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

| Você recebeu | A — Antes do Claude | B — Primeiro contato | C — Anatomia da receita | D — A sua skill | Fechamento | Bônus | Soma |
|---|---|---|---|---|---|---|---|
| **mais de 120 min** (palco antes das 16h00) | 30 | 25 | 30 | 30 | 5 + obrigado | 6 a 30, emendados | **126 a 150** |
| **120 min** (16h00) | 30 | 25 | 30 | 30 | 5 + obrigado | — | **120** |
| **100 min** (16h20) | 30 | 15 | 20 | 30 | 5 + obrigado | — | **100** |
| **80 min** (16h40) | 30 | **B+C fundidos: 15** | — | 30 | 5 + obrigado | — | **80** |

O **obrigado** fecha o núcleo em qualquer um dos quatro cenários. Ele não é um slide de
transição: é o ponto em que a apresentação está completa e o facilitador pode sair sem
dever nada à sala. Tudo que vier depois dele é bônus — ver a seção **BÔNUS** no fim
deste roteiro.

**Como cada cenário se executa na prática:**

- **Mais de 120 min — o cenário com sobra.** O núcleo roda inteiro e fecha no obrigado.
  Os bônus entram **depois** disso, um a um, enquanto o relógio permitir. Detalhe do
  critério de escolha na subseção *"O cenário com sobra"*, logo abaixo.
- **120 min — o alvo.** Tudo roda como escrito. Se sobrar minuto no fim de C, ele vai
  para D, não para B.
- **100 min.** B perde a comparação CLI vs MCP e o tour de features (`/loop`,
  `/schedule`, remote control) — fica abrir, custo de prompt, **a instalação do plugin
  do Skill Creator (não corta)** e o primeiro prompt. C perde a dissecação linha a linha
  do exemplo e os hooks viram uma tela só: "existem, servem para isso, quem quiser
  aprofundar pesquisa depois."
- **80 min.** B e C deixam de ser blocos separados. Vira **um bloco único de 15 min**:
  abrir o Claude Code, **instalar o plugin do Skill Creator com a sala (não corta —
  cabe primeiro, o resto se ajusta ao que sobrar)**, mostrar o `.md` de exemplo na tela
  e nomear as três partes da receita (ingredientes, modo de preparo, output). Hooks e
  guardrails saem do palco e ficam de fora — sem menção nem link. **A e D ficam
  intactos** — A é a autoridade do facilitador, D é o que o aluno leva para casa.

**Ordem de corte, declarada:** B comprime primeiro, depois C, depois B e C fundem.
**A e D nunca caem.** Se a Taciana estourar além dos 40 min (palco às 16h40+), não
comprimir A nem D: cortar o Fechamento para 2 min e avisar a produção.

### O piso: abaixo de 77 min a regra deixa de fechar

A conta: A (30, não comprime) + B+C fundidos (15, que já é o mínimo) + D (30, não
comprime) + Fechamento (2, já cortado) = **77 min**. Isso é palco entregue às **16h43**.
Abaixo disso, *"A e D nunca comprimem"* vira aritmeticamente impossível, e fingir que
não é só transfere o problema para o meio do bloco D, com a sala na mão.

**Então, declarado antes, na ordem em que cai:**

| Palco entregue | Total | O que cai |
|---|---|---|
| até 16h40 | 80+ | Nada além do já previsto: B+C fundidos em 15, Fechamento em 5 |
| 16h43 | 77 | Fechamento cai para 2 min |
| 16h45 | 75 | **Fechamento sai do palco.** O mapeamento contra os 3 passos vira uma frase dentro do próprio D, com a nota ainda na tela do aluno: *"repara que os teus ingredientes são o passo 1, os teus handoffs são o passo 2, os teus entregáveis são o passo 3"*. É o fecho combinado, dito em 40 segundos |
| 16h50 | 70 | **B+C caem de 15 para 10:** só `claude`, os dois comandos do plugin, o reinício, e uma frase nomeando ingredientes · modo de preparo · output com o `.md` na tela. Sem dissecação, sem features, sem hooks |
| depois de 16h50 | < 70 | **A regra quebra, e quem cede é o A, não o D.** A comprime para 20: mantém shit in/shit out e o plano de mensuração, perde os cases (Duty Free e Ering viram menção de 20 segundos). D fica intacto porque é o entregável — o aluno não pode sair sem a nota |
| menos de 50 min | — | Não é mais compressão, é outro bloco. Avisar a produção **na hora da entrega do palco**, não no fim: ou se negocia estender, ou o entregável muda de *"sai com uma nota"* para *"sai com a skill, e roda o validador em casa"*. Nesse caso, dizer isso à sala em voz alta — a expectativa foi vendida, não se apaga em silêncio |

**O único horário que não escorrega** continua sendo o início do bloco D: **hora de
término menos 35 min**. Se o relógio disser que ele já passou, pular direto para o D, de
onde quer que o bloco esteja.

**A instalação do plugin do Skill Creator, dentro de B, também nunca cai** — nos três
cenários, inclusive no B+C fundido de 80 min. Sem ela o exercício do bloco D não
acontece, então ela tem a mesma prioridade de A e D. O espaço para ela sai de conteúdo
de B que já era opcional em qualquer cenário (a comparação CLI vs MCP): ver seção do
Bloco B.

**Se sobrar tempo** (ela terminar antes das 16h00): B e C voltam ao alvo, o excedente
dentro do núcleo vai para D — é onde o tempo extra rende mais, porque é lá que o aluno
trava — e o que continuar sobrando **depois do obrigado** vira bônus. Como escolher
qual, logo abaixo.

### O cenário com sobra: mais de 120 min

Esta é a subseção que tira o cronograma da dependência do horário de entrega do palco.
O núcleo termina no obrigado; o bônus é emendado ali, sem anunciar que era reserva.

**Quanto cada bloco custa:**

| Bônus | Tema | Alvo | Soma acumulada a partir dos 120 |
|---|---|---|---|
| 1 | Quanti × quali, com o case Zerezes | 6 min | 126 |
| 3 | Matriz de quantos testes cabem | 6 min | 132 |
| 2 | Case Duty Free | 6 min | 138 |
| 5 | CLI × MCP — o benchmark | 6 min | 144 |
| 4 | Hooks e guardrails na prática | 6 min | 150 |

