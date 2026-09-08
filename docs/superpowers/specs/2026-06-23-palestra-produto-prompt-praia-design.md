---
title: "De 3 semanas pra 3 dias: como comprimimos o ciclo inteiro de A/B test"
evento: "Produto. Prompt. Praia."
data_evento: 2026-06-26
local: Rio de Janeiro
duracao_min: 20
formato: Slides (sem demo ao vivo)
palestrante: Lucian Fialho
audiencia: Product managers, designers de produto, pesquisadores de UX
status: design-aprovado
created: 2026-06-23
---

# Design — Palestra "Produto. Prompt. Praia." — 2026-06-26

## Contexto

Nova palestra criada em D-3 do evento. Não é uma das 3 palestras planejadas no CLAUDE.md — é um convite adicional para evento de produto no Rio. O organizador pediu um case específico em vez do tema genérico original ("O futuro das análises de dados com IA").

## Tese central

> O gargalo do A/B test não é falta de ideia. É o handoff.  
> A gente construiu um harness de experimentação que elimina os handoffs — e comprovou em 3 meses de uso.

## Audiência

Profissionais de produto (PMs, designers, pesquisadores). **Não** são especialistas de CRO. Conhecem o problema de handoffs e velocity de time — esse é o ângulo de conexão, não CRO em si.

## Headline

**"De 3 semanas pra 3 dias: como comprimimos o ciclo inteiro de A/B test"**

## Case

E-commerce de materiais de construção (cliente anônimo — não citar Obramax). Usado como exemplo concreto sem revelar o nome. Resultado: ciclo de preparação de teste passou de ~3 semanas para ~3 dias.

**Importante:** o teste A/B ainda não subiu para produção. O resultado mensurado é o processo de preparação (ideação → hipótese → design → código), não lift de conversão. Ser honesto sobre isso na palestra.

## O harness de experimentação

Três skills do analytics-copilot encadeadas em um processo definido:

```
/cro-audit [url]  →  /ab-suggest [url]  →  /ab-create [test]
   Auditoria           Hipóteses +            Spec completo +
   da página           preview visual         código JS
```

**Definição de harness usada:** processo definido que qualquer pessoa da equipe pode executar do início ao fim, sem precisar de múltiplos especialistas ou handoffs. O analista chama as skills manualmente em sequência — o harness é o processo, não automação.

**Referência de contexto 2026:** o termo "agent harness" está emergindo como categoria em 2026 (artigo: "2025 Was Agents. 2026 Is Agent Harnesses").

## Estrutura (20 min / ~17 slides)

### Abertura — 1 min (2 slides)

- **Slide 1:** Hook — *"Quantos testes A/B você subiu nos últimos 3 meses?"* Pausa. Pergunta retórica.
- **Slide 2:** *"O problema quase nunca é falta de ideia."*

### Ato 1 — O processo quebrado (4 min / 4 slides)

- **Slide 3:** Diagrama visual do processo tradicional de CRO:
  `Analista → Designer → Dev → QA → Teste no ar`
  Cada seta = handoff = fila + contexto perdido
- **Slide 4:** Detalhamento do tempo por etapa (tabela simples):
  | Etapa | Quem | Tempo típico |
  |---|---|---|
  | Análise + hipóteses | Analista CRO | 3-5 dias |
  | Wireframe | Designer | 3-5 dias |
  | Implementação | Dev | 5-7 dias |
  | QA + setup | CRO + QA | 2-3 dias |
  | **Total** | 3 pessoas | **~3-5 semanas** |
- **Slide 5:** Insight — *"O gargalo não é velocidade. É a transferência."*
- **Slide 6:** Número âncora — *"Em projetos que a gente acompanha, esse ciclo levava entre 3 e 5 semanas por teste."*

### Ato 2 — O harness (10 min / 7 slides)

- **Slide 7:** Definição rápida de harness para produto:
  *"Processo definido que uma pessoa consegue rodar do início ao fim. Sem fila de sprint. Sem brief pro designer. Sem ticket pro dev."*
- **Slide 8:** Diagrama do harness — as 3 etapas em sequência
- **Slide 9:** Step 1 — `/cro-audit`
  Screenshot real do output: audit visual da página, lista de fricção priorizada por impacto.
  *"A análise que levava 3 dias de analista. Aqui leva horas."*
- **Slide 10:** Step 2 — `/ab-suggest`
  Screenshot real: hipóteses ancoradas no audit, preview lado-a-lado (control vs variant injetada na página ao vivo).
  *"Wireframe que precisava de designer. Aqui é preview na página real."*
- **Slide 11:** Step 3 — `/ab-create`
  Screenshot real: spec completo + código JS pronto para colar no GTM/VWO.
  *"Código que precisava de dev. Aqui já vem junto."*
- **Slide 12:** Síntese visual — before vs after lado a lado
  Before: 3 pessoas, 3 handoffs, 3 semanas.
  After: 1 pessoa, 0 handoffs, 3 dias.
- **Slide 13:** *"Do URL ao código em horas, não semanas."*

### Ato 3 — O que mudou + princípio (3 min / 3 slides)

- **Slide 14:** Honestidade sobre o resultado:
  *"O teste ainda não subiu — mas o ciclo de preparação que levava 3 semanas levou 3 dias."*
  O que foi medido: tempo de ideação → código pronto.
- **Slide 15:** O princípio transferível:
  *"Não é sobre CRO. É sobre qualquer processo com handoffs caros."*
  Exemplos rápidos de outros handoffs clássicos de produto: discovery → eng, research → design, analytics → produto.
- **Slide 16:** Pergunta de fechamento para a audiência:
  *"Qual é o handoff mais lento do seu time hoje?"*

### Fechamento + CTA (2 min / 1-2 slides)

- **Slide 17:** Beta do analytics-copilot + QR code
  *"Tudo isso que mostrei é o que uso todo dia. Beta aberto — galera daqui tem prioridade."*

## Contagem de tempo

| Bloco | Tempo |
|---|---|
| Abertura | 1 min |
| Ato 1 — Processo quebrado | 4 min |
| Ato 2 — O harness | 10 min |
| Ato 3 — O que mudou | 3 min |
| Fechamento + CTA | 2 min |
| **Total** | **20 min** |

## Decisões de produção

**Slides:** reutilizar stack visual das palestras 01 e 02 — deck web com `deck-stage.js` + `deck-styles.css` (Reveal.js-based, em `01-intro-ecommerce/deck/`). Copiar estrutura como base, ajustar conteúdo.

**Screenshots:** precisam ser capturas reais do analytics-copilot com o case anonimizado. Não usar mockups — a credibilidade vem de mostrar o produto real rodando.

**Cliente:** apresentar como "um e-commerce de materiais de construção". Nunca citar Obramax.

**Tom:** direto, sem hype de IA. A tese é ancorada em problema real (handoffs) antes do produto. Honestidade sobre estado do teste (não subiu ainda).

## O que ainda falta

- [ ] Screenshots reais do analytics-copilot rodando o harness (cro-audit, ab-suggest, ab-create) com dados do cliente anonimizado
- [ ] Slide de diagrama "processo tradicional" (visual)
- [ ] Slide "before vs after" lado a lado
- [ ] QR code do beta
- [ ] Produção dos ~17 slides
