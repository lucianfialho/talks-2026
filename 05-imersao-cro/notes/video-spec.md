# Spec dos vídeos de demo — imersão CRO (14/09/2026)

> Cinco vídeos, não três. Os três primeiros cobrem o produto
> (`analytics-copilot`), no bloco das 17h15. Os outros dois são plano B para
> queda de wifi no bloco das 16h05 (Cadeira do Analytics — Code) — ver
> "Por que existem os vídeos 4 e 5" abaixo. Formato desta spec espelha
> `03-analytics-copilot/demos/video-spec.md`.

**Esta task entrega a especificação, não os arquivos `.mp4`.** Gravar exige
uma pessoa com tela, produto autenticado e microfone — é trabalho humano,
fora do escopo desta sessão. Ver "Status de gravação" no fim deste
documento.

## Por que existem os vídeos 4 e 5

Queda de wifi **não** derruba o DuckDB — ele roda 100% local, contra os
arquivos `data/cro.db` e `data/cro-clean.db` já copiados na máquina de
demonstração. O que a queda de wifi derruba é o **Claude Code**, que
depende da API da Anthropic para interpretar o pedido em linguagem natural
("roda srm-check em data/cro.db") e orquestrar a skill. Sem rede, `claude`
não responde — e as duas skills do bloco das 16h05 não rodam de jeito
nenhum, mesmo que o dado esteja ali, local, pronto.

`script.md` já previne essa trava na tabela geral de pontos de risco:

> "Wifi caiu → Skills do Desktop param → Passar direto para as demos
> gravadas e o dataset local; `srm-check` e `post-test-segments` rodam
> offline"

O problema: essa gravação não existia em lugar nenhum do repositório antes
desta task. O bloco das 16h05 é o maior da tarde (45min) e o único plano B
possível quando o Claude Code está fora do ar — não dá para "acompanhar
pelo handout" e chamar isso de equivalente à demo ao vivo, então a
gravação precisa existir e estar pronta antes do dia 14/09.

## Pré-requisitos antes de gravar (todos os 5 vídeos)

- [ ] Laptop em modo "não perturbe" (zero notificação na tela)
- [ ] Resolução de gravação: **1920×1080**, 60fps preferível
- [ ] Cursor destacado (macOS: System Settings → Accessibility → Pointer →
      aumentar tamanho do cursor)
- [ ] Modo claro do terminal/app (a sala projeta contra luz de auditório —
      contraste importa)
- [ ] **Sem áudio próprio** — track silenciado no export. A narração é
      sempre ao vivo, do facilitador, por cima do vídeo mudo.
- [ ] **Sem chrome de player** — sem barra de play/pause/volume visível no
      arquivo final. O deck já injeta o player mínimo necessário
      (`muted playsinline`); não gravar com controles de OS/app por cima.
- [ ] Ferramenta sugerida: QuickTime (built-in Mac) ou OBS.
- [ ] Edição: iMovie ou DaVinci Resolve gratuito. Cortes diretos, sem
      transição — plateia presencial não precisa de fade.

## Regra obrigatória de anonimização — vale para os 5 vídeos

**Nenhum nome de cliente, domínio real ou ID de property GA4 pode aparecer
legível em nenhum frame.** Isso inclui, sem se limitar a:

- Nome de conta/organização no header do navegador ou do app
- URL real de cliente na barra de endereço
- `property_id` do GA4 em qualquer output de comando
- E-mail de login visível em avatar/perfil
- Nome de arquivo ou caminho de disco que contenha nome de cliente

**Critério de bloqueio: o vídeo não sobe se houver dado identificável.**
Isso vale mesmo que o restante do vídeo esteja pronto — regravar a cena ou
borrar/tarjar o trecho em pós-produção antes de considerar o vídeo pronto.
Os vídeos 1–3 usam produto real (`analytics-copilot`); os vídeos 4–5 usam
dados sintéticos do dataset da imersão (`data/cro.db`,
`data/cro-clean.db`), que já não contêm identidade de cliente real — mas a
checagem visual (nome de arquivo, caminho da pasta, título do terminal)
ainda se aplica.