**Ordem sugerida de emenda: 1 → 3 → 2 → 5 → 4.** É a ordem que sai do assunto mais
próximo do que a sala acabou de fazer (processo e dado) e vai andando para o mais
técnico. Quem parar no meio para no lugar certo — cada bloco é fechado em si.

**O critério para escolher qual puxar primeiro é ler a sala, não a tabela:**

- **Turma que se acendeu em processo** — a que fez pergunta sobre plano de mensuração,
  sobre como priorizar, sobre quantos testes dá para rodar: puxar **1 e 3**. São os dois
  que continuam a conversa que ela mesma abriu.
- **Turma que se acendeu em técnica** — a que perguntou de terminal, de token, de
  segurança, de o que o Claude pode quebrar: puxar **4 e 5**. É onde a mão dela já
  estava.
- **O 2 (Duty Free) não é escolha de leitura de sala, é escolha de material.** Só entra
  se o conteúdo tiver sido levantado com o Gustavo antes do dia. Se o `[A CONFIRMAR]`
  do bloco continuar aberto na manhã do evento, ele sai da lista e não se tenta
  improvisar no palco.

**Duas regras de palco para os bônus:**

1. **Não anunciar que é bônus.** Para a sala, é a continuação natural. Anunciar reserva
   é dizer que havia conteúdo guardado, e isso desvaloriza o que já foi entregue.
2. **Cada bloco fecha antes de o próximo começar.** Se o relógio acabar no meio, foi no
   fim de um bloco, não no meio de uma frase.

Tudo que não entrar ao vivo continua indo para o **PDF complementar** que o aluno leva —
o bônus não é conteúdo perdido, é conteúdo que muda de canal.

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

Estabelecer o pré-requisito antes de qualquer ferramenta aparecer. Este bloco é a
autoridade do facilitador para tudo que vem depois. Se ele não acontecer, o resto da
tarde vira demo de ferramenta.

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

E emendar a tese que organiza o bloco inteiro:

> `>>` **"o que a gente tem que aprender antes de aprender"** — e a regra que decorre
> dela: mão na ferramenta só quando já existe aplicabilidade dela na etapa.

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

O aluno abre o Claude Code pela primeira vez, entende custo e controle de prompt,
**instala o plugin do Skill Creator com o facilitador** e manda o primeiro prompt. Nada
além disso. O aluno instala **o Claude Code e o Node.js, a dependência de base dele, e
este plugin** — sem DuckDB, sem Python, e sem clonar o repositório do curso.

**O git é usado por baixo do pano, e nem todo mundo vai ter.** O `claude plugin
marketplace add` faz um `git clone` por baixo; numa máquina sem git ele falha com
`✘ Failed to add marketplace: Failed to clone marketplace repository`. Não há aviso
prévio à turma — não existe grupo da turma nem contato antes do evento, então todo
mundo descobre isso ao vivo, no B.2. Quem não tiver git faz o B.2 em dupla, com quem
tem, e instala o git depois, em casa; não há passo de instalação dedicado a isso no
`instalacao.md`, só um aviso de uma linha dentro do passo do plugin.

Fala dele em 16/07, sobre o próprio desconforto com o momento em que isso acontece:

> `>>` **"Eles vão abrir o [Claude] no curso pela primeira vez, né, que eu acho um
> absurdo. Eles tinham que ter aberto o [Claude] na primeira parte do curso já, tá
> ligado?"**

Isso é contexto para o facilitador, não fala de palco. O efeito prático: **assumir que
ninguém abriu antes** e não pressupor nada.

**Por que o plugin entra aqui e não no intervalo:** o `/skill-creator` — usado no bloco
D, o exercício do dia — não vem instalado por padrão com o Claude Code; é um plugin
separado. Se cada aluno instalasse sozinho no intervalo, uma falha (por exemplo, alguém
digitando a forma abreviada do comando, que pode tentar autenticação por SSH e falhar
sem chave configurada) passaria em silêncio, espalhada pela sala, e só apareceria às
17h25, quando o D começa. Aqui, ao vivo, o facilitador roda com todo mundo, vê quem
travou na hora e resolve — por isso este passo é tratado como **B.2, com a mesma
prioridade dos blocos A e D: não cai em nenhum cenário**, nem no B+C fundido de 80 min.
No `05-imersao-cro/instalacao.md` isso aparece como Passo 6, opcional e de
adiantamento — quem já rodou no intervalo só vê a confirmação de novo, sem problema.
(Sem git na máquina, o B.2 não roda — mas isso não é aviso prévio: quem descobrir na
hora faz o passo em dupla e instala o git depois.)

## Na tela

Terminal do facilitador, fonte grande. Uma tela de apoio com a lista de features a
mencionar. Os dois comandos do B.2 estão grandes e legíveis num slide, com a URL
completa; a mesma URL está impressa no handout, para quem preferir copiar de lá.

## O que o facilitador digita ao vivo

```
claude
```

Esperar a sala acompanhar. Depois, os dois comandos do plugin (ver B.2 abaixo). Depois,
o primeiro prompt de verdade — algo que produza saída em texto, sem depender de conexão
a fonte de dado externa.

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

### B.2 — Instalar o plugin do Skill Creator, todos juntos (4 min · NUNCA CORTA)

A fala de transição: *"antes de seguir, um passo técnico rápido, e eu quero ver todo
mundo rodando comigo — vocês vão precisar disso lá no fim da tarde."*

**Passo zero, e é onde a sala inteira erra:** a essa altura todo mundo está *dentro* do
Claude Code (acabaram de abrir no B.1). Os dois comandos abaixo **não são comandos do
Claude** — digitados lá dentro, viram prompt para o modelo, ele responde em prosa, nada
é instalado, e ninguém vê a mensagem de sucesso. Dizer isso em voz alta antes de
qualquer comando, e mandar todo mundo sair:

```
/exit
```

Esperar a sala voltar ao cursor do terminal. Só então, **os dois comandos**, um de cada
vez, exatamente como estão:

```
claude plugin marketplace add https://github.com/anthropics/claude-plugins-official
```

Esperar a sala acompanhar. O sinal de que funcionou aparece na tela de cada um:
`✔ Successfully added marketplace: claude-plugins-official (declared in user settings)`
(ou, para quem já rodou no intervalo — Passo 6 do guia —,
`✔ Marketplace 'claude-plugins-official' already on disk`; os dois estão certos).
Depois:

