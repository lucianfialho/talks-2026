# Roteiro do facilitador — Imersão CRO, bloco da tarde

**Evento:** 14/09/2026 · **Bloco:** 16h00–18h00 (elástico) · **Facilitador:** Lucian Fialho
**Co-facilitação:** Taciana Serafim, 14h00–15h30 · **Coffee:** 15h30–16h00

---

## Como usar este documento

Este roteiro é para quem está no palco. Cada bloco tem: horário e duração alvo,
objetivo, o que está na tela, **falas-chave literais**, o que o facilitador digita ao
vivo, o que pode dar errado com a saída, e quanto o bloco comprime.

**Convenções:**

- Falas marcadas com `>>` são **literais**, tiradas das transcrições de reunião e da
  live de 22/07. São falas do próprio facilitador — dizer assim, não parafrasear.
  A fonte de cada uma está no relatório da task.
- As transcrições são geradas por ASR e escrevem *"cloud"* / *"cloud code"* onde ele
  disse **Claude** / **Claude Code**. Nas citações abaixo a palavra aparece corrigida
  entre colchetes: `[Claude]`. O resto da fala está como saiu da boca dele, palavrão
  incluído — é assim que ele fala no palco e é assim que funciona.
- O vocabulário da Taciana (ciclo, papéis, heurística de Morys, template de hipótese,
  ICE, formas de testar, checklist pré-Start, decisões pós-experimento) vem de
  `notes/sources/taciana-cro-fundamentos.md` e **não se parafraseia**. Quando o
  callback tocar nesse vocabulário, usar as palavras dela.
- Não citar número de página de nada, no roteiro ou no palco.

---

## 1. Cenários de tempo — a tabela mais útil do dia

A Taciana entrega o palco; o bloco da tarde se ajusta ao que sobrar. Fala dele em 11/09:

> `>>` **"não tenha medo da quantidade de slide que você vai ter, tá ligado? Porque eu
> consigo ajustar o meu conteúdo para caber no tempo que você me entregar, tá ligado?"**

Por isso: **decidir o cenário no momento em que ela devolve o palco**, olhando o
relógio, e não no meio do bloco. Anunciar nada disso para a sala — a turma não precisa
saber que houve corte.

| Você recebeu | A — Antes do Claude | B — Primeiro contato | C — Anatomia da receita | D — A sua skill | Fechamento | Soma |
|---|---|---|---|---|---|---|
| **120 min** (16h00) | 30 | 25 | 30 | 30 | 5 | **120** |
| **100 min** (16h20) | 30 | 15 | 20 | 30 | 5 | **100** |
| **80 min** (16h40) | 30 | **B+C fundidos: 15** | — | 30 | 5 | **80** |

**Como cada cenário se executa na prática:**

- **120 min — o alvo.** Tudo roda como escrito. Se sobrar minuto no fim de C, ele vai
  para D, não para B.
- **100 min.** B perde a comparação CLI vs MCP e o tour de features (`/loop`,
  `/schedule`, remote control) — fica só abrir, custo de prompt e o primeiro prompt.
  C perde a dissecação linha a linha do exemplo e os hooks viram uma tela só: "existem,
  servem para isso, o link está no grupo."
- **80 min.** B e C deixam de ser blocos separados. Vira **um bloco único de 15 min**:
  abrir o Claude Code, mostrar o `.md` de exemplo na tela e nomear as três partes da
  receita (ingredientes, modo de preparo, output). Hooks e guardrails saem do palco e
  viram link no grupo de WhatsApp. **A e D ficam intactos** — A é a autoridade do
  facilitador, D é o que o aluno leva para casa.

**Ordem de corte, declarada:** B comprime primeiro, depois C, depois B e C fundem.
**A e D nunca caem.** Se a Taciana estourar além dos 40 min (palco às 16h40+), não
comprimir A nem D: cortar o Fechamento para 2 min e avisar a produção.

**Se sobrar tempo** (ela terminar antes das 16h00): B e C voltam ao alvo e o excedente
vai todo para D — é onde o tempo extra rende mais, porque é lá que o aluno trava.

---

## 2. As duas teses do bloco

O bloco inteiro sustenta duas afirmações, nesta ordem. A primeira é o que dá autoridade
para a segunda.

**Tese 1 — o pré-requisito.** Não adianta IA numa operação quebrada.

> `>>` **"uma das coisas que eu vou mais falar para eles lá é tudo que a gente tem que
> aprender antes de aprender o [Claude] especificamente, porque não adianta nada a gente
> fazer toda essa estrutura, querer colocar IA dentro do processo de de CRO."**

> `>>` **"não adianta nada você colocar IA dentro de uma operação que ela tá quebrada.
> Então, é shit in, shit out."**

**Tese 2 — a receita.** Skill é receita em Markdown.

> `>>` **"eu tento trabalhar como se a skill do [Claude], ela fosse uma receita mesmo.
> (...) Dona Maria Braga, você tem lá ela começando pelos ingredientes (...) que vão ser
> as fontes de dados que a gente vai consumir e a gente tem o modo de preparo."**

O aluno **não recebe receita pronta.** Ele escreve a dele, a partir do processo que a
empresa dele já tem. Esse é o entregável do dia.

---

## 3. Mapa de callbacks — os 3 passos agrupados

A Taciana apresenta o ciclo de 7 passos. Para uma plateia diversa, a ênfase do bloco da
tarde agrupa em **3 passos**, decisão de 11/09:

> `>>` **"juntar coleta e análise, hipótese e priorização, teste, dev, relatório e
> escala, sacou? Porque aí você diminui a quantidade de passos e aí você consegue fazer
> um slide onde você só vai dar a ênfase."**

A forma do callback, nas palavras dele:

> `>>` **"lembra quando a Tá falou sobre coleta de dados? Eu tô falando sobre aquele
> ponto que ela trouxe número um e por que isso é importante. Aí eu mostro as
> ferramentas."**

| Passo | Agrupa (vocabulário dela) | Onde o callback entra | O que o facilitador acrescenta |
|---|---|---|---|
| **1** | Coleta de Dados + Análise | Bloco A, abertura | Plano de mensuração; macro vs microconversão; checagem de implementação — shit in, shit out |
| **2** | Hipóteses + Priorização + Design | Bloco A, meio | Como se gera e como se prioriza; quali como fonte de hipótese; *"priorização é grande parte do problema"* |
| **3** | Testes + Relatórios + Escala | Bloco A, fim / Fechamento | Tipos de teste (A/B, MVT, fake door, rollout progressivo); o que vira skill e o que vira infra |

**Nomear a Taciana em voz alta em cada um dos três.** O callback só funciona se ela for
citada pelo nome — é o que amarra a tarde com a manhã e é o combinado entre os dois.

**Observação de palco:** ele fecha ciclo e abre dúvida de propósito, a cada ~15 min.

> `>>` **"eu sempre pego tipo assim, caralho, acho que eu vou fechar um ciclo aqui e
> perguntar se a galera entendeu para poder abrir a dúvida pra galera."**

---

# BLOCO A — Antes do Claude

**16h00–16h30 · 30 min · NÚCLEO — NUNCA CORTA**

## Objetivo

Estabelecer o pré-requisito antes de qualquer ferramenta aparecer, assumindo o papel do
cético. Este bloco é a autoridade do facilitador para tudo que vem depois. Se ele não
acontecer, o resto da tarde vira demo de ferramenta.

## Na tela

- Uma tela com os **3 passos agrupados** (Coleta+Análise · Hipótese+Priorização+Design ·
  Teste+Relatório+Escala), amarrando visualmente com o ciclo de 7 que ela mostrou.
- Uma tela de plano de mensuração: macroconversão → microconversões, no formato de
  jornada. Exemplo dele: `americanas.com`.
- Uma tela "shit in, shit out" — a checagem de implementação.
- Telas de case: **Duty Free** e **Ering** (+ Zerezes e Aklin como exemplos de quali).

**Nenhum terminal aberto neste bloco.** O Claude Code só aparece no Bloco B.

## Roteiro falado

### A.1 — Abertura e gancho com ela (3 min)

Abrir com a frase de fechamento dela — é o gancho combinado:

> "O próximo desafio não é usar o Claude. É transformá-lo em parte do seu processo de
> CRO." *(frase de fechamento da Taciana — dizer que é dela)*

E emendar o papel:

> `>>` **"eu sou o cara que eu sou, o cético, o tóxico"**

### A.2 — Callback 1: Coleta + Análise (10 min)

Nomear o callback:

> `>>` **"lembra quando a Tá falou sobre coleta de dados? Eu tô falando sobre aquele
> ponto que ela trouxe número um e por que isso é importante. Aí eu mostro as
> ferramentas."**

**Plano de mensuração — o exercício de jornada na parede.** Puxar a macroconversão da
sala, ao vivo, não de slide:

> `>>` **"eu falo sobre macro e microconversão. a gente pega um exemplo de um site de um
> cliente que pode estar lá ou de alguém da internet e aí eu vou fazendo a jornada do
> usuário e falando, ó, aqui a macroconversão dentro da americanas.com. (...) E aí como
> que a gente [faz o] plano de mensuração da macro para as micros? Então, qual a etapa
> que antecede a micro?"**

Perguntar para a sala, em voz alta: *"qual é a macroconversão do site de vocês?"* —
depois *"qual é a etapa que antecede ela?"*, e ir montando o funil no quadro/na tela.

**Shit in, shit out — a virada do bloco.** Aqui o tom muda:

> `>>` **"não adianta nada você colocar IA dentro de uma operação que ela tá quebrada.
> Então, é shit in, shit out. Se você tá coletando o evento que é ação desejada que você
> quer otimizar e ele tá implementado errado e na maioria das vezes está"**

E o plano prático que o aluno leva para casa — **esta é a fala mais importante do
bloco A**:

> `>>` **"não esquece de chegar lá dentro do teu Google Analytic[s], da ferramenta de
> análise que você tem ou que você vai querer ter, para poder ver, cara, bate a
> quantidade de adição do produto ao carrinho, o purchase bate com a plataforma, porque
> tudo isso são sinais de mais implementações que vão cagar o teu teste A/B. E aí não tem
> ferramenta no mundo"**

Fechar o ciclo: *"quem aqui já conferiu se o purchase do Analytics bate com a
plataforma? Levanta a mão."* — e deixar o silêncio trabalhar.

### A.3 — Callback 2: Hipótese + Priorização + Design (10 min)

> `>>` **"nas hipóteses a gente pode trabalhar especificamente pensando em como que a
> gente gera as hipóteses e como a gente prioriza as hipóteses."**

**O gargalo não é gerar, é priorizar** — avisar cedo, como ele mesmo faz:

> `>>` **"já para avisar vocês, priorização é grande parte do problema."**

