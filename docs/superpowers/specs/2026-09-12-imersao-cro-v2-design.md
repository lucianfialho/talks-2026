# Imersão Claude para CRO — bloco da tarde — Design v2

**Substitui:** `2026-09-08-imersao-cro-claude-design.md`, que foi escrito sem acesso às
reuniões de alinhamento e errou estrutura, duração e entregável.

**Data:** 2026-09-12 (D-2) · **Evento:** 2026-09-14 · **Facilitador:** Lucian Fialho

## Fontes de autoridade

| Fonte | O que define |
|---|---|
| `05-imersao-cro/notes/sources/reuniao-taciana-2026-07-16-transcricao.txt` | Estrutura da tarde, divisão de responsabilidades, exercício final |
| `05-imersao-cro/notes/sources/reuniao-taciana-2026-09-11-transcricao.txt` | Ciclo agrupado em 3 passos, callbacks, cases, elasticidade do bloco |
| `05-imersao-cro/notes/sources/live-claude-code-2026-07-22-transcricao.txt` | Conteúdo técnico do próprio Lucian: skills, hooks, guardrails, CLI vs MCP |
| `05-imersao-cro/notes/sources/taciana-cro-fundamentos.md` | Vocabulário do material da Taciana (44 slides) |

---

## 1. O que mudou em relação à v1, e por quê

A v1 foi construída a partir da página de vendas e do PDF da Taciana. Faltavam as
reuniões. Os erros:

| v1 (errado) | Real |
|---|---|
| Lucian 15h00–18h00 (3h) | **16h00–18h00 (2h)**, e elástico — ver §3 |
| Break 15h30–15h50 (20min) | **15h30–16h00 (30min)** |
| Alunos criam skills às 15h08, no Desktop | **Nenhuma ferramenta antes das 16h00** — é o horário da Taciana, e ela pediu sem interrupção técnica |
| Entregável: 7 skills prontas | **Uma skill: a do processo de CRO da empresa do próprio aluno** |
| Tese: "quatro cadeiras" | Tese: **o que aprender ANTES do Claude** + a receita (ingredientes e modo de preparo) |
| Alunos instalam DuckDB e Python | **Só Claude Code.** DuckDB é cache interno do `gmp-cli`, nunca foi para a máquina do aluno |
| Ciclo de 7 passos no fechamento | **3 passos agrupados** — decisão da reunião de 11/09 |

---

## 2. Tese

Duas, em sequência, e a primeira sustenta a segunda.

**Tese 1 — o pré-requisito.** *"Tudo que a gente tem que aprender antes de aprender o
cloud especificamente."* Não adianta colocar IA numa operação quebrada: **shit in, shit
out.** Se o `add_to_cart` não bate, se o `purchase` não bate com a plataforma, o teste
A/B nasce morto e não existe ferramenta no mundo que conserte. O facilitador assume aqui
o papel do cético — é o que dá autoridade para tudo que vem depois.

**Tese 2 — a receita.** Skill é *"uma receita em Markdown: ingredientes (fontes de dados)
e modo de preparo (sequência de passos)"*. Hooks são *"scripts de segurança para manter o
uso determinístico"*. O aluno não recebe receitas prontas — ele escreve a dele, a partir
do processo que a empresa dele já tem.

---

## 3. Estrutura — elástica por decisão

A Taciana entrega o horário; o bloco da tarde se ajusta ao que sobrar. Fala do Lucian em
11/09: *"não tenha medo da quantidade de slide que você vai ter, porque eu consigo ajustar
o meu conteúdo para caber no tempo que você me entregar."*

Portanto o material é **modular**, com ordem de corte declarada.

### Alvo: 16h00–18h00 (120 min)

