# CRO Demo Runbook — Palestra 02

> Sequência exata de comandos para executar ao vivo. Testar completo no D-1.
> Formato: screen share online. Slide esquerda, terminal direita em split permanente.

## Setup pré-palestra (fazer no D-1)

```bash
cd /Users/lucianfialho/Code/talks-2026
python3 02-cro/demos/data/generate-sample-data.py
duckdb cro.db < 02-cro/demos/data/setup-duckdb.sql
# deve retornar: "Setup completo." com ~8600 usuários
```

## Ato 1 — wterm no browser

URL: https://wterm.vercel.app (testar antes — pode ser instância local)
Ação: abrir browser, navegar pra wterm, mostrar Claude Code inicializando
Fallback se wterm offline: abrir terminal local, digitar `claude` na pasta do projeto

## Ato 2 — DuckDB ao vivo

```bash
# terminal direito, visível enquanto slide fica na esquerda
duckdb cro.db
```

```sql
-- primeira query: mostrar escala do dado
SELECT COUNT(*) AS total_events, COUNT(DISTINCT user_pseudo_id) AS total_users
FROM events;
-- expected: ~86k eventos, ~8600 usuários

-- mostrar estrutura (LLM Wiki concept)
DESCRIBE events;
```

## Ato 3A — Bot filtering

```sql
-- na sessão duckdb cro.db
SELECT user_pseudo_id, COUNT(*) AS hits, AVG(session_duration) AS avg_dur
FROM events WHERE event_name = 'session_start'
GROUP BY user_pseudo_id
HAVING hits > 50 OR avg_dur < 1
LIMIT 10;
-- expected: ~200 usuários com padrão de bot (hits altos, duration=0)
```

```sql
-- before vs after
SELECT 'bruto' AS estado, COUNT(DISTINCT user_pseudo_id) AS users
FROM events WHERE event_name = 'session_start'
UNION ALL
SELECT 'limpo', COUNT(DISTINCT user_pseudo_id)
FROM events_clean WHERE event_name = 'session_start';
-- expected: limpo tem ~200 usuários a menos
```

## Ato 3B — SRM check

```
/srm-check
```

Expected no output de Claude: SRM detectado em variant_b (~400 usuários extras injetados)

## Ato 3C — Hook ao vivo

Mostrar no terminal que o hook bloqueia análise sem pré-condições:

```bash
# simular tentativa de análise sem SRM check
CLAUDE_TOOL_INPUT="SELECT experiment_variant, COUNT(*) FROM test_results WHERE experiment_variant='variant_b' GROUP BY 1" \
  bash 02-cro/demos/hooks/validate-before-analysis.sh
# expected: ⚠️ ATENÇÃO: SRM check não encontrado
```

Depois mostrar que com o sentinel funciona:
```bash
touch .cro-srm-checked
CLAUDE_TOOL_INPUT="SELECT experiment_variant, COUNT(*) FROM test_results WHERE experiment_variant='variant_b' GROUP BY 1" \
  bash 02-cro/demos/hooks/validate-before-analysis.sh
# expected: ✅ Pré-condições OK
```

## Bifurcação #1 — Pipeline completo (se escolhida, Ato 3)

```sql
-- na sessão duckdb cro.db — pipeline passo a passo com log
SELECT 'Passo 1: total bruto' AS etapa, COUNT(DISTINCT user_pseudo_id) AS usuarios
FROM events WHERE event_name = 'session_start'
UNION ALL
SELECT 'Passo 2: bots identificados',
       COUNT(DISTINCT user_pseudo_id)
FROM sessions WHERE hit_count > 50 OR session_duration = 0
UNION ALL
SELECT 'Passo 3: dado limpo',
       COUNT(DISTINCT user_pseudo_id)
FROM events_clean WHERE event_name = 'session_start';
```

## Ato 4A — Segmentação pós-teste

Criar sentinel antes (demo assume SRM foi feito e aprovado):
```bash
touch .cro-srm-checked
```

```
/post-test-segments
```

Expected no output de Claude: mobile/variant_b com CR ~20% acima de mobile/control

## Ato 4B — Heuristic scan

```
/heuristic-scan
```

Fornecer URL de staging quando Claude pedir. Se não tiver URL real: usar https://www.metricasboss.com.br como demo.

## Ato 5 — Automação

Mostrar e explicar — não precisa executar de verdade:

```
/schedule every monday at 8am: /cro-weekly-pipeline
```

```
/loop 2h: /srm-check
```

## Bifurcação #2 — Heuristic scan completo (se escolhida, Ato 4)

Rodar `/heuristic-scan` em URL real com agent-browser, mostrar screenshots desktop e mobile sendo capturados, percorrer ao menos 5 dos 11 itens do checklist ao vivo.

## Fallback total (sem internet / auth falhar)

```bash
# tudo roda offline com duckdb local — dados já carregados
duckdb cro.db "SELECT 'offline OK — dados carregados localmente' AS status;"
```

## Limpeza pós-demo

```bash
rm -f .cro-srm-checked
```
