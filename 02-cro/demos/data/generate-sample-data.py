import csv
import random
import datetime

random.seed(42)

VARIANTS = ['control', 'variant_b']
DEVICES = ['mobile', 'desktop', 'tablet']
CHANNELS = ['organic', 'cpc', 'social', 'email', 'direct']
BOT_IDS = [f'bot_{i:04d}' for i in range(200)]
REAL_USERS = [f'user_{i:06d}' for i in range(8000)]

rows = []
start = datetime.datetime(2026, 3, 1)

for i, user_id in enumerate(REAL_USERS):
    device = random.choice(DEVICES)
    channel = random.choice(CHANNELS)
    variant = VARIANTS[i % 2]
    session_duration = random.randint(30, 600)
    num_events = random.randint(2, 15)
    converted = (
        random.random() < (0.045 if variant == 'control' else
                           0.054 if device == 'mobile' else 0.046)
    )
    ts = start + datetime.timedelta(
        days=random.randint(0, 29),
        seconds=random.randint(0, 86400)
    )
    rows.append({
        'user_pseudo_id': user_id,
        'event_name': 'session_start',
        'event_timestamp': ts.isoformat(),
        'device_category': device,
        'traffic_source': channel,
        'experiment_variant': variant,
        'session_duration': session_duration,
        'converted': int(converted),
        'is_new_user': int(random.random() < 0.4),
    })
    for _ in range(num_events - 1):
        rows.append({
            'user_pseudo_id': user_id,
            'event_name': random.choice(['page_view', 'scroll', 'click', 'add_to_cart']),
            'event_timestamp': (ts + datetime.timedelta(seconds=random.randint(1, session_duration))).isoformat(),
            'device_category': device,
            'traffic_source': channel,
            'experiment_variant': variant,
            'session_duration': session_duration,
            'converted': int(converted),
            'is_new_user': int(random.random() < 0.4),
        })

# inject bots
for bot_id in BOT_IDS:
    for _ in range(random.randint(60, 120)):
        rows.append({
            'user_pseudo_id': bot_id,
            'event_name': 'session_start',
            'event_timestamp': (start + datetime.timedelta(days=random.randint(0, 29))).isoformat(),
            'device_category': 'desktop',
            'traffic_source': 'direct',
            'experiment_variant': random.choice(VARIANTS),
            'session_duration': 0,
            'converted': 0,
            'is_new_user': 0,
        })

# inject SRM: extra variant_b users in first 5 days
extra_variant_b = [f'srm_user_{i:04d}' for i in range(400)]
for uid in extra_variant_b:
    ts = start + datetime.timedelta(days=random.randint(0, 4), seconds=random.randint(0, 86400))
    rows.append({
        'user_pseudo_id': uid,
        'event_name': 'session_start',
        'event_timestamp': ts.isoformat(),
        'device_category': random.choice(DEVICES),
        'traffic_source': random.choice(CHANNELS),
        'experiment_variant': 'variant_b',
        'session_duration': random.randint(10, 300),
        'converted': 0,
        'is_new_user': 1,
    })

random.shuffle(rows)

with open('02-cro/demos/data/sample-ga4-events.csv', 'w', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=rows[0].keys())
    writer.writeheader()
    writer.writerows(rows)

print(f"Generated {len(rows)} rows")
print(f"  Real users: {len(REAL_USERS)}")
print(f"  Bot IDs injected: {len(BOT_IDS)}")
print(f"  SRM users injected: {len(extra_variant_b)}")
