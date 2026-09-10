# Guia de instalação — Claude Code

Este guia é para o intervalo das 15h30. Leva uns 10 minutos se tudo correr
bem. Se travar em algum passo, procure a frase exata que apareceu na sua
tela na tabela "Quando der errado", mais abaixo. Se mesmo assim não sair do
lugar, leia o quadro **"Não trave aqui"** no fim deste guia e siga para o
resto da tarde sem culpa.

## Antes de tudo — o que você precisa ter

- Conta Claude Pro ativa (a mesma que você usou de manhã).
- ~10 minutos.

Nada mais. Você não precisa saber o que é um terminal — este guia ensina.

## Passo 0 — abrir o terminal

O terminal é um programa que já vem instalado no seu computador. Ele
parece uma tela preta ou branca com texto, sem botões. É nele que você vai
digitar os comandos deste guia.

**No Mac:**
1. Aperte `Cmd + Espaço` (a tecla Cmd fica ao lado da barra de espaço).
2. Digite `Terminal`.
3. Aperte `Enter`.

**No Windows:**
1. Aperte a tecla `Windows` (a tecla com o logo do Windows).
2. Digite `PowerShell`.
3. Aperte `Enter`.

Uma janela escura ou clara com texto vai abrir. É essa janela que fica
aberta para todos os passos a seguir.

**Como usar os comandos deste guia:** cada bloco de texto abaixo é um
comando — você vai digitá-lo, letra por letra, dentro da janela do
terminal. Clique dentro da janela do terminal primeiro, para o cursor
ficar piscando lá dentro, depois digite exatamente o que está no bloco.
Preste atenção em símbolos como `@`, `-` e espaços — eles fazem parte do
comando, não são decoração. Só aperte `Enter` depois de conferir que
digitou igual ao bloco. Se errar, apague com a tecla `Backspace` e digite
de novo — não tem problema, o terminal só reage quando você aperta
`Enter`.

**Uma palavra sobre "fechar o terminal":** alguns passos deste guia pedem
para fechar a janela do terminal e abrir de novo. "Fechar" quer dizer
clicar no X da janela (ou apertar `Cmd+Q` no Mac) — minimizar a janela ou
só trocar de aba não conta como fechar, e o comando continua não
funcionando se você fizer isso.

## Passo 1 — instalar o Node.js

O Node.js é um programa que o Claude Code precisa para funcionar. Antes de
instalar, verifique se ele já está aí — muita gente já tem sem saber.

Digite e aperte `Enter`:

```
node --version
```

**Se aparecer algo como `v18`, `v20`, `v22` ou qualquer número maior que
18** (por exemplo `v22.22.3`): já está instalado, pule para o Passo 2.

**Se aparecer `command not found: node` (Mac) ou `'node' não é reconhecido
como um comando interno ou externo` (Windows):** o Node não está
instalado. Siga:

- **Mac:** abra o navegador, vá em nodejs.org, baixe o instalador marcado
  **LTS**. Abra o arquivo `.pkg` baixado e clique em "Continuar"/"Avançar"
  até o fim.
- **Windows:** abra o navegador, vá em nodejs.org, baixe o instalador
  marcado **LTS**. Abra o arquivo `.msi` baixado, avance até a tela que
  tem a caixa **"Add to PATH"** e **marque essa caixa** — sem ela o
  próximo passo não funciona. Continue avançando até o fim.

Depois de terminar o instalador, volte para a janela do terminal (no Mac,
`Cmd+Tab` até achar o ícone do Terminal; no Windows, clique no ícone do
PowerShell na barra de tarefas — ele continua aberto de onde você saiu).
No Windows, **feche essa janela** (veja a definição de "fechar" acima) **e
abra uma nova** repetindo o Passo 0, para o Windows reconhecer o programa
recém-instalado. No Mac isso não é necessário.

Depois de instalar, rode `node --version` de novo para confirmar que
aparece um número de versão.

## Passo 2 — instalar o Claude Code

Com o Node.js confirmado, digite e aperte `Enter`:

```
npm install -g @anthropic-ai/claude-code
```

