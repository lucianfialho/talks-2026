# Script.md — roteiro do facilitador

**Bloco das 15h00 às 18h00 · Lucian Fialho · co-facilitação: Taciana Serafim (14h–15h)**

Este documento é para quem está no palco, não para o aluno — o aluno tem o
`handout.md`. Cada bloco abaixo segue o mesmo formato: horário de início,
duração, objetivo, o que está na tela, falas-chave (literais quando
marcadas como tal), o que pode dar errado, e como cortar se a tarde atrasar.

As falas marcadas com `>>` são **literais** — dizer exatamente assim, não
parafrasear. O resto é direção de palco: pode adaptar ao momento.

**Não cite número de página de nada** neste roteiro nem no palco — o
material é impresso e a numeração muda na diagramação. O ponteiro correto é
sempre "o guia de instalação, no fim do handout".

## Antes de a sala abrir — checklist do facilitador

- [ ] Claude Desktop aberto, logado na conta usada de manhã pela Taciana (a
      mesma que os alunos usam).
- [ ] Projeto "CRO" já criado no Desktop, **vazio** — as instruções de cada
      skill entram ao vivo, no ritmo da sala, não pré-coladas. (Se o tempo
      apertar demais em ensaio, ver "como cortar" do Bloco 2 para a exceção.)
- [ ] Terminal do Claude Code aberto numa pasta com `05-imersao-cro/data`
      copiada para dentro dela (`cp -r 05-imersao-cro/data ./data`), `claude`,
      `duckdb` e `python3` funcionando na máquina de demonstração.
- [ ] 3 URLs de backup prontas no slide do Bloco 2, para quem não trouxe
      página própria: `magazineluiza.com.br`, `americanas.com.br`,
      `mercadolivre.com.br` — abrir as três no navegador antes da sala
      encher, para confirmar que carregam no wifi do local.
- [ ] Demos gravadas de `srm-check` e `post-test-segments` disponíveis em
      arquivo local (não em link que depende de internet) — é o plano B se o
      wifi cair durante os blocos de Code.
- [ ] **Impressão montada como um documento só:** `handout.md` seguido de
      `instalacao.md`, nessa ordem, no mesmo material impresso — são dois
      arquivos separados no repositório, mas o handout promete três vezes
      "o guia de instalação está no fim deste material", e essa promessa só
      é verdade se os dois forem encadernados juntos. Conferir antes de
      imprimir, não no dia.
- [ ] Handout impresso na mão, para apontar fisicamente "guia de instalação,
      no fim do handout" quando disser a frase do break.
- [ ] Time de apoio (quem circula durante o intervalo e a repescagem)
      avisado que **agora são três instalações e um download**, Claude Code,
      DuckDB, python3 e os arquivos do curso, não uma só — ver Bloco 3.

---

## Cronograma

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

Verificação aritmética (Step 2 da task): `8+22+20+15+45+25+20+10+15 = 180`.
Rodado e confirmado — ver relatório da task para a saída literal.

**O trecho mais crítico do dia é 15h00–15h30** (Blocos 1+2 somados). Ele
precisa terminar exatamente na parede — a tela mostrando
`⚠️ FALTA EVIDÊNCIA` — porque é isso que justifica o café e sustenta a
segunda metade da tarde. Se sobrar tempo aqui, alongue a leitura da tabela
das 7 dimensões no Bloco 2; nunca alongue a abertura do Bloco 1.

---

## Bloco 1 — 15h00 · 8min · Quatro cadeiras

**Objetivo:** amarrar com o fechamento da Taciana e instalar a tese do dia:
uma skill por cadeira, e a ferramenta que cada um usa hoje só preenche uma
delas por completo.

**Na tela:** slide com a citação de fechamento da Taciana (slide 44) e, em
seguida, a tabela cadeira → skill → camada (a mesma do handout, seção 1).

**Falas-chave:**

>> "A Taci terminou dizendo que o próximo desafio não é usar o Claude, é
>> transformá-lo em parte do seu processo. É exatamente isso que a gente vai
>> fazer nas próximas três horas."

Em seguida, retomar as quatro posições dela (Defesa/Leitura de campo —
Digital Analytics; Meio-campo/Armação — Estrategista de CRO;
Meio-campo/Criação — UX/Research; Ataque/Finalização — Dev/Experimentação) —
1 frase por posição, sem reabrir o slide dela inteiro, só nomeando.

>> "Vamos preencher as quatro cadeiras. Uma skill por cadeira. E em 40
>> minutos você vai descobrir que a ferramenta que você escolheu preenche
>> uma só."

**Declarar em voz alta a cadeira que fica de fora — não deixar implícito:**

>> "Uma delas não entra na tarde de hoje: UX/Research. Não foi esquecimento
>> — é a cadeira que menos se resolve com skill e mais depende de pesquisa
>> com gente: entrevista, teste de usabilidade, sessão gravada. As outras
>> três — Analytics, CRO e Dev — a gente cobre com uma skill em cada uma."

Mostrar a tabela do handout (CRO / Analytics / Dev × 7 skills × Desktop /
Claude Code) — repare que ela já só lista essas três cadeiras, não as
quatro da Taciana; é o mapa da tarde, não o mapa completo do time. Dizer,
sem entrar em detalhe ainda: "as três primeiras rodam nas duas colunas; as
quatro últimas só na direita — e o motivo disso é o assunto da tarde
inteira."