## Regras de produção comuns

- **Dead air zero.** Toda espera entre comando e resposta é cortada. Se um
  passo demora 5s para processar, vira corte direto ou no máximo 1s no
  vídeo final.
- **Sem branding nas pontas.** O vídeo abre direto no conteúdo e fecha
  direto no conteúdo — sem intro, sem outro, sem logo.
- **Export:** MP4 (H.264), 1920×1080, ~10–15 Mbps, sem faixa de áudio (ou
  faixa muda). Salvar em `05-imersao-cro/deck/assets/`.
- **Nomes de arquivo já padronizados** (usar exatamente estes):

| # | Arquivo |
|---|---|
| 1 | `01-custo-setup.mp4` |
| 2 | `02-copilot.mp4` |
| 3 | `03-pipeline.mp4` |
| 4 | `04-contingencia-srm.mp4` |
| 5 | `05-contingencia-segmentos.mp4` |

---

## Vídeo 1 — O custo do setup

**Arquivo:** `01-custo-setup.mp4`
**Duração alvo:** 45s
**Onde entra:** Bloco 7 — 17h15, "Segunda parede → copilot", na
apresentação dos quatro itens (OAuth, ETL, Agendamento, Manutenção de
schema), logo depois da fala:

> "Isso rodou no meu dataset, que eu deixei pronto pra vocês. Pra rodar no
> SEU GA4, toda segunda, sem você abrir o terminal — o que falta?"

Este vídeo é a prova visual da resposta "OAuth" e "ETL" antes de o
facilitador nomear os quatro itens na tela.

### Roteiro de captura, quadro a quadro

1. **0:00–0:05** — Tela em branco/dashboard do Google Cloud Console, sem
   projeto selecionado. Um relógio (overlay gráfico simples, canto
   superior direito, contador tipo cronômetro digital) começa a rodar a
   partir de `00:00`.
2. **0:05–0:15** — Fluxo de OAuth: criar/selecionar projeto no Google
   Cloud, habilitar a API do GA4, gerar credenciais OAuth (client ID/
   secret). Acelerado (timelapse 4x–8x) — o objetivo é comunicar "isso tem
   muitos cliques", não que a plateia leia cada tela.
3. **0:15–0:25** — Tela de consentimento OAuth, escolher a conta Google,
   escolher a **property** do GA4 na lista (property de teste/sintética —
   nunca uma property real de cliente). Ainda acelerado.
4. **0:25–0:35** — "Esperar export": simular/mostrar uma tela de
   exportação de dados do GA4 para BigQuery carregando (barra de
   progresso ou spinner). Pode ser acelerado ao extremo (cut para o
   resultado) — o ponto é comunicar espera, não mostrar a espera real.
5. **0:35–0:43** — Montar schema: um editor de texto/SQL com a definição
   de tabela sendo digitada (nomes de coluna genéricos — `user_pseudo_id`,
   `event_name`, etc., iguais aos do dataset da imersão, para ecoar o que
   a sala já viu nos blocos anteriores).
6. **0:43–0:45** — Corte final: zoom no relógio/cronômetro no canto da
   tela, parado em um valor alto e específico (sugestão: **43min** — não
   redondo, para parecer medição real, não estimativa de marketing).
   Tela congela 1s no valor final antes do corte.

### O que o facilitador narra por cima (ao vivo, não é áudio do vídeo)

"Isso que vocês viram nos últimos comandos rodou porque o dataset já
estava pronto. Pra rodar isso no SEU GA4 — não no meu — alguém passa por
isto primeiro: escolher a property certa, autorizar o acesso, esperar o
export terminar, e montar o schema que as skills esperam. Não é um passo,
são vários, e o relógio não para durante nenhum deles."