```
claude plugin install skill-creator@claude-plugins-official
```

Sinal de sucesso:
`✔ Successfully installed plugin: skill-creator@claude-plugins-official (scope: user)`
(ou `✔ Plugin "skill-creator@claude-plugins-official" is already installed`, mesma
coisa). Os dois comandos são idempotentes — rodar de novo não quebra nada, é por isso
que dá para rodar com a sala toda ao mesmo tempo, sem perguntar antes quem já adiantou.

**Terceiro comando, e ele é obrigatório:** o plugin só carrega na **sessão seguinte**.
Quem ficar na sessão antiga não vai ter `/skill-creator`, por mais que a instalação
tenha dado certo. Então, com a sala:

```
claude
```

**Como confere que a sala inteira conseguiu, sem parar o bloco — e só DEPOIS do
reinício:** com todo mundo de volta dentro do Claude Code, mandar digitar `/` e
perguntar em voz alta, *"quem está vendo `skill-creator` na lista, levanta a mão"*. A
checagem é essa, não a mensagem de sucesso: a mensagem de sucesso aparece mesmo em
quem depois não reabriu, e é justamente isso que esconde a falha até as 17h25. Não é
checagem máquina a máquina, é leitura rápida da sala. Quem não levantar a mão é a saída
da linha 3 da tabela de pontos de trava, mais abaixo: segue o bloco sem parar, e
resolve em dupla no bloco D. **Não depurar erro de instalação individual aqui** — mesmo
raciocínio já usado para erro de login: mão levantada, segue o roteiro, resolve durante
o D.

**O erro que vai aparecer em quem não instalou o git:** uma frase começando em
`✘ Failed to add marketplace:` e contendo `Failed to clone marketplace repository`.
Não é wifi, não é conta, não é digitação. É git faltando — e não tem conserto de palco:
no mac o instalador é gráfico e leva minutos, no Windows é um download do git-scm.com.
Mão levantada, dupla no bloco D, instala em casa.

### B.3 — As features, em lista (7 min)

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

### B.4 — Por que terminal e não web (3 min)

> `>>` **"Muita gente fica copiando e colando o texto ainda, jogando pro chat GPT,
> deixando ele analisar, copia, cola, volta. Isso daí é um fluxo meio ruim, porque quando
> você tá na web ali, você não tem tanto acesso a conseguir brincar, por exemplo, com o
> uso de um MCP local, que pode, por exemplo, abrir um navegador, ou usar recursos locais
> da máquina que você tá trabalhando."**

O aparte de CLI vs MCP que cabia aqui saiu do tempo cronometrado — é o que abriu espaço
para o B.2. Se sobrar tempo de verdade (só no cenário de 120 min, e só se B.2 não
comeu o excedente), soltar como bônus:

> `>>` **"o MCP na maioria das vezes ele acaba trazendo uma visão onde ele vai gastar
> mais tokens do que a maioria das conexões de dados que a gente pode fazer através de
> CLI. Então, ele acaba sendo um pouco mais caro em consumo de tokens."**

### B.5 — Git, em 60 segundos (3 min)

Não ensinar Git — e não dizer que ele não é usado hoje, porque é mentira: ele já rodou
na máquina de todo mundo no B.2, por baixo do `claude plugin marketplace add`. O
enquadramento certo é *"vocês já usaram git hoje e nem viram"*. Depois, nomear por que
existe:

> `>>` **"vocês vão ter que dar uma olhada, uma pincelada no que que é o Git, nem que
> seja porque é o lugar que você copia as skills. Tem que saber."**

> `>>` **"vocês não precisam ser experts em GitHub, vocês precisam saber que que é isso
> daqui, como que isso funciona, porque lá que vocês vão copiar a maioria das skills que
> vocês vão pegar."**

## O que pode dar errado — e a saída

| Risco | Saída |
|---|---|
| **Aluno sem git na máquina** | O `claude plugin marketplace add` falha com `Failed to clone marketplace repository`. Não tem conserto de palco: mac pede instalador gráfico (minutos), Windows pede download do git-scm.com. Mão levantada, segue o bloco, **dupla no D** enquanto ele instala em paralelo. Sem aviso prévio (não há grupo da turma), é esperado que aconteça com uma fatia da sala — assumir e seguir |
| **Sala digitou os comandos do plugin dentro do Claude Code** | Sintoma: o Claude responde em prosa sobre o comando, nenhum `✔` aparece. Nada foi instalado. Mandar `/exit` e repetir os dois comandos no terminal |
| **Instalação deu sucesso mas `/skill-creator` não aparece** | Não reabriram o Claude Code. `/exit`, `claude`, e conferir de novo no `/` |
| Aluno não conseguiu instalar no coffee | Ele acompanha B e C **sem máquina**, de olho na tela. No bloco D trabalha em dupla com quem instalou — a permissão de dupla é explícita e vem do desenho do exercício |
| Aluno instalou o Claude Code mas o plugin do Skill Creator falhou no B.2 (erro de SSH, wifi, ou não levantou a mão a tempo) | Não parar o bloco. Ele acompanha C normalmente. No bloco D, dupla com quem tem o plugin funcionando, enquanto o facilitador (ou o próprio aluno, se der tempo) tenta de novo em paralelo — ver linha 3 dos pontos de trava |
| Wifi do local cai | B e C rodam na máquina do facilitador, que é a única que precisa de rede. D é escrita de Markdown — funciona offline até a chamada do Skill Creator. Se a rede não voltar, ver "pontos de trava" |
| Sala trava em erro de login/conta | Não debugar caso a caso no palco. Pedir para levantar a mão, seguir o roteiro, e resolver as mãos levantadas durante o bloco D, que é trabalho individual |
| Alguém pergunta de DuckDB / gmp-cli / Copilot | Responder que é o stack do facilitador, não do exercício de hoje. **Não instalar nada na máquina de ninguém** |

## Compressão

O B.2 (plugin) **nunca corta** — nem em minutos, nem em conteúdo — em nenhum dos
cenários abaixo, pelo mesmo motivo que A e D não cortam: sem ele, o bloco D não tem o
que fazer.

