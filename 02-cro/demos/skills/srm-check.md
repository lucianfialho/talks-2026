---
name: srm-check
description: Valida Sample Ratio Mismatch em testes A/B antes de declarar resultado. Usa chi-quadrado pra detectar distribuição desproporcional de tráfego entre variantes.
---

## Tarefa

Verificar se o teste A/B tem SRM (Sample Ratio Mismatch) antes de qualquer análise de resultado.

## Passos

1. Buscar no DuckDB (arquivo `cro.db` na pasta do projeto) a distribuição de usuários únicos por variante usando `events_clean`:

```sql
SELECT
    experiment_variant,
    COUNT(DISTINCT user_pseudo_id) AS users,
    ROUND(COUNT(DISTINCT user_pseudo_id) * 100.0 /
          SUM(COUNT(DISTINCT user_pseudo_id)) OVER (), 2) AS pct
FROM events_clean
WHERE event_name = 'session_start'
  AND experiment_variant IS NOT NULL
GROUP BY experiment_variant
ORDER BY experiment_variant;
```

2. Calcular chi-quadrado:
   - Esperado: distribuição igual entre variantes (50/50 para teste simples A/B)
   - Fórmula: χ² = Σ (observado - esperado)² / esperado
   - p-value crítico: 0.05 (χ² > 3.84 para 1 grau de liberdade = SRM detectado)

3. Emitir veredicto claro:

**SRM DETECTADO:** Se χ² > 3.84
> "⚠️ SRM detectado. Variante B recebeu [X]% mais tráfego que control. Diferença: [N] usuários. χ² = [valor], p < 0.05. Este teste NÃO pode ser declarado vencedor — o dado de exposição está contaminado."

**SEM SRM:** Se χ² ≤ 3.84
> "✅ Sem SRM. Distribuição: control=[N] ([X]%), variant_b=[N] ([X]%). χ² = [valor], p > 0.05. Pode prosseguir com a análise."

4. Se SRM detectado, sugerir causas prováveis:
   - Implementação da variante com delay (JS que carrega tarde)
   - Segmento de exclusão não aplicado em uma das variantes
   - Cache de CDN servindo versão errada
   - Bot traffic concentrado em uma variante

## Contexto esperado

- DuckDB em `cro.db` na pasta do projeto com a view `events_clean`
- Se o arquivo não existir, instruir o usuário a rodar: `duckdb cro.db < 02-cro/demos/data/setup-duckdb.sql`
