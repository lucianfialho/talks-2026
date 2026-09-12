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
> segundo arquivo, encadernado logo depois deste. Você instala **só o Claude
> Code** — nada de DuckDB, Python ou clone de repositório.

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

Você não vai aprender Git hoje. Só precisa saber que existe, porque é o
lugar de onde a maioria das skills prontas circula:

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
heurística e análise de site como o que mais agrega para esta turma:

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

### Antes de digitar `/skill-creator` — instalar o plugin (uma vez só)

O Skill Creator não vem pronto dentro do Claude Code assim que você instala
— é um plugin oficial que precisa ser adicionado uma vez. Isso não está no
roteiro nem no guia de instalação porque é um detalhe técnico que foi
conferido só agora, na escrita deste handout: sem este passo, `/skill-creator`
não existe ainda na sua máquina. Precisa de internet — se o wifi cair aqui,
veja o quadro "Se a rede não voltar" mais abaixo.

No terminal, ainda **fora** do Claude Code (ou dentro dele, trocando `claude`
por `/`, os dois funcionam):

```
claude plugin marketplace add https://github.com/anthropics/claude-plugins-official
```

Espere a mensagem `✔ Successfully added marketplace: claude-plugins-official`
(ou `já on disk`, se alguém já rodou isso na sua máquina antes — também está
certo). Depois:

```
claude plugin install skill-creator@claude-plugins-official
```

Espere `✔ Successfully installed plugin: skill-creator@claude-plugins-official`
(ou `já instalado` — também está certo). Rodar os dois comandos de novo não
tem problema nenhum: eles não fazem nada se já estiver tudo pronto.

### Rodando o Skill Creator

Dentro do Claude Code:

```
/skill-creator
```

E na conversa: cole o parágrafo com as suas quatro respostas de D.1 e peça
para ele gerar a skill do processo de CRO da sua empresa.

### Plano B — se o Skill Creator não se comportar como esperado

A skill não deixa de existir porque a ferramenta falhou. Escreva o `.md` à
mão, com os três blocos que você aprendeu no Bloco C:

```
# [nome da sua skill]

## Ingredientes
[suas fontes de dado, da resposta 4 de D.1]

## Modo de preparo
[a sequência de passos do seu processo — cargos e handoffs, das respostas 1 e 2]

## Output
[os entregáveis de cada etapa, da resposta 3 de D.1]
```

## D.3 — Validar

**Se você chegou atrasado nesta parte:** se o comando `/valida-skill-cro` não
existir ainda na sua máquina quando você chegar aqui, acompanhe o
facilitador rodando na tela dele com a skill de um voluntário, e use a
tabela de critérios abaixo para se autoavaliar enquanto isso.

O validador foi desenhado como o oposto da sua skill — um antipattern que
confere se a sua metodologia está completa:

> "Eu posso fazer uma skill que é um antipattern da sua, que você vai
> colocar quais são os pontos de avaliação pra gente poder fazer um
> validador de skill." — Lucian Fialho

> "Ponto. Entrega com o cara saindo com a notinha e tá tudo certo."
> — Lucian Fialho

`[A CONFIRMAR: como exatamente o comando `/valida-skill-cro` chega até a sua
máquina — pendrive, cópia de tela ou link — ainda não estava decidido quando
este handout foi escrito. O facilitador anuncia o método no início do Bloco
D. O que segue abaixo é o mecanismo técnico por trás de qualquer um desses
métodos: uma vez com o texto da skill em mãos, ele funciona assim.]`

Se o arquivo chegar como texto para colar (pendrive ou tela), salve-o na
pasta de skills do seu usuário, dentro da pasta oculta `.claude` que o
Claude Code já criou quando você fez login — no Mac, `~/.claude/skills/`; no
Windows, dentro da pasta do seu usuário, também `.claude\skills\`. Crie uma
subpasta chamada `valida-skill-cro` e salve o conteúdo dentro dela como
`SKILL.md`. Feito isso, o comando abaixo passa a existir.

No Claude Code:

```
/valida-skill-cro
```

E aponte o `SKILL.md` que você acabou de gerar (ou cole o conteúdo direto no
chat).

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
turma**, criado antes do coffee.

`[A CONFIRMAR: se há um convite de produto (analytics-copilot) no fechamento
presencial. Nenhuma fonte usada para este handout confirma isso para o
evento de 14/09 — a menção a esse convite aparece só numa live pública
anterior, sem relação combinada com a Taciana para este dia. Não incluído
aqui até confirmação.]`