**O que pode dar errado:** parte da sala saiu para o café das 15h e ainda
não voltou / está entrando. **Saída:** não parar para esperar; quem perder
este bloco não perde exercício nenhum (é mapa, o próprio handout diz isso na
seção 1) — só perde o gancho narrativo, que dá para recuperar em uma frase
quando a pessoa senta.

**Como cortar se atrasar:** este bloco não tem gordura — é 8 minutos para
uma citação, quatro nomes e uma tabela. Se precisar cortar, corte a leitura
das quatro posições uma a uma e vá direto da citação para a tese e a
tabela. Nunca corte a citação de abertura, a frase da tese, nem a frase que
declara UX/Research fora de escopo: uma sala que conta as cadeiras no slide
do mapa percebe a ausência antes de você nomeá-la — dizer isso em voz alta é
o que evita a pergunta incômoda no meio de outro bloco.

---

## Bloco 2 — 15h08 · 22min · Cadeira do CRO — Desktop

**Modo de interação:** narrado e espelhado — o facilitador executa no telão
e a sala replica em tempo real no próprio Claude Desktop, projeto "CRO".
Não há tempo de demo-depois-prática aqui; é simultâneo.

**Objetivo:** produzir, ao vivo, uma hipótese estruturada — e deixá-la
travada por falta de evidência, de propósito, para abrir o gancho do
intervalo.

**Sub-timing:**

| Janela | Duração | O quê |
|---|---|---|
| 15h08–15h14 | 6min | `heuristica-morys` — colar instrução, colar URL |
| 15h14–15h20 | 6min | Rodar, ler o output, apontar a dimensão mais fraca |
| 15h20–15h25 | 5min | `hipotese-estruturada` — colar instrução, montar hipótese com achado da Morys, **sem** dar número de evidência |
| 15h25–15h28 | 3min | Rodar ao vivo, mostrar o bloqueio |
| 15h28–15h30 | 2min | A parede + anúncio do break |

### 15h08–15h14 · `heuristica-morys`

**Na tela:** Claude Desktop, projeto "CRO" → Instruções do projeto, colando
o texto de `skills/desktop/heuristica-morys.md` (handout, seção 2).

Pedir à sala uma URL de página própria; se ninguém tiver, usar uma das 3 de
backup do slide.

**O que pode dar errado (trava prevista):** ninguém tem página própria para
analisar. **Saída:** usar as 3 URLs de e-commerce brasileiro do slide — não
parar o bloco para negociar qual página usar.

### 15h14–15h20 · rodar e ler

Colar a URL (e um print, se tiver) na conversa. Deixar a skill pedir os 4
inputs (URL, print, conversão desejada, público) se você ainda não deu tudo
— isso é o comportamento correto da skill, não um bug.

**Na tela:** a tabela de 7 dimensões preenchida, score total, e as 2
dimensões mais fracas apontadas.

**Fala de transição:** "Rode `hipotese-estruturada` sobre a dimensão mais
fraca" — é a própria skill que fecha assim; use a deixa dela para emendar no
próximo passo sem parecer forçado.

### 15h20–15h25 · `hipotese-estruturada` — montar sem evidência

**Na tela:** colar o texto de `skills/desktop/hipotese-estruturada.md`
embaixo do que já está nas instruções do projeto.

Lembrar o template em voz alta antes de preencher — é o que a sala vai
preencher à mão no handout daqui a pouco:

    Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência].

Pegar o achado mais fraco da Morys e montar a hipótese na conversa **até o
campo Evidência** — aí, deliberadamente, não dar nenhum número. Se alguém na
sala tentar "ajudar" gritando um número, agradeça e diga que é exatamente
isso que o próximo passo vai testar.

### 15h25–15h28 · rodar e mostrar o bloqueio

**Na tela:** o output da skill parando em `⚠️ FALTA EVIDÊNCIA`, com a lista
do que faltaria para fechar.

### 15h28–15h30 · A parede

>> "O Claude não está sendo teimoso. Ele está certo. E ele não consegue
>> buscar esse dado — não porque não sabe, porque não tem como. Café. Volta
>> em 20."

Imediatamente depois, o anúncio do break (dito ainda dentro deste bloco,
nos últimos segundos, ou já abrindo o Bloco 3 — não há corte visível para a
sala):

>> "Quem quiser sair na frente: o guia de instalação está no fim do
>> handout. Instala enquanto toma café, eu fico aqui. É opcional — quem não
>> instalar continua acompanhando tudo."

*(Desvio deliberado da fala do brief: o texto original cita "página 4 do
handout"; a restrição global deste roteiro proíbe número de página, então a
referência de local foi trocada por "no fim do handout", mantendo o resto
literal. Ver relatório da task para o registro completo desse desvio.)*

**O que pode dar errado:** o bloco atrasou e a parede não bate na tela às
15h28 — sobra menos de 2 minutos para o anúncio do break, ou nenhum.
**Saída:** o anúncio do break pode ser dito em cima da última tela ainda
aberta (o `⚠️ FALTA EVIDÊNCIA`); não é necessário fechar a tela antes de
falar. O que não pode acontecer é abrir o break sem a parede — ela é o
gancho, sem ela o intervalo não tem por que existir na cabeça da sala.

**Como cortar se atrasar:** primeiro corte a leitura detalhada da tabela de
7 dimensões (ficar em "as duas mais fracas são X e Y", sem passar linha por
linha); depois, se ainda faltar tempo, encurte o texto colado nas
instruções do projeto (o facilitador pode ter uma versão resumida
pré-copiada só para a demonstração, desde que a versão completa continue
sendo a do handout para quem replica). Nunca corte a hipótese sem evidência
nem a fala da parede — são o motivo de o break existir.

