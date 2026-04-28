---
titulo: "CRO com Claude Code: do dado bruto à decisão"
evento: "Palestra para comunidade CRO"
data: TBD
duracao_min: 50
audiencia_estimada: TBD
formato: Online (screen share)
audiencia_perfil: Misto — ~70% analistas de ferramenta (GA4, Hotjar, VWO), ~30% técnicos (SQL/Python). Todos sabem o que é CRO; nem todos têm pipeline de dado.
voice_target: Método direto, sem drama. Técnico quando necessário, acessível por padrão. Sem hype de IA.
cta_final: Beta do analytics-copilot (mesma newsletter da palestra 01)
status: draft-01 — outline aprovado em brainstorming 2026-04-27
---

# Estrutura — Palestra 02 (CRO)

> Outline de trabalho. Script completo gerado em cima disso depois de aprovação.

---

## Tese central

**"Você passa 60-70% do tempo em preparação antes de qualquer análise. Claude Code resolve na camada certa — antes da análise. Do dado bruto à decisão em 30 minutos."**

Não é palestra sobre IA. É palestra sobre método de dados para CRO.

---

## Premissas

1. **Audiência sabe o problema** — não precisa convencer que dado ruim é ruim. Precisa mostrar o fix.
2. **Online** — screen share. Slide esquerda, terminal direita em split permanente. Nenhuma quebra de ritmo pra trocar janela.
3. **wterm** (vercel-labs/wterm) como abertura e conceito — mostra que Claude Code roda no browser. Para as demos ao vivo: terminal local com dados reais.
4. **Stack técnico:** `spec2cli` → plataforma (VTEX/Shopify) + `gmp-cli` → GA4/GSC/Ads → DuckDB (cache local) → Claude Code (1M contexto) → análise/decisão.
5. **1M de contexto** é o diferencial técnico real vs ChatGPT/Cursor: você joga o dataset completo, não amostra.
6. **Guardrails como código** — não instrução. Retoma o "Immutable by instruction is not enough" da palestra 01 aplicado a CRO.

---

## Formato de apresentação

**Dois layers simultâneos:**
- **Slide** — frame conceitual, o "porquê"
- **Terminal (wterm ou local)** — execução ao vivo, o "como"

Complementares, não alternados. O split screen online permite isso naturalmente.

---

## Ato 1 — Abertura: Claude Code no browser (5 min)

**Objetivo:** criar um "isso existe?" imediato + estabelecer que tudo demonstrado pode ser reproduzido + fixar o problema de prep de dados sem hand-raise.

**Beats:**

1. **Zero introdução — abre wterm no browser:** Claude Code bota up na tela. 3 segundos em silêncio. *"Isso é Claude Code. No browser. Sem instalar nada."*
2. **Setup da palestra:** *"Tudo que vocês vão ver hoje acontece aqui. Dados reais de GA4, limpeza, análise de A/B — no browser, ou no terminal local. Mesma coisa."*
3. **Frame do problema:** *"O problema de CRO não é falta de ferramenta de análise. É que você passa a maior parte do tempo ANTES de qualquer análise — preparando dado, verificando integridade, colocando guardrail. E ninguém mede esse tempo."*
4. **O número sem hand-raise:** slide "60-70% do tempo é prep". Afirma — não pergunta. Deixa a audiência fazer as contas do próprio trabalho.
5. **Transição:** *"Hoje eu mostro o método que corta isso."*

**Slides:** wterm ao vivo (sem slide — é o browser) / "60-70% em prep" (número grande) / Transição  
**Terminal:** wterm bootstrapado, Claude Code rodando

---

## Ato 2 — Por que o contexto importa (8 min)

**Objetivo:** vender o 1M de contexto como diferencial técnico real — não marketing. Introduzir DuckDB como a camada de cache que torna a análise possível.

**Beats:**

1. **O problema de contexto (slide):** ChatGPT/Cursor = 200k tokens. Um dataset de 30 dias de GA4 com eventos completos = 800k tokens facilmente. Você não joga o dataset inteiro — você joga amostra e analisa amostra. A análise é tão boa quanto o recorte.
2. **O diferencial (slide + terminal):** Claude Code = 1M de contexto. Na prática: dataset completo de um mês, sem samplear. A análise vê o dado real.
3. **O conceito do Karpathy — LLM Wiki (slide):** dado estruturado como documento navegável pra LLM = LLM raciocina melhor, menos alucinação, mais precisão. Não joga CSV cru — estrutura como contexto.
4. **DuckDB como cache local (terminal ao vivo):**
   - *"DuckDB é um SQLite analítico. Zero setup, roda na pasta do projeto, fala SQL padrão, aguenta dataset grande."*
   - Ao vivo: cria `cro.db` local, carrega dados via `gmp-cli`, faz uma query simples.
   - Output: dado estruturado, pronto. **Isso é o seu cache local entre a API e o Claude.**
