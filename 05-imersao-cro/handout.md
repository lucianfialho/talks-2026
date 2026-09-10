# Handout — Imersão Claude para CRO

**Bloco das 15h00 às 18h00 · Lucian Fialho**

Este material é seu. Ele existe para uma situação específica: você travou em
algum passo, perdeu uns 10 minutos tentando resolver sozinho, e agora a sala
já está três passos à frente. Você não precisa levantar a mão nem interromper
ninguém — cada seção abaixo começa com uma linha "Se você chegou atrasado
nesta parte" que diz exatamente o que fazer para voltar ao jogo sozinho.

O guia de instalação do Claude Code está no fim deste material.

> **Nota de montagem (impressão):** este handout e o guia de instalação são
> dois arquivos separados no repositório (`handout.md` e `instalacao.md`),
> mas o material impresso que você recebe é os dois juntos, nesta ordem —
> handout primeiro, guia de instalação em seguida. Toda referência abaixo a
> "o guia de instalação, no fim deste material" está falando desse segundo
> arquivo, encadernado logo depois deste.

## Sumário

1. 15h00 · As quatro cadeiras
2. 15h08 · Sua primeira skill: `heuristica-morys`
3. 15h20 · Sua hipótese: `hipotese-estruturada`
4. 15h30 · Break — instalar o Claude Code
5. 15h50 · Priorizar: `ice-score`
6. 16h05 · A cadeira do Analytics
7. 16h50 · A cadeira do Dev
8. 17h15 · O que falta
9. 17h35 · Para levar

---

## 1. 15h00 · As quatro cadeiras

**Se você chegou atrasado nesta parte:** não tem nada para recuperar aqui —
esta seção é mapa, não mão na massa. Leia a tabela abaixo em 1 minuto e
alcance a turma na seção 2 (15h08), que é onde a produção começa.

> "O próximo desafio não é usar o Claude. É transformá-lo em parte do seu
> processo de CRO." — Taciana Serafim

A tese do bloco: **vamos preencher as quatro cadeiras. Uma skill por
cadeira. E em 40 minutos você vai descobrir que a ferramenta que você
escolheu preenche uma só.**

| Cadeira | Skill | Desktop | Claude Code |
|---|---|---|---|
| CRO | `heuristica-morys` | ✅ | ✅ |
| CRO | `hipotese-estruturada` | ✅ (bloqueia sem evidência) | ✅ (busca no DuckDB) |
| CRO | `ice-score` | ✅ | ✅ (+ persiste backlog) |
| Analytics | `srm-check` | ❌ | ✅ |
| Analytics | `post-test-segments` | ❌ | ✅ |
| Dev | `variante-builder` | ❌ | ✅ |
| Dev | `pre-flight-check` | ❌ | ✅ |

As três skills de CRO existem nas duas camadas porque são raciocínio
estruturado sobre o que você cola na conversa — não dependem de ler arquivo
nem rodar código. As quatro de Analytics e Dev só existem em Claude Code
porque dependem de rodar SQL contra um dado real ou escrever arquivo em
disco. Essa fronteira não é acidente de implementação: é o assunto da tarde.

---

## 2. 15h08 · Sua primeira skill: `heuristica-morys`

**Se você chegou atrasado nesta parte:** abra o Claude Desktop agora, siga os
3 passos abaixo, e quando terminar de colar o texto você está no mesmo lugar
que o resto da sala — não precisa ter visto a demonstração ao vivo para isso
funcionar.

### Passo a passo

1. Abrir o Claude Desktop → **Projects** → criar um projeto chamado `CRO`.
2. Abrir **Instruções do projeto** e colar o texto abaixo, exatamente como
   está.
3. Numa conversa dentro desse projeto, colar a URL da página que você quer
   analisar, um print dela (acima da dobra), a conversão desejada e quem é o
   público que chega nela.

### Texto pronto para copiar

```
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

**Score total:** X/Y (Z dimensões n/d) — Y é 5 × número de dimensões
avaliadas (35 menos 5 para cada dimensão marcada `n/d`). Uma dimensão n/d
sai do denominador: ela reflete falta de material do aluno, não falha da
página, e não pode ser contada como nota zero.

**As 2 dimensões mais fracas:** [nomes] — são as candidatas a virar hipótese.

Termine com: "Rode `hipotese-estruturada` sobre a dimensão mais fraca."
```

