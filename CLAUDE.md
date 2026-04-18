# talks-2026 — context for Claude sessions

This repo holds 3 talks built **using the dogfood ecosystem**. The construction itself is part of the material.

## Sprint 01 — palestra de e-commerce

- **Date:** 2026-04-25
- **Title:** Como atingir o máximo de eficiência com o Claude Code
- **Audience:** e-commerce pros (may not use Claude Code yet)
- **Format:** 50min, narrative blog-post style, 3 audience-vote bifurcations on technical depth
- **CTA:** analytics-copilot (beta)

### Sprint timeline

| D- | Date | Entrega |
|---|---|---|
| D-7 | 2026-04-18 | Scaffold + issues + knowledge base MVP |
| D-6 | 2026-04-19 | Script palestra 01 (draft) |
| D-5 | 2026-04-20 | Site de votação MVP deploy |
| D-4 | 2026-04-21 | Deck palestra 01 |
| D-3 | 2026-04-22 | Ensaio 1 + ajustes |
| D-2 | 2026-04-23 | Ensaio 2 + fechamento |
| D-1 | 2026-04-24 | Contingência / backup |
| D-0 | 2026-04-25 | 🎤 Palestra |

## Tool inventory (lean on these — don't re-invent)

Each tool below is part of the user's own ecosystem; prefer them over external alternatives.

| Tool | Use for |
|---|---|
| [`atomic-gates`](https://github.com/lucianfialho/atomic-gates) | Orchestration runtime; every PR run lands in `.gates/runs/` |
| [`claude-dev-pipeline`](https://github.com/lucianfialho/claude-dev-pipeline) | Issue → PR via `solve-issue` skill (delegates to backend-dev / frontend-dev) |
| [`paper7`](https://github.com/lucianfialho/paper7) | arXiv papers as clean markdown — load literature into context |
| [`ghscout`](https://github.com/lucianfialho/ghscout) | Discovery of evidence from GitHub issues |
| [`gmp-cli`](https://github.com/lucianfialho/gmp-cli) | Live demo data: GA4, GSC, Ads, GTM, BigQuery |
| [`mmm-research`](https://github.com/lucianfialho/mmm-research) | Core case for the MMM section (16h autonomous run, beat Meridian by 32%, agent cheated) |
| [`google-analytics-mcp-benchmark`](https://github.com/lucianfialho/google-analytics-mcp-benchmark) | The 20x number — proof slide for CLI > MCP |
| [`newsletter-toolkit`](https://github.com/lucianfialho/newsletter-toolkit) | `digest` + `humanizer` skills for content drafts |
| [`spec2cli`](https://github.com/lucianfialho/spec2cli) | If voting site exposes an OpenAPI, ship a CLI for free |
| [`ailint-cli`](https://github.com/lucianfialho/ailint-cli) | Catch hallucinated packages / phantom APIs in demo snippets |

**Stack defaults:** Next.js 16 (App Router), Vercel KV for voting state, AI SDK + chat-sdk for the knowledge base embed, TypeScript, Tailwind, shadcn/ui.

## "Honestly measured" — operating stance

This sprint follows the same posture as `atomic-gates` itself: ship infrastructure that works, log failures publicly, do not hide gaps.

- Every `claude-dev-pipeline:solve-issue` run is recorded in `.gates/runs/<uuid>.yaml` (gitignored individual files; folder tracked via `.gitkeep`)
- Failed gates, abandoned runs, broken builds are NOT scrubbed from the audit trail — they become content for talk 03 (harness)
- The `validation/` folder, when added, mirrors `atomic-gates/validation/ledger.md`: pre-registered hypotheses for what we expect to work, with verdicts updated as data comes in
- If a tool in the inventory fails mid-sprint, prefer documenting the failure + falling back over silently using something external

## Three palestras (overall arc)

| # | Talk | Audience | Depth | CTA |
|---|---|---|---|---|
| 01 | Eficiência com Claude Code | E-commerce pros | Surface | analytics-copilot beta |
| 02 | CRO com Claude Code | CRO community | Application | analytics-copilot beta |
| 03 | Harness engineering | Devs / AI eng | Depth | open source ecosystem |

01 and 02 share much of the substrate (gmp-cli demo, MMM case, benchmark slide); 03 reframes everything from the harness/state-machine angle and uses this very repo's `.gates/runs/` log as material.

## Repository layout

```
talks-2026/
├── shared/
│   ├── knowledge-base/          # RAG sources (chat logs curated, repo summaries, cases)
│   │   └── sources/
│   ├── site/                    # Next.js + Vercel KV voting site (issue #3)
│   ├── stats/                   # /stats snapshots (prova social common to all 3)
│   ├── cases/                   # mmm-research, benchmark 20x — escalated by depth per talk
│   └── assets/                  # screenshots, gifs, raw data
├── 01-intro-ecommerce/
│   ├── script.md                # narrative blog-post (issue #4)
│   ├── bifurcations.md          # the 3 vote points (depth, not narrative)
│   ├── deck/                    # slides (issue #5)
│   ├── notes/                   # rehearsal log, timing
│   └── demos/                   # live demo commands and snippets
├── 02-cro/
├── 03-harness/
├── .gates/
│   ├── config.yaml              # indexed directories + PR structure gate
│   └── runs/                    # gitignored except .gitkeep
├── .github/workflows/
│   └── lint-content.yml         # ailint-cli on changed .md
├── README.md                    # human-facing plan + assumptions
├── ISSUES.md                    # backlog mirroring GitHub issues #1-#7
└── CLAUDE.md                    # this file — context for future sessions
```

## Bifurcations (palestra 01)

3 audience-vote points, all on **technical depth** — not narrative. Each converges to the same next ato; only depth differs.

| # | Trigger | Question | Raso | Fundo |
|---|---|---|---|---|
| 1 | After first automation (~min 15) | Want to see how it works under the hood? | 1 min impact | 4 min terminal + skill |
| 2 | MMM core (~min 30) | Want to see code + the cheating moment in detail? | 2 min story | 5 min `load_data` before/after |
| 3 | Best practices (~min 42) | Technical method (gates) or just principles? | 2 min principles | 5 min atomic-gates + ledger |

**Buffer:** ~9 minutes flex.

## Conventions

- All commits in this repo follow conventional-commit prefixes: `chore:`, `feat:`, `fix:`, `docs:`, `ci:`, `refactor:`
- PRs MUST contain `## Summary`, `## Changes`, and `## Issue coverage` sections (enforced by `gate-pr-structure`, see `.gates/config.yaml`)
- Hallucinated packages / phantom APIs in any markdown demo snippet will fail CI (`ailint-cli` workflow)
- All directory-level changes get `.metadata/summary.md` files updated (enforced by `gate-metadata`)

## When in doubt

- Read `ISSUES.md` for the active backlog
- Read `README.md` for the plan and assumptions
- Read `.gates/runs/` for the audit trail of past automated work
- Pick the tool from the inventory above before reaching for an external one