| # | Bloco | Alvo | Corta? |
|---|---|---|---|
| A | **Antes do Claude** — callbacks nos 3 passos dela, plano de mensuração, shit in/shit out, cases | 30 min | Núcleo. Nunca corta. |
| B | **Primeiro contato** — abrem o Claude Code, custo e controle de prompt, CLI vs web | 25 min | Comprime para 15 |
| C | **Anatomia de uma receita** — dissecar uma skill, hooks e guardrails | 30 min | Comprime para 20 |
| D | **A sua skill** — processo da empresa → Skill Creator → validador | 30 min | Núcleo. Nunca corta. |
| — | **Fechamento** — 3 passos cobertos, o que escala | 5 min | Núcleo |

**Ordem de corte se a Taciana estourar:** B comprime primeiro, depois C. **A e D nunca
caem** — A é a autoridade do facilitador, D é o entregável que o aluno leva.

Se sobrar tempo (a Taciana terminar antes), B e C voltam ao alvo e o bloco D ganha
respiro, que é onde o tempo extra rende mais.

---

## 4. Os 3 passos agrupados

Decisão de 11/09, para uma plateia diversa: *"você diminui a quantidade de passos e
consegue fazer um slide onde você só vai dar a ênfase."*

| Passo | Agrupa | Callback do Lucian |
|---|---|---|
| 1 | Coleta + Análise | Plano de mensuração; macro vs microconversão; checagem de implementação (shit in, shit out) |
| 2 | Hipótese + Priorização + Design | Como se gera e como se prioriza; *"priorização é grande parte do problema"* |
| 3 | Teste + Relatório + Escala | Tipos de teste (A/B, MVT, fake door, rollout progressivo); o que vira skill e o que vira infra |

O fechamento mapeia a skill que o aluno acabou de criar contra esses 3 passos.

---

## 5. O exercício final — o entregável do dia

Definido na reunião de 16/07, nas palavras do Lucian:

> *"vocês vão descrever o processo de CRO, tal como funciona na empresa de vocês (...) e
> sair para mim com uma skill. Aí eu chego no final falando: essa skill é o ponto que
> conecta com toda a metodologia do que a gente viu aqui hoje."*

Mecânica em três tempos:

1. **Descrever** — o aluno mapeia o processo da empresa dele: quais cargos existem, quais
   handoffs acontecem, quais são os entregáveis de cada etapa. Trabalho individual, com
   permissão explícita de fazer em dupla.
2. **Gerar** — o Skill Creator transforma a descrição em skill. **Ele não vem com o
   Claude Code:** é o plugin `skill-creator@claude-plugins-official`, instalado com os
   dois comandos `claude plugin marketplace add …` / `claude plugin install …`, que
   rodam **fora** do REPL e só valem **na sessão seguinte**. Por isso a instalação é um
   passo de palco (B.2), com a sala toda, e não pressuposto.
3. **Validar** — roda o validador, que é *"uma skill que é um antipattern da sua"*, com
   pontos de avaliação definidos. Saída: **o aluno sai com uma nota**.

O validador é material novo — não existia nada equivalente no repositório quando esta
spec foi escrita. Ele agora vive em `05-imersao-cro/skills/code/valida-skill-cro/` e é
**reproduzido por extenso no handout**, porque o aluno precisa instalá-lo à mão: a pasta
`~/.claude/skills/` não existe numa configuração nova, e a skill só carrega depois de
fechar e reabrir o Claude Code.

---

## 6. Cases obrigatórios

Ação do Lucian definida em 11/09:

- **Duty Free** — contar quando chegar em estudos de caso
- **Ering** — dados qualitativos gerando hipótese
- **Zerezes, Aklin** — citados como exemplos de quali a partir de reclamação real

---

## 7. Instalação — o que o aluno precisa

O Claude Code, mais a conta Claude Pro que já é pré-requisito do curso — **e as duas
dependências de base que o Claude Code usa por baixo: Node.js e git.**

