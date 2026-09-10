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

## Passo 6 — instalar as skills e o dataset

Com `node`, `npm`, `claude` e `duckdb` funcionando, o terminal está
pronto. O próximo passo — instalar as sete skills da imersão e copiar o
dataset — está em `skills/README.md`, seção "Instalação no Claude Code".
Siga a partir de lá.

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
| Nenhuma linha acima bate com o que você está vendo | Não insista sozinho. Chame o facilitador e mostre a tela. |

**Nota sobre o `sudo`:** se você precisar rodar o comando com `sudo`, ao
digitar a senha **nada vai aparecer na tela** — nem letras, nem bolinhas,
nem o cursor se mexendo. Não travou: é assim mesmo, por segurança. Digite
a senha do computador normalmente e aperte `Enter`.

> **Não trave aqui.** Você já tem três skills funcionando no Claude Desktop e
> elas cobrem a cadeira mais importante. Acompanhe as demos da segunda metade,
> o material inteiro está no repositório, e a instalação você faz com calma
> depois — o guia é este mesmo.
