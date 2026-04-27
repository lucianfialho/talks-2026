---
talk: 02-cro
bifurcations: 2
formato: hand-raise / chat ao vivo (online)
---

# Bifurcações — Palestra 02 (CRO)

Ambas as bifurcações são sobre **profundidade técnica** — não mudam a narrativa, só o quanto vai a fundo na demo. Tanto o caminho raso quanto o fundo convergem para o mesmo ponto.

---

## Bifurcação #1 — Ato 3, após 3C (guardrails)

**Gatilho:** fim da demonstração do hook PreToolUse

**Pergunta:** *"Quer ver os 3 passos — bot filter, SRM check, guardrail — rodando num dataset real do início ao fim? Ou segue pra análise pós-teste?"*

**Caminho Raso (1-2 min):**
- Mostrar o output final da view `events_clean` pronta
- *"O pipeline inteiro produziu isso. Os scripts estão no repo."*
- Tempo salvo: ~4 min → vai pro Ato 4

**Caminho Fundo (5 min):**
- Executar "Bifurcação #1 — Pipeline completo" do `commands.md`
- Mostrar cada etapa com contagem: bruto → bots → clean
- Explicar o threshold de decisão (50 hits OU duration=0)
- Rodar SRM check com output ao vivo
- Mostrar hook sendo disparado e bloqueando

**Convergência:** ambos chegam com `events_clean` validado, pronto para `/post-test-segments`

---

## Bifurcação #2 — Ato 4, após 4A (segmentação pós-teste)

**Gatilho:** após mostrar segmentação por device do resultado

**Pergunta:** *"Quer ver o checklist completo de heurísticas rodando ao vivo numa página real?"*

**Caminho Raso (1 min):**
- Mostrar exemplo de output do `/heuristic-scan` já pronto
- *"É isso que sai. O checklist tem 11 itens, está no repo."*
- Tempo salvo: ~3 min → vai pro Ato 5

**Caminho Fundo (4 min):**
- Executar "Bifurcação #2 — Heuristic scan completo" do `commands.md`
- `agent-browser` abre URL, captura screenshots desktop e mobile
- Rodar ao menos 5 dos 11 itens do checklist ao vivo
- Correlacionar resultado heurístico com lift quantitativo do Ato 4A

**Convergência:** ambos chegam no Ato 5 (automação)

---

## Buffer de tempo

| Cenário | Tempo total |
|---|---|
| Ambas rasas | ~42 min → 8 min Q&A |
| Bif #1 fundo, #2 raso | ~46 min → 4 min buffer |
| Bif #1 raso, #2 fundo | ~45 min → 5 min buffer |
| Ambas fundas | ~50 min exato |
