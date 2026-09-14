# Caminho — bloco da tarde

> Desenhado em conjunto, 13/09. Só entra aqui o que o Lucian desenhou ou aprovou.

## 1. Pesquisa qualitativa (na sala, mão levantada)

- Quem aqui usa ou já usou o Claude?
- Quem aqui usa ou já usou o Claude Code?
- Quem aqui usa o Claude Code no terminal?

## 2. Apresentação

## 3. Back to Basics

### A importância de fazer a jornada do seu usuário
↔ conecta com "Dividir a jornada em etapas" (abaixo)

### A importância do plano de mensuração
- Definir quais informações enriquecem cada comportamento
- Dividir a jornada em etapas  ↔ conecta com "fazer a jornada do seu usuário"
- Material complementar sobre plano de mensuração

### A importância de usar dados qualitativos — enriquecimento de contexto
> Precisa vir cedo: esses dados são o que dá o contexto pra tudo que vem depois.

- Uso de ferramentas de pesquisa onsite
- Pesquisas internas
  - **Identificar principais objeções** — com o time de vendas
  - **Entender perfil demográfico dos usuários atuais** — olhar pra dentro de casa,
    não pra fora: você é e-commerce, é tech, puxa os dados de quem já comprou e
    monta o traço demográfico a partir deles
  - **Conexão com dados do SAC** — **case Ering**: conectar os dados do Zendesk
    pra montar um backlog pautado no que foi extraído do SAC. IA lendo todas as
    reclamações do mês pra achar a principal dor com o site. (IA pra código
    já está muito avançada — dá pra fazer o extrator, ou analisar direto.)

### Fecha o nó: tudo isso cabe num arquivo — `CRO.md`
> Decisão 2026-09-13. É o CLAUDE.md da loja: o que o aluno aprendeu "antes de
> aprender" vira contexto pro Claude. Convenção do workshop, não spec de mercado.

- 8 seções: Negócio · Jornada em etapas · Plano de mensuração · Segmentos ·
  Voz do cliente (SAC, vendas) · Perfil demográfico · Testes e backlog · Design → DESIGN.md
- **Três preenchidas ao vivo** (Jornada, Plano de mensuração, Voz do cliente);
  as outras cinco vão no template em `aluno/CRO.md`
- Os hooks passam a exigir a seção "Plano de mensuração" do CRO.md (não mais
  um `plano-de-mensuracao.md` separado)

## 4. Claude Code Desktop ou Terminal — quais as diferenças?

- Claude Code Desktop — o que se perde
  - Compor com outras ferramentas: pipe, scripts, gmp-cli
  - Rodar sem ninguém na frente: automação, agendamento
  - Rodar fora da sua máquina: servidor, SSH
- Claude Code no terminal — o que se perde
  - Interface visual: ver o diff do que mudou, navegar os arquivos
  - Curva de entrada: quem nunca abriu terminal trava
  - Várias conversas abertas, lado a lado, e voltar nelas

## 5. Instalar — e o Claude conceitualmente
> Não é só instalar e abrir. É instalar e explicar como funciona.
> Ordem interna talvez diferente da listada.

- Instalar. A ideia é trabalhar direto no **Claude Code terminal**
- Por que terminal: mais acesso, conectar coisas, gerenciar a extensão do Chrome
  (**Claude in Chrome**)
- Conceitos básicos, em cima de como o Claude Code funciona:
  - o que é uma **skill**
  - o que é um **hook** (na live de julho saiu como "web hook" na transcrição —
    é a mesma coisa; não existe webhook no Claude Code)
  - **MCPs**
  - **Claude in Chrome** como conceito (a demo fica pro nó 11)
  - **engenharia de contexto**, `design.md`
- (o material que já existe sobre esses conceitos pode ser reaproveitado)

## 6. Rodando o Claude Code pela primeira vez (`claude --help`)

- **Parâmetros essenciais**
  - `--system-prompt <prompt>`
  - `--remote-control`
  - `--chrome`
  - `--resume`
- **Slash commands**
  - `/login`
  - `/model`
  - `/effort`
  - `/mcp`
  - `/<skill-name>`

## 7. Escolhendo o modelo — o que é melhor para cada tipo de tarefa no caso de CRO

> Regra prática: **começa no Sonnet. Sobe se errou, desce se foi fácil.**

- **Haiku** — volume. Classificar 500 reclamações do SAC por tema, extrair objeções de
  transcrição de vendas. Barato o bastante pra rodar todo dia.
- **Sonnet** — o dia a dia. Gerar hipótese do que a heurística achou, rascunhar copy de
  variante, resumir relatório de teste.
- **Opus** — raciocínio pesado. Priorizar backlog grande com muita variável cruzada,
  escrever e revisar uma skill de processo. Quando errar custa caro.
- **Fable** — o topo. Cruzar várias fontes de uma vez (SAC + analytics + jornada), auditar
  um plano de mensuração inteiro. Usar com parcimônia pelo custo.

## 8. Enriquecer o contexto — do ponto de vista de design
> O mesmo "enriquecimento de contexto" do Back to Basics, agora pro Claude.

- Falar sobre a **especificação criada pelo Google para extração de design system**
- Talvez criar uma **skill que detecte esse design system**
  - dá pra usar uma skill pronta como base
- Fecha com **dois arquivos, uma loja**: `CLAUDE.md` na pasta da loja com
  `@CRO.md` (como a loja converte) e `@DESIGN.md` (como a loja parece).
  Abriu o terminal na pasta, rodou `claude`, ele já leu os dois.

## 9. Anatomia de uma skill — a receita

1. **Onde mora** — `~/.claude/skills/<nome>/SKILL.md`. O nome da pasta vira o comando `/<nome>`
2. **A etiqueta** — `name` e `description` no topo. A `description` é o que faz ela disparar
   sozinha ("use quando o usuário disser…"). A parte mais importante e mais negligenciada
3. **Ingredientes** — o que ela precisa receber: URL, arquivo, dado colado. O que perguntar antes
4. **Modo de preparo** — os passos, em ordem, executáveis. "Analise" não é passo;
   "rode esta query e compare com X" é
5. **O que ela recusa** — onde para e pede mais informação em vez de inventar
6. **Como sai** — formato fixo do output, pra comparar entre rodadas
7. **Dissecar uma ao vivo** — abrir `heuristica-morys` e apontar cada parte

## 10. Análise — trazer os dados de comportamento
> Callback na etapa 2 da Taciana. Aqui o gmp-cli ganha aplicabilidade.

- **gmp-cli** pra puxar os dados de comportamento (GA4)

## 11. Geração de hipótese
> Callback na etapa 3 da Taciana. Aqui o Claude in Chrome ganha aplicabilidade.

- **Claude in Chrome** navega o site fazendo a jornada — e a heurística roda em cima do
  que ele viu (não é gravação de sessão; é ele percorrendo)
- Aplicar **Morys** (`heuristica-morys`)

## 12. ( … )