**O git é dependência dura, não opcional.** O `claude plugin marketplace add` faz um
`git clone` por baixo; sem git ele falha com `✘ Failed to add marketplace: Failed to
clone marketplace repository`. Windows não traz git de fábrica e `npm install -g` não o
instala; no mac sem Xcode Command Line Tools, o `xcode-select --install` abre um
instalador gráfico que leva minutos. Como o B.2 (instalar o plugin) é declarado "nunca
corta" e é o que habilita o entregável do dia, o git tem que estar instalado **antes**
do evento — aviso pelo grupo de WhatsApp, e passo obrigatório no `instalacao.md`.

Fora: DuckDB, Python, `gmp-cli`, `agent-browser`, clone do repositório do curso. Nenhum
deles é necessário para o exercício, e cada um é um ponto de falha num intervalo de 30
minutos com 50 pessoas majoritariamente sem terminal.

O arquivo de exemplo a ser dissecado no bloco C é **um único `.md`**, distribuído por
pendrive ou copiado da tela. Sem download e sem ZIP, e o aluno não clona repositório —
mas isso não quer dizer que git não seja usado: ele é, por baixo do plugin.

---

## 8. O que se aproveita do material da v1

| Artefato | Destino |
|---|---|
| `skills/desktop/heuristica-morys.md` | **Vira o exemplo dissecado do bloco C.** A Taciana apontou heurística e análise de site como o que mais agrega |
| `skills/*/hipotese-estruturada`, `ice-score` | Referência para o facilitador; não entram como entregável |
| `skills/code/{srm-check,post-test-segments,variante-builder,pre-flight-check}` | Fora do bloco. Podem virar demo se sobrar tempo |
| `data/*.db` | Demo do facilitador apenas |
| `instalacao.md` | Reescrito: só Claude Code |
| `handout.md`, `script.md`, `deck/` | **Refeitos do zero** — construídos para 3h, tese e cronograma errados |
| `notes/sources/taciana-cro-fundamentos.md` | Mantido, é vocabulário |

---

## 9. Riscos

| Risco | Mitigação |
|---|---|
| Taciana estoura e sobra menos de 2h | Ordem de corte declarada (§3); B e C comprimem, A e D não |
| Aluno não consegue instalar o Claude Code no intervalo | Acompanha A inteiro sem máquina (o bloco A é conceitual, sem ferramenta); em D trabalha em dupla com quem instalou |
| **Aluno sem git no B.2** — o `plugin marketplace add` faz `git clone` por baixo e falha com `Failed to clone marketplace repository` | Avisar a turma pelo grupo de WhatsApp **antes do evento**; git como passo obrigatório no `instalacao.md`. No dia não há conserto de palco (mac: instalador gráfico; Windows: download): mão levantada, dupla no bloco D |
| **Plugin ou skill instalados com a sessão aberta não aparecem** — o Claude Code só os carrega na sessão seguinte | Todos os documentos mandam sair (`/exit`) e reabrir (`claude`) depois de instalar; a conferência de sala acontece **depois** do reinício, nunca pela mensagem de sucesso |
| **Comandos do plugin digitados dentro do REPL** viram prompt para o modelo e não instalam nada | Instrução explícita de `/exit` antes dos dois comandos, no `instalacao.md`, no `handout.md` e no `script.md`; sintoma na tabela de erros |
| Aluno não sabe descrever o processo da própria empresa | O bloco A já expõe as etapas; a descrição é guiada por perguntas fixas, não em branco |
| Skill Creator se comportar diferente do ensaiado | Ensaiar na máquina do dia; ter o caminho manual (escrever o `.md` à mão) como plano B |
| Validador dar nota alta para skill ruim | Calibrar com 3 exemplos antes do evento: uma boa, uma vaga, uma sem processo |

---

## 10. Pendências humanas

- Ensaiar o bloco D ponta a ponta na máquina do dia
- Calibrar o validador com os 3 exemplos
- Confirmar com a Taciana o horário real de entrega do palco
- Grupo de WhatsApp da turma: definido em 11/09 como canal de envio de links
