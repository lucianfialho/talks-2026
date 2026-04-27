---
titulo: "CRO com Claude Code: do dado bruto à decisão"
talk: 02
status: draft-01
voice_target: Conversacional, direto, técnico quando necessário. Zero hype de IA.
duracao_estimada: 50min
audiencia: CRO community — misto técnico/ferramenta
---

# Script — Palestra 02 (CRO)

> Versão para leitura e ensaio. Atos com tempo-alvo entre colchetes.

---

## Ato 1 — Abertura: Claude Code no browser [5 min]

[AÇÃO: abrir wterm no browser, mostrar Claude Code inicializando]

*"Isso é Claude Code. No browser. Sem instalar nada."*

[pausa 3 segundos]

*"Tudo que vocês vão ver hoje acontece aqui. Dados reais de GA4, limpeza de dado, análise de teste A/B — no browser, ou no terminal local, que é a mesma coisa."*

*"Antes de começar qualquer demo, deixa eu te fazer uma pergunta honesta: quanto do seu tempo de análise você realmente passa analisando?"*

[SLIDE: "60-70% do tempo é prep"]

*"Esse número é o que aparece quando a galera cronometra o próprio trabalho. Sessenta a setenta por cento do tempo vai pra preparação — puxar dado, verificar se o dado tá certo, limpar o que não presta, configurar o contexto. E sobra vinte, trinta por cento pro que importa de fato: a análise."*

*"O problema de CRO não é falta de ferramenta de análise. A gente tem GA4, Hotjar, VWO, ABTasty, BigQuery, sei lá mais o quê. O problema tá na camada anterior a tudo isso — a preparação. E é exatamente aí que o Claude Code entra."*

---

## Ato 2 — Por que o contexto importa [8 min]

[SLIDE: comparativo de contexto — 200k vs 1M tokens]

*"Quando você tenta jogar um CSV de GA4 no ChatGPT — e vai me dizer que você nunca tentou — o que acontece? Arquivo muito grande. Ou ele aceita mas você tá jogando uma amostra. Você não tá analisando o dado, você tá analisando um recorte do dado que você torce que seja representativo."*

*"ChatGPT, Cursor — janela de contexto de 200 mil tokens. Um dataset de GA4 de 30 dias com eventos completos — session, page_view, click, conversion — facilmente 800 mil tokens. Você vai samplear. Sempre."*

*"Claude Code tem 1 milhão de tokens de contexto. Na prática: você joga o dataset de um mês inteiro sem samplear. A análise vê o dado real."*

[SLIDE: LLM Wiki concept]

*"Mas ter contexto grande não é suficiente. Você precisa estruturar o dado antes de jogar. Existe um conceito que eu chamo de LLM Wiki — dado preparado como contexto navegável pra LLM, não CSV cru. Dado bem estruturado significa que o modelo raciocina melhor, erra menos, devolve análise mais precisa."*

*"A implementação prática disso aqui é o DuckDB."*

[AÇÃO: abrir terminal, abrir sessão duckdb cro.db]

```bash
duckdb cro.db
```

*"DuckDB é um SQLite analítico. Zero setup — roda na pasta do projeto, sem servidor, sem configuração. Fala SQL padrão, aguenta dataset grande."*

[AÇÃO: rodar DESCRIBE events]

```sql
DESCRIBE events;
```

*"Você puxou via gmp-cli ou spec2cli, caiu no DuckDB, o Claude acessa com SQL e raciocina em cima do dado completo. É o cache local entre a API e o Claude. Simples assim."*

[SLIDE: stack diagram — gmp-cli + spec2cli → DuckDB → Claude Code (1M) → análise]

---

## Ato 3 — A limpeza na prática [15 min]

### 3A — Bot filtering

[SLIDE: "15-30% dos seus eventos são lixo"]

*"Deixa eu te mostrar uma coisa no dado que a gente acabou de carregar."*

[AÇÃO: rodar query de detecção de bots]

```sql
SELECT user_pseudo_id, COUNT(*) AS hits, AVG(session_duration) AS avg_dur
FROM events WHERE event_name = 'session_start'
GROUP BY user_pseudo_id
HAVING hits > 50 OR avg_dur < 1
LIMIT 10;
```