> `>>` **"O problema, na maioria das vezes, não é a capacidade que o ser humano tem de
> gerar hipótese, é a capacidade que ele tem de priorizar isso dado a quantidade de coisa
> que ele tem. Porque assim, a priorização também deveria estar ligada à capacidade
> técnica que a gente tem de desenvolver, a capacidade de design de conseguir implementar
> aquelas telas."**

Callback explícito ao **ICE Score** dela — usar o vocabulário dela, sem reexplicar o
framework: ela já deu Impacto × Confiança × Facilidade, e ela já disse que o score
"explicita critérios e organiza o backlog — use para ranking relativo, não como
veredito."

**Dado qualitativo como fonte de hipótese.** É aqui que entram os cases:

> `>>` **"dado quali, ó, é dado de qualidade, mesmo — qualitativo. Então é pesquisa, é
> você ir na loja, você fazer a jornada da porra do teu usuário"**

> `>>` **"faça a porra da jornada do teu usuário"**

> `>>` **"a gente num determinado momento a gente acaba se distanciando muito do produto
> que a gente mesmo vende, sacou? Então assim, qual é a forma da gente estar mais próximo
> da dor do nosso cliente?"**

**Case Zerezes** (curto, 1 min — é o gancho de pesquisa qualitativa):

> `>>` **"A gente foi na Zerezes, conseguiu trocar uma ideia com os caras de Zerezes para
> poder entender quais eram as dores e, pô, a gente tem um backlog gigantesco."**

**Case Ering — obrigatório, é ação dele definida em 11/09** (3 min):

> `>>` **"A gente tá montando um backlog de testes A/B pra Ering e com a Aklin, que vai
> ser 100% baseado nas reclamações do cliente. Então, olha como é que a gente vai
> conseguir resolver a dor de geração de hipótese com dados qualitativos"**

Complementar com o método, que ele já contou na live:

> `>>` **"A gente trabalhou do ponto de vista qualitativo, indo na loja, entrevistando o
> vendedor, com hotjar, com formulário no site, pra gente poder conseguir captar a
> informação."**

### A.4 — Callback 3: Teste + Relatório + Escala (5 min)

Usar o vocabulário dela de formas de testar — **A/B, A/B/n, MVT, Redirect/Split URL,
Fake Door, MAB, Personalização** — sem reexplicar, e acrescentar o que ele pediu para
incluir em 11/09:

> `>>` **"Acho que você pode colocar rollout progressivo também como uma opção de teste,
> tá ligado? Para você ir distribuindo isso como uma hipótese de produto."**

**Case Duty Free — obrigatório, é ação dele definida em 11/09**, quando chegar em
estudos de caso:

> `>>` **"esse case aí, tu pode me chamar e eu conto o case."**

`[A CONFIRMAR: o conteúdo do case Duty Free. As transcrições registram que ele conta o
case (prova social, trabalho feito com o Gustavo antes de a Taciana entrar), mas não
registram números, hipótese testada nem resultado. Levantar com o Gustavo antes do dia —
sem isso, o case vira menção de 20 segundos, não bloco.]`

### A.5 — A ponte para o Claude (2 min)

O que a IA substitui e o que não substitui — é a ponte honesta para o bloco B:

> `>>` **"a IA não vai substituir o consumo humano disso daqui. Tipo, a parte de análise
> e estratégia, ela é a parte que ainda a gente depende do humano."**

> `>>` **"o copy, a gente pode fazer um brute force de tipo assim: ah, beleza, eu vou
> criar um multivariável agora com IA que vai testar 100 possibilidades e foda-se, deixa
> brigar lá, eu tenho tráfego para poder fazer. Então, tipo assim, a parte da cópia, a
> gente consegue testar n possibilidades agora, dado um contexto, mas a parte de análise e
> estratégia não."**

Frase de virada: *"tudo isso que a gente viu até aqui é o que você tem que ter antes de
abrir a ferramenta. Agora a gente abre."*

## O que pode dar errado — e a saída

| Risco | Saída |
|---|---|
| A sala não responde à pergunta da macroconversão | Não insistir. Usar `americanas.com` como exemplo dado e seguir — o ponto é o funil, não a participação |
| Alguém puxa discussão longa de GA4 / GTM | "Esse é exatamente o ponto — e é assunto de um curso inteiro. Aqui o que importa é você sair sabendo que tem que conferir." Devolver ao roteiro |
| A Taciana já cobriu plano de mensuração na parte dela | Ótimo: o callback fica mais curto e mais forte. Citar ela e ir direto para shit in, shit out. Ganha 4 min para D |
| Case Duty Free sem material | Contar em 20 segundos como menção e ir para Ering, que tem material |

## Compressão

**Este bloco não comprime.** Em qualquer cenário de tempo ele roda em 30 min. Se a sala
atrasar, o corte sai de B, nunca daqui.

---

# BLOCO B — Primeiro contato com o Claude Code

**16h30–16h55 · 25 min · comprime para 15 (e para 5, fundido com C, no cenário de 80)**

## Objetivo

O aluno abre o Claude Code pela primeira vez, entende custo e controle de prompt, e
manda o primeiro prompt. Nada além disso. O aluno instala **só o Claude Code** — sem
DuckDB, sem Python, sem clone de repositório.

Fala dele em 16/07, sobre o próprio desconforto com o momento em que isso acontece:

> `>>` **"Eles vão abrir o [Claude] no curso pela primeira vez, né, que eu acho um
> absurdo. Eles tinham que ter aberto o [Claude] na primeira parte do curso já, tá
> ligado?"**