### Critério de "está bom"

- O cronômetro precisa estar legível na projeção a partir da última fileira
  da sala — número grande, alto contraste, canto fixo da tela do início ao
  fim.
- Nenhuma property real, nenhum nome de conta Google real, nenhum e-mail
  visível em nenhum frame — usar conta/projeto de demonstração criado só
  para esta gravação.
- O timelapse precisa comunicar "muitos passos manuais" em 45s sem que a
  plateia precise ler texto pequeno — se um frame exige leitura para fazer
  sentido, ele é longo demais para o corte.

---

## Vídeo 2 — O copilot fazendo

**Arquivo:** `02-copilot.mp4`
**Duração alvo:** 60s
**Onde entra:** Bloco 7 — 17h15, slide 14 do deck ("analytics-copilot — a
resposta"), embutido via `<video src="assets/02-copilot.mp4" muted
playsinline>` (já referenciado no slide 14 de `deck/index.html`).
Este é o vídeo que seria a resposta positiva depois do vídeo 1 mostrar o
custo: "e se não precisasse de nada disso?"

### Roteiro de captura, quadro a quadro

1. **0:00–0:05** — Abre o `analytics-copilot` já autenticado (conta de
   demonstração, não a Métricas Boss real com dado sensível de terceiro —
   ou, se for a conta real, garantir que nenhuma property de cliente
   apareça na barra lateral durante a gravação). Chat vazio, cursor
   piscando no campo de mensagem.
2. **0:05–0:15** — Digitar, em linguagem natural, **a mesma pergunta que
   sustenta `post-test-segments`** — não uma pergunta genérica de
   analytics, a pergunta específica do bloco das 16h05:

   > "onde o lift do teste realmente aconteceu quando eu olho por tipo de
   > dispositivo?"

   (ou fraseado equivalente, natural, não um comando de skill — o ponto é
   contrastar com o terminal que a sala acabou de ver.)
3. **0:15–0:20** — Enter. Cortar o dead air do processamento (não mostrar
   spinner girando por segundos reais).
4. **0:20–0:50** — Output do copilot aparecendo: tabela por device
   (desktop / mobile / tablet) com CR de controle e variante, replicando a
   mesma leitura do slide 11 do deck (desktop 4,19%→4,88%, mobile
   4,23%→7,17%, tablet 4,56%→**3,78%**) — **usar dado sintético do próprio
   dataset da imersão** (`cro-clean.db`), não dado de cliente real, para
   manter os números coerentes com o que a sala já viu no bloco das
   16h05.
5. **0:50–0:60** — Zoom leve (1x→1.3x) na linha do tablet com o número
   negativo, ecoando o mesmo "momento de parada" que o facilitador fez ao
   vivo no slide 11. Termina com o painel de resposta completo na tela,
   parado.

### O que o facilitador narra por cima

"A mesma pergunta que a gente acabou de responder na mão, com o terminal e
o dataset que eu preparei — aqui, em linguagem natural, sem terminal, sem
setup, contra o dado real do negócio. É a mesma tabela, o mesmo achado do
tablet. A diferença é que ninguém aqui precisou saber o que é SRM para
chegar nela."

### Critério de "está bom"

- A pergunta digitada precisa ser legível por 2–3s antes do corte para o
  envio — a plateia precisa registrar que foi digitada em português comum,
  não um comando técnico.
- A tabela de resultado precisa reproduzir os mesmos números do slide 11
  (ou equivalentes plausíveis se a conta usada for outra) — inconsistência
  de números entre o slide 11 e este vídeo quebra a narrativa "é a mesma
  pergunta".
- Nenhuma property real, nome de cliente ou domínio visível na barra
  lateral, no header ou em qualquer output — checar frame a frame antes de
  aprovar.

---

## Vídeo 3 — O pipeline rodando sozinho

**Arquivo:** `03-pipeline.mp4`
**Duração alvo:** 30s
**Onde entra:** Bloco 7 — 17h15, depois do vídeo 2, reforçando o item
"Agendamento" da lista de quatro (o pipeline chega pronto sem alguém
disparar manualmente).

### Roteiro de captura, quadro a quadro

1. **0:00–0:05** — Tela de notificação/e-mail chegando (ou dashboard de
   notebooks do `analytics-copilot`, se essa for a superfície real) com
   timestamp de segunda-feira de manhã visível (data sintética, sem ano
   real associável a um evento específico se isso puder vazar contexto
   sensível — usar data plausível e genérica).
2. **0:05–0:20** — Abrir o relatório semanal (`cro-weekly-pipeline`) já
   pronto: seções com métricas-chave, sem o usuário ter disparado nada
   naquele momento — a mensagem é "isso já estava pronto quando a pessoa
   abriu o e-mail/dashboard".
3. **0:20–0:30** — Scroll rápido pelas 2–3 seções do relatório (ex:
   resumo executivo, achados da semana, próximos passos sugeridos).
   Termina com a tela do relatório completo, parada.

### O que o facilitador narra por cima

"Isso é o que o `cro-weekly-pipeline` faria se vocês tivessem essa
infraestrutura rodando: toda segunda, sem ninguém abrir terminal, sem
ninguém lembrar de rodar nada — o relatório já está esperando."

### Critério de "está bom"

- O timestamp/data do relatório precisa estar visível e coerente com
  "chegou sozinho" (não pode parecer que alguém acabou de gerar na hora).
- Nenhum nome de cliente, domínio ou property real visível — mesma regra
  dos vídeos 1 e 2.
- 30s é curto: não incluir nenhum passo que exija leitura de texto miúdo
  para fazer sentido; o efeito é visual ("chegou pronto"), não a leitura
  de conteúdo.

---

## Vídeo 4 — Contingência: `srm-check` (plano B, wifi caiu)

**Arquivo:** `04-contingencia-srm.mp4`
**Duração alvo:** 90s
**Onde entra:** **Só se o wifi cair durante o Bloco 5 — 16h05, janela
16h07–16h20 (`srm-check` em `data/cro.db`).** Não faz parte do fluxo normal
do bloco — é o vídeo que o facilitador toca no telão no lugar da demo ao
vivo, exatamente na hora em que tocaria `duckdb data/cro.db` no terminal.
Ver `script.md`, tabela de pontos de trava gerais: "Wifi caiu → Passar
direto para as demos gravadas e o dataset local; `srm-check` e
`post-test-segments` rodam offline".

**Este vídeo precisa ser uma gravação real de execução**, não uma
reconstrução simulada — o ponto pedagógico é "isto roda de verdade contra
o dado", que é exatamente a alegação que perde credibilidade se parecer
encenado.

### Roteiro de captura, quadro a quadro

1. **0:00–0:10** — Terminal limpo, na pasta com `data/cro.db` visível num
   `ls` rápido (título da janela do terminal sem caminho de disco pessoal
   identificável — usar um prompt genérico, sem nome de usuário/máquina
   visível se o shell exibir isso por padrão).
2. **0:10–0:20** — Digitar (ou colar, mas visível caractere a caractere se
   possível, para parecer comando ao vivo) o pedido em linguagem natural
   ao Claude Code: `roda srm-check em data/cro.db` — ecoando exatamente o
   texto de `skills/code/srm-check/SKILL.md` e do handout, seção 6.
3. **0:20–0:35** — Claude Code processando: pode cortar dead air real de
   raciocínio, mas manter visível pelo menos um trecho do plano/execução
   da skill para não parecer corte para o resultado mágico.
4. **0:35–0:55** — Output do Passo 1 (distribuição observada):

   ```
   control     4000
   variant_b   4400
   ```

   Manter na tela tempo suficiente para leitura (pelo menos 4–5s antes do
   próximo corte).
5. **0:55–1:15** — Output do Passo 2 (chi-quadrado), formatado como no
   slide 10 do deck:

   **χ²=19,0476 · p=1,275e-05**

6. **1:15–1:30** — Veredito final na tela: **🔴 SRM DETECTADO** — zoom leve
   (1x→1.3x) no veredito, mantendo por pelo menos 3s antes de terminar.

### O que o facilitador narra por cima

"O wifi caiu, então em vez de rodar isso ao vivo, vocês estão vendo uma
gravação de exatamente o mesmo comando, contra o mesmo dataset que está na
pasta de vocês agora. `srm-check` não depende de rede pra rodar — o
DuckDB é local — o que depende de rede é o Claude Code interpretar o meu
pedido. Então gravamos essa execução antes, pra não perder o bloco. Os
números são control 4000, variant_b 4400, χ² de 19,0476, p de 1,275e-05:
SRM detectado. Esse teste não tem resultado pra ler."

### Critério de "está bom"

- Os três números-chave (4000 / 4400 / χ²=19,0476 / p=1,275e-05 /
  🔴 SRM DETECTADO) precisam estar legíveis na projeção — fonte de
  terminal grande o suficiente (recomendação: aumentar o zoom do terminal
  antes de gravar, não confiar em zoom de pós-produção para texto
  pequeno).
- O caminho do arquivo (`data/cro.db`) precisa aparecer no comando digitado
  — reforça "isto é o mesmo dataset que está na pasta de vocês".
- Nenhum nome de usuário do sistema operacional, caminho de disco pessoal
  (`/Users/nome-real/...`) ou identificador de máquina visível no prompt
  do terminal.
- **Só é usado se o wifi cair** — não entra no fluxo normal do bloco das
  16h05, que é ao vivo por padrão.

---

## Vídeo 5 — Contingência: `post-test-segments` (plano B, wifi caiu)

**Arquivo:** `05-contingencia-segmentos.mp4`
**Duração alvo:** 90s
**Onde entra:** **Só se o wifi cair**, imediatamente depois do vídeo 4, no
lugar da janela 16h23–16h40 (`post-test-segments` em `data/cro-clean.db`)
do Bloco 5 — 16h05. Mesma lógica de contingência do vídeo 4: o DuckDB
continua local, mas sem Claude Code (sem rede) a skill não roda, então a
gravação é o único substituto para o maior bloco da tarde.

### Roteiro de captura, quadro a quadro

1. **0:00–0:10** — Terminal limpo, na pasta com `data/cro-clean.db`
   visível. Mesmas regras de anonimização do vídeo 4 (sem caminho pessoal,
   sem identificador de máquina).
2. **0:10–0:20** — Digitar o pedido em linguagem natural ao Claude Code:
   `roda post-test-segments em data/cro-clean.db`.
3. **0:20–0:35** — Output agregado (cortar dead air de processamento):

   ```
   control    4,33%
   variant_b  5,30%   (lift agregado +22,4%)
   ```

4. **0:35–1:05** — Output por device, reproduzindo a tabela do slide 11:

   | Device | Control CR | Variant CR | Lift relativo |
   |---|---|---|---|
   | desktop | 4,19% | 4,88% | +16,5% |
   | mobile | 4,23% | 7,17% | +69,5% |
   | tablet | 4,56% | **3,78%** | **-17,1%** |

   Manter a tabela completa na tela por pelo menos 6–8s — este é o número
   que sustenta a fala sobre decisão; não cortar cedo demais.
5. **1:05–1:20** — Zoom leve (1x→1.3x) na linha do tablet, isolando o
   `3,78%` negativo — replica o momento de silêncio proposital que o
   facilitador faz ao vivo ("parar aqui e deixar a tela com o tablet
   negativo visível por alguns segundos antes de falar").
6. **1:20–1:30** — Corte final: tela com a recomendação de decisão
   (**Iterar**) visível, se a skill produzir esse output formatado; senão,
   terminar com a tabela por device ainda na tela.

### O que o facilitador narra por cima

"Mesma situação do vídeo anterior — sem rede, sem Claude Code, mas o
dataset `cro-clean.db` está aí, local, na pasta de vocês. Essa é a
execução real de `post-test-segments`. Agregado, control 4,33% contra
variant_b 5,30%, lift de 22,4%. Mas olhem por device: mobile ganha 69,5%,
e o tablet perde 17,1%. Segmento com lift negativo é achado, não ruído. Um
teste que ganha no mobile e perde no tablet é decisão de rollout
segmentado, não vencedor simples. Recomendação aqui é Iterar — a direção
geral se sustenta, mas o tablet precisa de ajuste antes de rodar nos três
devices."

### Critério de "está bom"

- A tabela por device inteira (as três linhas, os dois valores de CR por
  linha) precisa estar legível simultaneamente na projeção — não pode
  depender de scroll ou de a plateia lembrar o valor anterior.
- O `3,78%` do tablet precisa estar visualmente destacado (cor, negrito ou
  zoom) exatamente como no slide 11 do deck, para não quebrar a
  continuidade visual entre "isto é gravado" e "isto é o mesmo slide que
  vocês já viram".
- Nenhum nome de usuário do sistema, caminho pessoal ou identificador de
  máquina visível.
- **Só é usado se o wifi cair** — a expectativa padrão do bloco das 16h05
  é rodar ao vivo, contra o terminal real.

---

## Estrutura de pastas

```
05-imersao-cro/deck/assets/
├── 01-custo-setup.mp4
├── 02-copilot.mp4
├── 03-pipeline.mp4
├── 04-contingencia-srm.mp4
└── 05-contingencia-segmentos.mp4
```

Todos os `.mp4` ficam fora do controle de versão por padrão (binários) —
seguir a mesma decisão de `03-analytics-copilot/demos/videos/final/`: se
não couber em Git/LFS, referenciar via link externo (Drive/Dropbox) neste
mesmo documento antes do dia 14/09, e garantir que a máquina de
demonstração tenha os 5 arquivos copiados localmente com os nomes exatos
da tabela acima — o teste de "toca com wifi desligado" (ver Step 3 do
brief da Task 14) só é válido com o arquivo físico no disco da máquina que
vai ao palco, não com um link.

## Status de gravação

Nenhum dos 5 vídeos foi gravado nesta task. `05-imersao-cro/deck/assets/`
existe (com `.gitkeep`) mas está vazio de `.mp4`. Gravar, editar e revisar
frame a frame (Steps 2–4 do brief da Task 14) é trabalho humano — exige
tela, produto autenticado e microfone — e fica como pendência explícita
antes do dia 14/09, com atenção especial aos vídeos 4 e 5: são o único
plano B do maior bloco da tarde (45min), então não podem ficar para a
véspera.

**Checklist de pendência:**

- [ ] Gravar e editar `01-custo-setup.mp4` (45s)
- [ ] Gravar e editar `02-copilot.mp4` (60s) — depende de acesso ao
      `analytics-copilot` com dado anonimizado
- [ ] Gravar e editar `03-pipeline.mp4` (30s) — depende de
      `cro-weekly-pipeline` ou mock equivalente
- [ ] Gravar `04-contingencia-srm.mp4` (90s) — execução real de
      `srm-check` contra `data/cro.db`
- [ ] Gravar `05-contingencia-segmentos.mp4` (90s) — execução real de
      `post-test-segments` contra `data/cro-clean.db`
- [ ] Revisar os 5 vídeos frame a frame contra a regra de anonimização
      (Step 4 do brief) antes de colocar em `deck/assets/`
- [ ] Testar os 5 vídeos com wifi desligado no deck (Step 3 do brief)
- [ ] Commitar os `.mp4` finais separadamente desta task