---

## Bloco 3 — 15h30 · 20min · BREAK — instalação voluntária assistida

**Objetivo:** deixar quem quiser instalar o Claude Code, o DuckDB e o
python3 durante o café, com apoio circulando, sem obrigar ninguém.

**Dependência nova que aperta este bloco:** o guia de instalação
(`instalacao.md`) ganhou um Passo 5 (DuckDB), um Passo 6 (python3) e um
Passo 7 (baixar os arquivos do curso) que não existiam na versão original
do material. Isso significa que **o intervalo agora cobre três instalações
e um download, não uma** — Claude Code (Passos 0 a 4), DuckDB (Passo 5) e
python3 (Passo 6), mais baixar os arquivos da imersão (Passo 7) — antes de
chegar ao Passo 8 (skills + dataset). Os 20 minutos do break não mudaram; o
que cabe neles ficou mais apertado.

**O que fazer com isso, explicitamente:**

- No anúncio do break (Bloco 2), a frase manda a pessoa para "o guia de
  instalação, no fim do handout", sem detalhar quantos passos são — isso é
  proposital, para não assustar quem está só olhando de longe. Mas o time
  de apoio que circula durante o café **precisa saber** que são 8 passos, e
  que os passos 0–4 (terminal, Node, Claude Code, verificar, logar) são o
  mínimo para acompanhar a próxima meia hora (Bloco 4, que continua 100% no
  Desktop), enquanto os Passos 5–7 (DuckDB, python3, baixar os arquivos) só
  importam a partir das 16h05.
- Priorização do apoio durante os 20 minutos: ajudar primeiro quem está
  travado nos Passos 0–4 (sem isso, a pessoa não acompanha nem o Bloco 4);
  só depois ajudar quem já tem Claude Code e está tentando DuckDB, python3
  ou o download dos arquivos.
