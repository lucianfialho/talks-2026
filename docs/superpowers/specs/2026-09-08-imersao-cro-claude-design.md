# Imersão Claude para CRO — Módulo da tarde (Lucian) — Design

**Data do design:** 2026-09-08
**Evento:** [Imersão Claude para CRO](https://crobrasil.com.br/imersao-claude/) — CRO Brasil
**Data do evento:** 2026-09-14 (D-6 no momento deste design)
**Local:** Distrito · Av. Rebouças, 1585, São Paulo — presencial, 50 vagas
**Meu bloco:** 15h00–18h00 (3h)
**Facilitadores:** Alexandre Messina (manhã), Taciana Serafim (14h–15h), Lucian Fialho (15h–18h)

---

## 1. Contexto

### O que acontece antes de mim

**Manhã (09h–12h) — Alexandre Messina, "Dominando o Claude"**
- Bloco 0: modelo das 3 camadas
- Bloco 1: Claude AI (projetos, artefatos, conectores, skills)
- Bloco 2: Claude Cowork
- Bloco 3: Claude Code — rotinas, automações, primeiro contato prático

**Tarde, 14h–15h — Taciana Serafim, "Fundamentos de CRO"** (44 slides, material recebido)

Conteúdo dela, na ordem:
1. O que é CRO, cálculo de taxa, caso de +R$34,7M com +0,06pp
2. Benchmarks de mercado (Dynamic Yield 2,5% / Unbounce 6,6%)
3. **Ciclo contínuo de 7 passos** — passo 7 alimenta o passo 1
4. **Quatro posições:** Digital Analytics (defesa) · Estrategista de CRO (armação) · UX/Research (criação) · Dev/Experimentação (ataque)
5. **Três transformações:** Analytics transforma comportamento em evidência · CRO transforma evidência em hipótese · Dev transforma hipótese em experimento
6. "E quando você não tem esse time?" — **quatro cadeiras, uma agenda**
7. Mapa da Conversão no Brasil 2026 (179 diagnósticos, score médio 53)
8. **Heurística de André Morys — 7 dimensões:** Relevância, Confiança, Orientação, Estímulo, Segurança, Conveniência, Confirmação
9. Cialdini — 6 princípios de persuasão
10. Copywriting, Eugene Schwartz (níveis de consciência), AIDA, voz do cliente
11. **Template de hipótese:** `Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência]`
12. **ICE Score** (Impacto × Confiança × Facilidade)
13. Métodos de teste, checklist pré-Start, leitura de resultado ("winner/loser é leitura pobre")
14. Slide 43: os 4 papéis — *"cada uma delas vira um prompt melhor"*
15. **Slide 44 (último): "O próximo desafio não é usar o Claude. É transformá-lo em parte do seu processo de CRO."**

O slide 44 é o gancho. Meu bloco começa exatamente nessa frase.

### Público

CRO & Growth, Marketing, Produto, Dados & Analytics, empreendedores, times de e-commerce. Pré-requisito declarado: **conta Claude Pro ativa** — não Claude Code, não terminal. Assumir maioria não-técnica.

### Promessas da página de vendas (contrato a cumprir)

- Pacote de Skills de CRO prontos
- Hipótese estruturada a partir de insight real
- Certificado de participação

### Objetivo de negócio

Enviesar o aluno em direção ao **analytics-copilot**. Acesso beta disponível no dia, porém **limitado** — não há acesso para os 50.

---

## 2. Tese central

> **"Vamos preencher as quatro cadeiras. Uma skill por cadeira. E em 40 minutos você vai descobrir que a ferramenta que você escolheu preenche uma só."**

A Taci instala o vocabulário de "quatro cadeiras, uma agenda". Eu reutilizo esse vocabulário em vez de introduzir um novo. A limitação do Claude Desktop deixa de ser uma comparação de features e passa a ser uma **cadeira que fica vazia** — que é o problema que ela já nomeou.

### Mapa cadeira → skill → degrau

| Cadeira (Taci) | Transformação | Skill | Roda no Desktop? | Degrau |
|---|---|---|---|---|
| Estrategista de CRO | evidência → hipótese | `heuristica-morys`, `hipotese-estruturada`, `ice-score` | ✅ sim — é repertório, não execução | 1 |
| Digital Analytics | comportamento → evidência | `srm-check`, `post-test-segments` | ❌ precisa ler dado e calcular | 2 |
| Dev / Experimentação | hipótese → experimento | `variante-builder`, `pre-flight-check` | ❌ precisa escrever arquivo | 2 |
| UX / Research | desenhar experiência | — fora do escopo, **declarado em voz alta** | — | — |

### A escada de 3 degraus

| Degrau | Ferramenta | O que a skill consegue fazer | Cobertura na sala |
|---|---|---|---|
| 1 | Claude Desktop / Pro | Método salvo. Roda sobre contexto colado pelo aluno. | 50/50 |
| 2 | Claude Code | Lê dado local, executa SQL/estatística, escreve arquivos, chama CLI. | quem instalar |
| 3 | analytics-copilot | Roda sozinha, no dado real do aluno, sem setup. | acesso limitado |

**A dor do degrau 2 é o argumento de venda do degrau 3.** O aluno sente o custo de setup no próprio teclado; o copilot é apresentado como remoção desse custo, não como slide de propaganda. Nenhuma skill é capada de propósito — a limitação demonstrada é real.

---

## 3. Estrutura da tarde (15h–18h)

**Break do evento: 15h30–15h50 (20min).** Confirmado com o Lucian em 2026-09-08.

O break cai exatamente onde estaria o bloco de instalação — o trecho de maior risco operacional do dia. Decisão: **a instalação do Claude Code acontece durante o café**, de forma voluntária e assistida, em vez de consumir tempo de aula.

#### Antes do break — 15h00 às 15h30 (30min)

| Tempo | Duração | Bloco | Objetivo |
|---|---|---|---|
| 15h00 | 8min | **Quatro cadeiras** | Pegar o slide 44 da Taci e virar tese. Mapa do que vai ser construído. |
| 15h08 | 22min | **Cadeira do CRO — Desktop** | `heuristica-morys` + `hipotese-estruturada` criadas ao vivo. Todos os 50 entregam. Aluno sai com hipótese real da própria página. |

O bloco termina na **parede**: `hipotese-estruturada` se recusa a completar o campo `porque [evidência]` porque o aluno não tem dado, e o Desktop não consegue buscar. Esse é o último momento antes do café — a sala vai para o intervalo com a pergunta aberta.

#### O break — 15h30 às 15h50 (20min)

Anúncio antes de liberar: *"O guia de instalação do Claude Code está no handout, página X. Quem quiser sair na frente instala enquanto toma café — eu fico aqui."*

- Instalação **voluntária**, nunca obrigatória — ninguém é forçado a trabalhar no intervalo
- Facilitador e apoio ficam na sala para desempate
- Dataset (`cro.db`) distribuído por pendrive/local, sem depender do wifi
- Ganho: o bloco de maior risco sai do caminho crítico da aula

#### Depois do break — 15h50 às 18h00 (130min)

| Tempo | Duração | Bloco | Objetivo |
|---|---|---|---|
| 15h50 | 15min | **`ice-score` — Desktop** | Retomada que inclui todo mundo, inclusive quem não instalou. Em paralelo, instalação assistida para os retardatários. Fecha o pacote de skills do degrau 1. |
| 16h05 | 45min | **Cadeira do Analytics — Code** | `srm-check` + `post-test-segments` rodando SQL e chi-quadrado em `cro.db` real. Responde a parede de 15h30. |
| 16h50 | 25min | **Cadeira do Dev — Code** | `variante-builder` + `pre-flight-check` (slide 41 dela). |
| 17h15 | 20min | **Segunda parede → copilot** | "Rodou no MEU dataset. E no SEU GA4, toda segunda, sozinho?" Demo gravada do copilot. |
| 17h35 | 10min | **Fechamento** | Ciclo de 7 passos da Taci com uma skill em cada etapa. Repo + acesso beta. |
| 17h45 | 15min | **Buffer** | Absorve atraso da Taci, break estendido ou instalação assistida que estourou. |

### Contrato cumprido antes do café

"Hipótese estruturada a partir de insight real" sai **aos 30 minutos, antes do café**, no Desktop. O "pacote de Skills" fecha às 16h05, também no Desktop. Ambos com risco operacional próximo de zero. **Se a instalação do Claude Code falhar para metade da sala, o curso já entregou o que vendeu antes do intervalo.** Este é o seguro do design e a razão de a ordem ser Desktop-primeiro.

### Mecânica do acesso beta

Não há acesso para 50. **Não sortear.** Critério declarado no início do bloco 3: quem chegar ao degrau 2 com skill rodando entra no beta. Converte escassez em incentivo em vez de frustração, e seleciona os betas mais qualificados da sala.

---

## 4. Skills — especificação

Cada skill existe em **duas versões** no repo: `desktop/` (instruções para Projects do Claude Desktop) e `code/` (SKILL.md com frontmatter para Claude Code). A existência das duas versões é o que torna a comparação tangível — o aluno lê o mesmo método e vê o que cada camada consegue executar.

### Degrau 1 — Desktop (15h08 e 15h50)

**`heuristica-morys`**
Varredura nas 7 dimensões da Taci: Relevância, Confiança, Orientação, Estímulo, Segurança, Conveniência, Confirmação. Input: URL + screenshot colado pelo aluno (Desktop não navega). Output: score por dimensão + achado por dimensão.

**`hipotese-estruturada`**
Implementa o template dela literalmente: `Se [X], para [segmento Y], então [Z], porque [evidência]`, com os 4 campos (Observação / Intervenção / Resultado esperado / Evidência). **Recusa-se a completar sem evidência** — este é o comportamento que constrói a parede do bloco seguinte. Se o aluno não tem dado, a skill diz o que falta e por quê.

**`ice-score`**
Impacto × Confiança × Facilidade (1–10). Recebe N hipóteses, devolve backlog ranqueado. Segue o aviso dela: ranking relativo, não veredito.

### Degrau 2 — Claude Code (16h05 e 16h50)

**`srm-check`** — já existe em `02-cro/demos/skills/`. Reaproveitável quase como está. Lê `cro.db` (DuckDB), chi-quadrado sobre distribuição por variante.

**`post-test-segments`** — já existe. Segmenta lift por device / novo-vs-recorrente / canal. Depende de `srm-check` rodar antes.

**`variante-builder`** — nova. Recebe a hipótese estruturada do degrau 1 e gera o código da variante (HTML/CSS/JS) + eventos de instrumentação. Cobre o slide 40 dela (Construir / Configurar / Instrumentar / Validar).

**`pre-flight-check`** — nova. Checklist "o que checar antes de apertar Start" (slide 41 dela) como skill executável.

### Degrau 3 — demo apenas (17h15)

`cro-weekly-pipeline` (existe, depende de `gmp-cli`) e `ab-suggest` (skill global, depende de `agent-browser`) **não entram no hands-on**. Viram a demo da segunda parede, onde o custo de setup é o argumento.

### Correção necessária no substrato existente

A `heuristic-scan` atual em `02-cro/demos/skills/` é **técnica** (WCAG, thumb zone, tap targets 44px) e não corresponde à heurística de Morys. Usá-la como está criaria dois vocabulários diferentes na mesma tarde. Decisão: `heuristica-morys` é escrita nova nas 7 dimensões da Taci; a `heuristic-scan` técnica é mantida como camada avançada opcional do degrau 2.

---

## 5. Instalação do Claude Code — design de sobrevivência

Este é o ponto de maior risco do dia: 50 pessoas majoritariamente não-técnicas instalando Node + Claude Code em Windows e macOS, em wifi de evento.

**Decisão estrutural: a instalação acontece no break das 15h30, não em tempo de aula.** Voluntária, assistida, com repescagem às 15h50 em paralelo ao `ice-score` (que roda no Desktop e não exclui quem ficou para trás).

**Mitigações:**
- Guia por SO escrito e impresso/distribuído antes do bloco — o aluno não depende de acompanhar a projeção
- Dataset (`cro.db`) distribuído por **pendrive ou download local**, não por rede — remove o wifi do caminho crítico
- **Plano B declarado em voz alta:** quem não conseguir instalar continua no degrau 1, acompanha as demos e sai com as 3 skills do bloco anterior funcionando. Ninguém fica sem entregável.
- Buffer de 15min no fim da tarde absorve repescagem de instalação e break estendido

**Fora de escopo por decisão:** OAuth do GA4 do aluno via `gmp-cli`. Autenticar 50 contas Google em wifi de evento é risco desproporcional ao ganho. O dado real do aluno é justamente o que o degrau 3 resolve.

---

## 6. Entregáveis

```
05-imersao-cro/
├── skills/
│   ├── desktop/          # versões para Claude Desktop (Projects)
│   │   ├── heuristica-morys.md
│   │   ├── hipotese-estruturada.md
│   │   └── ice-score.md
│   ├── code/             # versões SKILL.md para Claude Code
│   │   ├── heuristica-morys/
│   │   ├── hipotese-estruturada/
│   │   ├── ice-score/
│   │   ├── srm-check/            # adaptada de 02-cro
│   │   ├── post-test-segments/   # adaptada de 02-cro
│   │   ├── variante-builder/     # nova
│   │   └── pre-flight-check/     # nova
│   └── README.md         # como instalar em cada camada
├── data/
│   └── cro.db            # dataset local, sem OAuth
├── handout.md            # passo-a-passo do aluno, autossuficiente
├── instalacao.md         # guia Claude Code por SO (macOS / Windows)
├── script.md             # roteiro do facilitador: timing, falas, pontos de trava
├── deck/                 # padrão dos outros decks do repo
└── notes/
    └── sources/
        └── taciana-cro-fundamentos.md   # extração do PDF dela
```

**Critério de qualidade do handout:** um aluno que perdeu 10 minutos travado na instalação consegue voltar sozinho lendo o handout, sem interromper a turma.

---

## 7. Riscos

| Risco | Probabilidade | Mitigação |
|---|---|---|
| Instalação do Claude Code falha em massa | Alta | Contrato já cumprido no bloco 1; plano B declarado; guia impresso |
| Wifi do venue cai | Média | Dataset local, skills do degrau 1 rodam com Claude Pro (precisa de rede, mas leve); demos do degrau 3 **gravadas em vídeo**, não ao vivo |
| Taci atrasa e come meu tempo | Média | Buffer de 15min + Cadeira do Dev (25min) é o primeiro bloco a ser cortado |
| Break estoura de 20min | Média | Buffer de 15min absorve; `ice-score` encolhe de 15 para 10min |
| Frustração pelo beta limitado | Média | Critério de mérito declarado antes, não sorteio |
| Aluno chega sem Claude Pro pago | Baixa | Pré-requisito da página; comunicar reforço antes do dia |
| Messina não cobre Claude Code de manhã como previsto | Média | Meu bloco de instalação é autossuficiente, não assume conhecimento prévio |

---

## 8. Decisões descartadas

- **Tudo no Desktop, zero instalação** — risco operacional mínimo, mas o copilot vira propaganda no slide final. Sem a dor do setup, não há conversão.
- **Claude Code desde o primeiro minuto** — perde metade da sala nos primeiros 30 minutos, sem recuperação, e o contrato da página de vendas fica refém da instalação.
- **`gmp-cli` + GA4 do aluno no hands-on** — impacto máximo, risco máximo. É exatamente o que o degrau 3 vende.
- **Reaproveitar `heuristic-scan` como está** — criaria conflito de vocabulário com o material da Taci.