Isso é contexto para o facilitador, não fala de palco. O efeito prático: **assumir que
ninguém abriu antes** e não pressupor nada.

## Na tela

Terminal do facilitador, fonte grande. Uma tela de apoio com a lista de features a
mencionar. O link de instalação já está no grupo de WhatsApp desde antes do coffee.

## O que o facilitador digita ao vivo

```
claude
```

Esperar a sala acompanhar. Depois, o primeiro prompt de verdade — algo que produza
saída em texto, sem depender de conexão a fonte de dado externa.

Depois, para mostrar o menu de recursos:

```
/
```

> `>>` **"quando você abre o [Claude] lá, tanto desktop quanto o [Claude Code] (...) tenta
> digitar o barra dentro dele. Quem tiver aí aberto e nunca fez isso, aconselho fazer."**

## Roteiro falado

### B.1 — Abrir e o custo do prompt (8 min)

O enquadramento, definido em 16/07:

> `>>` **"galera, a gente precisa garantir com relação a custo. Pô, como que a gente faz
> para poder orientar e garantir o custo de prompt?"**

### B.2 — As features, em lista (7 min)

Ele mesmo definiu o inventário a cobrir:

> `>>` **"Quais são as features do [Claude] code? Pô, tem a parte do [Claude] cowork, tem
> a parte do schedule, tem a parte das tarefas, a gente fala disso, e tem a skill."**

Mostrar `/loop` e `/schedule` como estão no `/`:

> `>>` **"O loop, ele automatiza aquilo dali como se fosse um cron job, né? De duas em
> duas horas, de três em três horas, de quatro em quatro, de 15 em 15 minutos. E o
> schedule ele vai conseguir fazer isso na nuvem para você poder rodar o pipeline
> completo."**

**Remote control** (30 segundos, é a piada que solta a sala):

> `>>` **"O segundo recurso é o remote control, que inclusive salva casamentos, né?
> Porque a minha esposa acha que eu... 'ah, sai do computador'... e aí eu deixo o remote
> control, vou pro meu telefone aqui, ó, e continuo mandando as paradas pro meu
> computador."**

**O comando perigoso** — mencionar para que saibam que existe, e dizer para não usar:

> `>>` **"esse daqui é o comando perigoso, beleza? Que é o danger skip permission. Não
> aconselho vocês utilizarem nesse primeiro momento, mas ele é o comando que vai evitar
> com que você fique apertando y e confirmando toda hora."**

### B.3 — Por que terminal e não web (7 min)

> `>>` **"Muita gente fica copiando e colando o texto ainda, jogando pro chat GPT,
> deixando ele analisar, copia, cola, volta. Isso daí é um fluxo meio ruim, porque quando
> você tá na web ali, você não tem tanto acesso a conseguir brincar, por exemplo, com o
> uso de um MCP local, que pode, por exemplo, abrir um navegador, ou usar recursos locais
> da máquina que você tá trabalhando."**

Se houver tempo e a sala aguentar, o ponto de CLI vs MCP (é o primeiro a cair na
compressão):

> `>>` **"o MCP na maioria das vezes ele acaba trazendo uma visão onde ele vai gastar
> mais tokens do que a maioria das conexões de dados que a gente pode fazer através de
> CLI. Então, ele acaba sendo um pouco mais caro em consumo de tokens."**

### B.4 — Git, em 60 segundos (3 min)

Não ensinar Git. Só nomear por que existe:

> `>>` **"vocês vão ter que dar uma olhada, uma pincelada no que que é o Git, nem que
> seja porque é o lugar que você copia as skills. Tem que saber."**

> `>>` **"vocês não precisam ser experts em GitHub, vocês precisam saber que que é isso
> daqui, como que isso funciona, porque lá que vocês vão copiar a maioria das skills que
> vocês vão pegar."**

## O que pode dar errado — e a saída

| Risco | Saída |
|---|---|
| Aluno não conseguiu instalar no coffee | Ele acompanha B e C **sem máquina**, de olho na tela. No bloco D trabalha em dupla com quem instalou — a permissão de dupla é explícita e vem do desenho do exercício |
| Wifi do local cai | B e C rodam na máquina do facilitador, que é a única que precisa de rede. D é escrita de Markdown — funciona offline até a chamada do Skill Creator. Se a rede não voltar, ver "pontos de trava" |
| Sala trava em erro de login/conta | Não debugar caso a caso no palco. Pedir para levantar a mão, seguir o roteiro, e resolver as mãos levantadas durante o bloco D, que é trabalho individual |
| Alguém pergunta de DuckDB / gmp-cli / Copilot | Responder que é o stack do facilitador, não do exercício de hoje, e que o link vai para o grupo. **Não instalar nada na máquina de ninguém** |

## Compressão

- **Para 15 min:** cortar B.3 inteiro (CLI vs MCP e web vs terminal) e B.4. Fica abrir,
  custo de prompt, `/`, primeiro prompt.
- **Para 5 min (cenário 80, fundido com C):** só `claude`, o primeiro prompt e a frase
  "isso aqui é onde a receita roda". Features, remote control, danger skip permission e
  Git saem do palco e viram mensagem no grupo.

---

# BLOCO C — Anatomia de uma receita (+ hooks e guardrails)

**16h55–17h25 · 30 min · comprime para 20 (e some para dentro de B no cenário de 80)**

## Objetivo

