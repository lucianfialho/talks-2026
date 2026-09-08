# Imersão Claude para CRO — Módulo da tarde — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produzir todo o material do bloco de 15h–18h da Imersão Claude para CRO (14/09/2026): pacote de skills em duas camadas, dataset de demo, handout do aluno, guia de instalação, roteiro do facilitador e deck.

**Architecture:** Quatro subsistemas com dependência linear fraca. (A) **Dataset** — `cro.db` com SRM proposital + `cro-clean.db` sem SRM; tudo local, zero OAuth. (B) **Skills** — cada skill existe em `skills/desktop/` (instrução colável em Project do Claude Desktop) e `skills/code/` (SKILL.md com frontmatter para Claude Code); a duplicação é intencional e é o que torna a comparação de camadas tangível na sala. (C) **Material do aluno** — `handout.md` e `instalacao.md`, autossuficientes: quem trava 10min consegue voltar sozinho. (D) **Material do facilitador** — `script.md` com timing e deck HTML no padrão dos outros decks do repo.

**Tech Stack:** Markdown com frontmatter YAML (formato de skill do Claude Code), DuckDB (SQL + `cro.db`), HTML/CSS/JS estático para o deck (custom element `<deck-stage>`, sem framework, servido por `python3 -m http.server`).

**Spec:** `docs/superpowers/specs/2026-09-08-imersao-cro-claude-design.md`

## Global Constraints

- **Evento em 2026-09-14.** Este plano é executado em D-6. Ordem das tasks é por criticidade, não por conveniência.
- **Vocabulário obrigatório:** usar os termos do material da Taciana, nunca sinônimos. As 7 dimensões de Morys são exatamente `Relevância, Confiança, Orientação, Estímulo, Segurança, Conveniência, Confirmação`. O template de hipótese é exatamente `Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência]`. ICE é `Impacto × Confiança × Facilidade`, escala 1–10 cada.
- **Nenhuma skill do hands-on pode depender de `gmp-cli`, `agent-browser` ou OAuth.** Essas dependências só aparecem na demo gravada do degrau 3.
- **Skills do degrau 1 (`heuristica-morys`, `hipotese-estruturada`, `ice-score`) devem funcionar sem acesso a arquivo, rede ou execução** — elas rodam em Claude Desktop com conta Pro.
- **Idioma:** todo material voltado ao aluno em pt-BR. Frontmatter de skill (`name`, `description`) também em pt-BR, seguindo o padrão de `02-cro/demos/skills/`.
- **Commits:** conventional commits (`feat:`, `docs:`, `chore:`, `fix:`). Rodapé obrigatório em todo commit:
  ```
  Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
  Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT
  ```
- **`.metadata/summary.yaml`** é obrigatório em diretório novo de palestra (gate do repo). Formato em `03-analytics-copilot/.metadata/summary.yaml`.

---

## File Structure

```
05-imersao-cro/
├── .metadata/summary.yaml        Task 1
├── data/
│   ├── cro.db                    Task 2  — COM SRM (control 4000 / variant_b 4400)
│   ├── cro-clean.db              Task 2  — SEM SRM, para o bloco de segmentação
│   └── README.md                 Task 2  — o que cada dataset ensina
├── skills/
│   ├── README.md                 Task 9  — como instalar em cada camada
│   ├── desktop/
│   │   ├── heuristica-morys.md         Task 3
│   │   ├── hipotese-estruturada.md     Task 4
│   │   └── ice-score.md                Task 5
│   └── code/
│       ├── heuristica-morys/SKILL.md       Task 3
│       ├── hipotese-estruturada/SKILL.md   Task 4
│       ├── ice-score/SKILL.md              Task 5
│       ├── srm-check/SKILL.md              Task 6
│       ├── post-test-segments/SKILL.md     Task 7
│       ├── variante-builder/SKILL.md       Task 8
│       └── pre-flight-check/SKILL.md       Task 8
├── instalacao.md                 Task 10
├── handout.md                    Task 11
├── script.md                     Task 12
├── deck/
│   ├── index.html                Task 13
│   ├── deck-styles.css           Task 13 (copiado de 04-)
│   ├── deck-stage.js             Task 13 (copiado de 04-)
│   └── package.json              Task 13
└── notes/
    ├── sources/taciana-cro-fundamentos.md  Task 1
    └── video-spec.md             Task 14
```

**Ordem por criticidade.** Tasks 1–5 entregam o contrato da página de vendas (skills do degrau 1) e são inegociáveis. Tasks 6–11 entregam o hands-on do degrau 2. Tasks 12–14 são material de palco: se o tempo acabar, o script é mais importante que o deck, e o deck é mais importante que os vídeos.

**Sugestão de calendário:** D-6/D-5 tasks 1–5 · D-4 tasks 6–9 · D-3 tasks 10–11 · D-2 tasks 12–13 · D-1 task 14 + ensaio.

---

## Task 1: Scaffold e fonte da Taciana

**Files:**
- Create: `05-imersao-cro/.metadata/summary.yaml`
- Create: `05-imersao-cro/notes/sources/taciana-cro-fundamentos.md`
- Create: `05-imersao-cro/notes/.gitkeep`

**Interfaces:**
- Produces: a árvore `05-imersao-cro/` e o arquivo de fonte que as tasks 3, 4, 5, 12 e 13 citam para não inventar vocabulário.

- [ ] **Step 1: Criar a árvore de diretórios**

```bash
mkdir -p 05-imersao-cro/{.metadata,data,skills/desktop,skills/code,notes/sources,deck}
touch 05-imersao-cro/notes/.gitkeep
```

- [ ] **Step 2: Extrair o PDF da Taciana**

O PDF está em `~/Downloads/Material CRO AI DAY.pdf` (44 páginas).

```bash
pdftotext -layout ~/Downloads/"Material CRO AI DAY.pdf" /tmp/taci-raw.txt
wc -l /tmp/taci-raw.txt
```

Esperado: ~592 linhas.

- [ ] **Step 3: Escrever `notes/sources/taciana-cro-fundamentos.md`**

Estruturar a extração como referência consultável, não como dump. O arquivo DEVE conter, literalmente:

- Cabeçalho identificando: autora Taciana Serafim, 44 slides, bloco 14h–15h, recebido 2026-09-08
- **As 7 dimensões de Morys** com a pergunta-diagnóstico de cada uma, copiadas dos slides 16–22:
  - Relevância — "A proposta de valor ajuda a resolver as dores do cliente?"
  - Confiança — "São usadas celebridades ou autoridades como depoimentos?"
  - Orientação — "O CTA principal é visível e fácil de achar?"
  - Estímulo — "A percepção de preço e risco está bem projetada?"
  - Segurança — "Existe uma página de perguntas frequentes?"
  - Conveniência — "Os formulários realmente são convenientes?"
  - Confirmação — "A página mostra razões racionalmente boas para a decisão de compra?"
- **O template de hipótese** (slide 36) com os 4 campos e o exemplo dela:
  - Template: `Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência]`
  - Campos: Observação (unidade + contexto) · Intervenção (a mudança proposta) · Resultado esperado (métrica + magnitude) · Evidência (dados que suportam)
  - Exemplo: "Se adicionarmos auto-preenchimento por CEP no checkout mobile, então o completion aumentará 20%, porque heatmaps mostram rage clicks no campo de endereço e 68% dos usuários mobile abandonam nessa etapa."
- **ICE Score** (slide 38): Impacto × Confiança × Facilidade, 1–10 cada, com o aviso "ranking relativo, não veredito"
- **As 4 posições** (slide 07): Digital Analytics (defesa) · Estrategista de CRO (armação) · UX/Research (criação) · Dev/Experimentação (ataque), com a pergunta de cada uma
- **As 3 transformações** (slide 08): Analytics transforma comportamento em evidência · CRO transforma evidência em hipótese · Dev transforma hipótese em experimento
- **Dados do Mapa da Conversão 2026** (slide 11): 179 diagnósticos, score médio 53, e os temas recorrentes com percentual — CTA e hierarquia visual 99%, Confiança e prova social 97%, Clareza da proposta de valor 93%, Fricção do funil e formulários 84%, Experiência mobile 79%, Conteúdo e objeções 60%
- **Checklist pré-Start** (slide 41) e a frase "Um erro de implementação não aparece no resultado — ele aparece como um resultado que ninguém consegue explicar."
- **Frase de fechamento dela (slide 44):** "O próximo desafio não é usar o Claude. É transformá-lo em parte do seu processo de CRO." — marcada como **GANCHO DE ABERTURA DO BLOCO DAS 15h**

- [ ] **Step 4: Escrever `.metadata/summary.yaml`**

```yaml
id: 05-imersao-cro
title: "Imersão Claude para CRO — módulo da tarde (15h-18h)"
event: "Imersão Claude para CRO — CRO Brasil"
event_url: "https://crobrasil.com.br/imersao-claude/"
event_date: "2026-09-14"
event_time: "15:00 – 18:00"
duration_min: 180
location: "Distrito · Av. Rebouças, 1585, São Paulo — presencial, 50 vagas"
tags:
  - cro
  - workshop
  - skills
  - analytics-copilot
  - hands-on
covers:
  - skills/
  - handout.md
  - instalacao.md
  - script.md
  - notes/sources/taciana-cro-fundamentos.md
last_updated: "2026-09-08"
status: in-progress
```

- [ ] **Step 5: Verificar que a fonte cobre o vocabulário obrigatório**

