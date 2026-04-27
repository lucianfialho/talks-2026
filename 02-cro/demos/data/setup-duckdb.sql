-- Bootstrap do ambiente de demo CRO
-- Run once before demos: duckdb cro.db < 02-cro/demos/data/setup-duckdb.sql

CREATE TABLE IF NOT EXISTS events AS
SELECT * FROM read_csv_auto('02-cro/demos/data/sample-ga4-events.csv');

-- view of unique sessions (one row per user)
CREATE OR REPLACE VIEW sessions AS
SELECT
    user_pseudo_id,
    COUNT(*) AS hit_count,
    MAX(CASE WHEN event_name = 'session_start' THEN session_duration END) AS session_duration,
    MAX(device_category) AS device_category,
    MAX(traffic_source) AS traffic_source,
    MAX(experiment_variant) AS experiment_variant,
    MAX(converted) AS converted,
    MAX(is_new_user) AS is_new_user,
    MIN(event_timestamp) AS first_seen
FROM events
GROUP BY user_pseudo_id;

-- clean view (bots removed)
CREATE OR REPLACE VIEW events_clean AS
SELECT e.*
FROM events e
WHERE e.user_pseudo_id NOT IN (
    SELECT user_pseudo_id FROM sessions
    WHERE hit_count > 50 OR session_duration = 0
);

SELECT 'Setup completo.' AS status,
       COUNT(DISTINCT user_pseudo_id) AS total_users,
       COUNT(*) AS total_events
FROM events;