Dissecar **uma** skill pronta, ao vivo, nomeando as três partes da receita. O aluno sai
sabendo o que ele vai escrever no bloco D. Depois, hooks e guardrails — por que existem
e o que eles impedem.

## Na tela

Um **único arquivo `.md`** aberto no editor/terminal, fonte grande. O exemplo é
`skills/desktop/heuristica-morys.md` — escolhido porque é exatamente o que a Taciana
apontou como o que mais agrega:

> `>>` *(Taciana, 16/07)* **"a skill... que vai mais agregar é as partes de heurística,
> de análises de site"**

Distribuição: pendrive ou cópia da tela. **Sem download, sem ZIP, sem git clone.**

## Roteiro falado

### C.1 — A receita (12 min)

A definição, dita exatamente assim:

> `>>` **"eu tento trabalhar como se a skill do [Claude], ela fosse uma receita mesmo. E
> aí numa receita, quando a gente vai escrever uma receita ou a gente vai ler uma receita,
> Dona Maria Braga, você tem lá ela começando pelos ingredientes, que a gente pode tentar
> fazer o translate aqui pro nosso quadro de análise de dados, que vão ser as fontes de
> dados que a gente vai consumir, e a gente tem o modo de preparo."**

> `>>` **"a gente tem ingredientes, modo de preparo e como você vai consumir aquela
> informação."**

**Parte 1 — ingredientes.** Apontar na tela onde eles estão:

> `>>` **"nos ingredientes, você vai definir quais são as fontes de dados que você quer
> consumir e quais os dados que você quer extrair daquilo para aquela skill que você quer
> fazer."**

**Parte 2 — modo de preparo:**

> `>>` **"o modo de preparo é a lista de steps que ele tem que fazer (...) você vai
> montando a lista de passos que ele tem que executar para poder conseguir chegar num
> produto final"**

> `>>` **"quanto mais contexto a gente dá para essa lista, para esse método, esse modo de
> preparo, melhor a gente vai conseguir ter o output no final."**

**Parte 3 — o output, contratado.** Esta é a parte que a maioria esquece:

> `>>` **"eu acho que tá muito bem definido o que que é o nosso output, o que que a gente
> consome, né? (...) ele diz lá: essa receita é feita para três a seis pessoas, você pode
> consumir assim, assim, assado, tem o prazo de validade de tanto. Eu acho que a gente tem
> que deixar isso também contratado dentro da skill."**

**Markdown, e a piada que desarma:**

> `>>` **"Quem achou que não ia ter que escrever Markdown em pleno 2026, né? Tecnologia
> tão antiga, mas que a gente tem utilizado bastante, muito porque é uma das formas que a
> gente tem de escrever documentos um pouco mais semânticos em texto."**

### C.2 — Não copie skill dos outros (5 min)

Este trecho é o que torna o bloco D inevitável — ele explica por que o aluno tem que
escrever a dele:

> `>>` **"você nunca acredita cegamente na skill de uma pessoa. Você sempre traz essa
> skill para dentro do seu [Claude Code] e entende como que ela pode ser boa pro teu fluxo
> de trabalho. Nunca você sai copiando e colando."**

> `>>` **"aquela skill é uma sequência, é uma receita dada por uma pessoa que tem um
> fluxo de trabalho específico, que é o dela, sacou?"**

> `>>` **"Nunca copie, principalmente se o cara sabe menos que você, tá ligado?"**

E o problema de time, que é o argumento para o Skill Creator no bloco D:

> `>>` **"cada um criou uma skill separada diferente do seu jeito, com seu contexto para
> poder analisar dados. (...) A gente vai ter a IA procurando problema às vezes em coisas
> que só eu peguei ou em coisas que só eu pensei."**

> `>>` **"é muito importante que a gente tenha a mesma base para poder conseguir
> construir essas skills."**

Um aviso prático que vale ouro para quem vai escrever daqui a 10 minutos:

> `>>` **"eu acho que vocês estão criando skills muito grandes"**

### C.3 — Skill, slash command e hook: as três peças (5 min)

A distinção, na definição dele:

> `>>` **"as skills, elas são os textos que vão determinar as receitas de como aquilo tem
> que ser implementado. O slash command é o atalho — é você dar um barra weekly report e
> ele rodar um report, que é uma skill que vai puxar as informações de uma vez só para
> você. E os hooks são os scripts que a gente consegue colocar ali automaticamente para
> poder evitar que alguém faça uma merda muito grande."**

### C.4 — Hooks e guardrails (8 min)

A definição de hook:

> `>>` **"os hooks é a maneira que a gente tem de conseguir deixar determinístico a
> parada, sabe? É a maneira com que a gente tem de falar: '[Claude], ó, se o usuário
> tentar fazer alguma coisa que vai excluir algum artigo, você bloqueia ele na hora.'"**

Os eventos, nas palavras dele:

> `>>` **"O primeiro é o session start. Então você consegue trigar alguma coisa toda vez
> que a sessão ela inicia. (...) você pega o user prompt submit e você consegue ler o que
> ele tá falando ali para poder conseguir analisar."**

> `>>` **"a gente tem o pre tool use, ou seja, antes dele executar qualquer ação de
> ferramenta do [Claude], você consegue entender o que que ele tá fazendo."**

O guardrail concreto, mostrando o arquivo:

> `>>` **"colocar um guard rail para detectar comandos destrutivos é fundamental"**

