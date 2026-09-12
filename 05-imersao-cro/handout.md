# Handout — Imersão Claude para CRO, bloco da tarde

**14/09/2026 · 16h00–18h00 (elástico) · Facilitador: Lucian Fialho**
**Co-facilitação: Taciana Serafim, 14h00–15h30 · Coffee: 15h30–16h00**

Este material é seu. Ele existe para uma situação específica: você travou em
algum passo, perdeu uns minutos tentando resolver sozinho, e a sala já está
adiante. Você não precisa levantar a mão nem interromper ninguém — cada bloco
abaixo começa com uma linha **"Se você chegou atrasado nesta parte"** que diz
exatamente o que fazer para voltar ao jogo sozinho.

> **Nota de montagem (impressão):** este handout e o guia de instalação são
> dois arquivos separados no repositório (`handout.md` e `instalacao.md`),
> mas o material impresso que você recebe é os dois juntos, nesta ordem —
> handout primeiro, guia de instalação em seguida. Toda referência abaixo a
> **"o guia de instalação, no fim deste material"** está falando desse
> segundo arquivo, encadernado logo depois deste. Você instala **o Claude
> Code e mais dois programas de base que ele usa por baixo: o Node.js e o
> git** — e nada além disso. Sem DuckDB, sem Python, e sem clonar o
> repositório do curso.

**Sobre as citações abaixo:** as falas marcadas como citação saem das
transcrições do próprio Lucian e do material da Taciana Serafim. Onde o
sistema de transcrição automática registrou "cloud" ou "cloud code", o texto
abaixo já mostra corrigido para "Claude" / "Claude Code" — fora isso, a fala
é literal. O vocabulário da Taciana (ciclo de 7 passos, ICE Score, formas de
testar, decisões pós-experimento) também é literal, não parafraseado.

## O que você vai levar para casa

**Uma skill: a do processo de CRO da sua própria empresa.** Não é uma receita
pronta que você recebe — é a que você escreve, a partir de como a conversão
já funciona (ou não funciona) aí dentro. Este handout é onde você rascunha
essa skill à mão, em quatro blocos, antes de ela virar um arquivo `.md`.

| Bloco | Conteúdo | Alvo |
|---|---|---|
| **A** — Antes do Claude | O que checar na sua operação antes de pôr IA em cima | 16h00 |
| **B** — Primeiro contato | Abrir o Claude Code, entender custo, mandar o primeiro prompt | 16h30 |
| **C** — Anatomia de uma receita | Dissecar uma skill pronta; hooks e guardrails | 16h55 |
| **D** — A sua skill | Descrever → gerar → validar. Você sai com uma nota | 17h25 |
| **Fechamento** | Onde sua skill se encaixa e o que fazer segunda-feira | 17h55 |

Os horários são o alvo do cenário de 2 horas cheias. A tarde é elástica: se a
Taciana passar do horário dela, o facilitador ajusta a duração de cada bloco
ao vivo. Os blocos A e D nunca encolhem — são o núcleo do dia. Se um bloco
demorar menos ou mais do que o previsto aqui, as instruções abaixo continuam
valendo do mesmo jeito.

---

# BLOCO A — Antes do Claude

**Se você chegou atrasado nesta parte:** não tem terminal para abrir aqui —
é a parte da tarde sem ferramenta nenhuma na tela. Pule direto para os dois
exercícios em branco abaixo ("Seu plano de mensuração" e "Shit in, shit out")
e preencha pensando na sua empresa; você não precisa ter ouvido a explicação
inteira para fazer isso sozinho.

## A tese do bloco

A frase que abre a tarde é da Taciana, fechando a parte dela:

> "O próximo desafio não é usar o Claude. É transformá-lo em parte do seu
> processo de CRO." — Taciana Serafim

E a virada do facilitador, que é o pré-requisito de tudo que vem depois:

> "Não adianta nada você colocar IA dentro de uma operação que ela tá
> quebrada. Então, é shit in, shit out." — Lucian Fialho

Não adianta ferramenta nenhuma se o dado que alimenta ela está errado. Antes
de abrir o Claude, você precisa saber se a sua operação está limpa.

## Mapa — os 3 passos agrupados

A Taciana apresentou o ciclo de CRO em 7 passos, num time de 4 posições
(Digital Analytics, Estrategista de CRO, UX/Research, Dev/Experimentação). O
bloco da tarde agrupa esse ciclo em 3 passos, para caber numa plateia grande.
Esta tabela é o mapa que volta no fechamento — guarde-a:

| Passo | Agrupa | O que o facilitador acrescenta nesta tarde |
|---|---|---|
| **1** | Coleta de Dados + Análise | Plano de mensuração; macro vs microconversão; checagem de implementação (shit in, shit out) |
| **2** | Hipóteses + Priorização + Design | Como gerar e priorizar hipóteses; dado qualitativo como fonte |
| **3** | Testes + Relatórios + Escala | Tipos de teste; o que vira skill e o que vira infraestrutura |

Vocabulário de apoio para o Passo 2 — a Taciana já apresentou o **ICE Score**
(Impacto × Confiança × Facilidade, 1 a 10 cada eixo): *"o score explicita
critérios e organiza o backlog — use para ranking relativo, não como
veredito."* E o alerta do facilitador sobre esse passo:

> "Priorização é grande parte do problema. O problema, na maioria das vezes,
> não é a capacidade que o ser humano tem de gerar hipótese, é a capacidade
> que ele tem de priorizar isso dado a quantidade de coisa que ele tem."
> — Lucian Fialho

