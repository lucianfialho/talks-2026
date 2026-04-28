#!/bin/bash
# Hook PreToolUse: validates pre-conditions before A/B test analysis
# Only activates when the command contains A/B test analysis keywords

COMMAND="${CLAUDE_TOOL_INPUT:-}"

# only activate for analysis commands
if ! echo "$COMMAND" | grep -qiE "(experiment_variant|test_results|converted|variant_b)"; then
  exit 0
fi

echo "🔍 CRO Analysis Guard: verificando pré-condições..."

# 1. check cro.db exists
if [ ! -f "cro.db" ]; then
  echo "❌ BLOQUEADO: cro.db não encontrado."
  echo "   Setup: duckdb cro.db < 02-cro/demos/data/setup-duckdb.sql"
  exit 1
fi

# 2. check SRM was done this session (sentinel file)
if [ ! -f ".cro-srm-checked" ]; then
  echo "⚠️  ATENÇÃO: SRM check não encontrado nesta sessão."
  echo "   Recomendado: invocar /srm-check antes de analisar resultados."
  echo "   (Para pular: touch .cro-srm-checked)"
  exit 0
fi

echo "✅ Pré-condições OK. Prosseguindo com análise."
exit 0