```bash
for termo in "Relevância" "Confiança" "Orientação" "Estímulo" "Segurança" "Conveniência" "Confirmação" "porque \[evidência\]" "Impacto × Confiança × Facilidade"; do
  grep -q "$termo" 05-imersao-cro/notes/sources/taciana-cro-fundamentos.md \
    && echo "OK  $termo" || echo "FALTA $termo"
done
```

Esperado: 9 linhas, todas `OK`. Qualquer `FALTA` significa que a Task 3/4/5 vai inventar vocabulário — corrigir antes de seguir.

- [ ] **Step 6: Commit**

```bash
git add 05-imersao-cro/
git commit -m "chore: scaffold 05-imersao-cro + extração do material da Taciana

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 2: Datasets — com e sem SRM

**Files:**
- Create: `05-imersao-cro/data/cro.db` (cópia de `cro.db` da raiz)
- Create: `05-imersao-cro/data/cro-clean.db`
- Create: `05-imersao-cro/data/README.md`

**Interfaces:**
- Produces: `05-imersao-cro/data/cro.db` com tabela `events` e views `sessions` e `events_clean`, colunas `user_pseudo_id VARCHAR, event_name VARCHAR, event_timestamp TIMESTAMP, device_category VARCHAR, traffic_source VARCHAR, experiment_variant VARCHAR, session_duration BIGINT, converted BIGINT, is_new_user BIGINT`. Mesma estrutura em `cro-clean.db`. Tasks 6 e 7 consomem ambos.

**Contexto:** o `cro.db` existente tem SRM proposital — `control` com 4000 usuários e `variant_b` com 4400 (χ² ≈ 19,05, p < 0,0001). Isso é o momento didático do bloco das 16h05: o aluno acha que tem um lift de 20% e a skill invalida o teste. Mas `post-test-segments` (Task 7) precisa de um teste **válido** para rodar honestamente — daí o segundo dataset.

- [ ] **Step 1: Copiar o dataset com SRM**

```bash
cp cro.db 05-imersao-cro/data/cro.db
```

- [ ] **Step 2: Confirmar o SRM no dataset copiado**

```bash
duckdb 05-imersao-cro/data/cro.db -c \
"SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) users
 FROM events_clean WHERE event_name='session_start' GROUP BY 1 ORDER BY 1;"
```

Esperado: `control 4000` e `variant_b 4400`. Se os números mudarem, o script da Task 12 precisa ser reajustado.

- [ ] **Step 3: Gerar o dataset sem SRM**

Remover usuários de `variant_b` até equilibrar em 4000/4000, preservando a distribuição por device (senão o lift de mobile some junto).

```bash
duckdb 05-imersao-cro/data/cro-clean.db <<'SQL'
ATTACH '05-imersao-cro/data/cro.db' AS src (READ_ONLY);

-- amostra estratificada por device: mantém 4000 de cada variante
CREATE TABLE events AS
WITH ranked AS (
  SELECT user_pseudo_id, experiment_variant, device_category,
         ROW_NUMBER() OVER (
           PARTITION BY experiment_variant, device_category
           ORDER BY user_pseudo_id
         ) AS rn,
         COUNT(*) OVER (PARTITION BY experiment_variant, device_category) AS n_cell,
         COUNT(*) OVER (PARTITION BY experiment_variant) AS n_var
  FROM (SELECT DISTINCT user_pseudo_id, experiment_variant, device_category
        FROM src.events_clean WHERE experiment_variant IS NOT NULL)
),
keep AS (
  SELECT user_pseudo_id FROM ranked
  WHERE rn <= CAST(ROUND(n_cell * 4000.0 / n_var) AS BIGINT)
)
SELECT e.* FROM src.events e
WHERE e.user_pseudo_id IN (SELECT user_pseudo_id FROM keep);

CREATE OR REPLACE VIEW sessions AS
SELECT
    user_pseudo_id,
    COUNT(*) AS hit_count,
    MAX(CASE WHEN event_name = 'session_start' THEN session_duration END) AS session_duration,
    MAX(device_category) AS device_category,
    MAX(traffic_source) AS traffic_source,
    MAX(experiment_variant) AS experiment_variant,
    MAX(converted) AS converted,
    MAX(is_new_user) AS is_new_user,
    MIN(event_timestamp) AS first_seen
FROM events
GROUP BY user_pseudo_id;

CREATE OR REPLACE VIEW events_clean AS
SELECT e.* FROM events e
WHERE e.user_pseudo_id NOT IN (
    SELECT user_pseudo_id FROM sessions
    WHERE hit_count > 50 OR session_duration = 0
);
SQL
```

- [ ] **Step 4: Verificar que o SRM sumiu e o lift de mobile ficou**

```bash
duckdb 05-imersao-cro/data/cro-clean.db -c \
"SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) users
 FROM events_clean WHERE event_name='session_start' GROUP BY 1 ORDER BY 1;" -c \
"SELECT device_category, experiment_variant,
        ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)
              /COUNT(DISTINCT user_pseudo_id),2) cr
 FROM events_clean WHERE experiment_variant IS NOT NULL
 GROUP BY 1,2 ORDER BY 1,2;"
```

Esperado: as duas variantes dentro de ±1% uma da outra (χ² não significativo), e mobile ainda com `variant_b` acima de `control` por margem visível. Se o lift de mobile tiver sumido, refazer o Step 3 aumentando o alvo de 4000 para o mínimo entre as variantes por célula.

- [ ] **Step 5: Escrever `data/README.md`**

Conteúdo obrigatório: uma tabela com as duas linhas abaixo e um parágrafo explicando por que existem dois arquivos.

| Arquivo | O que tem | Usado em |
|---|---|---|
| `cro.db` | Teste A/B com **SRM** — control 4000 / variant_b 4400 | Bloco 16h05, `srm-check`. O aluno vê a skill invalidar um teste que parecia vencedor. |
| `cro-clean.db` | Mesmo teste, tráfego equilibrado | Bloco 16h05, `post-test-segments`. Segmentação só faz sentido em teste válido. |

O parágrafo deve dizer: *"Rodar segmentação em teste com SRM é exatamente o erro que a skill anterior existe para impedir. Os dois arquivos tornam essa sequência demonstrável em vez de teórica."*

- [ ] **Step 6: Commit**

```bash
git add 05-imersao-cro/data/
git commit -m "feat: datasets de demo com e sem SRM

cro.db tem SRM proposital (4000/4400) — a skill srm-check invalida o
teste na frente do aluno. cro-clean.db é o mesmo teste equilibrado,
para a segmentação rodar em cima de resultado válido.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 3: Skill `heuristica-morys` (degrau 1)

**Files:**
- Create: `05-imersao-cro/skills/desktop/heuristica-morys.md`
- Create: `05-imersao-cro/skills/code/heuristica-morys/SKILL.md`

**Interfaces:**
- Consumes: as 7 dimensões e suas perguntas-diagnóstico de `05-imersao-cro/notes/sources/taciana-cro-fundamentos.md` (Task 1).
- Produces: um output em markdown com uma linha por dimensão no formato `| Dimensão | Nota 1-5 | Achado | Evidência na página |`, consumido pela Task 4 (`hipotese-estruturada` recebe esse output como observação).

**Por que existe:** a `heuristic-scan` em `02-cro/demos/skills/` é técnica (WCAG, thumb zone, tap targets 44px) e não corresponde ao vocabulário de Morys que a Taciana instala às 14h. Usar aquela criaria dois vocabulários na mesma tarde. Esta é escrita nova.

- [ ] **Step 1: Escrever a versão Desktop**

`05-imersao-cro/skills/desktop/heuristica-morys.md` — sem frontmatter YAML (Claude Desktop não lê frontmatter; o aluno cola isso na instrução do Project). Estrutura obrigatória:

```markdown
# Heurística de Morys — varredura em 7 dimensões

Você é um estrategista de CRO. Avalia páginas usando a heurística de André Morys.

## Input necessário

Antes de começar, peça ao usuário:
1. A URL da página
2. Um print da página (acima da dobra, desktop e mobile se possível)
3. Qual é a conversão desejada nessa página
4. Quem é o público que chega nela

Se faltar o print, diga que a análise fica limitada ao que a URL sugere e
peça confirmação antes de seguir. Não invente o que está na página.

## As 7 dimensões

Avalie cada uma de 1 a 5, com a pergunta-guia:

| # | Dimensão | Pergunta |
|---|---|---|
| 1 | Relevância | A proposta de valor ajuda a resolver as dores do cliente? |
| 2 | Confiança | São usadas celebridades ou autoridades como depoimentos? |
| 3 | Orientação | O CTA principal é visível e fácil de achar? |
| 4 | Estímulo | A percepção de preço e risco está bem projetada? |
| 5 | Segurança | Existe uma página de perguntas frequentes? |
| 6 | Conveniência | Os formulários realmente são convenientes? |
| 7 | Confirmação | A página mostra razões racionalmente boas para a decisão de compra? |

## Regras de avaliação

- Cada nota precisa citar **o que você viu na página**. "Nota 2 em Orientação"
  sem dizer qual CTA e onde ele está é uma nota inútil.
- Se você não consegue avaliar uma dimensão com o material fornecido, escreva
  `n/d` e diga o que precisaria para avaliar. Nunca chute uma nota.
- Não sugira solução ainda. Esta skill diagnostica. A hipótese vem depois.

## Output

| Dimensão | Nota (1-5) | Achado | Evidência na página |
|---|---|---|---|
| ... | ... | ... | ... |

**Score total:** X/35

**As 2 dimensões mais fracas:** [nomes] — são as candidatas a virar hipótese.

Termine com: "Rode `hipotese-estruturada` sobre a dimensão mais fraca."
```