Vocabulário de apoio para o Passo 3 — formas de testar e validar, tal como a
Taciana definiu (mais o acréscimo do facilitador):

| Método | Notação | Definição |
|---|---|---|
| Teste A/B | `A ↔ B` | Duas experiências comparadas: controle A versus tratamento B. |
| Teste A/B/n | `A ↔ B ↔ C ↔ D` | Compara o controle com duas ou mais variantes ao mesmo tempo. |
| MVT | `TÍTULO × IMAGEM × CTA` | Testa combinações de diferentes elementos de uma experiência. |
| Redirect / Split URL | `/PAGINA-A ↔ /PAGINA-B` | Compara experiências em URLs ou implementações diferentes. |
| Fake Door | `"QUERO ESSE RECURSO"` | Valida interesse antes de construir. |
| MAB | `50/50 → 20/80` | Adapta a distribuição de tráfego favorecendo o que performa melhor. |
| Personalização | `SEGMENTO A → EXPERIÊNCIA A` | Experiências diferentes por público, comportamento ou contexto. |
| Rollout progressivo | — | Acréscimo do facilitador: distribuir uma hipótese de produto aos poucos, como forma de teste. |

## Exercício — seu plano de mensuração

**Se você chegou atrasado nesta parte:** você não precisa da explicação ao
vivo para fazer isto. Pense num site ou produto da sua empresa e responda às
duas perguntas abaixo, na ordem.

Qual é a **macroconversão** do site (ou produto) da sua empresa? (a ação
final que você quer que o usuário complete — uma venda, um lead, uma
assinatura)

`_________________________________________________________________`

Qual é a **etapa que antecede** essa macroconversão? E a que antecede essa
etapa? Monte o funil de trás para frente, uma etapa por linha:

```
Macroconversão:  _______________________________________________
Etapa -1:        _______________________________________________
Etapa -2:        _______________________________________________
Etapa -3:        _______________________________________________
```

## Exercício — shit in, shit out

**Se você chegou atrasado nesta parte:** este checklist não depende de
nenhuma demonstração — é uma lista de perguntas sobre a sua própria conta de
analytics. Preencha com o que você sabe agora; se não souber, marque como
pendência para checar na volta ao trabalho.

A fala mais importante do bloco A é este plano prático:

> "Não esquece de chegar lá dentro do teu Google Analytics, da ferramenta de
> análise que você tem ou que você vai querer ter, para poder ver, cara,
> bate a quantidade de adição do produto ao carrinho, o purchase bate com a
> plataforma, porque tudo isso são sinais de mais implementações que vão
> cagar o teu teste A/B." — Lucian Fialho

Antes de pôr IA em cima do seu processo de CRO, confira:

- [ ] O evento de **adicionar ao carrinho** (`add_to_cart` ou equivalente)
      dispara a mesma quantidade de vezes que você observa manualmente?
      Diferença observada: `_________________`
- [ ] O evento de **compra** (`purchase` ou equivalente) bate com o número
      de pedidos da sua plataforma de e-commerce, no mesmo período?
      Diferença observada: `_________________`