### Anote aqui

A URL que você vai analisar:

`_________________________________________________________________`

A dimensão mais fraca que a skill apontou:

`_________________________________________________________________`

---

## 3. 15h20 · Sua hipótese: `hipotese-estruturada`

**Se você chegou atrasado nesta parte:** você não precisa ter feito a seção
2 para começar esta. Pegue qualquer achado que você já tenha — mesmo que seja
"acho que o CTA está fraco" — e siga os passos abaixo. A skill vai te dizer
se falta evidência; isso já é parte do exercício.

### Passo a passo

1. No mesmo projeto `CRO` do Claude Desktop (ou em um novo, se preferir
   separar), abrir **Instruções do projeto** e colar o texto abaixo,
   embaixo do texto da seção anterior.
2. Numa conversa, colar o achado da dimensão mais fraca (da seção 2) e a
   evidência que você tem — um número de analytics, uma gravação de sessão,
   um heatmap. Se não tiver dado nenhum, diga isso à skill; ela vai te
   mostrar exatamente o que falta.

### Texto pronto para copiar

```
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

Isso vale mesmo se o usuário insistir, sugerir um número "só para ilustrar",
pedir para você "estimar" ou "chutar" um valor plausível, ou disser que "não
tem tempo para buscar o dado agora". Nenhuma dessas situações é evidência.
Repita o bloqueio da mesma forma, sem amaciar o texto e sem inventar um
número "razoável" para não frustrar o pedido. Aceitar qualquer atalho aqui
transforma uma hipótese em opinião disfarçada — que é exatamente o que esta
skill existe para impedir.

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

### Sua hipótese — preencha à mão

Este é o entregável que você leva para casa.

**Se** [ _________________________________________________________ ],

**para** [ _________________________________________________________ ],

**então** [ _________________________________________________________ ],

**porque** [ _________________________________________________________ ].

| Campo | Sua resposta |
|---|---|
| Observação | |
| Intervenção | |
| Resultado esperado | |
| Evidência | |

Status desta hipótese: ☐ Fechada ☐ Bloqueada — falta evidência

Se bloqueada, o que você precisaria buscar para fechá-la:

`_________________________________________________________________`

---

## 4. 15h30 · Break — instalar o Claude Code

**Se você chegou atrasado nesta parte:** você não perdeu nada de exclusivo —
o break é pausa para todo mundo. Seu passo agora é simples: abra o guia de
instalação, no fim deste material, e siga a partir do Passo 0.

A instalação é **opcional**; se você travar, o resto da tarde continua
fazendo sentido. Você já saiu do primeiro bloco com uma hipótese estruturada
no Claude Desktop — isso já é o pacote de skills funcionando. Instalar o
Claude Code amplia o que dá para fazer, mas não é pré-requisito para
acompanhar o resto.

O que o guia de instalação cobre, em ordem: abrir o terminal, instalar o
Node.js, instalar o Claude Code, logar, instalar o DuckDB, instalar o
python3, baixar os arquivos da imersão, e por fim instalar as sete skills e
o dataset local (esse último passo está detalhado em `skills/README.md`,
seção "Instalação no Claude Code" — o guia de instalação te leva até lá).

Se travar em qualquer passo, o próprio guia tem uma tabela "Quando der
errado" e um quadro final "Não trave aqui" — leia esse quadro antes de
insistir sozinho por mais de alguns minutos.

---

## 5. 15h50 · Priorizar: `ice-score`

**Se você chegou atrasado nesta parte** — inclusive se ainda está no meio da
instalação: siga os passos abaixo no Claude Desktop. Você não precisa ter
instalado o Claude Code para participar deste bloco; ele volta a rodar 100%
no Desktop, igual às seções 2 e 3.

### Passo a passo

1. No mesmo projeto `CRO`, colar o texto abaixo em **Instruções do
   projeto**, embaixo do que já está lá.
2. Numa conversa, listar as hipóteses que você já tem (a sua da seção 3, e
   quaisquer outras que você queira priorizar junto) e pedir o ICE Score de
   cada uma.

### Texto pronto para copiar

```
# ICE Score — priorização de backlog

Prioriza hipóteses de CRO com ICE Score. Uma lista de ideias sem prioridade
é só uma lista de desejos.

## A fórmula

    ICE = Impacto × Confiança × Facilidade