- [ ] **Step 2: Escrever a versão Claude Code**

`05-imersao-cro/skills/code/heuristica-morys/SKILL.md` — mesmo corpo do Step 1, com frontmatter e uma seção extra:

```markdown
---
name: heuristica-morys
description: Varredura de página nas 7 dimensões da heurística de André Morys (Relevância, Confiança, Orientação, Estímulo, Segurança, Conveniência, Confirmação). Diagnostica onde a página perde conversão antes de propor hipótese. Use quando o usuário disser "analisar página", "heurística", "diagnóstico de CRO", "onde estou perdendo conversão".
---
```

Corpo idêntico ao da versão Desktop, mais esta seção no fim:

```markdown
## Camada avançada (só no Claude Code)

Se `agent-browser` estiver disponível, capture a página em vez de pedir print:

    agent-browser open <url>
    agent-browser wait --load networkidle
    agent-browser screenshot /tmp/morys-desktop.png
    agent-browser snapshot -i

Se o comando não existir, siga com o print colado pelo usuário — a análise
das 7 dimensões não depende disso.
```

- [ ] **Step 3: Verificar que as 7 dimensões estão nas duas versões**

```bash
for f in 05-imersao-cro/skills/desktop/heuristica-morys.md \
         05-imersao-cro/skills/code/heuristica-morys/SKILL.md; do
  echo "--- $f"
  for d in Relevância Confiança Orientação Estímulo Segurança Conveniência Confirmação; do
    grep -q "$d" "$f" && echo "  OK  $d" || echo "  FALTA $d"
  done
done
```

Esperado: 14 linhas `OK`, zero `FALTA`.

- [ ] **Step 4: Verificar o frontmatter da versão Code**

```bash
python3 -c "
import sys
p='05-imersao-cro/skills/code/heuristica-morys/SKILL.md'
t=open(p).read()
assert t.startswith('---\n'), 'frontmatter ausente'
fm=t.split('---')[1]
assert 'name: heuristica-morys' in fm, 'name errado'
assert 'description:' in fm, 'description ausente'
print('frontmatter OK')
"
```

Esperado: `frontmatter OK`.

- [ ] **Step 5: Teste funcional — rodar a skill numa página real**

Instalar localmente e invocar em uma URL de e-commerce brasileiro qualquer:

```bash
mkdir -p ~/.claude/skills/heuristica-morys
cp 05-imersao-cro/skills/code/heuristica-morys/SKILL.md ~/.claude/skills/heuristica-morys/
```

Numa sessão nova do Claude Code, pedir: *"roda heuristica-morys em https://www.example-loja.com.br/produto/x"*.

Critério de aprovação: o output traz **as 7 linhas** da tabela, cada nota cita evidência concreta da página, e dimensões não avaliáveis vêm como `n/d` em vez de chute. Se a skill inventar conteúdo da página, endurecer a regra "Não invente o que está na página" no Step 1 e repetir.

- [ ] **Step 6: Commit**

```bash
git add 05-imersao-cro/skills/
git commit -m "feat: skill heuristica-morys nas duas camadas

Escrita nova nas 7 dimensões de Morys do material da Taciana, em vez de
reaproveitar heuristic-scan de 02-cro, que é técnica (WCAG/thumb zone) e
criaria dois vocabulários na mesma tarde.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 4: Skill `hipotese-estruturada` (degrau 1) — a skill que constrói a parede

**Files:**
- Create: `05-imersao-cro/skills/desktop/hipotese-estruturada.md`
- Create: `05-imersao-cro/skills/code/hipotese-estruturada/SKILL.md`

**Interfaces:**
- Consumes: a tabela de output de `heuristica-morys` (Task 3) como observação de entrada.
- Produces: uma hipótese preenchida no formato `Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência]` mais os 4 campos separados (Observação, Intervenção, Resultado esperado, Evidência), consumida pela Task 5 (`ice-score`) e pela Task 8 (`variante-builder`).

**Esta é a skill mais importante do plano.** Ela cumpre a promessa literal da página de vendas ("hipótese estruturada a partir de insight real") **e** constrói a parede narrativa das 15h30: ela se recusa a completar o campo `porque [evidência]` sem dado, e o Claude Desktop não consegue buscar dado. O aluno vai para o café com a pergunta aberta.

- [ ] **Step 1: Escrever a versão Desktop**

`05-imersao-cro/skills/desktop/hipotese-estruturada.md`:

```markdown
# Hipótese estruturada

Transforma um achado em hipótese testável. Uma ideia solta não é hipótese.

## O template

    Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência].

Quatro campos, todos obrigatórios:

| Campo | O que é | Exemplo |
|---|---|---|
| Observação | Unidade + contexto | "Usuários mobile no checkout" |
| Intervenção | A mudança proposta | "Auto-preenchimento por CEP" |
| Resultado esperado | Métrica + magnitude | "+20% checkout completion" |
| Evidência | Dados que suportam | "68% abandono + rage clicks" |

Exemplo completo:

> Se adicionarmos auto-preenchimento por CEP no checkout mobile, então o
> completion aumentará 20%, porque heatmaps mostram rage clicks no campo de
> endereço e 68% dos usuários mobile abandonam nessa etapa.

## Regra de bloqueio — leia com atenção

**Você NÃO pode preencher o campo `Evidência` sozinho.**

Evidência é dado observado: número de analytics, gravação de sessão, heatmap,
entrevista, teste anterior. Não é raciocínio, não é boa prática de mercado,
não é "estudos mostram que".

Se o usuário não fornecer evidência:

1. Preencha os três primeiros campos normalmente.
2. Deixe `Evidência` **em branco**, marcado como `⚠️ FALTA EVIDÊNCIA`.
3. Diga exatamente qual dado resolveria, nesta forma:

       Para fechar essa hipótese eu preciso de:
       - [métrica específica] segmentada por [dimensão]
       - no período de [recorte]
       - fonte: [GA4 / heatmap / gravação / teste anterior]

4. Diga com todas as letras: **"Sem esse dado, isso é uma ideia priorizada por
   opinião, não uma hipótese."**

Nunca invente número. Nunca use número ilustrativo sem marcar como ilustrativo.
Não aceite "acho que" como evidência.

## Output

    ## Hipótese

    Se [X], para [Y], então [Z], porque [evidência].

    | Campo | Conteúdo |
    |---|---|
    | Observação | ... |
    | Intervenção | ... |
    | Resultado esperado | ... |
    | Evidência | ... ou ⚠️ FALTA EVIDÊNCIA |

    ## Status
    ✅ Hipótese fechada   ou   ⚠️ Bloqueada — falta evidência

    ## Se bloqueada: o que buscar
    - ...
```

- [ ] **Step 2: Escrever a versão Claude Code**

`05-imersao-cro/skills/code/hipotese-estruturada/SKILL.md` — frontmatter:

```markdown
---
name: hipotese-estruturada
description: Transforma um achado de CRO em hipótese testável no template "Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência]". Bloqueia a hipótese quando não há evidência de dado real. Use quando o usuário disser "montar hipótese", "estruturar hipótese", "transformar ideia em teste", "hipótese de CRO".
---
```

Corpo idêntico ao Step 1, mais esta seção no fim:

```markdown
## Desbloqueio de evidência (só no Claude Code)

Se existir um dataset local (`data/cro.db` ou `data/cro-clean.db`), você pode
buscar a evidência em vez de pedir ao usuário:

    duckdb data/cro-clean.db -c "SELECT device_category,
      ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)
            /COUNT(DISTINCT user_pseudo_id),2) AS cr
      FROM events_clean GROUP BY 1 ORDER BY cr;"

Use o resultado como evidência real e cite a query no campo. Esta seção é a
diferença prática entre a camada Desktop e a camada Code: o método é o mesmo,
a capacidade de fechar a hipótese não é.
```

- [ ] **Step 3: Teste do caminho bloqueado**

Instalar e invocar sem dar evidência:

```bash
mkdir -p ~/.claude/skills/hipotese-estruturada
cp 05-imersao-cro/skills/code/hipotese-estruturada/SKILL.md ~/.claude/skills/hipotese-estruturada/
```

Em sessão nova, pedir: *"monta uma hipótese: o CTA da minha página de produto está fraco, quero mudar o texto"* — sem fornecer nenhum dado.

Critério de aprovação: o output traz `⚠️ FALTA EVIDÊNCIA`, lista qual dado resolveria, e contém a frase *"Sem esse dado, isso é uma ideia priorizada por opinião, não uma hipótese."* **Se a skill inventar uma evidência, a parede das 15h30 não acontece e o bloco inteiro perde o gancho.** Endurecer a regra e repetir até bloquear de forma confiável em 3 tentativas seguidas.

- [ ] **Step 4: Teste do caminho desbloqueado**

Em sessão nova, no diretório `05-imersao-cro/`, pedir: *"monta uma hipótese sobre conversão em mobile, busca a evidência no dataset"*.

Critério de aprovação: a skill roda a query no DuckDB, cita o número real que voltou e fecha com `✅ Hipótese fechada`.

- [ ] **Step 5: Commit**

```bash
git add 05-imersao-cro/skills/
git commit -m "feat: skill hipotese-estruturada com bloqueio por falta de evidência