> `>>` **"aqui eu disponibilizei um arquivo, um shell, que eu tô dizendo: ó, não pode
> executar rm -rf, não pode executar drop table, não pode executar drop database. Ou seja,
> toda vez que o [Claude], antes de executar uma função que poderia ser um drop table, ele
> vai trigar o hook e vai travar a sessão pro usuário."**

E a responsabilidade, que é o fecho moral do bloco:

> `>>` **"nós como engenheiros de dados ou nós como analistas de dados, quando a gente
> disponibiliza um dado para um terceiro, que é uma pessoa que não tem esse conhecimento
> técnico, nós somos responsáveis por colocar esses guards lá dentro."**

> `>>` **"Se você não sabe quem é que tem que fazer alguma coisa, porque provavelmente é
> você que tem que fazer, né?"**

**O aluno não escreve hook hoje.** Ele precisa saber que existe, o que impede, e onde
achar os prontos — que vão para o grupo de WhatsApp.

`[A CONFIRMAR: qual repositório/link exato dos hooks prontos vai para o grupo de
WhatsApp. Na live de 22/07 ele compartilhou um link no chat, mas a transcrição não
registra a URL.]`

## O que pode dar errado — e a saída

| Risco | Saída |
|---|---|
| Sala sem referência de Markdown | Mostrar `#` virando título na tela ao vivo. 30 segundos resolvem |
| Alguém pede para instalar hooks agora | "Hoje ninguém escreve hook. Hoje todo mundo escreve receita." O link vai para o grupo |
| Discussão sobre qual heurística usar (Morys vs Nielsen) | Devolver para o vocabulário dela: ela apresentou as 7 dimensões de Morys. Dizer que o exemplo usa a estrutura dela e seguir |
| O `.md` de exemplo não abre / pendrive falha | Ler da tela projetada do facilitador. O aluno não precisa do arquivo para o bloco D |

## Compressão

- **Para 20 min:** cortar C.3 (a distinção skill/command/hook vira uma frase dentro de
  C.4) e reduzir C.4 a **uma tela**: hooks existem, bloqueiam `rm -rf` e `drop table`, o
  link está no grupo. C.1 e C.2 ficam intactos — são o que sustenta o bloco D.
- **Cenário 80:** C não existe como bloco. Dentro dos 15 min fundidos com B, sobra apenas
  a nomeação das três partes da receita (ingredientes · modo de preparo · output) sobre o
  arquivo na tela. Hooks saem inteiros do palco.

---

# BLOCO D — A sua skill

**17h25–17h55 · 30 min · NÚCLEO — NUNCA CORTA**

## Objetivo

**O entregável do dia: uma skill — a do processo de CRO da empresa do próprio aluno.**
Três tempos: descrever → gerar → validar. O aluno sai com uma nota.

O desenho, nas palavras dele em 16/07:

> `>>` **"Galera, então, ó, a gente vai fazer agora um exercício que a gente vai
> trabalhar, vocês vão trabalhar individualmente dentro das máquinas, mas, pô, vocês podem
> fazer isso em grupo se quiserem, onde vocês vão descrever o processo de CRO, tal como
> funciona na empresa de vocês, (...) vocês vão ter que debater sobre isso e sair para mim
> com uma skill, beleza? Aí eu chego no final falando: ó, essa skill é o ponto que conecta
> com toda a metodologia do que a gente viu aqui hoje."**

> `>>` **"eles vão recriar a metodologia baseado no que eles entenderam do que você
> falou"**

## Na tela

Uma tela fixa com **as quatro perguntas guia** — fica no telão o bloco inteiro, porque o
aluno vai olhar para ela o tempo todo. Um cronômetro visível.

## D.1 — Descrever (12 min)

O aluno **não parte do zero**: parte de quatro perguntas fixas. Elas vêm exatamente do
método que ele descreveu em 16/07:

> `>>` **"eu mapeei quais são os cargos das pessoas, quais são os handoffs que elas
> fazem, ou seja, quais são as conexões que elas fazem durante a semana, durante o mês,
> quais são as interfaces que elas têm, e quais são os entregáveis de cada uma delas."**

**As quatro perguntas na tela:**

1. **Cargos** — quem são as pessoas envolvidas em conversão na sua empresa? Nome do
   cargo, não "o time".
2. **Handoffs** — quem entrega para quem, e em que momento? Semana, mês, sprint.
3. **Entregáveis** — o que sai de cada etapa? Um documento, uma planilha, um ticket?
4. **Ingredientes** — de onde vem o dado que alimenta cada etapa? Fonte nomeada, não
   "os dados da empresa".

**Direção de palco:** este é o momento de circular pela sala. É a mecânica que os dois
combinaram em 11/09:

> `>>` **"a gente vai na máquina das pessoas, sacou? A gente pode ir lá: pô, mostra aí o
> que que você achou, qual que foi o resultado."**

Cinco minutos dentro do D.1, anunciar em voz alta: **"quem está travado, levanta a mão —
dupla é permitida e é uma boa ideia."** É a saída de quem não instalou e de quem não
sabe descrever o processo da própria empresa.

Se alguém disser *"na minha empresa não tem processo de CRO"* — a resposta correta é:
**descreva o que existe hoje, mesmo que seja informal.** Um processo ruim descrito é
material; um processo inventado não é.

## D.2 — Gerar (8 min)

O Skill Creator, com o argumento que já foi plantado no C.2:

> `>>` **"é uma skill que cria skills. (...) Você dá um barra skill creator dentro do teu
> [Claude Code] e ele vai criar um passo a passo, um loop que vai extrair as informações
> daquela sessão para poder conseguir gerar uma skill que você consegue replicar isso
> automaticamente."**