Isso baixa e instala o Claude Code. Pode levar um minuto — texto vai
rolar na tela, isso é normal. Espere ele parar e voltar a mostrar o cursor
piscando antes de digitar o próximo comando.

## Passo 3 — verificar

Digite e aperte `Enter`:

```
claude --version
```

Se aparecer um número de versão (algo como `2.1.267 (Claude Code)`), deu
certo — o Claude Code está instalado. Vá para o Passo 4.

## Passo 4 — logar

Digite e aperte `Enter`:

```
claude
```

Na primeira vez que você roda `claude`, pode aparecer uma ou duas
perguntas na própria tela do terminal antes do login — por exemplo escolha
de tema de cores, ou uma confirmação para confiar na pasta atual. São
normais: use as setas do teclado para escolher a opção e aperte `Enter`.
Depois disso é que o fluxo de login abre no navegador.

Entre com a mesma conta Claude Pro que você já usa. Depois de confirmar no
navegador, volte para a janela do terminal (no Mac, `Cmd+Tab`; no Windows,
clique no ícone na barra de tarefas) — ela vai mostrar que o login
funcionou.

## Passo 5 — instalar o DuckDB

O DuckDB é o banco de dados que as skills de Analytics usam na segunda
metade da tarde (a partir das 16h05). **Este passo é só para isso** — se
você travar aqui, ainda dá para acompanhar a primeira metade inteira sem
problema nenhum.

Verifique se já tem instalado:

```
duckdb --version
```

**Se aparecer algo como `v1.5.2 (Variegata) ...`** (qualquer número de
versão, com ou sem o nome entre parênteses): já está instalado, pule para
o Passo 6.

**Se aparecer `command not found: duckdb` (Mac) ou uma frase com
`duckdb` e "não é reconhecido" (Windows):** instale por um destes
caminhos.

**Mac, com Homebrew.** Primeiro veja se você tem Homebrew instalado:

```
brew --version
```

Se aparecer um número de versão, rode:

```
brew install duckdb
```

**Mac, sem Homebrew** (se `brew --version` deu `command not found:
brew`): abra o navegador, vá em duckdb.org/install, clique em "CLI",
escolha macOS e baixe o arquivo `.zip`. Descompacte com um duplo clique no
arquivo baixado (o Mac já sabe extrair `.zip` sozinho). Depois, no
terminal, mova o arquivo para uma pasta que o terminal já reconhece:

```
sudo mv ~/Downloads/duckdb /usr/local/bin/duckdb
```

Digite a senha do computador quando pedir — não vai aparecer nada na tela
enquanto você digita, isso é normal (veja a nota sobre `sudo` mais
abaixo).

**Windows, com winget:**

```
winget install DuckDB.cli
```

(O nome exato do pacote pode variar um pouco entre versões do Windows — se
`winget` não reconhecer `DuckDB.cli`, ou o comando `winget` não existir,
use o caminho sem gerenciador abaixo.)

**Windows, sem winget:** abra o navegador, vá em duckdb.org/install,
clique em "CLI", escolha Windows e baixe o `.zip`. Descompacte numa pasta
fixa, por exemplo `C:\duckdb`. Depois, adicione essa pasta ao PATH:
procure "variáveis de ambiente" no menu Iniciar, abra "Editar as variáveis
de ambiente do sistema", clique em "Variáveis de Ambiente", ache `Path` na
lista de cima, clique "Editar" → "Novo", cole `C:\duckdb` e confirme em
todas as janelas abertas. Feche o terminal e abra um novo (Passo 0).