5. **Stack diagram (slide):** `spec2cli` + `gmp-cli` → DuckDB → Claude Code (1M) → análise/decisão.

**Slides:** Comparativo de contexto (200k vs 1M) / LLM Wiki concept / Stack diagram  
**Terminal:** DuckDB bootstrapado + primeira query rodando

---

## Ato 3 — A limpeza na prática (15 min)

**Objetivo:** mostrar as 3 fontes principais de dado ruim em CRO e resolver cada uma ao vivo.

### 3A — Bot filtering + deduplicação (5 min)

**Slide:** "Quantos % dos seus eventos são lixo?" — 15-30% é a média. Ninguém trata, todo mundo confia no número.

**Terminal ao vivo:**
```sql
-- identifica bots: muitos hits, session_duration ~ 0
SELECT user_pseudo_id, COUNT(*) as hits,
       AVG(session_duration) as avg_duration
FROM events WHERE event_name = 'session_start'
GROUP BY user_pseudo_id
HAVING hits > 50 OR avg_duration < 1
```

Claude Code interpreta o output, sugere threshold de corte, aplica filtro. Dado limpo → tabela `events_clean`.

**Ponto:** a diferença de CR antes e depois do filtro. Muitas vezes seu "baseline" está inflado.

### 3B — SRM check antes de declarar vencedor (5 min)

**Slide:** o que é SRM (Sample Ratio Mismatch) — a audiência CRO sabe o conceito, mas quase ninguém tem o processo automatizado.

**Terminal ao vivo:** script de SRM check contra dados do teste. Claude Code calcula chi-quadrado, devolve veredicto:

*"SRM detectado — variação B recebeu 23% mais tráfego que A. Esse teste não pode ser declarado vencedor."*

**Ponto:** isso deveria ser obrigatório antes de qualquer análise. Com Claude Code é um comando.

### 3C — Guardrails como código, não instrução (5 min)

**Slide:** retoma o conceito da palestra 01 — *"Immutable by instruction is not enough."* Aplicado a CRO: você não fala "não use dado contaminado", você **escreve o gate** que impede isso.

**Terminal ao vivo:** hook `PreToolUse` que valida antes de qualquer análise:
1. SRM check passou
2. Período mínimo de teste foi cumprido
3. Segmento de exclusão (QA, internos) foi removido

Se qualquer um falhar → Claude para e avisa. Não é prompt. É código.

**Bifurcação #1:** *"Quer ver os 3 passos rodando num dataset real completo — do bruto ao clean em tempo real? Ou segue pro próximo bloco?"*
- **Fundo (5 min):** pipeline completo ao vivo, bruto → `events_clean` com log de cada transformação
- **Raso (1 min):** mostra o output final + link do repo com os scripts

**Slides:** "15-30% dos eventos são lixo" / SRM diagram / "Immutable by instruction is not enough"  
**Terminal:** bot filter + SRM check + hook ao vivo

---

## Ato 4 — Análise e heurísticas (12 min)

**Objetivo:** mostrar que dado limpo + 1M de contexto + agent-browser = análise que antes precisava de 3 pessoas.

### 4A — Análise pós-teste que ninguém faz (5 min)

**Slide:** todo mundo declara "ganhou 12% de CR" e fecha o ticket. Ninguém segmenta por device, novo/recorrente, canal, faixa de ticket.

**Terminal ao vivo:** com dataset limpo no DuckDB:
```sql
SELECT segment, variant, conversion_rate,
       lift, confidence, sample_size
FROM test_results
GROUP BY segment, variant
ORDER BY segment, variant
```

Claude interpreta: *"O lift de 12% é puxado 100% por mobile. Desktop não moveu. Se vocês implementarem pra todos os devices, o ganho real é 6%."*

**Ponto:** esse insight nunca aparece na análise padrão. Com Claude Code + DuckDB é 1 query.

### 4B — agent-browser pra heurísticas (7 min)

**Slide:** análise quantitativa diz O QUÊ mudou. Heurística diz POR QUÊ. Os dois juntos fecha o ciclo de CRO.

**Terminal + browser ao vivo:** Claude Code abre `agent-browser` apontando pra variante B:
- CTA acima da dobra?
- Contraste do botão principal
- Hierarquia visual
- Mobile: thumb zone, tap targets
- Friction: quantos campos no form?

Output: relatório estruturado com hipóteses acionáveis. *"Variante B move o CTA pra above the fold em mobile — explica 80% do lift. O form ainda tem 6 campos vs 4 na baseline, segurando desktop."*

**Ponto:** sem abrir Hotjar, sem gravar sessão, sem interpretar manualmente.

**Bifurcação #2:** *"Quer ver o checklist completo de heurísticas rodando ao vivo numa página real?"*
- **Fundo (4 min):** agent-browser rodando checklist completo numa URL real
- **Raso (1 min):** mostra o output formatado + explica o checklist