- **Ninguém deve ser empurrado a terminar tudo no mesmo café.** Se alguém
  claramente não vai terminar os Passos 5–7 em 20 minutos, a orientação do
  apoio é fechar o Claude Code primeiro (Passos 0–4) e deixar DuckDB,
  python3 e o download dos arquivos para depois — exatamente o que o
  próprio guia já diz ("se você travar aqui, ainda dá para acompanhar a
  primeira metade inteira sem problema nenhum").

**Na tela:** deixar um slide neutro (contagem regressiva ou o mapa das 4
cadeiras de novo) — o facilitador não precisa narrar o break, só estar
disponível.

**O que pode dar errado:**

| Trava | Sinal | Saída |
|---|---|---|
| Instalação estourou o break | Mais de 10 pessoas ainda tentando às 15h50 | Rodar `ice-score` (Desktop) e deixar o apoio circulando; ele é o bloco que existe justamente para isso |
| Wifi caiu | Ninguém consegue baixar Node/Claude Code/DuckDB/python3, nem baixar o ZIP dos arquivos do curso | Avisar a sala que quem não conseguir agora tem o guia completo para levar para casa; seguir o dia com quem já tem ambiente pronto (a máquina de demonstração do facilitador não depende do wifi da sala para os blocos de Code, só a instalação de quem está tentando pela primeira vez depende) |

**Como cortar se atrasar:** o break não corta — 20 minutos de intervalo são
para a sala, não para o conteúdo. Se o Bloco 2 invadiu o horário do break,
o café ainda começa na hora marcada (15h30 no relógio, mesmo que o
conteúdo tenha vazado 1–2 minutos); quem precisar de mais tempo de
instalação usa também a repescagem do Bloco 4.

---

## Bloco 4 — 15h50 · 15min · `ice-score` — Desktop + repescagem de instalação

**Modo de interação:** narrado e espelhado, igual ao Bloco 2 — este bloco
roda 100% no Desktop, então quem ainda está instalando o Claude Code ou o
DuckDB não fica de fora dele.

**Objetivo:** fechar o degrau 1 (CRO no Desktop) priorizando o backlog de
hipóteses, e fazer a checagem honesta de quem está pronto para o próximo
degrau.

**Sub-timing:**

| Janela | Duração | O quê |
|---|---|---|
| 15h50–15h53 | 3min | Checagem de instalação (repescagem) |
| 15h53–16h00 | 7min | `ice-score` — colar instrução, priorizar hipóteses |
| 16h00–16h05 | 5min | Preencher a tabela ICE à mão + citação da Taciana |

### 15h50–15h53 · Repescagem de instalação

Perguntar direto para a sala, com mãos levantadas: "quem já tem `claude`
rodando?" e, em seguida, "de quem levantou a mão, quem também já tem
`duckdb`?".

**A pergunta que este roteiro precisa responder em voz alta:** quem instalou
só o Claude Code, sem o DuckDB, consegue acompanhar o Bloco 5 (16h05,
Analytics)?

>> A resposta é não. `srm-check` e `post-test-segments` rodam `duckdb`
>> diretamente — sem ele instalado, o comando não existe na máquina, não
>> importa se o Claude Code está funcionando perfeitamente.

**O que o facilitador faz com isso, nesta janela de 3 minutos:**

1. Dizer a frase acima em voz alta — não deixar a lacuna implícita.
2. Para quem só tem Claude Code: apontar o Passo 5 do guia (DuckDB) e pedir
   para tentar durante este bloco (que não exige nada instalado) e, se não
   conseguir a tempo, durante o próprio Bloco 5 — o apoio continua
   circulando.
3. Para quem não tem nem Claude Code: sem alternativa nova aqui além do que
   já foi dito no break — seguir acompanhando no papel (handout, seção 6,
   já traz os comandos e os resultados esperados impressos) e tentar a
   instalação depois, em casa, com calma.
4. Reforçar que isso não é fracasso pessoal: a instalação era opcional desde
   o anúncio do break, e o handout foi desenhado para quem chega sem
   ambiente nenhum continuar entendendo o que está acontecendo na tela.

### 15h53–16h00 · `ice-score`

**Na tela:** colar o texto de `skills/desktop/ice-score.md` nas instruções
do projeto "CRO", embaixo do que já está lá. Listar a hipótese travada do
Bloco 2 (a que ficou com `⚠️ FALTA EVIDÊNCIA`) junto com o exemplo de
referência da Taciana (CEP no checkout mobile, que já tem evidência) para
mostrar os dois casos lado a lado na mesma tabela ICE.

**Fala-chave a reforçar (regra da skill):** hipótese com
`⚠️ FALTA EVIDÊNCIA` tem Confiança no máximo 3 — dizer isso em voz alta
quando o output aparecer, para a sala ver a régua se aplicando ao caso que
ela viu travar 20 minutos atrás.

### 16h00–16h05 · Preencher e fechar com a citação

Deixar a sala preencher a tabela ICE em branco do handout (seção 5) com as
próprias hipóteses, enquanto o facilitador fecha com:

> "O score explicita critérios e organiza o backlog — use para ranking
> relativo, não como veredito. O Dev participa estimando esforço e risco
> técnico." — Taciana Serafim

**O que pode dar errado:** a checagem de mãos levantadas mostra que mais da
metade da sala ainda não tem `duckdb`. **Saída:** não é motivo para alongar
a repescagem além dos 3 minutos previstos — seguir para `ice-score` no
horário e deixar o apoio trabalhando em paralelo durante os 7 minutos
seguintes, que não competem por atenção do facilitador.

**Como cortar se atrasar:** a checagem de instalação (3min) não corta —
é justamente o mecanismo que evita que o Bloco 5 comece com metade da sala
perdida sem saber por quê. Se precisar de tempo, corte o preenchimento
manual da tabela ICE (últimos 5 min) para depois, como tarefa de leva-para-
casa — o handout já está desenhado para isso.

---

## Bloco 5 — 16h05 · 45min · Cadeira do Analytics — Code

**Modo de interação:** demo no telão, na máquina do facilitador, já com
`claude` e `duckdb` instalados e logados de antemão — isso não depende de
nada que aconteça na sala. **Atenção: isso não quer dizer que o bloco
independe de wifi.** O caminho planejado (pedir à skill em linguagem
natural: "roda srm-check em data/cro.db") passa pelo Claude Code, que
depende da API da Anthropic — sem rede, ele não responde, para ninguém, nem
para o facilitador. O que não depende de wifi são os comandos `duckdb` e
`python3` por baixo da skill, que rodam contra o arquivo local — ver a saída
de 3 níveis na tabela de travas deste bloco. Quem já tem `claude` e
`duckdb` funcionando replica em paralelo; quem não tem acompanha pelos
resultados impressos no handout (seção 6) — não fica sem exercício, fica
sem terminal.

**Objetivo:** mostrar por que `srm-check` vem antes de qualquer leitura de
resultado, e onde o lift de um teste A/B realmente aconteceu quando se
segmenta por device.

**Critério do beta — dizer isto no início do bloco, antes de abrir
qualquer terminal:**

>> "Tem acesso ao beta do analytics-copilot hoje, e não tem para todo
>> mundo. Quem sair daqui com `srm-check` rodando na própria máquina
>> entra."

**Sub-timing:**

| Janela | Duração | O quê |
|---|---|---|
| 16h05–16h07 | 2min | Critério do beta + objetivo do bloco |
| 16h07–16h20 | 13min | `srm-check` em `data/cro.db` |
| 16h20–16h23 | 3min | Transição: por que trocar de dataset |
| 16h23–16h40 | 17min | `post-test-segments` em `data/cro-clean.db` |
| 16h40–16h50 | 10min | Prática em paralelo + perguntas |

### 16h07–16h20 · `srm-check`

**O que digitar ao vivo:** o caminho planejado é pedir pelo nome à skill
("roda srm-check em data/cro.db") e deixar o Claude Code orquestrar. O
comando abaixo é **exatamente o que a skill roda por baixo** — o mesmo
texto que está impresso no handout ao lado deste passo. Vale o facilitador
saber isso de cor: é o que transforma uma queda de wifi de "bloco parado"
em "roda o mesmo comando direto no terminal, sem a skill no meio" (nível 2
da degradação — ver a tabela de travas deste bloco):

```
duckdb data/cro.db -c "SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users FROM events_clean WHERE event_name = 'session_start' AND experiment_variant IS NOT NULL GROUP BY 1 ORDER BY 1;"
```

**Na tela — resultado esperado:**

```
control     4000
variant_b   4400
```

```
python3 -c "obs=[4000,4400]; n=sum(obs); exp=[n/2,n/2]; chi2=sum((o-e)**2/e for o,e in zip(obs,exp)); import math; p=math.erfc(math.sqrt(chi2/2)); print(f'chi2={chi2:.4f}  p={p:.3e}')"
```

**Na tela:** `chi2=19.0476  p=1.275e-05` → no telão, formatar como
**χ²=19,0476 · p=1,275e-05** → veredito **🔴 SRM DETECTADO**.

Dizer: "esse teste não tem resultado para ler. `data/cro.db` tem esse
problema de propósito — é o dataset bruto, o que a skill existe para
pegar."

**O que pode dar errado (trava prevista):** alguém puxa para p-valor e poder
estatístico. **Saída:** responder em uma frase — "p-valor aqui é a chance de
essa diferença de tamanho aparecer por acaso se a divisão fosse
realmente 50/50; é bem menor que 1%, por isso o alarme" — oferecer
continuar a conversa no fim do bloco, e seguir. Não é a aula.

### 16h20–16h23 · Transição de dataset — antecipar a confusão

A sala acabou de ver a skill mandar parar diante de SRM. O próximo passo
troca para `data/cro-clean.db`. Dizer isso explicitamente, antes que alguém
pergunte:

"`cro.db` é o dataset bruto, com o problema de propósito, para vocês verem a
skill pegando. `cro-clean.db` é a versão já corrigida — é nela que a
análise segmentada faz sentido. Não é a mesma régua sendo ignorada, é o
próximo degrau."

### 16h23–16h40 · `post-test-segments`

**Antes de chamar a skill — fechar a pré-condição (~30s):** `post-test-segments`
tem uma regra dura: só roda se o veredito de `srm-check` for 🟢. O único
veredito que a sala viu até agora foi 🔴 (em `cro.db`). Sem rodar `srm-check`
em `cro-clean.db` primeiro, a skill está sendo chamada logo depois do único
veredito da sessão ter sido vermelho — e pode recusar ou pedir confirmação
ao vivo. Rodar rápido, ainda dentro deste bloco, antes de pedir
`post-test-segments`:

```
duckdb data/cro-clean.db -c "SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users FROM events_clean WHERE event_name = 'session_start' AND experiment_variant IS NOT NULL GROUP BY 1 ORDER BY 1;"
```

**Resultado esperado:** `control 4000` / `variant_b 4000` → distribuição
perfeita, χ²=0, p=1,0000 → veredito **🟢 SEM SRM**. Dizer: "mesmo teste,
distribuição corrigida — e ele passa. Agora sim dá pra ler o resultado."
Só então pedir `post-test-segments`.

**Agregado:**

```
duckdb data/cro-clean.db -c "SELECT experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users, COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END) AS conv, ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)/COUNT(DISTINCT user_pseudo_id),2) AS cr FROM events_clean WHERE experiment_variant IS NOT NULL GROUP BY 1 ORDER BY 1;"
```

control 4,33% → variant_b 5,30% (lift agregado +22,4%).

**Por device:**

```
duckdb data/cro-clean.db -c "SELECT device_category, experiment_variant, COUNT(DISTINCT user_pseudo_id) AS users, ROUND(100.0*COUNT(DISTINCT CASE WHEN converted=1 THEN user_pseudo_id END)/COUNT(DISTINCT user_pseudo_id),2) AS cr FROM events_clean WHERE experiment_variant IS NOT NULL GROUP BY 1,2 ORDER BY 1,2;"
```

| Device | Control CR | Variant CR | Lift relativo |
|---|---|---|---|
| desktop | 4,19% | 4,88% | +16,5% |
| mobile | 4,23% | 7,17% | +69,5% |
| tablet | 4,56% | **3,78%** | **-17,1%** |

**Este é o número que sustenta a fala sobre decisão.** Parar aqui e deixar a
tela com o tablet negativo visível por alguns segundos antes de falar.

Dizer: "segmento com lift negativo é achado, não ruído. Um teste que ganha
no mobile e perde no tablet é decisão de rollout segmentado, não vencedor
simples."

Recomendação, com vocabulário exato (não sinônimo):

| Decisão | Quando |
|---|---|
| Implementar | A evidência sustenta a mudança e os guardrails ficaram estáveis. |
| Iterar | A direção parece certa, mas a execução pode melhorar. |
| Investigar | A evidência não é suficiente. Precisamos entender melhor. |
| Abandonar | A hipótese não se sustentou. Aprendemos algo sobre o usuário. |
| Nova hipótese | O resultado revelou um comportamento que não esperávamos. |

Recomendação para este resultado: **Iterar** — agregado +22,4% e mobile
+69,5% sustentam a direção, mas o tablet (-17,1%) precisa de ajuste antes
de um rollout nos três devices.

### 16h40–16h50 · Prática em paralelo

Quem tem ambiente pronto roda os mesmos comandos na própria máquina;
facilitador circula (ou o apoio circula, se o facilitador estiver
segurando perguntas). Quem não tem ambiente confere os números contra o
handout impresso.

**O que pode dar errado:**

| Trava | Sinal | Saída |
|---|---|---|
| Wifi caiu | Claude Code para de responder para a sala inteira (a invocação da skill em linguagem natural depende da API da Anthropic; sem rede, `claude` não roda, mesmo com `duckdb` e o dado 100% locais) | Degradação em 3 níveis: **(1)** com wifi, pede à skill em linguagem natural, como planejado; **(2)** sem wifi, digita direto no terminal o comando `duckdb`/`python3` impresso no handout ao lado do passo — é exatamente o que a skill executava por baixo, o resultado é o mesmo, só sem a conversa; **(3)** sem wifi e sem ambiente (`duckdb` não instalado), acompanha as demos gravadas `04-contingencia-srm.mp4` e `05-contingencia-segmentos.mp4` (`notes/video-spec.md`) mais o handout impresso |
| Muita gente sem `duckdb` mesmo depois da repescagem | Mais de metade da sala só observando | Manter o ritmo da demo no telão; não alongar o bloco por isso — a repescagem do Bloco 4 já foi o ponto de decisão |

**Como cortar se atrasar:** primeiro corte os 10 minutos de prática em
paralelo (passam a ser "pratique depois, com o handout"); depois, se ainda
faltar tempo, encurte a explicação do agregado (`post-test-segments` passo
1) para uma frase e vá direto para a tabela por device — é ela que carrega
o achado que a tarde precisa. Nunca corte o `srm-check` nem a tabela por
device com o tablet negativo.

---

## Bloco 6 — 16h50 · 25min · Cadeira do Dev — Code

**Primeiro candidato a cair inteiro** se a Taciana atrasou de manhã e comeu
tempo do dia (ver tabela de travas gerais, no fim deste documento). Se este
bloco for cortado, pular direto para o Bloco 7 (17h15) e mencionar
`variante-builder` e `pre-flight-check` só de passagem, remetendo ao
handout (seção 7) para quem quiser reproduzir sozinho.

**Objetivo:** mostrar o caminho da hipótese fechada até o código da
variante, e por que o checklist pré-Start barra um teste sem métrica
declarada.

**Sub-timing:**

| Janela | Duração | O quê |
|---|---|---|
| 16h50–16h58 | 8min | `variante-builder` a partir da hipótese de referência |
| 16h58–17h02 | 4min | Conferir os arquivos gerados |
| 17h02–17h13 | 11min | `pre-flight-check` |
| 17h13–17h15 | 2min | Frase de fechamento da Taciana |

### 16h50–16h58 · `variante-builder`

Usar a hipótese de referência da Taciana (CEP no checkout mobile), já que
nem toda a sala vai chegar aqui com uma hipótese própria fechada:

> "A hipótese é: se adicionarmos auto-preenchimento por CEP no checkout
> mobile, então o completion aumentará 20%, porque 68% dos usuários mobile
> abandonam nessa etapa. Gera a variante e roda o pre-flight."

**Na tela:** a skill escreve `variante-b.js` (guard de escopo por URL,
idempotência, push no `dataLayer`) e `eventos.md` na pasta atual.

### 16h58–17h02 · Conferir

```
ls -la variante-b.js eventos.md
node --check variante-b.js
```

No Windows, o equivalente do `ls -la` é `Get-ChildItem variante-b.js,
eventos.md` no PowerShell; `node --check variante-b.js` roda igual nos dois
sistemas.

Sem erro no `node --check` = sintaxe válida. Dizer o aviso que a própria
skill sempre encerra dizendo: "este código não foi testado no seu site."

### 17h02–17h13 · `pre-flight-check`

Pedir: "roda o pre-flight nessa variante". Os 8 itens são vocabulário exato
da Taciana (não sinônimos):

1. Hipótese escrita e compartilhada
2. Controle definido e no ar
3. Audiência e segmentação corretas
4. QA aprovado em browsers diferentes
5. Métrica primária e guardrails definidos
6. Variante validada em mobile e desktop
7. Eventos disparando nas duas versões
8. Flickering e performance verificados

Com o exemplo usado (sem tamanho de amostra nem critério de parada
declarados), esperar: `🔴 NÃO SUBA — item 5 (métrica primária e
guardrails)`. Dizer isso em voz alta antes de rodar, como previsão — o
acerto reforça que a skill não é decorativa.

### 17h13–17h15 · Fechamento do bloco

> "Só então: START. Um erro de implementação não aparece no resultado — ele
> aparece como um resultado que ninguém consegue explicar." — Taciana
> Serafim

**O que pode dar errado:**

| Trava | Sinal | Saída |
|---|---|---|
| Ninguém tem hipótese própria fechada | Perguntas de "e a minha?" atrapalhando o ritmo | Usar só o exemplo de referência para a demo; quem quiser aplicar na própria hipótese faz depois, com o handout |
| `node --check` não está disponível na máquina de alguém | Pessoa trava tentando validar | Pular a validação de sintaxe para quem não tem Node — o importante pedagógico é o conteúdo dos dois arquivos gerados, não a validação em si |

**Como cortar se atrasar:** primeiro corte a conferência de arquivos
(`ls` + `node --check`, 4min) e vá direto do output da skill para o
`pre-flight-check`; se ainda faltar tempo, corte o bloco inteiro (ver nota
no topo) — ele é o primeiro a cair no cronograma geral.

---

## Bloco 7 — 17h15 · 20min · Segunda parede → copilot

**Objetivo:** mostrar honestamente o que falta entre "rodou no meu dataset
preparado" e "roda no seu GA4, toda segunda, sem terminal" — e apresentar o
analytics-copilot como a resposta a essa lacuna, com os 3 vídeos de demo
(`notes/video-spec.md`) tocando nos pontos certos.

**Sub-timing:**

| Janela | Duração | O quê |
|---|---|---|
| 17h15–17h16 | 1min | Fala de abertura + Vídeo 1 (slide 13, 45s) |
| 17h16–17h18 | 2min | Quatro itens nomeados (slide 14) + frase honesta de cada |
| 17h18–17h19 | 1min | Vídeo 2 (slide 15, 60s) — o copilot respondendo |
| 17h19–17h20 | 1min | Vídeo 3 (slide 16, 30s) — o pipeline, reforçando "Agendamento" |
| 17h20–17h35 | 15min | Perguntas da sala + transição para o Bloco 8 |

### 17h15–17h16 · Abertura + Vídeo 1

>> "Isso rodou no meu dataset, que eu deixei pronto pra vocês. Pra rodar no
>> SEU GA4, toda segunda, sem você abrir o terminal — o que falta?"

**Na tela:** avançar para o slide 13 e **clicar em play no vídeo**
(`01-custo-setup.mp4`, 45s — o player tem `controls`, é clique simples).
Narrar por cima, ao vivo, enquanto o vídeo roda mudo:

"Isso que vocês viram nos últimos comandos rodou porque o dataset já
estava pronto. Pra rodar isso no SEU GA4 — não no meu — alguém passa por
isto primeiro: escolher a property certa, autorizar o acesso, esperar o
export terminar, e montar o schema que as skills esperam. Não é um passo,
são vários, e o relógio não para durante nenhum deles."

### 17h16–17h18 · Os quatro itens

**Na tela:** slide 14, listar os quatro itens (vocabulário do handout,
seção 8):

- OAuth
- ETL
- Agendamento
- Manutenção de schema

Para cada um, uma frase honesta (não suavizada) — usar o texto do handout
como referência: OAuth é "fluxo de permissão real, por conta, que alguém
precisa configurar e manter"; ETL é "alguém precisa extrair, transformar e
carregar esses dados toda vez, de forma confiável"; Agendamento é "alguém —
pessoa ou rotina — precisa disparar no dia certo, e reagir quando falhar
silenciosamente"; Manutenção de schema é "cada mudança no GA4 é uma chance
de as queries pararem de funcionar sem avisar".

### 17h18–17h19 · Vídeo 2 — o copilot respondendo

>> "Foi exatamente por isso que a gente construiu o analytics-copilot."

**Na tela:** avançar para o slide 15 e clicar em play
(`02-copilot.mp4`, 60s). Narrar por cima:

"A mesma pergunta que a gente acabou de responder na mão, com o terminal e
o dataset que eu preparei — aqui, em linguagem natural, sem terminal, sem
setup, contra o dado real do negócio. É a mesma tabela, o mesmo achado do
tablet. A diferença é que ninguém aqui precisou saber o que é SRM para
chegar nela."

### 17h19–17h20 · Vídeo 3 — o pipeline rodando sozinho

**Na tela:** avançar para o slide 16 e clicar em play
(`03-pipeline.mp4`, 30s). Narrar por cima, reforçando especificamente o
item "Agendamento":

"Isso é o que o `cro-weekly-pipeline` faria se vocês tivessem essa
infraestrutura rodando: toda segunda, sem ninguém abrir terminal, sem
ninguém lembrar de rodar nada — o relatório já está esperando."

**O que pode dar errado:** a sala pergunta preço/prazo/disponibilidade do
beta antes do CTA formal. **Saída:** responder que os detalhes vêm no
fechamento e na conversa individual do buffer final; não interromper o
fio dos quatro itens para negociar acesso ao vivo.

**O que pode dar errado (vídeos):** o arquivo `.mp4` de algum dos três
vídeos não está na máquina de demonstração (ver pendência em
`notes/video-spec.md`, "Status de gravação"). **Saída:** pular a
reprodução daquele vídeo específico e narrar a cena descrita em
`notes/video-spec.md` como se fosse contada, não mostrada — a legenda
abaixo do vídeo no slide já diz de qual demo se trata, então a sala não
fica sem contexto; não travar o bloco tentando resolver o arquivo faltante
ao vivo.

**Como cortar se atrasar:** primeiro, encurtar a frase de cada um dos 4
itens para uma linha só. Se ainda faltar tempo, corte o Vídeo 3 (é o mais
curto e o menos crítico dos três — reforça "Agendamento", que já foi dito
em palavras no item da lista); nunca corte o Vídeo 2, é a prova visual do
CTA.

---

## Bloco 8 — 17h35 · 10min · Fechamento

**Objetivo:** fechar o dia com o ciclo real da Taciana (slide 6, "Um ciclo
contínuo jogado por um time") — não uma lista das 7 skills, mas os 7 passos
dela, mapeados contra o que a sala efetivamente cobriu hoje. O encaixe é
imperfeito de propósito: os passos que ficam descobertos são o argumento do
bloco seguinte já dado (17h15) e o gancho natural para o CTA.

**Na tela:** a tabela dos 7 passos, com uma coluna extra marcando o que foi
coberto hoje.

**Falas-chave:**

Abrir citando o nome do ciclo, sem parafrasear:

>> "A Taciana fechou a manhã com isto: 'um ciclo contínuo jogado por um
>> time'. Sete passos. Vamos ver quantos a gente cobriu nas últimas três
>> horas."

Passar pelos 7 passos, pelo nome exato dela, marcando coberto/descoberto:

| # | Passo (nome exato) | Coberto hoje por | Status |
|---|---|---|---|
| 1 | Coleta de Dados | — | **descoberto** |
| 2 | Análise | `heuristica-morys`, `srm-check`, `post-test-segments` | coberto |
| 3 | Hipóteses | `hipotese-estruturada` | coberto |
| 4 | Priorização | `ice-score` | coberto |
| 5 | Testes | `variante-builder`, `pre-flight-check` | coberto |
| 6 | Relatórios | — | **descoberto** |
| 7 | Escala | — | **descoberto** |

>> "Quatro dos sete passos do ciclo dela, cobertos em três horas, com uma
>> skill em cada um. Os três que faltam — Coleta de Dados, Relatórios e
>> Escala — não são acaso: são exatamente os três que pedem infraestrutura
>> contínua, não uma conversa pontual. É o mesmo problema que a gente já
>> nomeou às 17h15: OAuth, ETL, agendamento, manutenção de schema."

Fechar com a frase do rodapé do slide 6, também literal:

>> "CRO é um esporte coletivo: nenhuma dessas competências resolve
>> conversão sozinha, e nenhuma etapa do ciclo pertence a uma única pessoa.
>> Em times pequenos, alguém acumula vários papéis; em times maduros, eles
>> se distribuem entre especialistas."

E a frase de continuidade do ciclo, para amarrar com "segunda-feira
seguinte" do handout:

>> "O passo 7 alimenta o passo 1: o aprendizado de uma rodada define onde a
>> próxima começa."

**Para levar (conteúdo do handout, seção 9 — só apontar, não reler):**

- Repositório: `github.com/lucianfialho/talks-2026`, pasta
  `05-imersao-cro/`.
- Reinstalação do zero: `skills/README.md`.
- Ação de segunda-feira: `heuristica-morys` numa página real →
  `hipotese-estruturada` no achado mais fraco → `ice-score` se tiver mais
  de uma ideia.
- Quem entrou no beta (critério anunciado às 16h05): confirmar acesso
  individualmente com o facilitador — isso vira o assunto do buffer.

**O que pode dar errado:** este fechamento tem mais conteúdo do que a
versão anterior (7 passos nomeados + mapeamento + 3 citações literais +
"para levar") — 10 minutos é apertado mesmo cortando tudo que dá para
cortar. **Estimativa honesta: isto tende a estourar para 12–13 minutos** em
ritmo de palco normal, não só em ensaio malfeito. **Saída:** este é
exatamente o tipo de estouro para o qual o Bloco 9 (buffer, 15min) existe —
não espremer o conteúdo para caber à força nos 10min; se passar 2-3
minutos, é o buffer absorvendo, não um erro de execução.

**Como cortar se atrasar (além de usar o buffer):** primeiro corte o "para
levar" (é 100% redundante com o handout impresso, que a sala já tem em
mãos); depois, se ainda faltar tempo, corte a citação de continuidade
("o passo 7 alimenta o passo 1") e a frase do rodapé, mantendo só a tabela
dos 7 passos e a linha "quatro de sete, e os três que faltam pedem
infraestrutura" — é ela que carrega o gancho para o CTA. Nunca corte a
tabela dos 7 passos nem a marcação dos 3 descobertos: é o fechamento do
arco do dia.

---

## Bloco 9 — 17h45 · 15min · Buffer

**Objetivo:** absorver qualquer atraso acumulado, responder perguntas
individuais, confirmar acesso ao beta pessoa a pessoa, e dar suporte final
a quem ainda está travado em alguma instalação.

**Uso, em ordem de prioridade se o tempo for curto:**

1. Se o dia atrasou, este é o tempo que absorve — não é preciso avisar a
   sala que "isso era buffer", só usar.
2. Confirmação individual de acesso ao beta do analytics-copilot para quem
   cumpriu o critério das 16h05.
3. Perguntas que ficaram pendentes dos blocos anteriores (em especial a
   pergunta de estatística do Bloco 5, se alguém quis continuar depois).
4. Suporte final de instalação para quem ainda não conseguiu Claude Code
   ou DuckDB — sem pressa, a sala já está tecnicamente encerrada aqui.

**O que pode dar errado:** nada específico — é o próprio amortecedor do
dia. Se sobrar buffer inteiro sem uso, está tudo bem; não é obrigatório
preencher os 15 minutos com conteúdo novo.

---

## Pontos de trava gerais (não ligados a um bloco só)

| Trava | Sinal | Saída |
|---|---|---|
| Instalação estourou o break | Mais de 10 pessoas ainda tentando às 15h50 | Rodar `ice-score` (Desktop) e deixar o apoio circulando; ele é o bloco que existe justamente para isso |
| Taciana atrasou e comeu tempo | Começar depois das 15h05 | Cortar o bloco da cadeira do Dev (16h50, 25min) inteiro; ele é o primeiro a cair |
| Wifi caiu | No Bloco 5 (Analytics, Code): Claude Code para de responder para a sala inteira, porque invocar a skill em linguagem natural depende da API da Anthropic — `duckdb` e o dado são locais, mas isso não ajuda se ninguém consegue chegar até eles pela skill. Nos blocos de CRO (Desktop): skills param igual, mesmo motivo | No Bloco 5, degradação em 3 níveis — ver a tabela de travas desse bloco: (1) pedir à skill normalmente, (2) sem wifi, digitar direto o comando `duckdb`/`python3` impresso no handout (mesmo resultado, sem a conversa), (3) sem wifi e sem ambiente, demos gravadas `04-contingencia-srm.mp4`/`05-contingencia-segmentos.mp4` (`notes/video-spec.md`) + handout impresso. Nos blocos de CRO, não há comando local equivalente — a saída é seguir só com quem já tem ambiente e reforçar que o material fica disponível para depois |
| Pergunta longa sobre estatística no bloco de SRM | Uma pessoa puxando para p-valor e poder | Responder em uma frase, oferecer conversar no fim, seguir. Não é a aula. |
| Ninguém tem página própria para analisar | Bloco das 15h08 trava | Ter 3 URLs de e-commerce brasileiro prontas no slide, para quem não trouxe |
| Quem só instalou Claude Code (sem DuckDB) chega ao Bloco 5 | Pessoa com terminal funcionando mas `duckdb: command not found` | Ela acompanha o Bloco 5 pelos resultados impressos no handout (seção 6), não pelo próprio terminal; instala o DuckDB depois, em casa — não é possível rodar `srm-check` ou `post-test-segments` sem ele, e fingir que dá seria pior do que admitir o limite |