O bloqueio é o mecanismo narrativo da parede das 15h30: a skill se recusa
a preencher 'porque [evidência]' sem dado, e o Desktop não consegue buscar.
A versão Code desbloqueia via DuckDB — a diferença entre as camadas fica
demonstrada em vez de argumentada.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 5: Skill `ice-score` (degrau 1)

**Files:**
- Create: `05-imersao-cro/skills/desktop/ice-score.md`
- Create: `05-imersao-cro/skills/code/ice-score/SKILL.md`

**Interfaces:**
- Consumes: uma ou mais hipóteses no formato produzido pela Task 4.
- Produces: backlog ranqueado — tabela `| # | Hipótese | I | C | F | ICE | Status da evidência |`.

- [ ] **Step 1: Escrever a versão Desktop**

`05-imersao-cro/skills/desktop/ice-score.md`:

```markdown
# ICE Score — priorização de backlog

    ICE = Impacto × Confiança × Facilidade

Cada eixo de 1 a 10. Score vai de 1 a 1000.

| Eixo | Pergunta | Nota 1 | Nota 10 |
|---|---|---|---|
| Impacto | Se der certo, quanto move a métrica de negócio? | mexe em métrica secundária | mexe em receita direta |
| Confiança | Quão forte é a evidência de que vai dar certo? | achismo | teste anterior no mesmo funil |
| Facilidade | Quanto custa colocar no ar? | precisa de time, sprint, backend | troca de copy no CMS |

## Regras

- **Hipótese com `⚠️ FALTA EVIDÊNCIA` tem Confiança no máximo 3.** Sem dado,
  a confiança é opinião. Marque isso na tabela e diga por quê.
- Peça ao usuário a nota de **Facilidade** — só quem conhece a stack sabe o
  custo real. Se ele não souber, marque `?` e diga que o dev precisa estimar.
- Impacto e Confiança você pode propor, mas justificando cada nota em uma linha.

## Aviso obrigatório no output

Termine sempre com:

> ICE organiza a conversa, não decide por você. Use como ranking relativo entre
> as hipóteses desta lista, nunca como veredito absoluto. O dev participa
> estimando esforço e risco técnico.

## Output

| # | Hipótese | I | C | F | ICE | Evidência |
|---|---|---|---|---|---|---|
| 1 | ... | 8 | 6 | 7 | 336 | ✅ |
| 2 | ... | 9 | 3 | 4 | 108 | ⚠️ falta |

**Recomendação:** comece pela #1. Justificativa em uma linha.
```

- [ ] **Step 2: Escrever a versão Claude Code**

`05-imersao-cro/skills/code/ice-score/SKILL.md` — frontmatter:

```markdown
---
name: ice-score
description: Prioriza backlog de hipóteses de CRO com ICE Score (Impacto × Confiança × Facilidade, 1-10 cada). Penaliza hipóteses sem evidência. Use quando o usuário disser "priorizar", "o que testar primeiro", "ICE", "backlog de testes".
---
```

Corpo idêntico ao Step 1, mais:

```markdown
## Persistência (só no Claude Code)

Salve o backlog ranqueado em `backlog-cro.md` no diretório atual, com a data
de geração no topo. Se o arquivo já existir, acrescente uma nova seção datada
em vez de sobrescrever — o histórico de priorização é o que mostra se a
Confiança das hipóteses melhorou com o tempo.
```

- [ ] **Step 3: Teste da regra de penalização**

Instalar e invocar com duas hipóteses, uma com evidência e outra sem:

```bash
mkdir -p ~/.claude/skills/ice-score
cp 05-imersao-cro/skills/code/ice-score/SKILL.md ~/.claude/skills/ice-score/
```

Prompt de teste: *"prioriza: (1) auto-preenchimento por CEP no checkout mobile, evidência: 68% de abandono e rage clicks no campo de endereço; (2) mudar a cor do botão pra verde, acho que vai converter mais"*.

Critério de aprovação: a hipótese (2) recebe Confiança ≤ 3 com justificativa explícita, a (1) fica acima no ranking, e o aviso "ICE organiza a conversa, não decide por você" aparece no fim.

- [ ] **Step 4: Commit**

```bash
git add 05-imersao-cro/skills/
git commit -m "feat: skill ice-score com penalização de hipótese sem evidência

Fecha o pacote do degrau 1 — as três skills que rodam em Claude Desktop e
cumprem o contrato da página de vendas antes de qualquer instalação.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 6: Skill `srm-check` (degrau 2) — adaptada

**Files:**
- Create: `05-imersao-cro/skills/code/srm-check/SKILL.md`
- Reference: `02-cro/demos/skills/srm-check.md` (origem, não modificar)

**Interfaces:**
- Consumes: `05-imersao-cro/data/cro.db` (Task 2), view `events_clean`, colunas `experiment_variant`, `user_pseudo_id`, `event_name`.
- Produces: veredito `SRM DETECTADO` ou `SEM SRM`, com χ², p-valor e a distribuição observada vs esperada. A Task 7 (`post-test-segments`) exige este veredito antes de rodar.

- [ ] **Step 1: Escrever a skill**

Base: `02-cro/demos/skills/srm-check.md`. Mudanças obrigatórias em relação ao original:
- caminho do banco passa a ser `data/cro.db` relativo ao diretório do aluno (o original aponta para a pasta do projeto `02-cro`)
- adicionar o cálculo explícito de χ² e p-valor em Python, porque o aluno precisa **ver a estatística acontecer** — é isso que o Desktop não faz

`05-imersao-cro/skills/code/srm-check/SKILL.md`:

```markdown
---
name: srm-check
description: Valida Sample Ratio Mismatch em teste A/B antes de declarar resultado. Roda chi-quadrado sobre a distribuição de usuários por variante no DuckDB local. Use quando o usuário disser "SRM", "validar teste", "o teste é confiável", "posso declarar vencedor".
---

## Tarefa

Verificar se o teste A/B tem SRM antes de qualquer leitura de resultado. Um
teste com SRM não tem resultado — tem um bug de distribuição.

## Passo 1 — distribuição observada

    duckdb data/cro.db -c "
    SELECT experiment_variant,
           COUNT(DISTINCT user_pseudo_id) AS users
    FROM events_clean
    WHERE event_name = 'session_start'
      AND experiment_variant IS NOT NULL
    GROUP BY 1 ORDER BY 1;"

## Passo 2 — chi-quadrado

Assumindo alocação pretendida de 50/50 (confirme com o usuário se for outra):

    python3 -c "
    obs = [<users_control>, <users_variant>]
    n = sum(obs); exp = [n/2, n/2]
    chi2 = sum((o-e)**2/e for o,e in zip(obs,exp))
    # p-valor para 1 grau de liberdade, sem dependência externa
    import math
    p = math.erfc(math.sqrt(chi2/2))
    print(f'chi2={chi2:.2f}  p={p:.6f}')
    "

## Passo 3 — veredito

| p-valor | Veredito | O que fazer |
|---|---|---|
| p < 0,01 | 🔴 **SRM DETECTADO** | Não leia o resultado. Investigue a instrumentação. |
| 0,01 ≤ p < 0,05 | 🟡 **Suspeito** | Investigue antes de decidir. |
| p ≥ 0,05 | 🟢 **SEM SRM** | Pode seguir para a análise segmentada. |

## Passo 4 — se detectou SRM

Liste as causas mais comuns, nesta ordem:
1. Redirect na variante B perdendo usuários no caminho
2. Bots contados só de um lado
3. Flicker / tag disparando antes do bucketing
4. Filtro de audiência aplicado depois da alocação

Diga explicitamente: **"Esse teste não tem resultado para ler. Corrigir a
distribuição vem antes de qualquer análise de lift."**

## Output

    ## SRM Check
    | Variante | Usuários | % observado | % esperado |
    |---|---|---|---|

    chi2 = X.XX · p = 0.XXXXXX
    Veredito: 🔴/🟡/🟢

    ## Próximo passo
    ...
```

- [ ] **Step 2: Verificar que a query roda no dataset**

```bash
duckdb 05-imersao-cro/data/cro.db -c "
SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users
FROM events_clean
WHERE event_name='session_start' AND experiment_variant IS NOT NULL
GROUP BY 1 ORDER BY 1;"
```

Esperado: `control 4000`, `variant_b 4400`.

- [ ] **Step 3: Verificar que o chi-quadrado dá SRM**

```bash
python3 -c "
import math
obs=[4000,4400]; n=sum(obs); exp=[n/2,n/2]
chi2=sum((o-e)**2/e for o,e in zip(obs,exp))
p=math.erfc(math.sqrt(chi2/2))
print(f'chi2={chi2:.2f} p={p:.8f}')
assert p < 0.01, 'dataset deixou de ter SRM — a demo perde o momento didático'
print('SRM confirmado')
"
```

Esperado: `chi2=19.05 p=0.00001...` e `SRM confirmado`.

- [ ] **Step 4: Verificar que o dataset limpo passa**

```bash
python3 - <<'PY'
import math, subprocess
out = subprocess.run(['duckdb','05-imersao-cro/data/cro-clean.db','-noheader','-list','-c',
  "SELECT COUNT(DISTINCT user_pseudo_id) FROM events_clean WHERE event_name='session_start' AND experiment_variant='control';"
  ], capture_output=True, text=True).stdout.strip()
out2 = subprocess.run(['duckdb','05-imersao-cro/data/cro-clean.db','-noheader','-list','-c',
  "SELECT COUNT(DISTINCT user_pseudo_id) FROM events_clean WHERE event_name='session_start' AND experiment_variant='variant_b';"
  ], capture_output=True, text=True).stdout.strip()