Cada eixo vai de 1 a 10. Score final vai de 1 a 1000.

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

Termine sempre com esta citação literal do material de referência (Taciana
Serafim, CRO AI DAY):

> "O score explicita critérios e organiza o backlog — use para ranking
> relativo, não como veredito. O Dev participa estimando esforço e risco
> técnico."

## Output

| # | Hipótese | I | C | F | ICE | Status da evidência |
|---|---|---|---|---|---|---|
| 1 | ... | 8 | 6 | 7 | 336 | ✅ evidência real |
| 2 | ... | 9 | 3 | 4 | 108 | ⚠️ FALTA EVIDÊNCIA |

**Recomendação:** comece pela #1. Justificativa em uma linha.
```

### Seu backlog — preencha à mão

**ICE = Impacto × Confiança × Facilidade**

| # | Hipótese | Impacto (1-10) | Confiança (1-10) | Facilidade (1-10) | ICE | Status da evidência |
|---|---|---|---|---|---|---|
| 1 | | | | | | |
| 2 | | | | | | |
| 3 | | | | | | |
| 4 | | | | | | |

Comece por: `_______` — justificativa em uma linha:

`_________________________________________________________________`

> "O score explicita critérios e organiza o backlog — use para ranking
> relativo, não como veredito. O Dev participa estimando esforço e risco
> técnico." — Taciana Serafim

---

## 6. 16h05 · A cadeira do Analytics

**Se você chegou atrasado nesta parte:** este bloco é 100% Claude Code — não
existe versão Desktop de `srm-check` e `post-test-segments`. Se você ainda
não tem `claude` e `duckdb` funcionando, pare aqui, siga o guia de
instalação (no fim deste material) até o Passo 8, e volte para esta seção. Se já tem o
terminal funcionando mas perdeu a explicação, os comandos abaixo são
suficientes para você conferir sozinho, com o resultado esperado ao lado de
cada um.

Trabalhe a partir de uma pasta que tenha `data/cro.db` e `data/cro-clean.db`
dentro dela (copiados durante a instalação, seção "Dataset" de
`skills/README.md`).

### `srm-check` — o teste tem um bug de distribuição?

Antes de ler qualquer resultado de teste A/B, verifique se a divisão de
usuários entre as variantes bate com o que foi planejado (50/50). No Claude
Code, peça: **"roda srm-check em data/cro.db"**. Por trás, é isto que
acontece — você pode rodar você mesmo para conferir:

```
duckdb data/cro.db -c "SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users FROM events_clean WHERE event_name = 'session_start' AND experiment_variant IS NOT NULL GROUP BY 1 ORDER BY 1;"
```

**Resultado esperado no seu terminal:**

```
control     4000
variant_b   4400
```

```
python3 -c "obs=[4000,4400]; n=sum(obs); exp=[n/2,n/2]; chi2=sum((o-e)**2/e for o,e in zip(obs,exp)); import math; p=math.erfc(math.sqrt(chi2/2)); print(f'chi2={chi2:.4f}  p={p:.3e}')"
```

**Resultado esperado no seu terminal:**

```
chi2=19.0476  p=1.275e-05
```

No telão, esses números aparecem como **χ²=19,0476 · p=1,275e-05**. Se o que
você vê bateu, o veredito é:

| p-valor | Veredito |
|---|---|
| p < 0,01 | 🔴 **SRM DETECTADO** |

`data/cro.db` tem esse problema de propósito — é o dataset bruto, o que a
skill existe para pegar. **Esse teste não tem resultado para ler.** Não dá
para seguir para a análise segmentada com ele.

### `post-test-segments` — onde o lift realmente aconteceu

Esta skill tem uma pré-condição obrigatória: só roda se `srm-check` já
tiver dado veredito 🟢 nesse dataset. Você acabou de rodar `srm-check` em
`cro.db` e viu 🔴 — isso não conta para `cro-clean.db`, que é outro
arquivo. Rode `srm-check` de novo, agora em `cro-clean.db`, antes de pedir
`post-test-segments`:

```
duckdb data/cro-clean.db -c "SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users FROM events_clean WHERE event_name = 'session_start' AND experiment_variant IS NOT NULL GROUP BY 1 ORDER BY 1;"
```

**Resultado esperado:** `control 4000` / `variant_b 4000` → χ²=0, p=1,0000
→ **🟢 SEM SRM**. Mesmo teste, distribuição corrigida, e agora ele passa —
é isso que libera a análise segmentada abaixo.

Esta skill roda sobre `data/cro-clean.db` — a versão já corrigida do
dataset, sem o problema de SRM que você acabou de detectar em `cro.db`. No
Claude Code, peça: **"roda post-test-segments em data/cro-clean.db"**.

```
duckdb data/cro-clean.db -c "SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users, COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END) AS conv, ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)/COUNT(DISTINCT user_pseudo_id),2) AS cr FROM events_clean WHERE experiment_variant IS NOT NULL GROUP BY 1 ORDER BY 1;"
```

**Resultado esperado — agregado:**

| Variante | Usuários | Conversões | CR |
|---|---|---|---|
| control | 4000 | 173 | 4,33% |
| variant_b | 4000 | 212 | 5,30% |

Lift agregado: +22,4% relativo.

```
duckdb data/cro-clean.db -c "SELECT device_category, experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users, ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)/COUNT(DISTINCT user_pseudo_id),2) AS cr FROM events_clean WHERE experiment_variant IS NOT NULL GROUP BY 1,2 ORDER BY 1,2;"
```

**Resultado esperado — por device:**

| Device | Control CR | Variant CR | Lift relativo | Amostra (menor braço) |
|---|---|---|---|---|
| desktop | 4,19% | 4,88% | +16,5% | 1.271 usuários |
| mobile | 4,23% | 7,17% | +69,5% | 1.301 usuários |
| tablet | 4,56% | **3,78%** | **-17,1%** | 1.338 usuários |

A menor célula de todas (desktop, variante) tem **1.271 usuários** — acima do
piso de 300 por braço que a skill exige para sustentar conclusão, então
nenhum segmento aqui fica marcado como "amostra insuficiente".

**Leitura:** o ganho está concentrado em mobile. Tablet mostra perda — isso é
achado, não ruído. Um teste que ganha no mobile e perde no tablet é uma
decisão de rollout segmentado, não um "vencedor" simples.

**Decisão possível** — vocabulário exato, não sinônimo:

| Decisão | Quando |
|---|---|
| Implementar | A evidência sustenta a mudança e os guardrails ficaram estáveis. |
| Iterar | A direção parece certa, mas a execução pode melhorar. |
| Investigar | A evidência não é suficiente. Precisamos entender melhor. |
| Abandonar | A hipótese não se sustentou. Aprendemos algo sobre o usuário. |
| Nova hipótese | O resultado revelou um comportamento que não esperávamos. |

Recomendação para este resultado: **Iterar** — a direção geral está certa
(agregado +22,4%, mobile +69,5%), mas a execução falha especificamente no
tablet (-17,1%) e precisa de ajuste antes de um rollout completo nos três
devices.

**Critério do beta:** quem sair daqui com `srm-check` rodando na própria
máquina entra no acesso beta do analytics-copilot — não tem para todo mundo.

---

## 7. 16h50 · A cadeira do Dev

**Se você chegou atrasado nesta parte:** você precisa do Claude Code
funcionando (seção anterior) e de uma hipótese fechada (a que você escreveu
à mão na seção 3, ou o exemplo de referência da Taciana, se a sua ainda
estiver bloqueada por falta de evidência). Sem hipótese fechada, use o
exemplo abaixo — a skill funciona igual.

### `variante-builder` — da hipótese ao código

No Claude Code, cole sua hipótese fechada e peça, por exemplo:

> "A hipótese é: se adicionarmos auto-preenchimento por CEP no checkout
> mobile, então o completion aumentará 20%, porque 68% dos usuários mobile
> abandonam nessa etapa. Gera a variante e roda o pre-flight."

O que acontece: a skill escreve dois arquivos na pasta onde você está —
`variante-b.js` (com guard de escopo por URL, checagem de idempotência e
push no `dataLayer`) e `eventos.md` (a lista de eventos a instrumentar, com
a métrica primária declarada). Para conferir que os dois foram escritos e
que o JavaScript é sintaticamente válido, rode na mesma pasta: liste os
arquivos com `ls -la variante-b.js eventos.md` (Mac/Linux) — no Windows,
PowerShell: `Get-ChildItem variante-b.js, eventos.md` — e valide a sintaxe
com `node --check variante-b.js` (funciona igual nos dois sistemas) — se
não aparecer erro, o arquivo está válido.

Aviso que a skill sempre encerra dizendo: este código não foi testado no seu
site. Rode `pre-flight-check` antes de subir.

### `pre-flight-check` — os 8 itens antes de apertar Start

No mesmo Claude Code, peça: **"roda o pre-flight nessa variante"**.

Os 8 itens são vocabulário exato da Taciana (slide 41) — não são
sinônimos, são a estrutura de primeiro nível:

1. Hipótese escrita e compartilhada
2. Controle definido e no ar
3. Audiência e segmentação corretas
4. QA aprovado em browsers diferentes
5. Métrica primária e guardrails definidos
6. Variante validada em mobile e desktop
7. Eventos disparando nas duas versões
8. Flickering e performance verificados

Os itens 1, 5 e 7 não checados forçam veredito 🔴 sozinhos — sem eles o
teste não produz leitura. Com o exemplo acima (sem tamanho de amostra nem
critério de parada declarados), espere: `🔴 NÃO SUBA — item 5 (métrica
primária e guardrails)`.

> "Só então: START. Um erro de implementação não aparece no resultado — ele
> aparece como um resultado que ninguém consegue explicar." — Taciana
> Serafim

---

## 8. 17h15 · O que falta

**Se você chegou atrasado nesta parte:** não tem exercício de terminal
aqui — é a seção de contexto que prepara o fechamento. Basta ler.

Tudo o que você rodou nas duas últimas horas funcionou porque o dataset já
estava pronto, local, sem depender de nada além do seu computador. Isso foi
uma escolha deliberada para a imersão — e é exatamente o que separa o que
você fez aqui de rodar isso no **seu** GA4, toda segunda-feira, sem abrir o
terminal. A lista abaixo é honesta, não suavizada:

- **OAuth.** Autenticar contra a conta do GA4 do seu negócio é um fluxo de
  permissão real, por conta, que alguém precisa configurar e manter — não é
  "colar uma chave uma vez e esquecer".
- **ETL.** Os dados do GA4 não chegam no formato que `srm-check` e
  `post-test-segments` esperam. Alguém precisa extrair, transformar e
  carregar esses dados toda vez, de forma confiável.
- **Agendamento.** "Toda segunda-feira" não acontece sozinho. Alguém — uma
  pessoa ou uma rotina — precisa disparar essa análise no dia certo, e
  reagir quando ela falhar silenciosamente numa segunda em que ninguém está
  olhando.
- **Manutenção de schema.** O GA4 muda: nomes de evento, parâmetros
  customizados, novos experimentos. Cada mudança no seu schema é uma chance
  de as queries pararem de funcionar sem avisar.

Nenhum desses quatro itens é grande sozinho. Juntos, são o motivo pelo qual
"rodar no meu dataset preparado" e "rodar no GA4 de verdade, toda semana,
sem intervenção manual" são coisas diferentes — e é exatamente essa
diferença que o analytics-copilot resolve.

---

## 9. 17h35 · Para levar

**Se você chegou atrasado nesta parte:** está tudo bem, é a última seção e
o que ela pede é só: leve este material com você.

- **Repositório:** `github.com/lucianfialho/talks-2026`, pasta
  `05-imersao-cro/`. Todo o conteúdo desta tarde — as 7 skills, o dataset,
  este handout e o guia de instalação — está lá.
- **Como reinstalar tudo sozinho, do zero, em casa:** siga
  `05-imersao-cro/skills/README.md`. Esse arquivo foi escrito para ser
  autossuficiente — ele cobre as duas camadas (Desktop e Claude Code), o
  dataset e uma tabela de troubleshooting, sem depender de você ter estado
  na sala hoje.
- **Na segunda-feira seguinte:** escolha uma página real do seu negócio,
  rode `heuristica-morys` nela no Claude Desktop, transforme o achado mais
  fraco em hipótese com `hipotese-estruturada`, e priorize com `ice-score`
  se tiver mais de uma ideia na mesa. Isso não depende de ter instalado o
  Claude Code — as três skills de CRO rodam no Desktop desde o primeiro
  bloco desta tarde.
- **Se você entrou no beta do analytics-copilot:** o convite foi pelo
  critério anunciado às 16h05 — quem saiu com `srm-check` rodando na própria
  máquina. Fale com o facilitador ao final da imersão para confirmar seu
  acesso.