*"Esse usuário aqui — 73 hits, session_duration zero. E esse — 91 hits, zero segundos de sessão. Isso é bot. E o GA4 padrão não filtra."*

*"A pergunta que você devia estar fazendo: qual é o seu baseline de conversão com esses bots dentro? Eles não convertem, mas inflam o denominador. Seu CR real pode ser mais alto do que você acha — o que significa que você pode estar subestimando o impacto dos seus testes."*

[AÇÃO: mostrar before/after da view events_clean]

```sql
SELECT 'bruto' AS estado, COUNT(DISTINCT user_pseudo_id) AS users
FROM events WHERE event_name = 'session_start'
UNION ALL
SELECT 'limpo', COUNT(DISTINCT user_pseudo_id)
FROM events_clean WHERE event_name = 'session_start';
```

*"Duzentos usuários a menos. Parece pouco. Mas se você tem 1% de CR, isso é dois usuários que você tava contando que nunca iam converter. O threshold do seu teste de significância tá errado desde o começo."*

### 3B — SRM check

[SLIDE: diagrama SRM]

*"Segundo problema. Você tá rodando um teste A/B. A variante B recebeu 23% mais tráfego que o control. Isso é SRM — Sample Ratio Mismatch. Em português: a distribuição de tráfego entre as variantes tá errada. O seu teste tá contaminado antes mesmo de você olhar pra conversão."*

*"E a maioria das plataformas de teste não te avisa. Você declara vencedor, manda implementar, o revenue não move, você fica sem entender o que aconteceu."*

*"Chi-quadrado — que é o teste estatístico que verifica se a distribuição tá dentro do esperado — não é complicado de rodar. O problema é que ninguém faz porque é manual, chato, e parece burocracia quando você tá com pressa de declarar resultado."*

[AÇÃO: invocar /srm-check]

```
/srm-check
```

*"É um comando. O Claude calcula chi-quadrado e devolve o veredicto em linguagem clara. Não tem desculpa pra declarar vencedor sem ter rodado isso antes."*

*"Olha o output: SRM detectado em variant_b. Há 400 usuários extras que não deveriam estar lá. Esse teste não pode ser declarado. Ponto."*

### 3C — Guardrails como código

[SLIDE: "Immutable by instruction is not enough"]

*"Na palestra passada eu falei sobre um experimento que rodei: dei um agente de ML pra otimizar um modelo de Marketing Mix Modeling, deixei rodando 16 horas, ele chegou num resultado impossível — WAPE de zero. O agente tinha aprendido a trapacear. Ele encontrou um jeito de ler o dataset de teste e treinar o modelo nele."*

*"A lição foi: 'Immutable by instruction is not enough.' Você não fala pro Claude 'não faça isso'. Você constrói o sistema de forma que ele não consegue fazer."*

*"Aqui em CRO é a mesma coisa. Você não fala 'não analise dado com SRM'. Você escreve o hook que bloqueia antes de qualquer análise rodar."*

[AÇÃO: mostrar hook em ação — primeiro sem sentinel]

```bash
CLAUDE_TOOL_INPUT="SELECT experiment_variant, COUNT(*) FROM test_results WHERE experiment_variant='variant_b' GROUP BY 1" \
  bash 02-cro/demos/hooks/validate-before-analysis.sh
```

*"Viu? O hook bloqueia. Sem o SRM check, sem análise. Não é prompt. É código. O Claude não consegue racionalizar por volta disso."*

[AÇÃO: criar sentinel e mostrar que passa]

```bash
touch .cro-srm-checked
CLAUDE_TOOL_INPUT="SELECT experiment_variant, COUNT(*) FROM test_results WHERE experiment_variant='variant_b' GROUP BY 1" \
  bash 02-cro/demos/hooks/validate-before-analysis.sh
```

*"Com o sentinel, passa. A pré-condição foi satisfeita. É assim que você força boas práticas sem depender de disciplina individual."*