(Os nomes exatos das telas de variáveis de ambiente podem variar um pouco
entre versões do Windows — o caminho geral é sempre "menu Iniciar →
variáveis de ambiente → editar Path".)

Depois de instalar, rode `duckdb --version` de novo para confirmar.

## Passo 6 — instalar o python3

O python3 é usado por baixo dos panos pela skill `srm-check` para calcular
o chi-quadrado do teste de SRM — ela roda sozinha, você não digita
`python3` na mão. **Este passo é só para a segunda metade da tarde, a
partir das 16h05** — igual ao DuckDB no Passo 5: se você travar aqui,
ainda dá para acompanhar a primeira metade inteira sem problema nenhum.

Verifique se já tem instalado:

```
python3 --version
```

**Se aparecer algo como `Python 3.9`, `Python 3.11`, `Python 3.14` ou
qualquer número que comece com `Python 3.`** (confirmado nesta máquina:
`Python 3.14.7`): já está instalado, pule para o Passo 7.

**No Mac, um caso especial antes de concluir que deu errado:** se em vez de
um número de versão **abrir uma janela pedindo para instalar as "Command
Line Tools"**, isso não é erro — é o macOS avisando que o `python3` do
sistema (`/usr/bin/python3`) é só um "atalho" que depende dessa instalação
para funcionar de verdade. Clique em "Instalar", espere terminar (pode
levar de 5 a 20 minutos e precisa de wifi) e rode `python3 --version` de
novo. (Não foi possível reproduzir essa janela nesta verificação porque a
máquina usada para revisar este guia já tinha as Command Line Tools
instaladas — o comportamento acima é o documentado para uma instalação
nova; trate como aproximação, no mesmo espírito das notas de Windows deste
guia.)

**Se aparecer `command not found: python3` (Mac, raro) ou uma frase com
`python3` e "não é reconhecido" — ou a tela abrir a Microsoft Store sem
instalar nada (Windows):**

- **Mac, com Homebrew** (você já conferiu isso no Passo 5):

```
brew install python3
```

- **Mac, sem Homebrew:** abra o navegador, vá em python.org/downloads,
  baixe o instalador para macOS, abra o `.pkg` baixado e avance até o fim.
- **Windows:** o alias `python3` do PowerShell, quando o Python não está
  instalado, abre a Microsoft Store em vez de mostrar um erro — feche essa
  janela sem instalar nada por ali. Abra o navegador, vá em
  python.org/downloads, baixe o instalador para Windows, avance até a tela
  que tem a caixa **"Add python.exe to PATH"** e **marque essa caixa** —
  sem ela o próximo passo não funciona. Continue avançando até o fim,
  depois **feche o terminal e abra um novo** (Passo 0).

Depois de instalar, rode `python3 --version` de novo para confirmar.

## Passo 7 — obter os arquivos do curso

Antes de instalar as skills, você precisa ter os arquivos da imersão na sua
máquina — o próximo passo copia arquivos de dentro dessa pasta, e sem ela
o comando não encontra nada para copiar.

**Caminho principal — baixar o ZIP pelo navegador** (não exige instalar
mais nada além do que você já tem):

1. Abra o navegador em `github.com/lucianfialho/talks-2026`.
2. Clique no botão verde **"Code"** e, no menu que abrir, em **"Download
   ZIP"**.
3. Quando o download terminar, descompacte o arquivo: no Mac, dê um duplo
   clique no `.zip` (normalmente na pasta Downloads); no Windows, clique
   com o botão direito no `.zip` e escolha **"Extrair tudo..."**. Isso cria
   uma pasta com um nome parecido com `talks-2026-main`.
4. Volte para a janela do terminal e entre nessa pasta:

```
cd ~/Downloads/talks-2026-main
```

No Windows (PowerShell): `cd ~\Downloads\talks-2026-main`. O nome exato da
pasta pode variar um pouco (`talks-2026-main`, `talks-2026-master`) —
confira o nome real dentro da sua pasta Downloads antes de digitar.

Confirme que chegou no lugar certo:

```
ls
```

No Windows: `dir`. Você deve ver, entre outras coisas, uma pasta chamada
`05-imersao-cro`.

**Sem rede no momento?** Peça ao facilitador o pendrive com os arquivos da
imersão — ele circula durante o break com uma cópia completa da pasta
`05-imersao-cro`. Copie essa pasta do pendrive para o seu computador (por
exemplo, para a Área de Trabalho) e use-a como se fosse a pasta
descompactada do ZIP a partir daqui.

## Passo 8 — instalar as skills e o dataset

Com `node`, `npm`, `claude`, `duckdb` e `python3` funcionando, e os
arquivos da imersão já na sua máquina (Passo 7), o terminal está pronto.
Abra o terminal dentro da pasta que você baixou no Passo 7 (a que contém
`05-imersao-cro`) — os comandos do próximo passo pressupõem isso. O
próximo passo — instalar as sete skills da imersão e copiar o dataset —
está em `skills/README.md`, seção "Instalação no Claude Code". Siga a
partir de lá.

## Quando der errado — tabela de erros

Compare o que apareceu na sua tela com a coluna da esquerda. Nas linhas
marcadas `(mac)`, o texto é exato — copiado direto do que aparece no
Terminal. Nas linhas marcadas `(win)`, o texto varia um pouco conforme a
versão do Windows; procure só o **trecho em negrito**, que se mantém igual
nas versões mais comuns.

| O que aparece na tela | O que fazer |
|---|---|
| `command not found: node` (mac) | Node não instalou. Refazer Passo 1. |
| Uma frase com **node** e **"não é reconhecido"** (win) | Faltou "Add to PATH". Reinstalar marcando a caixa. |
| `EACCES: permission denied` (mac) | Rodar `sudo npm install -g @anthropic-ai/claude-code` e digitar a senha do computador. |
| `command not found: claude` após instalar (mac) | Fechar e reabrir o terminal. |
| Uma frase com **claude** e **"não é reconhecido"** (win) | Fechar e reabrir o terminal. |
| `npm ERR! network` | Wifi. Tentar de novo; se insistir, usar o 4G do celular. |
| Login não abre o navegador | Copiar a URL que apareceu no terminal e colar no navegador. |
| `command not found: duckdb` após instalar (mac) | Fechar e reabrir o terminal. |
| Uma frase com **duckdb** e **"não é reconhecido"** (win) após instalar | Fechar e reabrir o terminal. |
| `command not found: brew` (mac) | Sem Homebrew. Use o caminho "Mac, sem Homebrew" do Passo 5 — baixar o zip direto de duckdb.org/install. |
| `winget` não reconhecido ou não encontrado (win) | Sem winget. Use o caminho "Windows, sem winget" do Passo 5 — baixar o zip direto de duckdb.org/install. |
| Uma janela pedindo para instalar as **"Command Line Tools"** apareceu ao rodar `python3 --version` (mac) | Não é erro. Clique em "Instalar", espere terminar (5–20min, precisa de wifi) e rode `python3 --version` de novo. |
| `command not found: python3` (mac, raro) | Rodar `brew install python3` (com Homebrew) ou baixar o instalador em python.org/downloads. |
| A tela abriu a **Microsoft Store** ao rodar `python3 --version`, sem instalar nada (win) | Fechar a Store sem instalar nada por ali. Baixar o instalador em python.org/downloads, marcando "Add python.exe to PATH". |
| Uma frase com **python3** e **"não é reconhecido"** (win) após instalar | Faltou "Add python.exe to PATH". Reinstalar marcando a caixa. |
| `cd: no such file or directory` (mac) ou **"O sistema não pode encontrar o caminho especificado"** (win) ao entrar na pasta baixada | Você não está na pasta certa ou o nome dela é outro. Confira o nome exato da pasta descompactada (`ls` no Mac / `dir` no Windows, dentro de Downloads) e repita o `cd` apontando para esse nome. |
| Nenhuma linha acima bate com o que você está vendo | Não insista sozinho. Chame o facilitador e mostre a tela. |

**Nota sobre o `sudo`:** se você precisar rodar o comando com `sudo`, ao
digitar a senha **nada vai aparecer na tela** — nem letras, nem bolinhas,
nem o cursor se mexendo. Não travou: é assim mesmo, por segurança. Digite
a senha do computador normalmente e aperte `Enter`.

> **Não trave aqui.** Você já tem três skills funcionando no Claude Desktop e
> elas cobrem a cadeira mais importante. Acompanhe as demos da segunda metade,
> o material inteiro está no repositório, e a instalação você faz com calma
> depois — o guia é este mesmo.