obs=[int(out),int(out2)]; n=sum(obs); exp=[n/2,n/2]
chi2=sum((o-e)**2/e for o,e in zip(obs,exp)); p=math.erfc(math.sqrt(chi2/2))
print(obs, f'chi2={chi2:.2f} p={p:.4f}')
assert p >= 0.05, 'cro-clean.db ainda tem SRM — refazer Task 2 Step 3'
print('cro-clean OK')
PY
```

Esperado: `cro-clean OK`.

- [ ] **Step 5: Commit**

```bash
git add 05-imersao-cro/skills/
git commit -m "feat: skill srm-check adaptada para o dataset da imersão

Adaptada de 02-cro/demos/skills/srm-check.md: caminho do banco relativo ao
aluno e cálculo explícito de chi-quadrado e p-valor em Python — o aluno
precisa ver a estatística rodar, que é justamente o que o Desktop não faz.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 7: Skill `post-test-segments` (degrau 2) — adaptada

**Files:**
- Create: `05-imersao-cro/skills/code/post-test-segments/SKILL.md`
- Reference: `02-cro/demos/skills/post-test-segments.md` (origem, não modificar)

**Interfaces:**
- Consumes: veredito de `srm-check` (Task 6) e `05-imersao-cro/data/cro-clean.db` (Task 2).
- Produces: tabela de conversion rate por variante × segmento (`device_category`, `is_new_user`, `traffic_source`) com o lift por célula.

- [ ] **Step 1: Escrever a skill**

`05-imersao-cro/skills/code/post-test-segments/SKILL.md`:

```markdown
---
name: post-test-segments
description: Análise pós-teste A/B segmentada por device, novo vs recorrente e canal de aquisição. Revela onde o lift realmente aconteceu, em vez de ler só o agregado. Use quando o usuário disser "onde o lift aconteceu", "segmentar resultado", "análise pós-teste", "quebrar por device".
---

## Pré-condição obrigatória

Rode `srm-check` primeiro. Se o veredito for 🔴 SRM DETECTADO, **pare** e diga:

> Esse teste tem SRM. Segmentar um resultado inválido só produz conclusões
> inválidas mais detalhadas. Corrija a distribuição antes.

Só siga se o veredito for 🟢 ou se o usuário apontar explicitamente um dataset
válido.

## Passo 1 — resultado agregado

    duckdb data/cro-clean.db -c "
    SELECT experiment_variant,
           COUNT(DISTINCT user_pseudo_id) AS users,
           COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END) AS conv,
           ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)
                 /COUNT(DISTINCT user_pseudo_id),2) AS cr
    FROM events_clean WHERE experiment_variant IS NOT NULL
    GROUP BY 1 ORDER BY 1;"

## Passo 2 — por device

    duckdb data/cro-clean.db -c "
    SELECT device_category, experiment_variant,
           COUNT(DISTINCT user_pseudo_id) AS users,
           ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)
                 /COUNT(DISTINCT user_pseudo_id),2) AS cr
    FROM events_clean WHERE experiment_variant IS NOT NULL
    GROUP BY 1,2 ORDER BY 1,2;"

## Passo 3 — novo vs recorrente

Mesma query trocando `device_category` por `is_new_user`.

## Passo 4 — canal

Mesma query trocando `device_category` por `traffic_source`.

## Regras de leitura

- Calcule o **lift relativo** por célula: `(cr_variant - cr_control) / cr_control`.
- Uma célula com menos de 300 usuários por braço não sustenta conclusão —
  marque como `amostra insuficiente` em vez de reportar o lift.
- **Segmento com lift negativo é achado, não ruído.** Reporte junto. Um teste
  que ganha no mobile e perde no tablet é uma decisão de rollout segmentado,
  não um vencedor.
- Nunca conclua "vencedor". Conclua o que a evidência sustenta e qual decisão
  ela permite.

## Output

    ## Agregado
    | Variante | Users | Conv | CR |

    ## Por device
    | Device | Control CR | Variant CR | Lift | Amostra |

    ## Por tipo de usuário
    ...
    ## Por canal
    ...

    ## Leitura
    O ganho está concentrado em [segmento]. [Segmento] mostra perda.

    ## Decisão possível
    Winner e loser é leitura pobre. As opções aqui são: [rollout segmentado /
    novo teste em X / manter controle em Y].
```

- [ ] **Step 2: Verificar a query de device no dataset limpo**

```bash
duckdb 05-imersao-cro/data/cro-clean.db -c "
SELECT device_category, experiment_variant,
       COUNT(DISTINCT user_pseudo_id) AS users,
       ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)
             /COUNT(DISTINCT user_pseudo_id),2) AS cr
FROM events_clean WHERE experiment_variant IS NOT NULL
GROUP BY 1,2 ORDER BY 1,2;"
```

Esperado: 6 linhas (3 devices × 2 variantes), com `mobile`/`variant_b` visivelmente acima de `mobile`/`control`, e `tablet`/`variant_b` abaixo de `tablet`/`control`. **O tablet negativo é o achado que sustenta a fala "winner/loser é leitura pobre" no bloco das 16h05** — se ele sumir no dataset limpo, revisar a amostragem da Task 2.

- [ ] **Step 3: Verificar a regra de amostra mínima**

```bash
duckdb 05-imersao-cro/data/cro-clean.db -noheader -list -c "
SELECT MIN(u) FROM (
  SELECT COUNT(DISTINCT user_pseudo_id) u FROM events_clean
  WHERE experiment_variant IS NOT NULL GROUP BY device_category, experiment_variant);"
```

Esperado: valor ≥ 300. Se vier abaixo, a skill vai marcar células como `amostra insuficiente` durante a demo — ajustar a Task 2 ou reduzir o corte de 300 para o valor real, documentando a mudança.

- [ ] **Step 4: Commit**

```bash
git add 05-imersao-cro/skills/
git commit -m "feat: skill post-test-segments com pré-condição de SRM

Recusa rodar em teste com SRM. A sequência srm-check -> post-test-segments
é o que torna demonstrável a frase da Taciana de que winner/loser é leitura
pobre — o tablet negativo no dataset força a conversa de rollout segmentado.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 8: Skills `variante-builder` e `pre-flight-check` (degrau 2, cadeira do Dev)

**Files:**
- Create: `05-imersao-cro/skills/code/variante-builder/SKILL.md`
- Create: `05-imersao-cro/skills/code/pre-flight-check/SKILL.md`

**Interfaces:**
- Consumes: hipótese fechada da Task 4 (os 4 campos).
- Produces: `variante-builder` escreve dois arquivos no diretório do aluno — `variante-b.js` (JS que aplica a mudança) e `eventos.md` (eventos a instrumentar). `pre-flight-check` produz um checklist com veredito `PODE SUBIR` / `NÃO SUBA`.

Estas duas skills são o bloco das 16h50 e são as primeiras a serem cortadas se o tempo apertar (ver riscos da spec). Implemente as duas na mesma task: elas dividem o mesmo bloco e um revisor não aprovaria uma sem a outra.

- [ ] **Step 1: Escrever `variante-builder`**

```markdown
---
name: variante-builder
description: Transforma uma hipótese de CRO fechada no código da variante B (JS/CSS) mais a lista de eventos a instrumentar. Cobre as etapas Construir, Configurar e Instrumentar do fluxo de experimentação. Use quando o usuário disser "código da variante", "implementar o teste", "criar variante B".
---

## Pré-condição

A hipótese precisa estar fechada (com evidência). Se vier com
`⚠️ FALTA EVIDÊNCIA`, avise: "Dá para escrever o código, mas você vai gastar
sprint testando opinião." Pergunte se quer seguir mesmo assim.

## Passo 1 — extrair a mudança

Da hipótese, isole: o **elemento** que muda, a **página** onde muda e o
**segmento** que deve ver a variante.

## Passo 2 — gerar `variante-b.js`

Escreva um arquivo `variante-b.js` no diretório atual. Regras não negociáveis:

- **Anti-flicker:** a mudança acontece antes do primeiro paint, ou a variante
  aparece piscando e contamina o resultado.
- **Idempotente:** rodar duas vezes não duplica elemento.
- **Guard de escopo:** só executa se a URL casar com a página do teste.
- **Falha silenciosa:** se o elemento alvo não existir, sair sem quebrar a
  página — nunca deixe o teste derrubar o site.

Esqueleto:

    (function () {
      if (!/\/checkout/.test(location.pathname)) return;
      var alvo = document.querySelector('[data-test="cep-field"]');
      if (!alvo || alvo.dataset.variantApplied) return;
      alvo.dataset.variantApplied = '1';
      // ... a mudança
      window.dataLayer = window.dataLayer || [];
      window.dataLayer.push({ event: 'experiment_impression',
                              experiment_id: '<id>', variant: 'variant_b' });
    })();

## Passo 3 — gerar `eventos.md`

Liste os eventos necessários para ler o teste, com nome, quando dispara e qual
pergunta cada um responde:

| Evento | Dispara quando | Responde |
|---|---|---|
| `experiment_impression` | variante aplicada | quantos viram de fato |
| `<evento de micro-conversão>` | ... | onde o funil melhorou |
| `<evento de conversão>` | ... | a métrica primária |

Diga qual é a **métrica primária** e por que as outras são secundárias.

## Aviso final obrigatório

