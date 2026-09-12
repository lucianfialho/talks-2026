# Guia de instalação — Claude Code

Este guia é para o intervalo das 15h30. Os passos 0 a 5 levam uns 10 minutos
se tudo correr bem — são esses que valem a pena terminar antes do fim do
intervalo. O Passo 6, no fim do guia, é opcional: só faça se sobrar tempo.
Se travar em algum passo, procure a frase exata que apareceu na sua tela na
tabela "Quando der errado", mais abaixo. Se mesmo assim não sair do lugar,
leia o quadro **"Não trave aqui"** no fim deste guia e siga para o resto da
tarde sem culpa.

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

## Passo 5 — onde colocar o arquivo do exercício

O material que vai ser dissecado em aula é **um único arquivo `.md`** — sem
download, sem ZIP, sem git. Ele chega até você por pendrive (vai circular
durante o intervalo) ou copiado direto da tela para um editor de texto.

Salve esse arquivo em qualquer pasta que você reconheça facilmente depois —
por exemplo, a Área de Trabalho. Não precisa estar dentro de nenhuma pasta
específica nem ter nome fixo: quando chegar a hora de usá-lo em aula, você
aponta o caminho desse arquivo para o Claude Code.

## Passo 6 (opcional) — adiantar a instalação do Skill Creator

**Este passo é opcional.** Ele **não** é pré-requisito para nada do que vem
antes das 16h. Se sobrar tempo aqui no intervalo, você adianta e chega no
Bloco B da tarde na frente dos outros. **Se não sobrar tempo, sem problema
nenhum** — o facilitador roda isso junto com a turma inteira, ao vivo, logo
no início do Bloco B. Ninguém trava por não ter feito este passo agora.

O Skill Creator é uma ferramenta extra que vai ser usada só no fim da tarde,
no exercício principal. Ela não vem instalada junto com o Claude Code —
precisa ser adicionada à parte, com dois comandos.

Com o terminal ainda aberto, digite e aperte `Enter`:

```
claude plugin marketplace add https://github.com/anthropics/claude-plugins-official
```

Espere aparecer:

```
✔ Successfully added marketplace: claude-plugins-official
```

(Se alguém já rodou isso antes na mesma máquina, pode aparecer `already on
disk` em vez disso — também está certo, não precisa fazer nada.)

Depois, digite e aperte `Enter`:

```
claude plugin install skill-creator@claude-plugins-official
```

Espere aparecer:

```
✔ Successfully installed plugin: skill-creator@claude-plugins-official
```

(Se já estiver instalado, aparece `already installed` em vez disso — também
está certo.) Rodar os dois comandos de novo não tem problema nenhum: eles
não fazem nada de errado se já estiver tudo pronto.

**Importante:** copie os comandos exatamente como estão acima, com o
endereço completo começando em `https://`. Não digite uma versão
resumida (só `anthropics/claude-plugins-official`, sem o `https://github.com/`
na frente) — essa forma resumida pode falhar de um jeito diferente, veja a
tabela de erros abaixo.

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
| Uma frase com **"Permission denied"** e **"publickey"**, ao adicionar o marketplace | Você (ou alguém) digitou a versão resumida do comando do Passo 6, sem o `https://github.com/` na frente. Apague e digite de novo, copiando exatamente o bloco do Passo 6, começando em `https://`. |
| Uma frase com **"not found in marketplace"**, ao instalar o `skill-creator` | O comando de adicionar o marketplace (o primeiro do Passo 6) não rodou com sucesso antes deste. Volte um comando, confira que apareceu a mensagem de sucesso dele, e só depois rode o comando de instalar de novo. |
| Nenhuma linha acima bate com o que você está vendo | Não insista sozinho. Chame o facilitador e mostre a tela. |

**Nota sobre o `sudo`:** se você precisar rodar o comando com `sudo`, ao
digitar a senha **nada vai aparecer na tela** — nem letras, nem bolinhas,
nem o cursor se mexendo. Não travou: é assim mesmo, por segurança. Digite
a senha do computador normalmente e aperte `Enter`.

> **Não trave aqui.** Você já tem três skills funcionando no Claude Desktop e
> elas cobrem a cadeira mais importante. Acompanhe as demos da segunda metade,
> o material inteiro está no repositório, e a instalação você faz com calma
> depois — o guia é este mesmo. **E o Passo 6 (o do Skill Creator) nem
> precisa ser feito agora** — o facilitador roda ele com a sala inteira, ao
> vivo, no início da parte da tarde.