> `>>` **"é usar o skill creator, porque ele vai seguir um passo a passo que minimamente
> vai trazer um equilíbrio maior sobre o teu time criando várias skills, sabe? Vai ter uma
> metodologia ali por trás que o [Claude] vai seguir."**

**O que o facilitador digita ao vivo**, na máquina dele, uma vez, antes de soltar a sala:

```
/skill-creator
```

E na conversa: colar a descrição do D.1 e pedir a skill.

**Plano B declarado:** se o Skill Creator se comportar diferente do ensaiado, o caminho
manual funciona igual — o aluno escreve o `.md` à mão, com os três blocos que ele
aprendeu no C.1: ingredientes, modo de preparo, output. A skill não deixa de existir
porque a ferramenta falhou.

## D.3 — Validar (10 min)

O validador foi desenhado por ele em 16/07:

> `>>` **"eu posso fazer uma skill que é um antipattern da sua, que você vai colocar
> quais são os pontos de avaliação pra gente poder fazer um validador de skill."**

> `>>` **"Ponto. Entrega com o cara saindo com a notinha e tá tudo certo."**

**O que o aluno digita:**

```
/valida-skill-cro
```

E aponta o `SKILL.md` que acabou de gerar.

O validador devolve nota por critério e, para cada ponto abaixo do máximo, **a pergunta
exata que a skill não responde**. Os critérios são os mesmos quatro do D.1 mais o modo
de preparo — o aluno reconhece a tela.

**O facilitador lê uma nota em voz alta**, de um voluntário, incluindo as lacunas. É o
momento mais útil do bloco: mostra que a nota não é julgamento, é lista de perguntas em
aberto.

`[A CONFIRMAR: a calibração do validador. O desenho pede calibrar com três exemplos antes
do evento — uma skill boa, uma vaga e uma que descreve ferramenta em vez de processo — e
essa calibração ainda não foi rodada. Sem ela, há risco de nota alta para skill ruim.]`

`[A CONFIRMAR: o nome exato do slash command do validador na máquina do aluno. O arquivo
no repositório está em skills/code/valida-skill-cro/, mas a forma de distribuição para a
máquina do aluno (cópia manual, pendrive ou link) não está decidida — e o aluno instala
só o Claude Code, sem git clone.]`

## O que pode dar errado — e a saída

| Risco | Saída |
|---|---|
| Aluno não sabe descrever o processo da empresa dele | O bloco A já expôs as etapas. As quatro perguntas na tela dão o esqueleto. Se ainda travar: dupla |
| Skill Creator se comporta diferente do ensaiado | Caminho manual — escrever o `.md` à mão com os três blocos do C.1. Anunciar como plano previsto, não como falha |
| Validador não roda na máquina do aluno | O facilitador roda **na máquina dele**, com a skill de dois ou três voluntários, na tela. O resto recebe o critério e se autoavalia |
| Validador dá nota alta para skill claramente ruim | Ler a nota em voz alta e discordar publicamente, apontando a lacuna. Honestidade vale mais que a ferramenta |
| Turma inteira atrasa e faltam 10 min | Cortar o D.3 individual: o facilitador roda o validador de **um** voluntário na tela, e todo mundo leva o comando para rodar em casa. D.1 e D.2 não cortam |

## Compressão

**Este bloco não comprime.** Em qualquer cenário ele roda em 30 min. Se o tempo total
for menor, o corte já saiu de B e C.

---

# FECHAMENTO

**17h55–18h00 · 5 min · NÚCLEO**

## Objetivo

Mapear a skill que o aluno acabou de criar contra os 3 passos, e dizer o que escala.

## Roteiro falado

**O fecho combinado**, palavras dele:

> `>>` **"essa skill é o ponto que conecta com toda a metodologia do que a gente viu aqui
> hoje."**

Percorrer os três passos apontando onde a skill do aluno toca cada um:

- **Passo 1 — Coleta + Análise:** os *ingredientes* da skill dele são as fontes de dado.
  Se estiverem vagos, é ali que a operação está quebrada. Shit in, shit out.
- **Passo 2 — Hipótese + Priorização + Design:** os *handoffs* que ele nomeou são
  exatamente onde a priorização trava.
- **Passo 3 — Teste + Relatório + Escala:** os *entregáveis* que ele nomeou são o que vira
  relatório e o que vira escala.

**O que escala** — a skill dele é o arquivo que o time inteiro pluga:

> `>>` **"eles saem podendo plugar a sua própria metodologia .md, que é o arquivo
> markdown, que vai ser a visão dele ou do time dele sobre CRO"**

**A régua honesta, que fecha a tarde:**

> `>>` **"elas são sempre a etapa inicial do teu trabalho"** *(sobre skills e navegação
> agêntica)*

> `>>` **"é sempre o ponto de partida, tá? Não é nunca o início e o fim."**

**Encerramento operacional:** os links de hoje — hooks prontos, o `.md` de exemplo, o
validador — vão para o **grupo de WhatsApp da turma**. Definido como canal em 11/09.

`[A CONFIRMAR: se há CTA de produto no fim (Analytics Copilot / lista de espera). Nada
nas transcrições de alinhamento com a Taciana define isso para o evento presencial — a
menção ao Copilot aparece só na live pública de 22/07. Decidir com ela antes do dia.]`

---

# Checklist de pré-evento

## D-2 e D-1 (12 e 13/09)