- **Para 15 min:** cortar B.4 inteiro (CLI vs MCP e web vs terminal) e B.5 (Git). Fica
  abrir, custo de prompt, **o plugin do B.2**, `/`, e o primeiro prompt.
- **Para 5 min (cenário 80, fundido com C):** só `claude`, **o plugin do B.2** — os dois
  comandos, sem a fala de transição — o primeiro prompt e a frase
  "isso aqui é onde a receita roda". Features, remote control, danger skip permission e
  Git saem do palco e ficam de fora — sem menção nem link.

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

Distribuição: pendrive ou cópia da tela. **Sem download e sem ZIP — e o aluno não
clona o repositório do curso.** (Isso não quer dizer que não há git na máquina dele:
para quem tem, foi ele que baixou o plugin no B.2; quem não tem, fez o B.2 em dupla.)

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

**O aluno não escreve hook hoje.** Ele precisa saber que existe, o que impede, e o nome
do repositório dos prontos, citado em voz alta e deixado na tela — não há grupo da
turma para postar depois.

`[A CONFIRMAR: qual repositório/link exato dos hooks prontos citar. Na live de 22/07
ele compartilhou um link no chat, mas a transcrição não registra a URL.]`

## O que pode dar errado — e a saída

| Risco | Saída |
|---|---|
| Sala sem referência de Markdown | Mostrar `#` virando título na tela ao vivo. 30 segundos resolvem |
| Alguém pede para instalar hooks agora | "Hoje ninguém escreve hook. Hoje todo mundo escreve receita." O nome do repositório fica na tela |
| Discussão sobre qual heurística usar (Morys vs Nielsen) | Devolver para o vocabulário dela: ela apresentou as 7 dimensões de Morys. Dizer que o exemplo usa a estrutura dela e seguir |
| O `.md` de exemplo não abre / pendrive falha | Ler da tela projetada do facilitador. O aluno não precisa do arquivo para o bloco D |

## Compressão

- **Para 20 min:** cortar C.3 (a distinção skill/command/hook vira uma frase dentro de
  C.4) e reduzir C.4 a **uma tela**: hooks existem, bloqueiam `rm -rf` e `drop table`, o
  nome do repositório fica citado na tela. C.1 e C.2 ficam intactos — são o que sustenta
  o bloco D.
- **Cenário 80:** C não existe como bloco. Dentro dos 15 min fundidos com B, a
  instalação do plugin do Skill Creator (B.2) roda primeiro e não corta; sobra o
  restante do tempo para abrir o Claude Code e nomear as três partes da receita
  (ingredientes · modo de preparo · output) sobre o arquivo na tela. Hooks saem
  inteiros do palco.

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

**Antes de soltar a sala no `/skill-creator`, uma pergunta rápida em voz alta:** "o
comando `/skill-creator` aparece quando vocês digitam `/`? Quem não instalou o plugin
no B.2, levanta a mão de novo." **Não presumir que o comando já está lá** — foi
instalado ao vivo no B.2, mas quem não conseguiu naquele momento (wifi, erro de SSH,
não levantou a mão a tempo) ainda não tem `/skill-creator` disponível. Quem levantar a
mão aqui vai de dupla com quem tem, exatamente como já vale para quem não instalou o
Claude Code — não para o bloco para reinstalar.

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

**Como o validador chega na máquina do aluno:** o texto completo do `SKILL.md` está
**impresso no handout**, na seção D.3, junto com as três etapas de instalação. O
facilitador também deixa o arquivo aberto e ampliado na tela dele no início do bloco D
— quem preferir copiar de lá em vez de digitar, pode; o handout é o caminho que não
falha.

**As três etapas, ditas em voz alta, nesta ordem** (é o que o handout traz, e o
facilitador acompanha pela tela dele):