> Este código não foi testado no seu site. Rode `pre-flight-check` antes de
> subir. Um erro de implementação não aparece no resultado — ele aparece como
> um resultado que ninguém consegue explicar.
```

- [ ] **Step 2: Escrever `pre-flight-check`**

```markdown
---
name: pre-flight-check
description: Checklist do que checar antes de apertar Start num teste A/B — QA de implementação, instrumentação, amostra e critério de parada. Use quando o usuário disser "posso subir o teste", "pre-flight", "checklist antes de subir", "QA do teste".
---

## Tarefa

Rodar o checklist pré-Start e dar veredito. Não existe "quase pronto": ou pode
subir, ou não pode.

## Checklist

### Implementação
- [ ] Variante renderiza sem flicker (mudança antes do primeiro paint)?
- [ ] Testado em Chrome, Safari e no mobile real, não só no emulador?
- [ ] Se a página é SPA, a variante sobrevive à navegação client-side?
- [ ] O código falha silenciosamente se o elemento sumir?

### Instrumentação
- [ ] Evento de impressão dispara **uma vez por usuário**, não por pageview?
- [ ] O ID do experimento chega no analytics em ambas as variantes?
- [ ] A métrica primária está declarada **antes** de subir?
- [ ] Existe pelo menos uma métrica de guarda (algo que não pode piorar)?

### Amostra e parada
- [ ] Qual o tamanho de amostra necessário para o efeito mínimo que interessa?
- [ ] Quantos dias isso leva no tráfego atual?
- [ ] O teste cobre pelo menos um ciclo semanal completo?
- [ ] O critério de parada está escrito **antes** de começar?

### Conflitos
- [ ] Tem outro teste ativo na mesma página?
- [ ] Tem campanha, promoção ou sazonalidade no período?

## Regras

- Item que o usuário não souber responder conta como **não checado**. "Acho que
  sim" é não.
- Não estime tamanho de amostra sem taxa de conversão base e efeito mínimo.
  Peça os dois. Se não tiver, diga que o teste não tem critério de parada.

## Veredito

    ## Pre-flight
    ✅ Checados: X/16
    ⚠️ Não checados: [lista]

    ## Veredito
    🟢 PODE SUBIR   ou   🔴 NÃO SUBA — [o item bloqueante]

Qualquer item de **Instrumentação** ou **Amostra e parada** não checado força
🔴. Itens de Implementação não checados geram 🟡 com ressalva explícita.
```

- [ ] **Step 3: Teste funcional das duas skills em sequência**

```bash
mkdir -p ~/.claude/skills/variante-builder ~/.claude/skills/pre-flight-check
cp 05-imersao-cro/skills/code/variante-builder/SKILL.md ~/.claude/skills/variante-builder/
cp 05-imersao-cro/skills/code/pre-flight-check/SKILL.md ~/.claude/skills/pre-flight-check/
```

Em sessão nova, num diretório temporário, pedir: *"a hipótese é: se adicionarmos auto-preenchimento por CEP no checkout mobile, então o completion aumentará 20%, porque 68% dos usuários mobile abandonam nessa etapa. Gera a variante e roda o pre-flight."*

Critério de aprovação:
- `variante-b.js` foi **escrito em disco** (é isso que o Desktop não faz — confirme com `ls`)
- o JS tem o guard de URL, o guard de idempotência e o push no dataLayer
- `eventos.md` declara a métrica primária
- `pre-flight-check` devolve 🔴 porque tamanho de amostra e critério de parada não foram informados

- [ ] **Step 4: Verificar que o arquivo foi escrito**

```bash
ls -la variante-b.js eventos.md && node --check variante-b.js && echo "JS válido"
```

Esperado: os dois arquivos existem e `JS válido`.

- [ ] **Step 5: Commit**

```bash
git add 05-imersao-cro/skills/
git commit -m "feat: skills variante-builder e pre-flight-check (cadeira do Dev)

variante-builder escreve arquivo em disco — a demonstração mais direta do
que o Claude Desktop não faz. pre-flight-check implementa o checklist do
slide 41 da Taciana como skill executável com veredito binário.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 9: `skills/README.md` — instalação do pacote nas duas camadas

**Files:**
- Create: `05-imersao-cro/skills/README.md`

**Interfaces:**
- Consumes: todas as skills das Tasks 3–8.
- Produces: o documento que o aluno leva para casa e usa para reinstalar tudo sozinho.

- [ ] **Step 1: Escrever o README**

Conteúdo obrigatório:

**Tabela do mapa cadeira → skill → camada** (as 7 skills, exatamente com os nomes usados nas Tasks 3–8):

| Cadeira | Skill | Desktop | Claude Code |
|---|---|---|---|
| CRO | `heuristica-morys` | ✅ | ✅ |
| CRO | `hipotese-estruturada` | ✅ (bloqueia sem evidência) | ✅ (busca no DuckDB) |
| CRO | `ice-score` | ✅ | ✅ (+ persiste backlog) |
| Analytics | `srm-check` | ❌ | ✅ |
| Analytics | `post-test-segments` | ❌ | ✅ |
| Dev | `variante-builder` | ❌ | ✅ |
| Dev | `pre-flight-check` | ❌ | ✅ |

**Instalação no Claude Desktop:**
1. Abrir Claude Desktop → Projects → criar projeto "CRO"
2. Em *Instruções do projeto*, colar o conteúdo de `skills/desktop/<skill>.md`
3. Um projeto por skill, ou um projeto só com as três coladas em sequência — o segundo caminho é mais rápido e funciona
4. Limitação declarada: essas instruções não leem arquivo, não rodam SQL e não escrevem no disco

**Instalação no Claude Code:**

```bash
cp -r 05-imersao-cro/skills/code/* ~/.claude/skills/
ls ~/.claude/skills/ | grep -E 'morys|hipotese|ice-score|srm|segments|variante|pre-flight'
```

Esperado: as 7 skills listadas.

**Dataset:**

```bash
cp -r 05-imersao-cro/data ./data
duckdb data/cro.db -c "SELECT COUNT(*) FROM events_clean;"
```

**Como saber se funcionou:** abrir o Claude Code no diretório com `data/` e pedir *"roda srm-check"*. Se a skill não for encontrada, conferir se o arquivo está em `~/.claude/skills/<nome>/SKILL.md` — a pasta precisa ter o mesmo nome do campo `name` do frontmatter.

- [ ] **Step 2: Verificar a instalação do zero**

```bash
rm -rf /tmp/teste-skills && mkdir -p /tmp/teste-skills/.claude/skills
cp -r 05-imersao-cro/skills/code/* /tmp/teste-skills/.claude/skills/
ls /tmp/teste-skills/.claude/skills/
find /tmp/teste-skills/.claude/skills -name SKILL.md | wc -l
```

Esperado: 7 diretórios e `7`.

- [ ] **Step 3: Validar todos os frontmatters de uma vez**

```bash
python3 - <<'PY'
import glob, sys
falhas=[]
for p in sorted(glob.glob('05-imersao-cro/skills/code/*/SKILL.md')):
    t=open(p).read()
    nome_dir=p.split('/')[-2]
    if not t.startswith('---\n'): falhas.append((p,'sem frontmatter')); continue
    fm=t.split('---')[1]
    if f'name: {nome_dir}' not in fm: falhas.append((p,f'name != {nome_dir}'))
    if 'description:' not in fm: falhas.append((p,'sem description'))
print(f'{len(glob.glob("05-imersao-cro/skills/code/*/SKILL.md"))} skills verificadas')
for f in falhas: print('FALHA', f)
sys.exit(1 if falhas else 0)
PY
```

Esperado: `7 skills verificadas`, zero `FALHA`, exit 0.

- [ ] **Step 4: Commit**

```bash
git add 05-imersao-cro/skills/README.md
git commit -m "docs: README de instalação do pacote de skills nas duas camadas

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 10: `instalacao.md` — guia do Claude Code por SO

**Files:**
- Create: `05-imersao-cro/instalacao.md`

**Interfaces:**
- Produces: o documento distribuído impresso, usado durante o break das 15h30. É lido por gente sem terminal, sob pressão de 20 minutos, com wifi ruim.

**Critério de qualidade:** um aluno que nunca abriu um terminal consegue chegar até `claude --version` funcionando, sozinho, sem perguntar nada.

- [ ] **Step 1: Escrever o guia**

Estrutura obrigatória:

**Antes de tudo — o que você precisa ter:** conta Claude Pro ativa (mesma da manhã) e ~10 minutos.

**Passo 0 — abrir o terminal**, com instrução separada e literal por SO:
- macOS: `Cmd + Espaço`, digitar `Terminal`, Enter
- Windows: tecla Windows, digitar `PowerShell`, Enter

**Passo 1 — instalar o Node.js**, com o teste de "já tenho?" antes:

```
node --version
```

Se aparecer `v18` ou maior, pular para o Passo 2. Se aparecer `command not found` ou `não é reconhecido`, instalar:
- macOS: baixar o instalador LTS em nodejs.org, abrir o `.pkg`, avançar até o fim
- Windows: baixar o instalador LTS em nodejs.org, abrir o `.msi`, **marcar a caixa "Add to PATH"**, avançar até o fim, **fechar e reabrir o terminal**

**Passo 2 — instalar o Claude Code:**

```
npm install -g @anthropic-ai/claude-code
```

**Passo 3 — verificar:**

```
claude --version
```

**Passo 4 — logar:**

```
claude
```

Segue o fluxo de login no navegador com a mesma conta Pro.

**Passo 5 — instalar as skills e o dataset:** apontar para `skills/README.md`.

**Quando der errado — tabela de erros literais:**

| O que aparece na tela | O que fazer |
|---|---|
| `command not found: node` (mac) | Node não instalou. Refazer Passo 1. |
| `'node' não é reconhecido` (win) | Faltou "Add to PATH". Reinstalar marcando a caixa. |
| `EACCES: permission denied` (mac) | Rodar `sudo npm install -g @anthropic-ai/claude-code` e digitar a senha do computador. |
| `command not found: claude` após instalar | Fechar e reabrir o terminal. |
| `npm ERR! network` | Wifi. Tentar de novo; se insistir, usar o 4G do celular. |
| Login não abre o navegador | Copiar a URL que apareceu no terminal e colar no navegador. |

**Se nada funcionar — box destacado, texto literal:**

> **Não trave aqui.** Você já tem três skills funcionando no Claude Desktop e
> elas cobrem a cadeira mais importante. Acompanhe as demos da segunda metade,
> o material inteiro está no repositório, e a instalação você faz com calma
> depois — o guia é este mesmo.

- [ ] **Step 2: Verificar os comandos em máquina limpa**

Rodar cada comando do guia num terminal e conferir que a saída bate com o descrito:

```bash
node --version
npm --version
claude --version
```

Qualquer divergência entre a saída real e a descrita no guia é bug do guia — corrigir o texto, não a expectativa.

- [ ] **Step 3: Teste de leitura com uma pessoa não-técnica**

Entregar o guia impresso para alguém que nunca usou terminal e observar sem ajudar. Anotar cada ponto de hesitação. Todo ponto onde a pessoa perguntou algo vira uma linha nova no guia. **Este teste não é opcional** — é o único jeito de descobrir o que está implícito.

- [ ] **Step 4: Commit**

```bash
git add 05-imersao-cro/instalacao.md
git commit -m "docs: guia de instalação do Claude Code por SO