- [ ] **Ensaiar o bloco D ponta a ponta na máquina do dia** — descrever, `/skill-creator`,
      `/valida-skill-cro`. Cronometrar. É o único bloco que não tem plano de corte.
- [ ] **Calibrar o validador com três exemplos:** uma skill boa, uma vaga, uma que
      descreve ferramenta em vez de processo. Conferir se a nota separa os três.
- [ ] Confirmar com a Taciana **o horário real de entrega do palco** e anotar aqui:
      `[A CONFIRMAR: horário de entrega do palco]`
- [ ] Confirmar se o **Messina participa da parte da tarde**. Em 11/09 ele disse
      *"não tô nem contando com a participação dele"* — o roteiro está escrito sem ele.
- [ ] Levantar o material do **case Duty Free** com o Gustavo (ver `[A CONFIRMAR]` no
      bloco A).
- [ ] Decidir e travar a **forma de distribuição** do `.md` de exemplo e do validador:
      pendrive, cópia de tela ou link no grupo. Sem git clone.
- [ ] Fechar os links que vão para o grupo: hooks prontos, `.md` de exemplo, validador.

## D-0, antes de a sala abrir

- [ ] **Grupo de WhatsApp da turma criado** e o link de instalação do Claude Code já
      postado (antes do coffee, não depois).
- [ ] Claude Code funcionando na máquina do facilitador, logado, com tokens disponíveis.
      *(Na live de 22/07 ele ficou sem tokens no meio — não repetir.)*
- [ ] Fonte do terminal aumentada e testada do fundo da sala.
- [ ] `/skill-creator` e `/valida-skill-cro` testados **na máquina do dia**, na rede do
      local.
- [ ] O `.md` de exemplo aberto e pronto para projetar.
- [ ] Tela das **quatro perguntas guia** do bloco D pronta e testada no projetor.
- [ ] Cronômetro visível para a sala.
- [ ] Testar o wifi do local com o Claude Code rodando de verdade, não só carregando uma
      página.
- [ ] Confirmar com a produção: `[A CONFIRMAR: tomadas suficientes para as máquinas da
      turma durante duas horas]`

## Nos 60 segundos em que a Taciana entrega o palco

- [ ] Olhar o relógio e **escolher o cenário** (120 / 100 / 80) na tabela da seção 1.
- [ ] Anotar mentalmente o horário-limite de início do bloco D: **hora de término menos
      35 min**. Esse é o único horário que não pode escorregar.

---

# Pontos de trava — e a saída de cada um

| # | Trava | Sinal de que aconteceu | Saída |
|---|---|---|---|
| 1 | **Taciana estoura o horário** | Palco entregue depois das 16h00 | Escolher o cenário na tabela da seção 1. B comprime, depois C, depois fundem. A e D não caem |
| 2 | **Aluno não instalou o Claude Code** | Mão levantada no início de B | Acompanha A, B e C sem máquina. Em D, dupla com quem instalou. Não parar o bloco para instalar |
| 3 | **Wifi cai** | Prompt não responde na máquina do facilitador | A não depende de rede. B e C rodam na tela do facilitador. D: o aluno escreve o `.md` à mão (plano B do D.2) e o validador vai para casa |
| 4 | **Skill Creator não se comporta como no ensaio** | Saída diferente, loop travado | Caminho manual: o `.md` à mão com ingredientes + modo de preparo + output. Anunciar como plano previsto |
| 5 | **Validador não roda na máquina do aluno** | Comando não encontrado | Facilitador roda na máquina dele com 2–3 voluntários, na tela. Os outros se autoavaliam pelos critérios |
| 6 | **Validador dá nota alta para skill ruim** | Nota 8+ numa skill sem cargos nem handoffs | Discordar em voz alta e apontar a lacuna. A honestidade vale mais que a ferramenta |
| 7 | **Aluno não sabe descrever o processo da empresa** | Tela em branco depois de 5 min no D.1 | "Descreva o que existe hoje, mesmo informal." As quatro perguntas são o esqueleto. Dupla como saída |
| 8 | **Sala trava em debate longo (GA4, ferramenta, framework)** | Uma pessoa dominando 3+ min | Reconhecer, dizer que é assunto de curso inteiro, devolver ao ponto. Retomar a linha do bloco |
| 9 | **O bloco D vai começar com menos de 30 min** | Relógio | Cortar o Fechamento para 2 min e avisar a produção. D não encolhe |
| 10 | **Material de case indisponível (Duty Free)** | Sem número, sem hipótese, sem resultado | Contar como menção de 20 segundos e ir para Ering, que tem material. Não inventar número |

---

## Fontes

Este roteiro foi escrito a partir de, nesta ordem de autoridade:

1. `docs/superpowers/specs/2026-09-12-imersao-cro-v2-design.md`
2. `notes/sources/reuniao-taciana-2026-07-16-transcricao.txt`
3. `notes/sources/reuniao-taciana-2026-09-11-transcricao.txt`
4. `notes/sources/live-claude-code-2026-07-22-transcricao.txt`
5. `notes/sources/taciana-cro-fundamentos.md`

Toda fala marcada `>>` é literal de uma dessas transcrições. Onde o roteiro precisaria de
informação que não está em nenhuma delas, há um marcador `[A CONFIRMAR: ...]` — nenhum
conteúdo técnico foi inventado para preencher lacuna.

**Soma das durações alvo:** 30 + 25 + 30 + 30 + 5 = **120 min**.