1. **Criar a pasta.** `~/.claude/skills/valida-skill-cro/` no mac,
   `%USERPROFILE%\.claude\skills\valida-skill-cro\` no Windows. Dizer explicitamente
   que **a pasta `skills` ainda não existe** — o Claude Code não a cria na instalação;
   numa máquina nova, dentro de `.claude` há só `.claude.json`, `backups`, `plugins` e
   `settings.json`. O aluno cria as duas pastas pelo Finder / Explorador, sem terminal.
2. **Salvar o `SKILL.md`.** Avisar do Notepad: no Windows ele salva `SKILL.md` como
   `SKILL.md.txt` em silêncio, e o D.3 morre aí. Atalho recomendado de palco: **pedir ao
   próprio Claude Code para salvar o arquivo** — colar o texto no chat e pedir para
   gravar em `~/.claude/skills/valida-skill-cro/SKILL.md`, criando as pastas. Resolve
   as etapas 1 e 2 de uma vez e é o caminho com menos coisa para dar errado numa sala
   sem terminal.
3. **Sair e reabrir o Claude Code** — `/exit`, depois `claude`. **Skill nova só carrega
   na sessão seguinte.** Se a sala não reiniciar, `/valida-skill-cro` não aparece, e
   parece que todo mundo errou a pasta. Este passo é tão obrigatório quanto os dois
   anteriores — é a mesma armadilha do plugin no B.2.

**A conferência é depois do reinício, não antes:** mandar digitar `/` e perguntar quem
está vendo `valida-skill-cro` na lista.

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

O nome do slash command é `/valida-skill-cro` — ele vem do campo `name` do frontmatter,
que tem que bater com o nome da pasta. Por isso a instrução de palco insiste no nome
exato da pasta: errar aí é o segundo motivo mais comum de o comando não aparecer, atrás
só de não ter reiniciado a sessão.

## O que pode dar errado — e a saída

| Risco | Saída |
|---|---|
| Aluno não sabe descrever o processo da empresa dele | O bloco A já expôs as etapas. As quatro perguntas na tela dão o esqueleto. Se ainda travar: dupla |
| Skill Creator se comporta diferente do ensaiado | Caminho manual — escrever o `.md` à mão com os três blocos do C.1. Anunciar como plano previsto, não como falha |
| Validador não roda na máquina do aluno | Antes de tratar como falha, checar as duas causas banais: **não reabriu o Claude Code** depois de salvar (`/exit` + `claude`) e **nome da pasta diferente de `valida-skill-cro`**. Se ainda assim não rodar: o facilitador roda **na máquina dele**, com a skill de dois ou três voluntários, na tela. O resto recebe o critério e se autoavalia |
| Arquivo salvo como `SKILL.md.txt` (Windows/Notepad) | Sintoma idêntico ao de cima — comando não aparece. Pedir para ligar "Extensões de nomes de arquivo" no Explorador e renomear. Ou refazer pelo atalho: pedir ao próprio Claude Code para salvar o arquivo |
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

**Encerramento operacional:** os links de hoje — o `.md` de exemplo e o validador — já
estão impressos por extenso no handout; o nome do repositório de hooks ficou citado na
tela, no C.4. Não há grupo da turma: decisão revista em 13/09 (não existe grupo de
WhatsApp, e não há contato com a turma antes do evento).

`[A CONFIRMAR: se há CTA de produto no fim (Analytics Copilot / lista de espera). Nada
nas transcrições de alinhamento com a Taciana define isso para o evento presencial — a
menção ao Copilot aparece só na live pública de 22/07. Decidir com ela antes do dia.]`

## O corte limpo — o obrigado

**Última fala do núcleo. Dita de pé, olhando a sala, sem emenda:**

> **"Obrigado."**

É só isso, e é de propósito. Deck no slide **Obrigado**, luz na sala, aplauso.

**O que este corte significa para quem está no palco:**

- **A apresentação está completa aqui.** Se o relógio tiver acabado, acabou — a promessa
  do dia foi entregue: o aluno sai com a skill dele escrita e com a nota do validador.
  Nada ficou devendo.
- **Ninguém na sala sabe que havia mais.** O obrigado não é "vou parar por aqui porque
  o tempo acabou"; é o fim que estava escrito.
- **Daqui em diante é tudo upside.** O que vem depois — a seção BÔNUS, logo abaixo —
  só é emendado se sobrar relógio, e a decisão é do facilitador, na hora, sem aviso
  para a sala.

**Se não há tempo:** encerrar aqui, agradecer a Taciana em voz alta pelo nome, lembrar
que o `.md` de exemplo e o validador já estão impressos no handout, e sair.

**Se há tempo:** não voltar ao fechamento nem recapitular. Emendar direto o primeiro
bônus escolhido, como se fosse a continuação natural da tarde.

---

# BÔNUS — 30 min de reserva

**Fora do núcleo · 5 blocos de ~6 min · soma 30 min**

Esta seção existe por uma decisão do facilitador em 13/09:

> `>>` **"deixa 30 minutos de conteúdo de reserva — eu faço isso de vez em quando: tu
> mete um obrigado e depois mete uns bônus falando sobre coisas específicas."**

**Como funciona:**

- Cada bloco é **fechado em si**, sem dependência dos outros, e pode ser dado em
  qualquer ordem.
- Ordem sugerida e critério de escolha: seção 1, subseção *"O cenário com sobra"*.
- Nenhum bloco é anunciado como bônus para a sala.
- O que não entrar ao vivo vai para o **PDF complementar**.

---

## Bônus 1 — Quanti × quali, com o case Zerezes

**~6 min**

### Por que é bônus e não núcleo

O núcleo já usa o dado qualitativo como **fonte de hipótese** (A.3) e já cita a Zerezes
em uma frase. O que este bloco acrescenta é o aprofundamento do conceito: onde cada tipo
de dado mora e o que "fazer quali" significa de verdade. É conceito, não mão na massa —
e o entregável do dia é a skill escrita, não um conceito a mais. Rende muito mais
contado do que lido, o que é exatamente o perfil de um bônus: se couber ao vivo, ganha;
se não couber, o PDF dá conta.

### Na tela

- Slide **Dado quanti × dado quali** — duas colunas, onde cada um mora
- Slide **Case Zerezes** — a fala do backlog + o veredito honesto

### Falas-chave

Abrir separando os dois, com o vocabulário dele (ditado em 12/09):

> **Quantitativo é onde se armazena e se trabalha:** Mixpanel, Amplitude, Analytics.

E então a virada, que é o ponto do bloco — quali **não é só pesquisa no site**:

> `>>` **"dado quali, ó, é dado de qualidade, mesmo — qualitativo. Então é pesquisa, é
> você ir na loja, você fazer a jornada da porra do teu usuário"**

Os quatro movimentos concretos, nas palavras dele: **consumir os dados do SAC**, **ir na
loja**, **fazer a compra**, **percorrer a jornada do próprio usuário**.

O porquê:

> `>>` **"a gente num determinado momento a gente acaba se distanciando muito do produto
> que a gente mesmo vende, sacou? Então assim, qual é a forma da gente estar mais próximo
> da dor do nosso cliente?"**

E o veredito honesto, que é o que faz o bloco funcionar — dizer com a sala olhando:

> **"É uma coisa que a gente fala muito e pouco a gente faz."**

Fechar com a Zerezes como prova de que dá resultado:

> `>>` **"A gente foi na Zerezes, conseguiu trocar uma ideia com os caras de Zerezes para
> poder entender quais eram as dores e, pô, a gente tem um backlog gigantesco."**

**Gancho de palco:** perguntar quem da sala já comprou no próprio site nos últimos 30
dias, do carrinho ao recebimento. Deixar o silêncio trabalhar, igual ao do purchase no
bloco A.

---

## Bônus 2 — Case Duty Free

**~6 min**

### Por que é bônus e não núcleo

É um case que ele **se comprometeu a contar** (ação dele na reunião de 11/09), mas que
hoje **não tem conteúdo em lugar nenhum** — nem número, nem hipótese, nem resultado. Um
case sem conteúdo não pode sustentar minuto de núcleo: se não for levantado a tempo, o
núcleo quebraria. Como bônus, a ausência não custa nada — o bloco simplesmente sai da
lista e ninguém percebe. No núcleo (A.4) ele continua existindo como **menção de 20
segundos**, que é o que o material atual suporta.

### Na tela

- Slide **Case Duty Free — estrutura**, com os campos vazios e visíveis

### Estrutura do bloco

O esqueleto abaixo é o que o bloco precisa. **Nenhum campo foi preenchido, porque
nenhum deles está em qualquer fonte.**

| Campo | Conteúdo |
|---|---|
| Contexto do cliente | `[A CONFIRMAR: que operação é, que porte, em que ano]` |
| Como o case chegou | `[A CONFIRMAR: trabalho feito com o Gustavo antes de a Taciana entrar — confirmar o enquadramento]` |
| O dado que originou | `[A CONFIRMAR: quanti, quali, ou os dois — e qual era o sinal]` |
| A hipótese testada | `[A CONFIRMAR: hipótese no template dela — se mudarmos X, para Y, então Z, porque W]` |
| A forma de teste | `[A CONFIRMAR: A/B, MVT, fake door, rollout progressivo — qual foi]` |
| O resultado | `[A CONFIRMAR: número, direção e se foi conclusivo]` |
| O que escalou depois | `[A CONFIRMAR: o que virou padrão na operação]` |

### Falas-chave

A única fala registrada sobre este case, na reunião de 11/09:

> `>>` **"esse case aí, tu pode me chamar e eu conto o case."**

### Regra do bloco

**Não inventar número no palco.** Se o material não tiver sido levantado com o Gustavo
até a manhã do dia 14, este bônus **não é dado** — puxa-se outro da lista. Já existe
linha para isso nos pontos de trava (item 11).

**Dependência:** item do checklist de pré-evento — *"Levantar o material do case Duty
Free com o Gustavo"*.

---

## Bônus 3 — Matriz de quantos testes cabem

**~6 min**

### Por que é bônus e não núcleo

É concreto e útil, e foi pedido nominalmente por ele (direção de 12/09). Mas é o tipo de
conteúdo que **funciona como leitura**: uma matriz se consulta, não se assiste. E os
cortes da matriz ainda não estão fechados, o que impediria de sustentá-la como núcleo.
Como bônus, ela cabe ao vivo quando a sala está em clima de processo, e cabe no PDF
sempre.

### Na tela

- Slide **As três entradas** — o que se mede para calcular
- Slide **O que a matriz responde** — com os cortes ainda em aberto

### O que ele pediu, textualmente (direção de 12/09)

Uma matriz de **quantos testes e experimentos a operação suporta**, a partir de:

- quantidade de pessoas acessando as páginas
- quantas páginas de destino
- quantos acessos

E o motivo: serve para *"deixar mais fácil essa criação de padrões"*.

### Falas-chave

O enquadramento vem do gargalo que ele já declara no núcleo (A.3), e este bloco é a
resposta prática dele:

> `>>` **"já para avisar vocês, priorização é grande parte do problema."**

> `>>` **"A priorização também deveria estar ligada à capacidade técnica que a gente tem
> de desenvolver, a capacidade de design de conseguir implementar aquelas telas."**

A ponte para dizer em voz alta: a matriz é o que transforma *"a gente tem 40 hipóteses"*
em *"a gente consegue rodar N por mês"* — e é o N que reorganiza o backlog, não o
ranking.

### O que ainda falta para a matriz existir

`[A CONFIRMAR: os cortes de tráfego da matriz — a partir de quantos acessos por página
por semana uma página entra na conta, e quantos experimentos simultâneos cada faixa
suporta. Nenhuma transcrição registra os números, e não há planilha na pasta data/.
Definir com ele antes do dia ou dar o bloco só com as três entradas e o raciocínio.]`

`[A CONFIRMAR: se a matriz considera páginas de destino como unidades independentes ou
se agrupa por template — muda a conta inteira.]`

**Plano B honesto, se os números não vierem:** dar o bloco como **método**, não como
tabela — nomear as três entradas, mostrar que o resultado é um teto de experimentos
simultâneos, e dizer que o corte exato depende do volume de cada operação. Funciona em
6 minutos e não inventa nada.

---

## Bônus 4 — Hooks e guardrails na prática

**~6 min**

### Por que é bônus e não núcleo

O núcleo (C.4) **nomeia** o conceito: hooks existem, servem para isso, o nome do
repositório dos prontos fica na tela. Isso já basta para o dia. Este bloco é
profundidade técnica sobre o que
ele mesmo chamou do ponto mais técnico do material — e o público **não é de tecnologia**
(direção de 12/09). Além disso, **o aluno não escreve hook hoje**: aprofundar não muda o
entregável. É exatamente o perfil de reserva.

> `>>` **"dentro dessa estrutura aqui, um pouquinho mais técnico, e eu acho que se p[ega]
> esse aqui é o ponto mais técnico desse material, a gente tem os hooks"**

### Na tela

- Slide **O hook, do evento ao bloqueio** — o caminho em três nós
- Slide **Peça pro Claude escrever o hook** — a saída para quem não escreve shell

### Falas-chave

**Começar pelo caminho que o C.4 não deu:** o problema de quem não é técnico, e a saída.

> `>>` **"aqui é onde a gente tem um pouco mais de problema, né? porque a gente precisa
> de ter um conhecimento técnico de fato pra gente poder conseguir fazer esses scripts
> aqui em [bash]. Mas você também pode pedir para o próprio [Claude Code] criar esses
> scripts para você."**

E o processo dele, que é o que a sala leva embora:

> `>>` **"vou trabalhar aqui numa camada onde eu preciso pensar em quais são os guard
> rails que eu preciso colocar para construir esses hooks, cara. Vou pegar esses hooks,
> vou trabalhar com [Claude Code] para poder criar ele e vou disponibilizar pra galera."**

Só então o arquivo concreto, se o C.4 tiver sido comprimido ou cortado:

> `>>` **"aqui eu disponibilizei um arquivo, um shell, que eu tô dizendo: ó, não pode
> executar rm -rf, não pode executar drop table, não pode executar drop database. Ou seja,
> toda vez que o [Claude], antes de executar uma função que poderia ser um drop table, ele
> vai trigar o hook e vai travar a sessão pro usuário."**

E o fecho, que é o que justifica o bloco existir para uma sala de CRO:

> `>>` **"quando a Júlia me liga[r] mandar lá para alguém do time dela utilizar e consumir
> informação, ela vai garantir com[o]: cara, uma merda muito grande essa pessoa não pode
> fazer. Uma merda pequenininha, às vezes ela consegue, mas de uma muito grande ela nunca
> vai conseguir fazer."**

### Regra de encaixe — evitar repetir o núcleo

**Se o C.4 rodou inteiro** (cenário de 120 min): começar este bônus direto em *"peça pro
Claude escrever o hook"* e **não repetir** os três eventos nem o arquivo. Sobram ~6 min
de método, que é o que não foi dado.

**Se o C.4 caiu ou virou uma tela só** (cenários 100 e 80): dar o bloco inteiro, na
ordem acima — os eventos, o arquivo, a responsabilidade.

`[A CONFIRMAR: qual repositório/link exato dos hooks prontos citar — mesmo marcador
aberto no C.4.]`

---

## Bônus 5 — CLI × MCP

**~6 min**

### Por que é bônus e não núcleo

No núcleo, este conteúdo **já é declaradamente o primeiro a cair** — foi o que abriu
espaço para a instalação do plugin no B.2, que não corta. Além disso é o **stack do
facilitador**, não o exercício do aluno: nenhuma máquina da sala precisa disso para
entregar a skill do dia. Como reserva é ótimo material — é pesquisa própria, tem número,
e é o bloco que mais impressiona uma sala técnica.

### Na tela

- Slide **O benchmark** — cinco tarefas, os dois competidores, o veredito
- Slide **O stack** — o que o CLI conecta, e o que ainda falta confirmar

### Falas-chave

A tese, que é a única parte que o núcleo às vezes dá:

> `>>` **"o MCP na maioria das vezes ele acaba trazendo uma visão onde ele vai gastar
> mais tokens do que a maioria das conexões de dados que a gente pode fazer através de
> CLI. Então, ele acaba sendo um pouco mais caro em consumo de tokens."**

E o que o núcleo nunca dá — **o benchmark próprio**, que é o conteúdo deste bloco:

> `>>` **"a gente fez um benchmark de fato, né? A gente pegou cinco tarefas e deu as cinco
> tarefas pro MCP do Google Analytics e pro CLI que a gente construiu. Em todas elas a
> gente foi mais performático."**

> `>>` **"Todas elas a gente foi mais performático do que eles com relação a consumo de
> tokens."**

O que foi construído e por quê:

> `>>` **"pra gente poder conseguir consumir isso de uma maneira onde a gente economize
> tokens comparados ao MCP, a gente criou aqui algumas bibliotecas que se conectam direto
> dentro do [Claude Code]. (...) a gente tem o Google Marketing Platform CLI. Então a
> gente consegue conectar GA4, Google Search Console, Google Ads, Google Tag Manager e o
> Google BigQuery."**

E a honestidade que evita o bloco virar propaganda — ele mesmo relativiza:

> `>>` **"hoje com modelos de 1 milhão de contexto que a gente acaba tendo tanto no
> [Claude] quanto em outras soluções, fica mais fácil da gente conseguir utilizar MCP
> hoje. Mas eu sempre prezo por um cenário onde a gente consiga mitigar e economizar
> bastante token para poder fazer a análise."**

### O que falta

`[A CONFIRMAR: os números exatos do benchmark — quais foram as cinco tarefas e qual a
diferença de tokens em cada uma. A transcrição da live de 22/07 registra o veredito
("em todas elas a gente foi mais performático") mas nenhum número. Puxar do artigo da
newsletter antes do dia.]`

`[A CONFIRMAR: o link do artigo da newsletter com o comparativo. Ele mandou no chat da
live; a transcrição não registra a URL.]`

**Regra:** se os números não vierem, dar o veredito qualitativo ("cinco tarefas, o CLI
ganhou nas cinco em consumo de token") e apontar o artigo. **Não estimar percentual no
palco.**

---

# Checklist de pré-evento

## D-2 e D-1 (12 e 13/09)

- [ ] **Ensaiar o bloco D ponta a ponta na máquina do dia** — descrever, `/skill-creator`,
      `/valida-skill-cro`. Cronometrar. É o único bloco que não tem plano de corte.
- [ ] **Ensaiar o B.2 (instalação do plugin) na máquina do dia, do zero** — rodar os dois
      comandos (`claude plugin marketplace add ...` e `claude plugin install
      skill-creator@claude-plugins-official`) e cronometrar quanto tempo leva de
      verdade, incluindo a espera pela mensagem de sucesso.
- [ ] **Verificar, no ensaio, que plugin e skill só aparecem depois de reabrir o Claude
      Code** — item obrigatório, não opcional. Instalar o plugin com uma sessão aberta,
      digitar `/` e confirmar que `/skill-creator` **não** está lá; dar `/exit`, abrir
      `claude`, digitar `/` e confirmar que agora **está**. Repetir o mesmo teste com o
      `valida-skill-cro` salvo à mão em `~/.claude/skills/valida-skill-cro/SKILL.md`.
      É a falha que some no B.2 e reaparece às 17h25 — ensaiar para saber o sintoma de
      cor.
- [ ] **Testar o caminho de instalação do validador na máquina do dia, do zero** — criar
      as pastas `skills/` e `valida-skill-cro/` (elas não existem numa config nova),
      salvar o `SKILL.md` copiado do handout, reabrir e rodar `/valida-skill-cro`.
- [ ] **Calibrar o validador com três exemplos:** uma skill boa, uma vaga, uma que
      descreve ferramenta em vez de processo. Conferir se a nota separa os três.
- [ ] Confirmar com a Taciana **o horário real de entrega do palco** e anotar aqui:
      `[A CONFIRMAR: horário de entrega do palco]`
- [ ] Confirmar se o **Messina participa da parte da tarde**. Em 11/09 ele disse
      *"não tô nem contando com a participação dele"* — o roteiro está escrito sem ele.
- [ ] Levantar o material do **case Duty Free** com o Gustavo (ver `[A CONFIRMAR]` no
      bloco A).
- [ ] Decidir e travar a **forma de distribuição** do `.md` de exemplo e do validador:
      pendrive ou cópia de tela — sem clonar o repositório do curso. O texto dos dois
      já está impresso por extenso no handout, que é o caminho que não falha; o que se
      decide aqui é só o atalho.
- [ ] Fechar o nome/link do repositório de hooks prontos, para citar em C.4 e no
      Bônus 4 — não há grupo da turma para postar depois.

### Só para os bônus (nada aqui bloqueia o núcleo)

- [ ] **Duty Free (bônus 2):** o mesmo levantamento com o Gustavo já listado acima. Se
      não vier, o bônus 2 sai da lista — decidir isso na manhã do dia 14, não no palco.
- [ ] **Matriz (bônus 3):** fechar os cortes de tráfego, ou assumir o plano B (dar o
      bloco como método, com as três entradas e sem tabela).
- [ ] **Benchmark (bônus 5):** puxar do artigo da newsletter os números das cinco
      tarefas e o link do artigo. Sem isso, só o veredito qualitativo.
- [ ] **Decidir a lista viável de bônus** — quais dos cinco estão realmente dados — e
      anotar aqui, para não precisar decidir isso com a sala olhando:
      `[A CONFIRMAR: bônus liberados para o dia]`

## D-0, antes de a sala abrir

- [ ] Claude Code funcionando na máquina do facilitador, logado, com tokens disponíveis.
      *(Na live de 22/07 ele ficou sem tokens no meio — não repetir.)*
- [ ] Fonte do terminal aumentada e testada do fundo da sala.
- [ ] `/skill-creator` e `/valida-skill-cro` testados **na máquina do dia**, na rede do
      local — os dois conferidos **depois** de um `/exit` + `claude`, não na sessão em
      que foram instalados.
- [ ] `git --version` respondendo na máquina do facilitador (é o que o B.2 usa por
      baixo).
- [ ] Texto do `valida-skill-cro` pronto para mostrar ampliado na tela no início do
      bloco D (o handout já traz impresso — é o caminho que não falha).
- [ ] **Os dois comandos do plugin do Skill Creator testados na rede do local**
      (não só na rede de casa/escritório) — wifi de local de evento costuma ser mais
      lento ou filtrado, e é isso que vai rodar ao vivo com 50 pessoas ao mesmo tempo
      no B.2.
- [ ] O `.md` de exemplo aberto e pronto para projetar.
- [ ] Tela das **quatro perguntas guia** do bloco D pronta e testada no projetor.
- [ ] Cronômetro visível para a sala.
- [ ] Testar o wifi do local com o Claude Code rodando de verdade, não só carregando uma
      página.
- [ ] Confirmar com a produção: `[A CONFIRMAR: tomadas suficientes para as máquinas da
      turma durante duas horas]`

## Nos 60 segundos em que a Taciana entrega o palco

- [ ] Olhar o relógio e **escolher o cenário** (mais de 120 / 120 / 100 / 80) na tabela
      da seção 1.
- [ ] Se o palco vier **antes das 16h00**, não alargar os blocos do núcleo para preencher:
      rodar o núcleo no alvo, fechar no obrigado e emendar bônus. A decisão de qual bônus
      fica para depois do obrigado, com a sala já lida.
- [ ] Anotar mentalmente o horário-limite de início do bloco D: **hora de término menos
      35 min**. Esse é o único horário que não pode escorregar.

---

# Pontos de trava — e a saída de cada um

| # | Trava | Sinal de que aconteceu | Saída |
|---|---|---|---|
| 1 | **Taciana estoura o horário** | Palco entregue depois das 16h00 | Escolher o cenário na tabela da seção 1. B comprime, depois C, depois fundem. A e D não caem |
| 2a | **Aluno sem git no B.2** | `✘ Failed to add marketplace:` com `Failed to clone marketplace repository` na tela dele | Não parar o bloco e não tentar instalar git no palco (mac: instalador gráfico de minutos; Windows: download do git-scm.com). Mão levantada, segue B e C normalmente, e **no bloco D faz em dupla** com quem tem o plugin, enquanto instala o git depois, em casa. A nota sai igual |
| 2b | **Plugin ou skill instalados com a sessão aberta** | Mensagem de sucesso apareceu, mas `/skill-creator` ou `/valida-skill-cro` não estão na lista do `/` | `/exit`, `claude`, conferir de novo. É a causa mais comum, e a conferência de sala sempre acontece **depois** do reinício, nunca antes |
| 2 | **Aluno não instalou o Claude Code** | Mão levantada no início de B | Acompanha A, B e C sem máquina. Em D, dupla com quem instalou. Não parar o bloco para instalar |
| 3 | **Aluno sem o plugin do Skill Creator quando o exercício (D) começa** | `/skill-creator` não aparece no `/` da máquina dele; mão levantada na checagem do B.2 ou no início do D.2 | Fazer em dupla com quem tem o plugin instalado, enquanto instala o dele em paralelo (os dois comandos do B.2, de novo). Não parar o bloco D para reinstalar — a dupla já resolve a entrega da nota |
| 4 | **Wifi cai** | Prompt não responde na máquina do facilitador | A não depende de rede. B e C rodam na tela do facilitador. D: o aluno escreve o `.md` à mão (plano B do D.2) e o validador vai para casa |
| 5 | **Skill Creator não se comporta como no ensaio** | Saída diferente, loop travado | Caminho manual: o `.md` à mão com ingredientes + modo de preparo + output. Anunciar como plano previsto |
| 6 | **Validador não roda na máquina do aluno** | Comando não encontrado | Facilitador roda na máquina dele com 2–3 voluntários, na tela. Os outros se autoavaliam pelos critérios |
| 7 | **Validador dá nota alta para skill ruim** | Nota 8+ numa skill sem cargos nem handoffs | Discordar em voz alta e apontar a lacuna. A honestidade vale mais que a ferramenta |
| 8 | **Aluno não sabe descrever o processo da empresa** | Tela em branco depois de 5 min no D.1 | "Descreva o que existe hoje, mesmo informal." As quatro perguntas são o esqueleto. Dupla como saída |
| 9 | **Sala trava em debate longo (GA4, ferramenta, framework)** | Uma pessoa dominando 3+ min | Reconhecer, dizer que é assunto de curso inteiro, devolver ao ponto. Retomar a linha do bloco |
| 10 | **O bloco D vai começar com menos de 30 min** | Relógio | Cortar o Fechamento para 2 min e avisar a produção. D não encolhe |
| 11 | **Material de case indisponível (Duty Free)** | Sem número, sem hipótese, sem resultado | Contar como menção de 20 segundos e ir para Ering, que tem material. Não inventar número |

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

**Soma das durações alvo do núcleo:** 30 + 25 + 30 + 30 + 5 = **120 min**, fechando no
obrigado.

**Soma dos bônus:** 6 + 6 + 6 + 6 + 6 = **30 min** de reserva, fora do núcleo. Teto com
tudo emendado: **150 min**.