Escrito para ser lido durante o break de 20min, impresso, por gente sem
terminal. Inclui tabela de erros literais e box de desistência sem culpa —
quem não instalar continua com as três skills do degrau 1.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 11: `handout.md` — passo-a-passo do aluno

**Files:**
- Create: `05-imersao-cro/handout.md`

**Interfaces:**
- Consumes: Tasks 3–10.
- Produces: o documento que torna a aula recuperável. Critério da spec: *"um aluno que perdeu 10 minutos travado na instalação consegue voltar sozinho lendo o handout, sem interromper a turma."*

- [ ] **Step 1: Escrever o handout na ordem cronológica da tarde**

Seções obrigatórias, nesta ordem, cada uma com o horário no título:

1. **15h00 · As quatro cadeiras** — a tabela cadeira → skill → camada (mesma da Task 9) e a frase da Taciana como epígrafe.
2. **15h08 · Sua primeira skill: `heuristica-morys`** — passo a passo de colar no Project do Desktop, com o texto pronto para copiar e um espaço em branco para o aluno anotar a URL que ele vai analisar.
3. **15h20 · Sua hipótese: `hipotese-estruturada`** — o template com os 4 campos **em branco, para preencher à mão**. É o entregável físico do aluno.
4. **15h30 · Break — instalar o Claude Code** — ponteiro para `instalacao.md` e a frase: *"opcional; se você travar, o resto da tarde continua fazendo sentido."*
5. **15h50 · Priorizar: `ice-score`** — a tabela ICE em branco para preencher.
6. **16h05 · A cadeira do Analytics** — os comandos exatos de `srm-check` e `post-test-segments`, com o resultado esperado impresso ao lado, para o aluno conferir se bateu.
7. **16h50 · A cadeira do Dev** — comandos de `variante-builder` e `pre-flight-check`.
8. **17h15 · O que falta** — o que seria preciso para rodar isso no GA4 dele toda segunda. Lista honesta: OAuth, ETL, agendamento, manutenção do schema.
9. **17h35 · Para levar** — link do repositório, como reinstalar tudo, e o que fazer na segunda-feira seguinte.

**Regra de escrita:** cada seção começa com uma linha *"Se você chegou atrasado nesta parte: [o que fazer para pegar o bonde]"*. É isso que torna a aula recuperável.

- [ ] **Step 2: Verificar que todo comando do handout roda**

```bash
grep -oE '^\s*(duckdb|python3|npm|cp|claude|node) [^`]*' 05-imersao-cro/handout.md
```

Executar cada linha extraída em `05-imersao-cro/` e confirmar que nenhuma erra. Comando que erra no handout vira 50 pessoas travadas ao mesmo tempo.

- [ ] **Step 3: Verificar que as 7 skills aparecem**

```bash
for s in heuristica-morys hipotese-estruturada ice-score srm-check post-test-segments variante-builder pre-flight-check; do
  grep -q "$s" 05-imersao-cro/handout.md && echo "OK  $s" || echo "FALTA $s"
done
```

Esperado: 7 `OK`.

- [ ] **Step 4: Commit**

```bash
git add 05-imersao-cro/handout.md
git commit -m "docs: handout do aluno com recuperação por seção

Cada bloco começa com 'se você chegou atrasado nesta parte' — é o que
permite alguém voltar depois de travar na instalação sem parar a turma.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 12: `script.md` — roteiro do facilitador

**Files:**
- Create: `05-imersao-cro/script.md`

**Interfaces:**
- Consumes: Tasks 1–11.
- Produces: o roteiro com timing por bloco, o que falar, o que digitar ao vivo e onde a turma trava.

- [ ] **Step 1: Escrever o roteiro seguindo o cronograma da spec**

Um bloco por seção, cada um com: **horário de início · duração · objetivo · o que está na tela · falas-chave · o que pode dar errado · como cortar se atrasar.**

Cronograma (copiado da spec, não recalcular):

| Início | Duração | Bloco |
|---|---|---|
| 15h00 | 8min | Quatro cadeiras |
| 15h08 | 22min | Cadeira do CRO — Desktop |
| 15h30 | 20min | **BREAK** — instalação voluntária assistida |
| 15h50 | 15min | `ice-score` — Desktop + repescagem de instalação |
| 16h05 | 45min | Cadeira do Analytics — Code |
| 16h50 | 25min | Cadeira do Dev — Code |
| 17h15 | 20min | Segunda parede → copilot |
| 17h35 | 10min | Fechamento |
| 17h45 | 15min | Buffer |

**Falas obrigatórias, literais:**

- **Abertura (15h00):** *"A Taci terminou dizendo que o próximo desafio não é usar o Claude, é transformá-lo em parte do seu processo. É exatamente isso que a gente vai fazer nas próximas três horas."* Em seguida, retomar as quatro posições dela e a tese: *"Vamos preencher as quatro cadeiras. Uma skill por cadeira. E em 40 minutos você vai descobrir que a ferramenta que você escolheu preenche uma só."*
- **A parede (15h28, imediatamente antes do break):** rodar `hipotese-estruturada` ao vivo sem evidência, mostrar o `⚠️ FALTA EVIDÊNCIA` na tela e dizer: *"O Claude não está sendo teimoso. Ele está certo. E ele não consegue buscar esse dado — não porque não sabe, porque não tem como. Café. Volta em 20."*
- **Anúncio do break:** *"Quem quiser sair na frente: o guia de instalação está na página 4 do handout. Instala enquanto toma café, eu fico aqui. É opcional — quem não instalar continua acompanhando tudo."*
- **Critério do beta (dito às 16h05, no início do bloco de Analytics):** *"Tem acesso ao beta do analytics-copilot hoje, e não tem para todo mundo. Quem sair daqui com `srm-check` rodando na própria máquina entra."*
- **Segunda parede (17h15):** *"Isso rodou no meu dataset, que eu deixei pronto pra vocês. Pra rodar no SEU GA4, toda segunda, sem você abrir o terminal — o que falta?"* Listar na tela: OAuth, ETL, agendamento, manutenção de schema. Então: *"Foi exatamente por isso que a gente construiu o analytics-copilot."*
- **Fechamento (17h35):** retomar o ciclo de 7 passos da Taciana com uma skill em cada etapa.

**Pontos de trava previstos e a saída de cada um:**

| Trava | Sinal | Saída |
|---|---|---|
| Instalação estourou o break | Mais de 10 pessoas ainda tentando às 15h50 | Rodar `ice-score` (Desktop) e deixar o apoio circulando; ele é o bloco que existe justamente para isso |
| Taciana atrasou e comeu tempo | Começar depois das 15h05 | Cortar o bloco da cadeira do Dev (16h50, 25min) inteiro; ele é o primeiro a cair |
| Wifi caiu | Skills do Desktop param | Passar direto para as demos gravadas e o dataset local; `srm-check` e `post-test-segments` rodam offline |
| Pergunta longa sobre estatística no bloco de SRM | Uma pessoa puxando para p-valor e poder | Responder em uma frase, oferecer conversar no fim, seguir. Não é a aula. |
| Ninguém tem página própria para analisar | Bloco das 15h08 trava | Ter 3 URLs de e-commerce brasileiro prontas no slide, para quem não trouxe |

- [ ] **Step 2: Verificar que a soma dos blocos fecha em 180 minutos**

```bash
python3 -c "
b=[8,22,20,15,45,25,20,10,15]
print(sum(b),'min'); assert sum(b)==180, 'cronograma não fecha'
print('cronograma OK — 15h00 às 18h00')
"
```

Esperado: `180 min` e `cronograma OK`.

- [ ] **Step 3: Ensaio cronometrado do bloco pré-break**

