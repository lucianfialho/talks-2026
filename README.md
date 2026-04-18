# talks-2026

Content layers (3 palestras) construídas usando dogfood do ecossistema próprio: `atomic-gates`, `claude-dev-pipeline`, `paper7`, `ghscout`, `gmp-cli`, `newsletter-toolkit`, `ailint-cli`.

## As 3 camadas

| # | Palestra | Audiência | Profundidade | Data | CTA |
|---|---|---|---|---|---|
| 01 | Como atingir o máximo de eficiência com o Claude Code | E-commerce pros | Superfície | **25/04/2026** | analytics-copilot (beta) |
| 02 | CRO com Claude Code | Comunidade CRO | Aplicação | TBD | analytics-copilot (beta) |
| 03 | Harness engineering | Devs / AI eng | Profundidade | TBD | ecossistema open source |

## Assumptions (validar/corrigir)

- **Ordem temporal:** 01 → 02 → 03 (01 é 25/04, demais TBD)
- **Sobreposição de público:** parcial — cada palestra é self-contained, mas deixa gancho pra próxima
- **CTA:** 01 e 02 apontam pro beta do analytics-copilot; 03 aponta pro ecossistema open source

## Dogfood — ferramentas usadas na construção

| Etapa | Ferramenta | Papel |
|---|---|---|
| Orquestração global | [`atomic-gates`](https://github.com/lucianfialho/atomic-gates) | State machine + audit trail em `.gates/runs/` |
| Issue → PR | [`claude-dev-pipeline`](https://github.com/lucianfialho/claude-dev-pipeline) | `solve-issue`, `backend-dev`, `frontend-dev` |
| Contexto acadêmico | [`paper7`](https://github.com/lucianfialho/paper7) | Literatura arXiv (didática, MMM, atribuição) |
| Discovery de referências | [`ghscout`](https://github.com/lucianfialho/ghscout) | Issues de outros repos como evidência |
| Dados pras demos | [`gmp-cli`](https://github.com/lucianfialho/gmp-cli) | GA4 / GSC / Ads / BQ real |
| Geração de draft | [`newsletter-toolkit`](https://github.com/lucianfialho/newsletter-toolkit) | `digest` + `humanizer` adaptados |
| CLI de controle | [`spec2cli`](https://github.com/lucianfialho/spec2cli) | Se API do site de votação for exposta |
| Knowledge base | **chat-sdk + AI SDK** (dogfood Vercel stack) | RAG embed próprio, não NotebookLM externo |
| Lint de código | [`ailint-cli`](https://github.com/lucianfialho/ailint-cli) | Evitar alucinação nos snippets das demos |
| Deck macOS | [`SlideKit`](https://github.com/mtj0928/SlideKit) (MIT) + scaffolding de [`try-Swift-2026`](https://github.com/mtj0928/try-Swift-2026) | App SwiftUI nativo em `slides/` — ver `slides/NOTICE.md` |

## Meta-loop

- Cada PR → registrado em `atomic-gates/.gates/runs/<uuid>.yaml`
- Audit trail vira material da palestra 03 (harness)
- Palestra 03 mostra literalmente a si mesma sendo construída

## Estrutura

```
talks-2026/
├── shared/
│   ├── knowledge-base/
│   │   └── sources/             # docs pro RAG (chat log curado, READMEs, cases)
│   ├── site/                    # Next.js + Vercel KV (votação interativa)
│   ├── stats/                   # snapshot /stats (prova social nas 3)
│   ├── cases/                   # mmm-research, benchmark 20x (escalados por profundidade)
│   └── assets/                  # screenshots, gifs, dados
├── 01-intro-ecommerce/          # 25/04/2026
│   ├── script.md                # narrativa blog-post (issue #4)
│   ├── bifurcations.md          # 3 pontos de votação (profundidade técnica)
│   ├── notes/                   # ensaio, roteiro, cronometragem
│   └── demos/                   # comandos e snippets das demos ao vivo (issue #6)
├── 02-cro/
├── 03-harness/
└── slides/                      # SwiftUI macOS app (Xcode) — deck das 3 palestras
    ├── NOTICE.md                # Atribuição SlideKit MIT + scaffolding try-Swift-2026
    ├── TrySwift2026.xcodeproj   # nome interno herdado; display name → "Luciano Talks 2026"
    └── TrySwift2026/
        ├── SlideState.swift     # enum de slides da palestra 01 (reescrito)
        ├── Slides/Talks/01-Ecommerce/   # placeholders até o script (issue #4) pousar
        └── …
```

## Cronograma 01 (7 dias)

| D- | Data | Entrega |
|---|---|---|
| D-7 | 18/04 | Scaffold + issues + knowledge base MVP |
| D-6 | 19/04 | Script palestra 01 (draft) |
| D-5 | 20/04 | Site de votação MVP deploy |
| D-4 | 21/04 | Deck palestra 01 |
| D-3 | 22/04 | Ensaio 1 + ajustes |
| D-2 | 23/04 | Ensaio 2 + fechamento |
| D-1 | 24/04 | Contingência / backup |
| D-0 | **25/04** | 🎤 Palestra |

## Bifurcações da palestra 01 (profundidade técnica)

Todas convergem no mesmo ponto narrativo. Mudam só profundidade:

| # | Momento | Pergunta | Raso | Fundo |
|---|---|---|---|---|
| 1 | Após primeira automação (~min 15) | Quer ver como funciona por baixo? | 1 min impacto | 4 min terminal + skill |
| 2 | No core do MMM (~min 30) | Quer ver código e trapaça em detalhe? | 2 min história | 5 min `load_data` antes/depois |
| 3 | Boas práticas (~min 42) | Quer método técnico (gates) ou só princípios? | 2 min princípios | 5 min atomic-gates + ledger |

**Buffer total:** ~9 min flexíveis.
