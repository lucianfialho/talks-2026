# Fonte: fundamentos de CRO — Taciana Serafim

**Autora:** Taciana Serafim
**Material:** "CRO AI DAY" — 44 slides
**Bloco:** 14h–15h (módulo da manhã/tarde anterior ao bloco desta palestra, 15h–18h)
**Recebido em:** 2026-09-08
**Arquivo fonte:** `~/Downloads/Material CRO AI DAY.pdf`
**Uso:** referência consultável — vocabulário e dados de CRO que as tasks 3, 4, 5, 7, 8, 12 e 13 devem citar literalmente, sem parafrasear.

> Este arquivo NÃO é um dump do PDF. É uma referência estruturada por tópico. Para o texto completo extraído (592 linhas), ver a extração bruta gerada por `pdftotext -layout` a partir do PDF original — não versionada neste repo.

---

## O ciclo de 7 passos (slide 06) — VOCABULÁRIO OBRIGATÓRIO

"Um ciclo contínuo jogado por um time" — slide de diagrama de cards (não sai
em extração de texto simples; conteúdo abaixo lido diretamente da imagem da
página). Os 7 passos, nesta ordem (fonte de verdade; não reordenar nem
parafrasear):

| # | Passo | Quem | Descrição |
|---|---|---|---|
| 1 | Coleta de Dados | ANALYTICS | Quanti + quali |
| 2 | Análise | ANALYTICS + CRO | Padrões e problemas |
| 3 | Hipóteses | CRO | Explicações testáveis |
| 4 | Priorização | CRO + TIME | O que testar primeiro |
| 5 | Testes | CRO + DEV | A/B, MVT e MAB |
| 6 | Relatórios | ANALYTICS + CRO | Documentar aprendizados |
| 7 | Escala | TIME | Implementar e repetir |

> "O passo 7 alimenta o passo 1: o aprendizado de uma rodada define onde a
> próxima começa."

> "CRO é um esporte coletivo: nenhuma dessas competências resolve conversão
> sozinha, e nenhuma etapa do ciclo pertence a uma única pessoa. Em times
> pequenos, alguém acumula vários papéis; em times maduros, eles se
> distribuem entre especialistas."

---

## As 4 posições (slide 07)

"Quatro posições, um mesmo gol" — analogia de futebol para os quatro papéis do time de CRO:

| Posição | Papel | Pergunta que faz |
|---|---|---|
| Defesa · Leitura de campo | **Digital Analytics** | "O que está acontecendo e onde está o problema?" |
| Meio-campo · Armação | **Estrategista de CRO** | "Por que isso acontece e o que podemos mudar?" |
| Meio-campo · Criação | **UX / Research** | "Como desenhar uma experiência melhor?" |
| Ataque · Finalização | **Dev / Experimentação** | "Como tornar isso tecnicamente testável?" |

> "O gol do time não é o teste no ar. É resultado de negócio e aprendizado acumulado."

---

## As 3 transformações (slide 08)

"Três papéis, três transformações":

- **Digital Analytics** transforma **comportamento em evidência**.
- **CRO** transforma **evidência em hipótese**.
- **Dev / Experimentação** transforma **hipótese em experimento**.

> "Não são fronteiras rígidas: Analytics também levanta hipóteses, CRO também trabalha com pesquisa, e o Dev participa da priorização apontando esforço e risco técnico."

---

## As 7 dimensões de Morys (slides 16–22)

"A heurística de André Morys" — 7 dimensões, cada uma com uma pergunta-diagnóstico:

### Relevância
"A proposta de valor ajuda a resolver as dores do cliente?"

### Confiança
"São usadas celebridades ou autoridades como depoimentos?"

### Orientação
"O CTA principal é visível e fácil de achar?"

### Estímulo
"A percepção de preço e risco está bem projetada?"

### Segurança
"Existe uma página de perguntas frequentes?"

### Conveniência
"Os formulários realmente são convenientes?"

### Confirmação
"A página mostra razões racionalmente boas para a decisão de compra?"

---

## Dados do Mapa da Conversão 2026 (slide 11)

Estudo da CRO Brasil: recorte observacional de **179 diagnósticos**, pontuados de 0 a 100 (amostra não probabilística, edição 2026).

- **Score médio: 53**
- 97 jornadas tinham venda online como objetivo; 80 tinham geração de leads como objetivo.

**Temas recorrentes nas recomendações (percentual das análises que apontam o tema):**

| Tema | % |
|---|---|
| CTA e hierarquia visual | 99% |
| Confiança e prova social | 97% |
| Clareza da proposta de valor | 93% |
| Fricção do funil e formulários | 84% |
| Experiência mobile | 79% |
| Conteúdo e objeções | 60% |

> "Nenhuma análise chegou à faixa mais alta, e os gargalos seguem ligados a fundamentos." — Fonte: O Mapa da Conversão no Brasil 2026 · CRO Brasil

---

## O template de hipótese (slide 36)

**Template:**
`Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência]`

**Os 4 campos:**

