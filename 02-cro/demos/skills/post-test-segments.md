---
name: post-test-segments
description: Análise pós-teste A/B com segmentação automática. Quebra o resultado agregado por device, novo vs recorrente e canal de aquisição. Revela onde o lift realmente aconteceu.
---

## Tarefa

Depois que um teste foi validado (sem SRM), fazer a análise segmentada completa para entender ONDE o lift aconteceu.

## Passos

1. Primeiro verificar se SRM check foi feito. Se não: invocar `/srm-check` antes de continuar.

2. Calcular conversion rate por variante (resultado agregado):

```sql
SELECT
    experiment_variant,
    COUNT(DISTINCT user_pseudo_id) AS users,
    SUM(converted) AS conversions,
    ROUND(SUM(converted) * 100.0 / COUNT(DISTINCT user_pseudo_id), 2) AS cr_pct
FROM events_clean
WHERE event_name = 'session_start'
GROUP BY experiment_variant;
```

3. Segmentação por device:

```sql
SELECT
    device_category,
    experiment_variant,
    COUNT(DISTINCT user_pseudo_id) AS users,
    SUM(converted) AS conversions,
    ROUND(SUM(converted) * 100.0 / COUNT(DISTINCT user_pseudo_id), 2) AS cr_pct
FROM events_clean
WHERE event_name = 'session_start'
GROUP BY device_category, experiment_variant
ORDER BY device_category, experiment_variant;
```

4. Segmentação por novo vs recorrente:

```sql
SELECT
    CASE WHEN is_new_user = 1 THEN 'new' ELSE 'returning' END AS user_type,
    experiment_variant,
    COUNT(DISTINCT user_pseudo_id) AS users,
    ROUND(SUM(converted) * 100.0 / COUNT(DISTINCT user_pseudo_id), 2) AS cr_pct
FROM events_clean
WHERE event_name = 'session_start'
GROUP BY user_type, experiment_variant
ORDER BY user_type, experiment_variant;
```

5. Segmentação por canal:

```sql
SELECT
    traffic_source,
    experiment_variant,
    COUNT(DISTINCT user_pseudo_id) AS users,
    ROUND(SUM(converted) * 100.0 / COUNT(DISTINCT user_pseudo_id), 2) AS cr_pct
FROM events_clean
WHERE event_name = 'session_start'
GROUP BY traffic_source, experiment_variant
HAVING COUNT(DISTINCT user_pseudo_id) >= 100
ORDER BY traffic_source, experiment_variant;
```

6. Emitir interpretação consolidada no formato:

> **Resultado agregado:** control=[X]% vs variant_b=[Y]% → lift de [Z]%
>
> **Por device:**
> - Mobile: lift de [X]%
> - Desktop: lift de [X]%
> - Tablet: [amostra insuficiente / lift de X%]
>
> **Insight:** O lift de [Z]% é puxado principalmente por [device/segmento]. Implementar para todos os devices entrega ~[real_lift]% de ganho real.
>
> **Recomendação:** [ação concreta de 1 linha]

## Contexto esperado

- DuckDB em `cro.db` com view `events_clean`
- `/srm-check` deve ter sido executado e aprovado antes desta skill