**Slides:** "12% de lift — mas pra quem?" / agent-browser diagram  
**Terminal:** query de segmentação + agent-browser rodando

---

## Ato 5 — Automação + fechamento (10 min)

**Objetivo:** transformar o método num sistema recorrente. Você configura uma vez, roda para sempre.

### 5A — `/schedule` + `/loop` pra CRO (5 min)

**Slide:** diagrama do fluxo completo construído nos atos anteriores.

**Terminal ao vivo:**
```bash
# pipeline semanal de limpeza + análise
/schedule every monday at 8am: /cro-weekly-pipeline

# monitora testes ativos em tempo real
/loop 2h: /check-active-tests
```

`/check-active-tests`: SRM check em todos os testes rodando + alerta se atingiu significância + avisa se dado suspeito. *"Um plantonista de CRO rodando enquanto você dorme."*

### 5B — O kit que você leva (3 min)

**Slide:** 4 skills prontas:
- `/cro-weekly-pipeline` — puxa → limpa → estrutura → reporta
- `/srm-check` — valida integridade de qualquer teste antes de analisar
- `/post-test-segments` — análise pós-teste com segmentação automática
- `/heuristic-scan` — agent-browser rodando checklist visual

Tudo markdown. Commita no Git. Funciona em qualquer projeto Claude Code.

### 5C — CTA (2 min)

**Slide:** analytics-copilot beta — *"Se você quer isso sem montar o stack do zero, tá em beta. Link na newsletter."*

QR code. Fim.

---

## Contagem de tempo

| Ato | Tempo alvo | Cumulativo |
|---|---|---|
| 1 — Abertura wterm | 5 min | 5 |
| 2 — Contexto + DuckDB | 8 min | 13 |
| 3 — Limpeza (bot + SRM + guardrails) + Bif #1 | 15 min | 28 |
| 4 — Análise + heurísticas + Bif #2 | 12 min | 40 |
| 5 — Automação + CTA | 10 min | **50** |

Buffer: ~5 min dependendo das bifurcações.  
Se ambas bifurcações forem no raso: sobram ~8 min. Se ambas fundo: fica justo.

---

## Stack técnico consolidado

| Ferramenta | Papel na palestra |
|---|---|
| `wterm` (vercel-labs) | Abertura — Claude Code no browser |
| `gmp-cli` | Puxa GA4/GSC/Ads pra DuckDB |
| `spec2cli` | Puxa dados da plataforma de e-commerce |
| DuckDB | Cache local analítico — o "LLM Wiki" |
| Claude Code (1M ctx) | Análise, limpeza, interpretação |
| `agent-browser` | Heurísticas visuais dos testes |
| `/schedule` + `/loop` | Automação recorrente |
| `atomic-gates` | Guardrails como código (hook PreToolUse) |

---

## Diferenças vs Palestra 01

| Dimensão | Palestra 01 (e-commerce) | Palestra 02 (CRO) |
|---|---|---|
| Formato | Presencial | Online (screen share) |
| Profundidade | Superfície | Aplicação |
| Demo | Terminal local com backup gravado | wterm + terminal local, split screen |
| Tese | Eficiência com rotinas custom | Método de dados: do bruto à decisão |
| Dado | GA4 + VTEX (negócio) | GA4 + testes A/B (análise) |
| Conceito novo | skills/hooks/schedule | 1M contexto + DuckDB + guardrails |

---

## Gaps de produção

**Research a confirmar:**
- [ ] Karpathy — referência exata do conceito "LLM Wiki" / dado estruturado como contexto
- [ ] Benchmark: número real de % de bot traffic em GA4 (fonte confiável)
- [ ] `wterm` — testar fluxo completo; confirmar que Claude Code roda dentro dele pra demo

**Produção visual:**
- [ ] Stack diagram (spec2cli + gmp-cli → DuckDB → Claude Code → análise)
- [ ] Comparativo de contexto (200k vs 1M com dataset size visual)
- [ ] Diagrama SRM (distribuição esperada vs real)
- [ ] Split screen layout pra demo online

**Produção de demo:**
- [ ] Dataset de GA4 mockado pra demonstração (caso dados reais não estejam disponíveis)
- [ ] Scripts das 4 skills (`/cro-weekly-pipeline`, `/srm-check`, `/post-test-segments`, `/heuristic-scan`)
- [ ] Hook `PreToolUse` de validação pronto e testado
- [ ] `agent-browser` checklist de heurísticas CRO definido e testado

---

## Próximos passos

1. Você revisa este outline
2. Aprovado → gerar `script.md` completo (narrativa blog-post)
3. Em paralelo: criar as 4 skills de demo + testar `wterm`
4. Slides: seguir padrão da palestra 01 (deck web)