- [ ] `_______________________________________________________________`
      (outro evento-chave do seu funil — o que você preencheu como "Etapa
      -1" acima é um bom candidato)
- [ ] `_______________________________________________________________`
      (outro evento-chave do seu funil)

Se qualquer uma dessas checagens não bate, essa é a prioridade antes de
qualquer skill de IA — nenhuma ferramenta corrige um teste A/B nascido de
dado errado.

---

# BLOCO B — Primeiro contato com o Claude Code

**Se você chegou atrasado nesta parte:** se você ainda não tem o Claude Code
instalado, siga o guia de instalação, no fim deste material, a partir do
Passo 0 — leva cerca de 10 minutos. Se já tem, digite `claude` no terminal
agora; você está no mesmo lugar que o resto da sala.

## O que o facilitador digita ao vivo

```
claude
```

O que esperar: se você já logou durante o guia de instalação, isso abre
direto o prompt do Claude Code, pronto para receber texto.

### B.2 — Instalar o plugin do Skill Creator (todos juntos, aqui — não corta)

O comando `/skill-creator`, usado só no fim da tarde no Bloco D, não vem
pronto dentro do Claude Code assim que você instala — é um plugin oficial
que precisa ser adicionado uma vez. Por isso ele entra aqui, no Bloco B, com
a sala toda ao mesmo tempo: quem já adiantou este passo no intervalo (Passo
7, opcional, do guia de instalação) vai ver a mesma mensagem de sucesso de
novo — isso é sucesso, não erro, não uma falha.

**Este passo precisa de duas coisas:** internet, e o **git** instalado na sua
máquina (Passo 2 do guia). O comando abaixo faz um `git clone` por baixo do
pano — sem git ele falha com uma frase que contém `Failed to clone
marketplace repository`. Se o wifi cair aqui, veja o quadro **"Se a rede não
voltar"**, logo abaixo.

**Primeiro: saia do Claude Code.** Os dois comandos abaixo são comandos do
**terminal**, não do Claude. Se você digitar qualquer um deles dentro da
sessão do Claude Code, ele vai responder em texto sobre o comando e **nada
será instalado**. Para sair, digite:

```
/exit
```

Agora, no terminal (com o cursor do terminal de volta, sem a caixa de
digitação do Claude Code):

```
claude plugin marketplace add https://github.com/anthropics/claude-plugins-official
```

Espere a mensagem
`✔ Successfully added marketplace: claude-plugins-official (declared in user settings)`
(ou `✔ Marketplace 'claude-plugins-official' already on disk`, se alguém já
rodou isso na sua máquina antes — também está certo). Depois:

```
claude plugin install skill-creator@claude-plugins-official
```

Espere
`✔ Successfully installed plugin: skill-creator@claude-plugins-official (scope: user)`
(ou `✔ Plugin "skill-creator@claude-plugins-official" is already installed` —
também está certo). Rodar os dois comandos de novo não tem problema nenhum:
eles não fazem nada se já estiver tudo pronto.

**Por último, e não é opcional: abra o Claude Code de novo.**

```
claude
```

O plugin só passa a existir **na próxima vez** que o Claude Code abre. Se
você continuar na sessão que já estava rodando, `/skill-creator` não vai
aparecer — e parece falha de instalação, quando não é. Confira agora: digite
`/` e procure `skill-creator` na lista. Se não estiver lá, `/exit` e
`claude` de novo.

### Se a rede não voltar

Sem wifi, este passo **não acontece** — e não adianta insistir. O comando
baixa o plugin da internet, com um `git clone`; não existe versão offline
dele, nem cópia em pendrive que resolva. Se a rede cair no meio do B.2, o
que você faz é:

- **Agora:** pare de tentar. Ficar repetindo o comando com a rede fora só
  produz a mesma mensagem de erro. Acompanhe o B e o C pela tela do
  facilitador — a máquina dele é a única que precisa de rede para o que vai
  ser mostrado.
- **No Bloco D:** o exercício continua existindo. Descrever o seu processo
  (D.1) é papel e caneta, e escrever a skill à mão é Markdown puro — funciona
  offline, é o "Plano B" do D.2, mais adiante neste handout. Para a parte que
  precisa do `/skill-creator`, faça em dupla com quem instalou antes da rede
  cair.
- **Em casa, com internet:** rode os dois comandos do B.2 exatamente como
  estão acima (eles também estão no guia de instalação, Passo 7), reabra o
  Claude Code, e você fica com a mesma máquina que a sala.

Não é a mesma situação de quem não instalou o Claude Code: ali a saída é a
mesma (dupla no D), mas aqui a falha é da sala inteira e o facilitador anuncia
o ajuste em voz alta. Você não precisa decidir sozinho.

Depois, um primeiro prompt de verdade — algo que produz saída em texto, sem
depender de nenhuma fonte de dado externa. Anote aqui o que o facilitador
pediu e o que voltou, para você repetir na sua própria máquina:

Prompt do facilitador: `_________________________________________________`

O que voltou (resumo em uma linha): `___________________________________`

O enquadramento desta parte é sobre **custo e controle**:

> "A gente precisa garantir com relação a custo. Como que a gente faz para
> poder orientar e garantir o custo de prompt?" — Lucian Fialho

Depois, para ver o menu de recursos:

```
/
```

> "Quando você abre o Claude, tanto desktop quanto o Claude Code, tenta
> digitar a barra dentro dele. Quem tiver aí aberto e nunca fez isso,
> aconselho fazer." — Lucian Fialho

## O que existe no menu `/` — visão geral

Não é para você rodar nada disto agora além de abrir o menu e olhar — são
recursos que o facilitador nomeia e mostra na tela dele:

- **`/loop`** — automatiza um comando como se fosse um cron job: de 15 em 15
  minutos, de hora em hora, do jeito que você configurar.
- **`/schedule`** — a versão que roda na nuvem, para pipelines completos, sem
  depender da sua máquina estar ligada.
- **Remote control** — deixa você mandar comandos para o Claude Code do seu
  computador a partir do celular.
- **O comando perigoso** — `--dangerously-skip-permissions`. Ele evita que
  você fique confirmando cada ação com "y", mas remove a rede de segurança
  junto. **Não use hoje.** O facilitador vai só nomear que existe.

## Por que terminal, não navegador

Resumo do argumento, para quem só usou chat via navegador até hoje: no
navegador você não tem acesso a rodar recursos locais da sua máquina nem a
conectar ferramentas locais (o que o facilitador chama de MCP local) — o
fluxo vira copiar texto, colar no chat, copiar a resposta, colar de volta. No
terminal essa ponte existe.

## Git, em uma frase

Você não vai aprender a **usar** Git hoje, e não vai clonar repositório
nenhum. Mas ele já está na sua máquina desde o intervalo (Passo 2 do guia de
instalação), porque o Claude Code usa o git por baixo do pano para baixar
plugins — foi o que aconteceu agora há pouco, no B.2, sem você ver.

O que você precisa saber é por que ele existe: é o lugar de onde a maioria
das skills prontas circula.

> "Vocês não precisam ser experts em GitHub, vocês precisam saber que que é
> isso daqui, como que isso funciona, porque lá que vocês vão copiar a
> maioria das skills que vocês vão pegar." — Lucian Fialho

---

# BLOCO C — Anatomia de uma receita

**Se você chegou atrasado nesta parte:** leia a definição de receita logo
abaixo (3 frases) e depois vá direto para a tabela "Os 3 campos, lado a
lado" — ela sozinha te dá o que você precisa saber para o Bloco D. Você não
precisa ter visto a dissecação linha a linha ao vivo.

## A receita

> "Eu tento trabalhar como se a skill do Claude, ela fosse uma receita
> mesmo. Numa receita, você tem lá ela começando pelos ingredientes, que a
> gente pode tentar fazer o translate aqui pro nosso quadro de análise de
> dados, que vão ser as fontes de dados que a gente vai consumir, e a gente
> tem o modo de preparo." — Lucian Fialho

> "A gente tem ingredientes, modo de preparo e como você vai consumir aquela
> informação." — Lucian Fialho

Três partes, sempre:

1. **Ingredientes** — as fontes de dado que a skill consome.
2. **Modo de preparo** — a lista de passos que ela executa, em sequência.
3. **Output, contratado** — o que ela entrega, em que formato, e até quando
   vale. Esta é a parte que a maioria esquece:

> "Eu acho que a gente tem que deixar isso também contratado dentro da
> skill: essa receita é feita para três a seis pessoas, você pode consumir
> assim, assim, assado, tem o prazo de validade de tanto." — Lucian Fialho

E a piada que desarma quem nunca escreveu Markdown:

> "Quem achou que não ia ter que escrever Markdown em pleno 2026, né?
> Tecnologia tão antiga, mas que a gente tem utilizado bastante, muito
> porque é uma das formas que a gente tem de escrever documentos um pouco
> mais semânticos em texto." — Lucian Fialho

## O exemplo dissecado: `heuristica-morys`

Este é o arquivo `.md` inteiro, projetado na tela — a Taciana apontou
heurística e análise de site como o que mais agrega para esta turma.

Repare nas quatro primeiras linhas, entre `---` e `---`: é o *frontmatter*, o
crachá da skill. O `name` é o que vira o comando (`/heuristica-morys`) e tem
que ser igual ao nome da pasta; a `description` é o que faz o Claude Code
saber **quando** usar a receita. Sem esse bloco, o arquivo é só um texto
solto — o Claude Code não o carrega. Ele volta no Bloco D, quando você
escrever a sua.

```markdown
---
name: heuristica-morys
description: Varredura de página nas 7 dimensões da heurística de André Morys (Relevância, Confiança, Orientação, Estímulo, Segurança, Conveniência, Confirmação). Diagnostica onde a página perde conversão antes de propor hipótese. Use quando o usuário disser "analisar página", "heurística", "diagnóstico de CRO", "onde estou perdendo conversão".
---

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

## Os 3 campos, lado a lado

Esta é a tabela que importa para o Bloco D. À esquerda, como cada campo
aparece no exemplo acima. À direita, em branco: comece a rascunhar a sua.

| Campo da receita | No exemplo `heuristica-morys` | Na sua receita — rascunhe |
|---|---|---|
| **Ingredientes** (fontes de dado) | URL da página + print (acima da dobra) + conversão desejada + público que chega nela | `_________________________________` |
| **Modo de preparo** (sequência de passos) | Avaliar as 7 dimensões de Morys, uma a uma, de 1 a 5, citando a evidência vista na página para cada nota | `_________________________________` |
| **Output, contratado** | Tabela nota+achado+evidência por dimensão; score total; as 2 dimensões mais fracas; chamada para a próxima skill (`hipotese-estruturada`) | `_________________________________` |

Use mais linhas se precisar:

`_______________________________________________________________________`

`_______________________________________________________________________`

## Não copie skill dos outros

Este é o motivo pelo qual você escreve a sua no Bloco D, em vez de usar a de
alguém:

> "Você nunca acredita cegamente na skill de uma pessoa. Você sempre traz
> essa skill para dentro do seu Claude Code e entende como que ela pode ser
> boa pro teu fluxo de trabalho. Nunca você sai copiando e colando."
> — Lucian Fialho

> "Aquela skill é uma sequência, é uma receita dada por uma pessoa que tem
> um fluxo de trabalho específico, que é o dela." — Lucian Fialho

E o problema em escala de time — é o argumento para usar o Skill Creator no
Bloco D, em vez de escrever cada um do seu jeito:

> "Cada um criou uma skill separada diferente do seu jeito, com seu
> contexto. A gente vai ter a IA procurando problema às vezes em coisas que
> só eu peguei ou em coisas que só eu pensei. É muito importante que a gente
> tenha a mesma base para poder conseguir construir essas skills."
> — Lucian Fialho

Um aviso que vale para quando você for escrever a sua, daqui a pouco:

> "Eu acho que vocês estão criando skills muito grandes." — Lucian Fialho

## Skill, slash command e hook — as três peças

> "As skills são os textos que vão determinar as receitas de como aquilo tem
> que ser implementado. O slash command é o atalho — é você dar um `/weekly
> report` e ele rodar um report, que é uma skill que vai puxar as
> informações de uma vez só para você. E os hooks são os scripts que a gente
> consegue colocar ali automaticamente para poder evitar que alguém faça uma
> merda muito grande." — Lucian Fialho

## Hooks e guardrails

Você **não escreve hook hoje**. Esta seção é para você saber que existe, o
que impede, e onde os prontos vão parar.

> "Os hooks é a maneira que a gente tem de conseguir deixar determinístico a
> parada. É a maneira com que a gente tem de falar: 'Claude, se o usuário
> tentar fazer alguma coisa que vai excluir algum artigo, você bloqueia ele
> na hora.'" — Lucian Fialho

O guardrail concreto que o facilitador mostra na tela, contra comandos
destrutivos:

> "Colocar um guardrail para detectar comandos destrutivos é fundamental.
> Aqui eu disponibilizei um arquivo, um shell, que eu tô dizendo: ó, não
> pode executar `rm -rf`, não pode executar `drop table`, não pode executar
> `drop database`. Toda vez que o Claude, antes de executar uma função que
> poderia ser um drop table, ele vai trigar o hook e vai travar a sessão pro
> usuário." — Lucian Fialho

E a responsabilidade, que fecha o argumento:

> "Nós como engenheiros de dados ou nós como analistas de dados, quando a
> gente disponibiliza um dado para um terceiro, que é uma pessoa que não tem
> esse conhecimento técnico, nós somos responsáveis por colocar esses
> guards lá dentro." — Lucian Fialho

`[A CONFIRMAR: o link exato dos hooks prontos ainda não estava fechado
quando este handout foi escrito. O facilitador vai postar no grupo de
WhatsApp da turma — confira lá se você não anotou durante a aula.]`

---

# BLOCO D — A sua skill

**Se você chegou atrasado nesta parte:** vá direto para "D.1 — Descrever" e
responda as quatro perguntas abaixo, mesmo sem ter ouvido a introdução. Se
travar para descrever o processo da sua empresa, peça para formar dupla com
quem já começou — é permitido e é uma boa ideia.

**Este é o entregável do dia: uma skill — a do processo de CRO da sua
própria empresa.** Três tempos: descrever → gerar → validar. Você sai com
uma nota.

> "Vocês vão descrever o processo de CRO, tal como funciona na empresa de
> vocês. Vocês vão ter que debater sobre isso e sair para mim com uma
> skill." — Lucian Fialho

> "Eles vão recriar a metodologia baseado no que eles entenderam do que você
> falou." — Lucian Fialho

## D.1 — Descrever

**Se você chegou atrasado nesta parte:** as quatro perguntas abaixo são
autossuficientes — você não precisa de mais nenhum contexto para começar a
escrever.

Você não parte do zero. Parte de quatro perguntas fixas:

**1. Cargos** — quem são as pessoas envolvidas em conversão na sua empresa?
Nome do cargo, não "o time".

```
_________________________________________________________________
_________________________________________________________________
_________________________________________________________________
```

**2. Handoffs** — quem entrega para quem, e em que momento? Semana, mês,
sprint.

```
_________________________________________________________________
_________________________________________________________________
_________________________________________________________________
```

**3. Entregáveis** — o que sai de cada etapa? Um documento, uma planilha, um
ticket?

```
_________________________________________________________________
_________________________________________________________________
_________________________________________________________________
```

**4. Ingredientes** — de onde vem o dado que alimenta cada etapa? Fonte
nomeada, não "os dados da empresa".

```
_________________________________________________________________
_________________________________________________________________
_________________________________________________________________
```

**Se na sua empresa não existe um processo de CRO formal:** descreva o que
existe hoje, mesmo que seja informal. Um processo ruim descrito é material
de trabalho; um processo inventado não é.

**Se você travar:** levante a mão — dupla é permitida e é uma boa ideia.

## D.2 — Gerar

**Se você chegou atrasado nesta parte:** copie as suas quatro respostas de
D.1 num parágrafo corrido e siga os passos abaixo a partir de "Rodando o
Skill Creator" — você não precisa ter visto a demonstração do facilitador.

O Skill Creator é uma skill que cria skills:

> "É uma skill que cria skills. Você dá um `/skill-creator` dentro do teu
> Claude Code e ele vai criar um passo a passo, um loop que vai extrair as
> informações daquela sessão para poder conseguir gerar uma skill que você
> consegue replicar isso automaticamente." — Lucian Fialho

> "É usar o Skill Creator, porque ele vai seguir um passo a passo que
> minimamente vai trazer um equilíbrio maior sobre o teu time criando várias
> skills. Vai ter uma metodologia ali por trás que o Claude vai seguir."
> — Lucian Fialho

### Rodando o Skill Creator

**O plugin do Skill Creator já foi instalado no Bloco B (B.2), com a sala
toda.** Se você chegou agora e o comando `/skill-creator` não aparece quando
você digita `/`, não pare para instalar sozinho: faça este exercício em
dupla com alguém que já tem o plugin funcionando, enquanto instala o seu em
paralelo — os mesmos dois comandos do B.2, listados no guia de instalação
(Passo 7). Lembre dos dois detalhes que fazem esse comando falhar em
silêncio: ele roda **fora** do Claude Code (`/exit` primeiro), e o plugin só
aparece **depois** de fechar e abrir o Claude Code de novo.

Dentro do Claude Code:

```
/skill-creator
```

E na conversa: cole o parágrafo com as suas quatro respostas de D.1 e peça
para ele gerar a skill do processo de CRO da sua empresa.

### Plano B — se o Skill Creator não se comportar como esperado

A skill não deixa de existir porque a ferramenta falhou. Escreva o `.md` à
mão, com os três blocos que você aprendeu no Bloco C.

**As três primeiras linhas não são decoração.** Aquele bloco entre `---` e
`---` chama-se *frontmatter*: é por ele que o Claude Code reconhece o arquivo
como uma skill e sabe quando usá-la. Um `.md` sem frontmatter é só um texto
solto na pasta — o Claude Code nunca o carrega. Copie o formato exatamente,
inclusive os dois `---`:

```
---
name: [nome-da-sua-skill]
description: [uma frase dizendo o que a skill faz e quando usar]
---

# [nome da sua skill]

## Ingredientes
[suas fontes de dado, da resposta 4 de D.1]

## Modo de preparo
[a sequência de passos do seu processo — cargos e handoffs, das respostas 1 e 2]

## Output
[os entregáveis de cada etapa, da resposta 3 de D.1]
```

O `name` tem que ser em minúsculas, sem espaço e sem acento — use hífen no
lugar do espaço (`processo-cro-acme`). E ele precisa ser **igual ao nome da
pasta** onde você salvar o arquivo; é o erro de instalação mais comum.

## D.3 — Validar

**Se você chegou atrasado nesta parte:** o texto completo do validador está
impresso mais abaixo, nesta mesma seção, junto com as três etapas para
instalá-lo (criar a pasta, salvar o arquivo, reabrir o Claude Code). Se não
der tempo de fazer isso agora, acompanhe o facilitador rodando na tela dele
com a skill de um voluntário e use a tabela de critérios para se
autoavaliar — a instalação você refaz em casa, com o mesmo texto.

O validador foi desenhado como o oposto da sua skill — um antipattern que
confere se a sua metodologia está completa:

> "Eu posso fazer uma skill que é um antipattern da sua, que você vai
> colocar quais são os pontos de avaliação pra gente poder fazer um
> validador de skill." — Lucian Fialho

> "Ponto. Entrega com o cara saindo com a notinha e tá tudo certo."
> — Lucian Fialho

### Como o validador chega na sua máquina

O texto completo do validador está **impresso aqui neste handout**, logo
abaixo. Não depende de link, de pendrive nem de você ter copiado algo da
tela a tempo: se o resto falhar, o papel na sua mão continua funcionando. O
facilitador também posta o arquivo no grupo de WhatsApp — quando der,
copiar de lá é mais rápido do que digitar.

São três coisas, nesta ordem: **criar a pasta**, **salvar o arquivo**,
**reabrir o Claude Code**. Cada uma tem um jeito de dar errado em silêncio, e
os três estão avisados abaixo.

#### 1. Criar a pasta

A pasta de skills do seu usuário **ainda não existe** — instalar o Claude
Code não a cria. Numa máquina recém-configurada, dentro da pasta oculta
`.claude` existem só `.claude.json`, `backups`, `plugins` e `settings.json`.
Você vai criar duas pastas: `skills`, e dentro dela `valida-skill-cro`.

O caminho final, por sistema:

| Sistema | Onde o arquivo tem que ficar |
|---|---|
| **Mac** | `~/.claude/skills/valida-skill-cro/SKILL.md` |
| **Windows** | `C:\Users\<seu usuário>\.claude\skills\valida-skill-cro\SKILL.md` |

**Sem terminal, no Mac:** abra o Finder. No menu do topo, clique em **Ir →
Ir para a pasta…** (ou aperte `Cmd + Shift + G`). Digite `~/.claude` e
aperte `Enter` — a pasta abre. Se não houver uma pasta `skills` ali, crie:
`Cmd + Shift + N`, nomeie **`skills`**, `Enter`. Entre nela e crie outra,
nomeada **`valida-skill-cro`**.

**Sem terminal, no Windows:** abra o Explorador de Arquivos. Clique na barra
de endereço do topo (onde aparece o caminho), apague o que estiver lá,
digite `%USERPROFILE%\.claude` e aperte `Enter`. Se não houver uma pasta
`skills`, clique com o botão direito num espaço vazio → **Novo → Pasta**, e
nomeie **`skills`**. Entre nela e crie outra, nomeada
**`valida-skill-cro`**.

O nome da pasta tem que ser **exatamente** `valida-skill-cro` — minúsculas,
com hífen, sem espaço e sem acento. Ele precisa bater com o campo `name` que
está na primeira linha do arquivo, mais abaixo.

#### 2. Salvar o arquivo — e o editor importa

Dentro da pasta `valida-skill-cro`, o arquivo tem que se chamar `SKILL.md`,
com esse nome e essa extensão. Aqui mora a armadilha:

> ⚠️ **No Windows, o Bloco de Notas (Notepad) salva `SKILL.md` como
> `SKILL.md.txt` sem avisar.** Você vê "SKILL.md" na janela de salvar, o
> arquivo aparece na pasta, e mesmo assim o Claude Code nunca acha a skill —
> porque o nome real tem um `.txt` grudado no fim que o Windows esconde de
> você. É a causa número um de o D.3 não funcionar.

**Como evitar, em ordem de preferência:**

1. **Se você já tem VS Code, Sublime Text ou Notepad++ instalado, use um
   deles.** Eles salvam texto puro e respeitam o nome que você digita. É o
   caminho sem surpresa.
2. **Mais simples ainda: peça ao Claude Code.** Abra o Claude Code, cole o
   texto do validador no chat e escreva: *"salve este conteúdo exatamente
   como está em `~/.claude/skills/valida-skill-cro/SKILL.md`, criando as
   pastas se não existirem"*. Ele pede sua confirmação para escrever o
   arquivo — responda que sim. Isso resolve o passo 1 e o passo 2 de uma vez,
   e é o caminho recomendado para quem não quer mexer em pasta nenhuma.
3. **No Mac, com o TextEdit:** abra o TextEdit e, **antes de colar o texto**,
   vá em **Formatar → Converter em texto simples** (`Shift + Cmd + T`) — sem
   isso ele salva um `.rtf` disfarçado. Depois cole, salve com o nome
   `SKILL.md` dentro da pasta que você criou, e quando ele perguntar sobre a
   extensão escolha **"Usar .md"**.
4. **No Windows, com o Bloco de Notas:** na janela "Salvar como", **antes de
   apertar Salvar**, mude o campo **"Tipo"** (ou "Salvar como tipo") de
   *Documentos de texto (\*.txt)* para **"Todos os arquivos (\*.\*)"**. Só
   então digite `SKILL.md` e salve. Se não achar esse campo, escreva o nome
   entre aspas: `"SKILL.md"`.

**Como conferir que deu certo no Windows:** no Explorador de Arquivos, aba
**Exibir**, marque a caixa **"Extensões de nomes de arquivo"**. O arquivo
tem que aparecer como `SKILL.md`. Se aparecer `SKILL.md.txt`, clique com o
botão direito → Renomear e apague o `.txt` do fim.

#### 3. Reabrir o Claude Code

Uma skill nova só é carregada **na próxima vez** que o Claude Code abre. Se
você salvar o arquivo com a sessão aberta, `/valida-skill-cro` não vai
aparecer — e parece que você errou a pasta, quando não errou.

Dentro do Claude Code, digite:

```
/exit
```

E depois, no terminal:

```
claude
```

Confira: digite `/` e procure `valida-skill-cro` na lista. Estando lá, rode:

```
/valida-skill-cro
```

E aponte o `SKILL.md` que você acabou de gerar (ou cole o conteúdo direto no
chat).

#### O texto do validador — copie daqui

```markdown
---
name: valida-skill-cro
description: Avalia a skill de processo de CRO que o aluno acabou de criar com o Skill Creator, nota por critério nomeado e aponta o que falta responder — sem preencher a lacuna por ele. Use quando o usuário disser "validar minha skill", "avaliar a skill que eu criei", "dar nota na skill", "essa skill tá boa?" ou "rodar o validador".
---

# Valida Skill CRO — nota e lacunas da skill do aluno

## Tarefa

Receber a skill de processo que o aluno acabou de gerar com o Skill Creator,
avaliar em 5 critérios nomeados e devolver uma nota por critério, uma nota
final e — para cada ponto que faltar — a pergunta exata que a skill não
responde. Esta skill não corrige a skill do aluno: ela é o antipattern que
confere se a metodologia dele está completa.

## Input necessário

Peça ao aluno:
1. O caminho do arquivo `SKILL.md` que ele gerou, ou o conteúdo colado
   direto no chat.

Se vier só um pedaço (por exemplo, sem a seção de passos), avalie apenas o
que foi entregue e diga explicitamente quais critérios ficaram sem material
suficiente — não peça para o aluno completar antes de rodar; a nota parcial
também é informação.

## Os 5 critérios

Cada um vem de uma peça específica do que uma skill de processo precisa ter,
nas próprias palavras usadas na definição do exercício: a skill é uma
receita — **ingredientes** (fontes de dado) e **modo de preparo** (sequência
de passos) — e o processo por trás dela tem **cargos**, **handoffs** e
**entregáveis** nomeados.

| # | Critério | Pergunta-guia |
|---|---|---|
| 1 | Papéis | A skill nomeia os cargos ou papéis das pessoas envolvidas no processo? |
| 2 | Handoffs | A skill nomeia as passagens entre papéis — quem entrega para quem, e em que momento? |
| 3 | Entregáveis | A skill nomeia o entregável de cada etapa — o que sai de cada handoff? |
| 4 | Ingredientes | A skill diz de onde vem o dado que alimenta cada etapa, com fonte nomeada (não "os dados da empresa")? |
| 5 | Modo de preparo | A sequência de passos é executável — dá para seguir passo 1, passo 2, passo 3 — ou é vaga ("analisar", "otimizar", "melhorar")? |

## Escala

Cada critério recebe 0, 1 ou 2:

- **0 — ausente.** Não aparece em nenhum lugar da skill.
- **1 — parcial.** Aparece, mas de forma genérica ou incompleta (por
  exemplo, cita "o time de CRO" sem nomear os cargos dentro dele, ou cita
  "os dados" sem dizer de onde vêm).
- **2 — completo.** Nomeado e específico o suficiente para outra pessoa
  executar sem perguntar de volta.

**Nota final:** soma dos 5 critérios, de 0 a 10.

- **8–10** — a skill descreve um processo executável; está pronta para virar
  a skill de execução do time.
- **4–7** — a skill tem processo real por trás, mas com lacunas que impedem
  que outra pessoa a rode sem perguntar de volta.
- **0–3** — o que foi descrito ainda não é um processo (ou é a operação de
  uma ferramenta, não um processo de negócio — ver sinal de alerta abaixo).

## Sinal de alerta — ferramenta em vez de processo

Uma skill pode ter uma sequência de passos claramente executável ("abra o
relatório X, clique em Y, exporte Z") e ainda assim pontuar 0 em Papéis,
Handoffs e Entregáveis. Isso não é um empate entre critérios — é o sinal de
que o aluno descreveu como usar uma ferramenta, não o processo de CRO da
empresa dele. Diga isso explicitamente quando acontecer: "Modo de preparo
pontuou alto porque os cliques são claros, mas isso descreve uma ferramenta,
não o processo — falta dizer quem faz isso, para quem entrega e o que essa
pessoa faz com o resultado."

## Regras de avaliação

- Toda nota abaixo de 2 vem acompanhada da **pergunta específica que a skill
  não responde** — nunca da observação genérica "está vago". Exemplo correto:
  "não diz quem recebe a lista de hipóteses depois de priorizada" — e não
  "falta detalhar handoffs".
- **Nunca invente conteúdo para preencher a lacuna do aluno.** Se a skill não
  diz de onde vem o dado, aponte a ausência — não sugira uma fonte plausível
  (não escreva "provavelmente vem do GA4"). O aluno tem que sair sabendo o
  que falta no processo dele, não recebendo um processo que você inventou.
- Cite o trecho da skill que sustenta cada nota 1 ou 2, do mesmo jeito que
  uma nota de heurística de página precisa citar o que foi visto na tela.
- Não avalie estilo de escrita, formatação de Markdown ou tamanho do
  arquivo. Os 5 critérios são os únicos pontos de avaliação.

## Output

| Critério | Nota (0-2) | O que sustenta a nota / o que falta |
|---|---|---|
| Papéis | ... | ... |
| Handoffs | ... | ... |
| Entregáveis | ... | ... |
| Ingredientes | ... | ... |
| Modo de preparo | ... | ... |

**Nota final:** X/10 — [faixa: pronta / incompleta / ainda não é um processo]

**Sinal de alerta (ferramenta vs. processo):** [presente / ausente — e por quê]

**As 2 lacunas mais urgentes:** [as perguntas específicas, na ordem em que
o aluno deveria resolvê-las antes de rodar o Skill Creator de novo]
```

A última seção do arquivo original — a calibragem que o facilitador roda
antes do evento — não entra na sua cópia: ela é instrução para quem prepara
a aula, não para quem roda o validador. Copiar só até aqui está certo.

### O que o validador devolve

Cinco critérios, cada um valendo 0, 1 ou 2 — os mesmos quatro de D.1, mais o
modo de preparo:

| Critério | Nota (0-2) | O que sustenta a nota / o que falta |
|---|---|---|
| Papéis | | |
| Handoffs | | |
| Entregáveis | | |
| Ingredientes | | |
| Modo de preparo | | |

**Nota final:** `_____` / 10

- **8–10** — a skill descreve um processo executável; pronta para virar a
  skill de execução do time.
- **4–7** — tem processo real por trás, mas com lacunas que impedem outra
  pessoa de rodar sem perguntar de volta.
- **0–3** — o que foi descrito ainda não é um processo (ou descreve uma
  ferramenta, não o seu processo de negócio).

**Sinal de alerta (ferramenta vs. processo):** uma sequência de cliques numa
interface pode pontuar alto em "Modo de preparo" e zero nos outros quatro
critérios. Isso não é uma skill de processo — é o manual de uma ferramenta.

Anote aqui o que o validador apontou como faltando — as 2 lacunas mais
urgentes, na ordem em que você deveria resolvê-las:

`1. ______________________________________________________________`

`2. ______________________________________________________________`

O validador não preenche essas lacunas por você. Ele existe para te mostrar
exatamente onde perguntar de novo, na sua própria empresa, antes de rodar o
Skill Creator uma segunda vez.

---

# FECHAMENTO

**Se você chegou atrasado nesta parte:** não tem exercício de terminal
aqui — é só ler e olhar para o que você já escreveu nos blocos anteriores.

> "Essa skill é o ponto que conecta com toda a metodologia do que a gente
> viu aqui hoje." — Lucian Fialho

## Onde a sua skill se encaixa nos 3 passos

Volte ao que você escreveu no Bloco D e mapeie contra o mapa do Bloco A:

- **Passo 1 — Coleta + Análise:** os **ingredientes** da sua skill (resposta
  4 de D.1) são as suas fontes de dado. Se estiverem vagos, é ali que a
  operação está quebrada — shit in, shit out.

  O que você escreveu como ingrediente: `_______________________________`

- **Passo 2 — Hipótese + Priorização + Design:** os **handoffs** que você
  nomeou (resposta 2 de D.1) são exatamente onde a priorização trava.

  O que você escreveu como handoff: `___________________________________`

- **Passo 3 — Teste + Relatório + Escala:** os **entregáveis** que você
  nomeou (resposta 3 de D.1) são o que vira relatório e o que vira escala.

  O que você escreveu como entregável: `_________________________________`

## O que escala

> "Eles saem podendo plugar a sua própria metodologia `.md`, que vai ser a
> visão dele ou do time dele sobre CRO." — Lucian Fialho

A régua honesta, que fecha a tarde:

> "Elas são sempre a etapa inicial do teu trabalho. É sempre o ponto de
> partida — não é nunca o início e o fim." — Lucian Fialho (sobre skills e
> navegação agêntica)

## Na segunda-feira

- Pegue a skill que você gerou hoje e rode ela de verdade, sobre um processo
  real da sua empresa — não o exemplo hipotético que você pode ter usado
  para testar.
- Resolva, na sua empresa, a lacuna mais urgente que o validador apontou
  acima antes de rodar o Skill Creator de novo.
- Compartilhe o `.md` gerado com o seu time — é o arquivo que todo mundo
  passa a usar, em vez de cada pessoa criar a própria skill do zero (o
  problema que o Bloco C descreveu).

## Links de hoje

Os links prometidos ao longo da tarde — hooks prontos, o `.md` de exemplo
(`heuristica-morys`) e o validador — vão para o **grupo de WhatsApp da
turma**, criado antes do coffee. O `heuristica-morys` e o validador também
estão impressos por extenso neste handout (Bloco C e D.3, respectivamente):
se você perder o link, o papel resolve.

`[A CONFIRMAR: se há um convite de produto (analytics-copilot) no fechamento
presencial. Nenhuma fonte usada para este handout confirma isso para o
evento de 14/09 — a menção a esse convite aparece só numa live pública
anterior, sem relação combinada com a Taciana para este dia. Não incluído
aqui até confirmação.]`
