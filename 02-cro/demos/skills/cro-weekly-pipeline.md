---
name: cro-weekly-pipeline
description: Pipeline semanal completo de CRO. Puxa dados frescos via gmp-cli, limpa bots, valida SRM de testes ativos, roda análise segmentada e gera relatório em markdown pronto para compartilhar.
---

## Tarefa

Executar o pipeline completo de análise CRO para a semana atual.

## Passos

### 1. Puxar dados frescos

```bash
# puxar eventos GA4 dos últimos 7 dias via gmp-cli
gmp ga raw-events --days 7 --output 02-cro/demos/data/events-latest.csv

# se gmp-cli não estiver configurado, usar dataset de demo:
# cp 02-cro/demos/data/sample-ga4-events.csv 02-cro/demos/data/events-latest.csv
```

### 2. Atualizar DuckDB com dados frescos

```sql
DROP TABLE IF EXISTS events;

CREATE TABLE events AS
SELECT * FROM read_csv_auto('02-cro/demos/data/events-latest.csv');

CREATE OR REPLACE VIEW sessions AS
SELECT
    user_pseudo_id,
    COUNT(*) AS hit_count,
    MAX(CASE WHEN event_name = 'session_start' THEN session_duration END) AS session_duration,
    MAX(device_category) AS device_category,
    MAX(traffic_source) AS traffic_source,
    MAX(experiment_variant) AS experiment_variant,
    MAX(converted) AS converted,
    MAX(is_new_user) AS is_new_user
FROM events GROUP BY user_pseudo_id;

CREATE OR REPLACE VIEW events_clean AS
SELECT e.* FROM events e
WHERE e.user_pseudo_id NOT IN (
    SELECT user_pseudo_id FROM sessions
    WHERE hit_count > 50 OR session_duration = 0
);

SELECT 'Dados atualizados.' AS status, COUNT(*) AS total_events FROM events;
```

### 3. Relatório de limpeza

```sql
SELECT
    'Total bruto' AS categoria,
    COUNT(DISTINCT user_pseudo_id) AS usuarios
FROM events
UNION ALL
SELECT
    'Bots removidos',
    COUNT(DISTINCT user_pseudo_id)
FROM sessions WHERE hit_count > 50 OR session_duration = 0
UNION ALL
SELECT
    'Dado limpo',
    COUNT(DISTINCT user_pseudo_id)
FROM events_clean WHERE event_name = 'session_start';
```

### 4. SRM check em testes ativos

Invocar `/srm-check` para cada teste ativo. Se SRM detectado: marcar como ⚠️ no relatório e **não incluir resultado desse teste**.

### 5. Análise de testes sem SRM

Para cada teste aprovado, invocar `/post-test-segments`.

### 6. Gerar relatório markdown

Criar arquivo `02-cro/notes/weekly-report-[YYYY-MM-DD].md` com a estrutura:

```markdown
# CRO Weekly Report — [data]

## Limpeza de dados
- Total bruto: [N] usuários
- Bots removidos: [N] ([X]%)
- Dado limpo: [N] usuários

## Testes ativos

### [Nome do teste]
- Status: ✅ Sem SRM / ⚠️ SRM detectado
- Resultado: [se sem SRM — lift + segmentação]
- Recomendação: [ação concreta]

## Próximos passos
- [lista]
```

## Contexto esperado

- `gmp-cli` instalado e configurado (ou dataset de demo disponível em `02-cro/demos/data/sample-ga4-events.csv`)
- DuckDB instalado (`brew install duckdb` se necessário)
- Arquivo `cro.db` na pasta do projeto