Rodar os 30 minutos de 15h00 a 15h30 com cronômetro, executando as skills de verdade, sem plateia. Anotar o tempo real de cada parte.

Critério: os 30 minutos precisam terminar **na parede** (`⚠️ FALTA EVIDÊNCIA` na tela). Se estourar, cortar conteúdo da abertura, nunca da parede — a parede é o que sustenta a segunda metade da tarde.

- [ ] **Step 4: Commit**

```bash
git add 05-imersao-cro/script.md
git commit -m "feat: roteiro do facilitador com timing e pontos de trava

Cronograma fecha em 180min. Falas-chave literais, critério do beta declarado
às 16h05, e saída documentada para cada trava previsível.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 13: Deck

**Files:**
- Create: `05-imersao-cro/deck/index.html`
- Create: `05-imersao-cro/deck/deck-styles.css` (cópia de `04-produto-prompt-praia/deck/deck-styles.css`)
- Create: `05-imersao-cro/deck/deck-stage.js` (cópia de `04-produto-prompt-praia/deck/deck-stage.js`)
- Create: `05-imersao-cro/deck/package.json`

**Interfaces:**
- Consumes: `05-imersao-cro/script.md` (Task 12).
- Produces: deck navegável no mesmo padrão dos outros do repo — custom element `<deck-stage>` com `<section class="slide">` filhos, navegação por teclado, estado salvo em `localStorage`.

**Princípio:** este é um workshop, não uma palestra. O deck é referência de parede, não narrativa. Slide dominado por tela de terminal, não por texto. Menos slides do que os outros decks do repo.

- [ ] **Step 1: Copiar o chassi**

```bash
cp 04-produto-prompt-praia/deck/deck-styles.css 05-imersao-cro/deck/
cp 04-produto-prompt-praia/deck/deck-stage.js 05-imersao-cro/deck/
cat > 05-imersao-cro/deck/package.json <<'JSON'
{
  "name": "deck-imersao-cro",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "slides": "python3 -m http.server 4245"
  }
}
JSON
```

- [ ] **Step 2: Escrever `index.html`**

Cabeçalho idêntico ao padrão do repo:

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quatro cadeiras — Imersão Claude para CRO</title>
<link rel="stylesheet" href="deck-styles.css">
<script src="deck-stage.js" defer></script>
</head>
<body>
<deck-stage>
  <!-- slides aqui -->
</deck-stage>
</body>
</html>
```

Slides obrigatórios, nesta ordem:

| # | Slide | Conteúdo |
|---|---|---|
| 1 | Gancho | A frase da Taciana em tipo grande: "O próximo desafio não é usar o Claude. É transformá-lo em parte do seu processo de CRO." |
| 2 | Tese | "Quatro cadeiras. Uma skill por cadeira." |
| 3 | Mapa | Tabela cadeira → skill → camada, com as camadas ainda **em branco** — preenchidas conforme a tarde avança |
| 4 | Morys | As 7 dimensões com a pergunta de cada |
| 5 | Template | `Se [X], para [Y], então [Z], porque [evidência]` — os 4 campos |
| 6 | **A parede** | Só o `⚠️ FALTA EVIDÊNCIA` em tela cheia. Sem mais nada. |
| 7 | Break | "Café · 20 min · instalação opcional na página 4 do handout" |
| 8 | ICE | Impacto × Confiança × Facilidade + o aviso "organiza a conversa, não decide por você" |
| 9 | Beta | O critério: "quem sair com `srm-check` rodando entra no beta" |
| 10 | SRM | O gráfico 4000 vs 4400 e χ²=19,05 · p<0,0001 |
| 11 | Segmentos | Mobile ganha, tablet perde — "winner e loser é leitura pobre" |
| 12 | Dev | Construir · Configurar · Instrumentar · Validar |
| 13 | **Segunda parede** | "E no SEU GA4, toda segunda?" → OAuth · ETL · agendamento · manutenção |
| 14 | Copilot | Vídeo da demo (Task 14) |
| 15 | Ciclo | Os 7 passos da Taciana com uma skill em cada etapa |
| 16 | Fechamento | Repo + CTA do beta |

Regra de conteúdo por slide: no máximo uma ideia. Slide 6 tem **uma linha só** — é o momento mais importante da primeira metade e o silêncio na tela é o efeito.

- [ ] **Step 3: Verificar que o deck abre e navega**

```bash
cd 05-imersao-cro/deck && python3 -m http.server 4245 &
sleep 2 && curl -s http://localhost:4245/ | grep -c '<section class="slide"'
```

Esperado: `16`. Abrir `http://localhost:4245` no navegador, navegar com as setas do começo ao fim e confirmar que nenhum slide estoura a tela em 1920×1080.

- [ ] **Step 4: Verificar consistência com o script**

```bash
for t in "FALTA EVIDÊNCIA" "srm-check" "19" "OAuth"; do
  grep -q "$t" 05-imersao-cro/deck/index.html && echo "OK  $t" || echo "FALTA $t"
done
```

Esperado: 4 `OK`. Divergência entre deck e script vira improviso no palco.

- [ ] **Step 5: Commit**

```bash
git add 05-imersao-cro/deck/
git commit -m "feat: deck do módulo da tarde — 16 slides

Deck de workshop, não de palestra: referência de parede, uma ideia por
slide, terminal dominando a tela. Slide 6 tem uma linha só — a parede.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Task 14: Vídeos das demos do degrau 3

**Files:**
- Create: `05-imersao-cro/notes/video-spec.md`
- Create: `05-imersao-cro/deck/assets/` (destino dos `.mp4`)

**Interfaces:**
- Consumes: `05-imersao-cro/script.md` (bloco das 17h15).
- Produces: vídeos sem áudio, narrados ao vivo, referenciados pelo slide 14 do deck.

**Por que gravado:** wifi de evento é risco declarado na spec. Mesma decisão da palestra 03 (`03-analytics-copilot/demos/video-spec.md`, que serve de referência de formato).

- [ ] **Step 1: Escrever `video-spec.md`**

Três vídeos, cada um com: duração alvo, o que aparece na tela, o que o Lucian narra por cima, e o ponto exato do script onde entra.

| # | Vídeo | Duração | O que mostra |
|---|---|---|---|
| 1 | O custo do setup | 45s | Timelapse do que seria conectar GA4 na mão: OAuth, escolher property, esperar export, montar schema. Termina com o relógio mostrando o tempo decorrido. |
| 2 | O copilot fazendo | 60s | A mesma pergunta de `post-test-segments`, feita em linguagem natural no copilot, respondida com dado real, sem setup. |
| 3 | O pipeline rodando sozinho | 30s | O relatório semanal chegando pronto — o que `cro-weekly-pipeline` faria se o aluno tivesse infra. |

Regras: sem áudio próprio, sem chrome de player, resolução 1920×1080, dado real mas **anonimizado** — nenhum nome de cliente na tela.

- [ ] **Step 2: Gravar os três vídeos**

```bash
mkdir -p 05-imersao-cro/deck/assets
ls -la 05-imersao-cro/deck/assets/*.mp4
```

Esperado: 3 arquivos.

- [ ] **Step 3: Verificar que rodam offline no deck**

Referenciar no slide 14 e testar com a rede desligada:

```html
<video src="assets/02-copilot.mp4" muted playsinline style="width:100%"></video>
```

Desligar o wifi, abrir o deck, reproduzir. Se não tocar, o vídeo não está local — corrigir o caminho.

- [ ] **Step 4: Verificar que não há dado de cliente na tela**

Assistir os três vídeos frame a frame nos trechos com tela de dados. Qualquer nome de cliente, domínio real ou ID de property visível exige regravar ou borrar. **Não subir vídeo com dado identificável.**

- [ ] **Step 5: Commit**

```bash
git add 05-imersao-cro/notes/video-spec.md 05-imersao-cro/deck/assets/
git commit -m "feat: vídeos das demos do degrau 3

Gravados, não ao vivo — wifi de evento é risco declarado na spec, mesma
decisão da palestra 03. Sem áudio, narração ao vivo por cima.

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_016U46YidswpdD9iJxSrWHRT"
```

---

## Cobertura da spec

| Requisito da spec | Task |
|---|---|
| Tese "quatro cadeiras" | 12 (fala), 13 (slides 1–3) |
| Mapa cadeira → skill → degrau | 9, 11, 13 |
| Escada de 3 degraus | 3–8 (degraus 1 e 2), 14 (degrau 3) |
| `heuristica-morys` nas 7 dimensões | 3 |
| `hipotese-estruturada` com bloqueio | 4 |
| `ice-score` | 5 |
| `srm-check` | 6 |
| `post-test-segments` | 7 |
| `variante-builder` + `pre-flight-check` | 8 |
| Duas versões por skill (desktop/code) | 3, 4, 5 (as do degrau 1); degrau 2 é Code-only por definição |
| Correção do vocabulário de `heuristic-scan` | 3 (escrita nova) |
| Dataset local sem OAuth | 2 |
| Instalação no break, voluntária | 10, 12 |
| Plano B para quem não instalar | 10 (box), 11 (recuperação por seção), 12 (bloco de `ice-score`) |
| Critério de mérito do beta | 12 (fala das 16h05), 13 (slide 9) |
| Demos do degrau 3 gravadas | 14 |
| Handout autossuficiente | 11 |
| Cronograma de 180min | 12 (verificado no Step 2) |
| `.metadata/summary.yaml` | 1 |
| Fonte da Taciana no repo | 1 |

Sem lacunas.