| Campo | Descrição |
|---|---|
| Observação | Unidade + contexto |
| Intervenção | A mudança proposta |
| Resultado esperado | Métrica + magnitude |
| Evidência | Dados que suportam |

**Exemplo dela (checkout mobile / CEP):**

> "Se adicionarmos auto-preenchimento por CEP no checkout mobile, então o completion aumentará 20%, porque heatmaps mostram rage clicks no campo de endereço e 68% dos usuários mobile abandonam nessa etapa."

---

## ICE Score (slide 38)

**ICE Score = Impacto × Confiança × Facilidade** (1–10 cada).

> "O score explicita critérios e organiza o backlog — use para ranking relativo, não como veredito. O Dev participa estimando esforço e risco técnico."

---

## Sete formas de testar e validar (slide 39)

"A/B é o mais conhecido. Mas existem diferentes formas de testar e validar"

> "Partimos de uma hipótese já definida e priorizada. Existem métodos estruturados para reduzir subjetividade nessa escolha, mas eles pertencem a outro módulo. Aqui a pergunta é: qual é a melhor forma de validá-la?"

| Método | Notação | Definição |
|---|---|---|
| Teste A/B | `A ↔ B` | "Duas experiências comparadas: controle A versus tratamento B." |
| Teste A/B/n | `A ↔ B ↔ C ↔ D` | "Compara o controle com duas ou mais variantes ao mesmo tempo." |
| MVT | `TÍTULO × IMAGEM × CTA` | "Testa combinações de diferentes elementos de uma experiência." |
| Redirect / Split URL | `/PAGINA-A ↔ /PAGINA-B` | "Compara experiências que estão em URLs ou implementações diferentes." |
| Fake Door | `"QUERO ESSE RECURSO"` | "Valida interesse antes de construir. É técnica de validação, não outro nome para A/B." |
| MAB | `50/50 → 20/80` | "Adapta a distribuição de tráfego favorecendo o que apresenta melhor desempenho." |
| Personalização | `SEGMENTO A → EXPERIÊNCIA A` | "Experiências diferentes por público, comportamento ou contexto, e pode ser validada experimentalmente." |

> "Não precisamos decorar os nomes. Precisamos entender qual pergunta queremos responder e escolher a forma de validação adequada."

> "Esses nomes convivem no universo de CRO, mas não significam a mesma coisa: alguns são desenhos experimentais, outros formatos de implementação, estratégias de alocação ou técnicas de validação."

---

## Da hipótese à experiência testável (slide 40)

"Transforma hipótese em experiência testável" — quatro etapas, cada uma com seus itens:

| Construir | Configurar | Instrumentar | Validar |
|---|---|---|---|
| Controle e variante | Ferramenta de experimentação | Eventos do experimento | QA em dispositivos e browsers |
| HTML, CSS e JavaScript | URLs e audiences | Integração com Analytics | Responsividade e flickering |
| Ajustes de layout e copy | Distribuição de tráfego | Validação das métricas | Performance e conflitos, SPA |

> "O Dev não entra só no fim: ele participa da priorização, apontando esforço, limitação técnica e risco de implementação."

---

## Checklist pré-Start (slide 41) — VOCABULÁRIO OBRIGATÓRIO

"O que checar antes de apertar Start" — os 8 itens, nesta ordem (fonte de verdade; não reordenar nem parafrasear):

1. Hipótese escrita e compartilhada
2. Controle definido e no ar
3. Audiência e segmentação corretas
4. QA aprovado em browsers diferentes
5. Métrica primária e guardrails definidos
6. Variante validada em mobile e desktop
7. Eventos disparando nas duas versões
8. Flickering e performance verificados

> "Só então: START. Um erro de implementação não aparece no resultado — ele aparece como um resultado que ninguém consegue explicar."

---

## As 5 decisões pós-experimento (slide 42) — VOCABULÁRIO OBRIGATÓRIO

"O experimento produz evidência. Quem decide é o negócio" — as 5 decisões possíveis, fonte de verdade (não reordenar nem parafrasear):

| Decisão | Quando |
|---|---|
| Implementar | "A evidência sustenta a mudança e os guardrails ficaram estáveis." |
| Iterar | "A direção parece certa, mas a execução pode melhorar." |
| Investigar | "A evidência não é suficiente. Precisamos entender melhor." |
| Abandonar | "A hipótese não se sustentou. Aprendemos algo sobre o usuário." |
| Nova hipótese | "O resultado revelou um comportamento que não esperávamos." |

> "Winner e loser é uma leitura pobre do resultado. Todo experimento termina em uma decisão — e nem toda decisão é implementar."

---

## Frase de fechamento dela (slide 44)

> "O próximo desafio não é usar o Claude. É transformá-lo em parte do seu processo de CRO."

**GANCHO DE ABERTURA DO BLOCO DAS 15h** — usar esta frase para abrir o módulo da tarde (esta palestra, `05-imersao-cro`), amarrando com o encerramento do bloco da Taciana (14h–15h).
