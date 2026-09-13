#!/bin/bash
# ---------------------------------------------------------------------------
# test.sh — roda os 6 casos (um que bloqueia e um que passa por hook).
# Nao precisa do Claude: manda o JSON no stdin do script, como o Claude faria.
# Uso: bash test.sh
# ---------------------------------------------------------------------------

HOOKS=$(cd "$(dirname "$0")" && pwd)
BOX=$(mktemp -d 2>/dev/null || mktemp -d -t crohooks)
OK=0
FALHOU=0

# Monta um projeto de mentira em $BOX/<nome> e ecoa o caminho.
projeto() { mkdir -p "$BOX/$1"; printf '%s' "$BOX/$1"; }

# checa <titulo> <script> <json> <esperado: 0=passa 2=bloqueia>
checa() {
  titulo="$1"; script="$2"; payload="$3"; esperado="$4"
  saida=$(printf '%s' "$payload" | bash "$HOOKS/$script" 2>&1)
  codigo=$?
  if [ "$codigo" = "$esperado" ]; then
    OK=$((OK+1)); printf 'PASS  %s\n' "$titulo"
  else
    FALHOU=$((FALHOU+1))
    printf 'FAIL  %s (esperava exit %s, veio %s)\n' "$titulo" "$esperado" "$codigo"
    printf '      saida: %s\n' "$(printf '%s' "$saida" | head -n 2 | tr '\n' ' ')"
  fi
}

echo "Sandbox: $BOX"
echo

# --- 1. sem-plano-sem-hipotese ----------------------------------------------
P=$(projeto sem-plano)
checa "sem-plano-sem-hipotese  BLOQUEIA sem plano-de-mensuracao.md" \
  sem-plano-sem-hipotese.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Skill\",\"tool_input\":{\"skill\":\"hipotese-estruturada\"}}" 2

P=$(projeto com-plano); : > "$P/plano-de-mensuracao.md"
checa "sem-plano-sem-hipotese  PASSA com plano-de-mensuracao.md" \
  sem-plano-sem-hipotese.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Skill\",\"tool_input\":{\"skill\":\"hipotese-estruturada\"}}" 0

# --- 2. sem-srm-sem-resultado -----------------------------------------------
P=$(projeto sem-srm)
CMD="duckdb data/cro-clean.db -c 'SELECT variant, AVG(converted) FROM events'"
checa "sem-srm-sem-resultado   BLOQUEIA leitura de conversao sem .cro/srm-ok" \
  sem-srm-sem-resultado.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Bash\",\"tool_input\":{\"command\":\"$CMD\"}}" 2

P=$(projeto com-srm); mkdir -p "$P/.cro"; echo "SRM_OK 2026-09-14" > "$P/.cro/srm-ok"
checa "sem-srm-sem-resultado   PASSA com .cro/srm-ok gravado" \
  sem-srm-sem-resultado.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Bash\",\"tool_input\":{\"command\":\"$CMD\"}}" 0

# --- 3. sem-design-sem-variante ---------------------------------------------
P=$(projeto sem-design)
checa "sem-design-sem-variante BLOQUEIA variante-builder sem DESIGN.md" \
  sem-design-sem-variante.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Skill\",\"tool_input\":{\"skill\":\"variante-builder\"}}" 2

P=$(projeto com-design); : > "$P/DESIGN.md"
checa "sem-design-sem-variante PASSA com DESIGN.md (Write de variante-b.js)" \
  sem-design-sem-variante.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Write\",\"tool_input\":{\"file_path\":\"$P/variante-b.js\",\"content\":\"x\"}}" 0

# --- extras de regressao ----------------------------------------------------
P=$(projeto sem-design)
checa "sem-design-sem-variante BLOQUEIA Write de variante-b.js sem DESIGN.md" \
  sem-design-sem-variante.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Write\",\"tool_input\":{\"file_path\":\"$P/variante-b.js\",\"content\":\"x\"}}" 2

P=$(projeto sem-srm)
checa "sem-srm-sem-resultado   NAO atrapalha o proprio srm-check" \
  sem-srm-sem-resultado.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Bash\",\"tool_input\":{\"command\":\"duckdb data/cro.db -c \\\"SELECT experiment_variant, COUNT(*) FROM events_clean WHERE event_name='session_start' GROUP BY 1\\\"\"}}" 0

checa "sem-plano-sem-hipotese  ignora skill que nao e a dele" \
  sem-plano-sem-hipotese.sh \
  "{\"cwd\":\"$P\",\"hook_event_name\":\"PreToolUse\",\"tool_name\":\"Skill\",\"tool_input\":{\"skill\":\"ice-score\"}}" 0

echo
echo "-----------------------------------------"
echo "PASS: $OK   FAIL: $FALHOU"
[ "$FALHOU" = 0 ] || exit 1
