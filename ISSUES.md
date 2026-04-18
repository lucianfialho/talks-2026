# Backlog

Issues pensadas pra serem resolvidas via `claude-dev-pipeline:solve-issue` com orquestração do `atomic-gates`.

## Sprint 01 — Palestra 25/04 (P0)

### #1 — Scaffold + infra
- [x] Criar estrutura de pastas
- [x] README com plano
- [ ] `.gitignore`
- [ ] Criar repo GitHub e push
- [ ] `atomic-gates init` pra registrar `.gates/`
- **Skill:** `backend-dev`
- **Estimativa:** 1h

### #2 — Knowledge base MVP
- [ ] Export curado deste chat (sem system reminders) → `shared/knowledge-base/sources/chat-planning-01.md`
- [ ] Snapshot `/stats` → `shared/stats/snapshot-2026-04-18.md`
- [ ] Summary dos 9 proven repos → `shared/knowledge-base/sources/proven-repos.md`
- [ ] `mmm-research` full story → `shared/cases/mmm-research.md`
- [ ] Decidir: NotebookLM (MVP rápido) ou chat-sdk embed (dogfood)
- **Skill:** `backend-dev` + manual
- **Estimativa:** 3h

### #3 — Site de votação interativa
- [ ] Next.js 16 + App Router
- [ ] Vercel KV pra estado
- [ ] 3 rotas: `/talk/01`, `/talk/02`, `/talk/03`
- [ ] UI celular: vê bifurcação atual + vota
- [ ] UI apresentador: resultado ao vivo
- [ ] Deploy Vercel + custom domain (opcional)
- **Skill:** `frontend-dev` + `backend-dev`
- **Estimativa:** 8-12h

### #4 — Script palestra 01 (draft)
- [ ] Narrativa blog-post em `01-intro-ecommerce/script.md`
- [ ] 5 atos + 3 bifurcações
- [ ] Cronometragem por bloco
- [ ] Usar `newsletter-toolkit:humanizer` pro tom de voz
- **Skill:** manual + `newsletter-toolkit`
- **Estimativa:** 4h

### #5 — Deck palestra 01
- [ ] Stack: a decidir (Keynote, Slidev, Reveal.js?)
- [ ] Slide de abertura com `/stats`
- [ ] Slides-âncora pras demos
- [ ] Slide do benchmark 20x
- [ ] Slide da história MMM (trapaça)
- [ ] CTA analytics-copilot
- **Skill:** `frontend-dev` (se web) ou manual (Keynote)
- **Estimativa:** 6h

### #6 — Demos ao vivo palestra 01
- [ ] Script de `gmp-cli` real com dados sanavita ou mock
- [ ] Fallback gravado caso internet falhe no evento
- [ ] Demo do `mmm-research` (código + trapaça)
- [ ] `ailint-cli` pra validar snippets
- **Skill:** manual
- **Estimativa:** 4h

### #7 — Ensaios
- [ ] Ensaio 1 (22/04) — cronometrar, ajustar
- [ ] Ensaio 2 (23/04) — fluidez + bifurcações
- [ ] Backup completo (24/04)
- **Skill:** manual
- **Estimativa:** 6h

**Total sprint 01: ~32-36h em 7 dias.**

## Sprint 02 — Palestra CRO (data TBD)

Definir após sprint 01.

## Sprint 03 — Palestra Harness (data TBD)

Definir após sprint 02.