[BIFURCAÇÃO #1 — ver bifurcations.md]

---

## Ato 4 — Análise e heurísticas [12 min]

### 4A — Análise pós-teste

[AÇÃO: criar sentinel e invocar /post-test-segments]

```bash
touch .cro-srm-checked
```

```
/post-test-segments
```

*"O lift agregado é 12%. Parece bom. Parece que você tem um vencedor."*

*"Mas olha o que acontece quando você segmenta por device."*

*"Mobile tem 20% de lift. Desktop não moveu — literalmente zero, dentro do ruído. Tablet, amostra pequena, não é conclusivo."*

*"Se você implementar pra todo mundo com base nos 12% agregados, o revenue não entrega os 12% prometidos. Você implementou uma mudança que é boa pra mobile e neutra pra desktop. O ganho real é metade do esperado, e o engenheiro que implementou vai parecer que fez algo errado."*

*"Esse insight existe no dado. Sempre existiu. Ninguém vai atrás porque a análise padrão para no agregado, e segmentar por device é mais uma query, mais tempo, mais chance de atrasar a decisão. Com Claude Code mais DuckDB é um comando."*

### 4B — Heurísticas com agent-browser

[SLIDE: "Quantitativo diz O QUÊ. Heurística diz POR QUÊ."]

*"Mas por que mobile moveu e desktop não? O dado quantitativo não responde isso. Ele te diz o quê aconteceu. Não o porquê."*

*"Uma varredura heurística te dá as hipóteses do porquê. Você pode fazer manualmente — abrir a variante, checar CTA, contraste, hierarquia visual. Ou você pode automatizar."*

[AÇÃO: invocar /heuristic-scan]

```
/heuristic-scan
```

*"O agent-browser abre a variante B, faz a varredura automática: CTA acima da dobra, contraste, hierarquia visual em desktop, thumb zone em mobile, friction no form. Devolve hipóteses em 2 minutos."*

*"Olha o output: variante B moveu o CTA pro thumb zone em mobile — área fácil de alcançar com o polegar. Isso explica o lift. O form ainda tem 6 campos — isso segura desktop porque o form fica pequeno e chato de preencher numa tela grande."*

*"Você não abriu o Hotjar. Não assistiu gravação de sessão. O agente fez a varredura e devolveu as hipóteses correlacionadas com o resultado quantitativo. Próximo teste já tem direção."*

[BIFURCAÇÃO #2 — ver bifurcations.md]

---

## Ato 5 — Automação + fechamento [10 min]

[SLIDE: stack diagram completo — o que foi construído hoje]

*"O que vocês viram hoje: bot filter, SRM check, segmentação pós-teste, heurística. São passos manuais que você faz uma vez por semana pra cada teste ativo. E provavelmente não faz todos, porque é chato e demorado."*

*"Ou não."*

[AÇÃO: mostrar /schedule]

```
/schedule every monday at 8am: /cro-weekly-pipeline
```

*"Toda segunda às 8 da manhã, relatório completo com limpeza, SRM status e segmentação pronto. Você não faz mais isso manualmente."*

[AÇÃO: mostrar /loop]

```
/loop 2h: /srm-check
```

*"Todo teste ativo, verificado de 2 em 2 horas. Se detectar SRM ou anomalia, te avisa. O agente faz enquanto você dorme — e se acorda você de madrugada é porque realmente tem problema."*

[SLIDE: 4 skills — o kit que você leva]

*"Tudo que eu mostrei hoje são 4 arquivos markdown. `/srm-check`, `/post-test-segments`, `/cro-weekly-pipeline`, `/heuristic-scan`. Você commita no Git, funciona em qualquer projeto Claude Code. Leva 30 minutos pra configurar."*

*"O que você ganha: você para de fazer análise de CRO no modo reativo. Você para de descobrir SRM depois que já declarou vencedor. Você para de perder lift porque não segmentou."*

*"Não é mágica. É automação de trabalho manual que você já deveria estar fazendo."*

[SLIDE: CTA analytics-copilot]

*"Se você quer isso pré-montado, sem montar o stack do zero — analytics-copilot em beta. É o mesmo setup, com interface, conectado ao GA4, pronto pra usar. Mesma newsletter da palestra passada, tem o link. QR code no slide."*

*"Obrigado."*

[pausa para Q&A]
