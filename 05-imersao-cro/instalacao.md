# Guia de instalação — Claude Code

Este guia é para o intervalo das 15h30. Os passos 0 a 6 levam uns 10 a 15
minutos se tudo correr bem — são esses que valem a pena terminar antes do
fim do intervalo. O Passo 7, no fim do guia, é opcional: só faça se sobrar
tempo. Se travar em algum passo, procure a frase exata que apareceu na sua
tela na tabela "Quando der errado", mais abaixo. Se mesmo assim não sair do
lugar, leia o quadro **"Não trave aqui"** no fim deste guia e siga para o
resto da tarde sem culpa.

## Antes de tudo — o que você precisa ter

- Conta Claude Pro ativa (a mesma que você usou de manhã).
- ~10 a 15 minutos — mais perto de 15 se o Passo 2 (git) precisar instalar
  de verdade na sua máquina.

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

## Passo 2 — instalar o git

O git é outro programa de base. Você **não vai aprender git hoje** e **não
vai clonar repositório nenhum** — mas ele precisa existir na sua máquina,
porque é ele que o Claude Code usa por baixo para baixar o plugin do Skill
Creator, lá no Passo 7 e de novo em sala com o facilitador. Sem git, aquele
comando falha — e é ele que habilita o exercício do fim da tarde.

Ele **não vem junto** com o Node.js nem com o Claude Code: instalar o Claude
Code (Passo 3) não instala o git. Por isso ele tem um passo só dele.

Antes de instalar, verifique se já está aí. Digite e aperte `Enter`:

```
git --version
```

**Se aparecer algo como `git version 2.50.1`** (qualquer número serve): já
está instalado, pule para o Passo 3.

**Se aparecer `command not found: git` (Mac) ou uma frase com `git` e "não é
reconhecido" (Windows):** siga o caminho do seu sistema abaixo.

**No Mac:** digite e aperte `Enter`:

```
xcode-select --install
```

Vai abrir **uma janela do próprio macOS** — não é o terminal, é um instalador
com botões. Clique em **"Instalar"** e aceite os termos. O download leva
alguns minutos e é bem pesado; deixe rodando e não feche a janela. Quando o
instalador disser que terminou, volte para o terminal (`Cmd+Tab` até achar o
ícone do Terminal) e rode `git --version` de novo para confirmar que agora
aparece um número de versão.

Se em vez da janela aparecer a frase `xcode-select: note: Command line tools
are already installed.`, o git já estava lá — rode `git --version` de novo e
siga para o Passo 3.

**No Windows:** o Windows **não vem com git de fábrica**, e ele não é
instalado por nenhum comando deste guia — precisa ser baixado. Abra o
navegador, vá em **git-scm.com**, e baixe o instalador do Windows. Abra o
arquivo `.exe` baixado e clique em "Next"/"Avançar" até o fim, **aceitando
todas as opções que já vêm marcadas** — não é preciso mudar nada nas telas
de configuração. Depois de terminar, volte para a janela do PowerShell,
**feche essa janela** (veja a definição de "fechar" no Passo 0) **e abra uma
nova** repetindo o Passo 0, para o Windows reconhecer o programa
recém-instalado. Então rode `git --version` para confirmar.

## Passo 3 — instalar o Claude Code

Com o Node.js e o git confirmados, digite e aperte `Enter`:

```
npm install -g @anthropic-ai/claude-code
```

Isso baixa e instala o Claude Code. Pode levar um minuto — texto vai
rolar na tela, isso é normal. Espere ele parar e voltar a mostrar o cursor
piscando antes de digitar o próximo comando.

## Passo 4 — verificar

Digite e aperte `Enter`:

```
claude --version
```

Se aparecer um número de versão (algo como `2.1.268 (Claude Code)`), deu
certo — o Claude Code está instalado. Vá para o Passo 5.

## Passo 5 — logar

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

### Você agora está *dentro* do Claude Code — e isso muda tudo

Repare na tela: depois do login, a janela do terminal deixou de ser o
terminal. Ela virou a **sessão do Claude Code** — tem uma caixa de digitação
esperando você escrever, e qualquer coisa que você digitar ali vira
**pergunta para o Claude**, não comando do computador.

Isso importa porque vários comandos deste guia (e da aula) só funcionam
**fora** do Claude Code, no terminal puro. Se você digitar um deles dentro
da sessão, o Claude vai responder alguma coisa em texto sobre o comando — e
nada será instalado.

**Como sair do Claude Code e voltar para o terminal:** digite e aperte
`Enter`:

```
/exit
```

A sessão fecha e você volta a ver o cursor do terminal, do jeito que estava
antes. Para entrar de novo, é só digitar `claude` e apertar `Enter` — você
não precisa logar outra vez.

Guarde `/exit`: ele volta a aparecer no Passo 7 e outra vez em aula.

## Passo 6 — onde colocar o arquivo do exercício

O material que vai ser dissecado em aula é **um único arquivo `.md`** — sem
download e sem ZIP. Você não vai clonar o repositório do curso: o arquivo
chega até você por pendrive (vai circular durante o intervalo) ou copiado
direto da tela para um editor de texto.

Salve esse arquivo em qualquer pasta que você reconheça facilmente depois —
por exemplo, a Área de Trabalho. Não precisa estar dentro de nenhuma pasta
específica nem ter nome fixo: quando chegar a hora de usá-lo em aula, você
aponta o caminho desse arquivo para o Claude Code.

## Passo 7 (opcional) — adiantar a instalação do Skill Creator

**Este passo é opcional.** Ele **não** é pré-requisito para nada do que vem
antes das 16h. Se sobrar tempo aqui no intervalo, você adianta e chega no
Bloco B da tarde na frente dos outros. **Se não sobrar tempo, sem problema
nenhum** — o facilitador roda isso junto com a turma inteira, ao vivo, logo
no início do Bloco B. Ninguém trava por não ter feito este passo agora.

O que **não** é opcional é o Passo 2 (git): sem ele os comandos abaixo
falham, aqui e também em sala.

O Skill Creator é uma ferramenta extra que vai ser usada só no fim da tarde,
no exercício principal. Ela não vem instalada junto com o Claude Code —
precisa ser adicionada à parte, com dois comandos.

**Antes de digitar qualquer coisa: saia do Claude Code.** Se você fez o
Passo 5, a sua janela está com a sessão do Claude Code aberta, e os dois
comandos abaixo **não são comandos do Claude** — são comandos do terminal.
Digitados lá dentro, eles viram pergunta para o Claude, nada é instalado, e
a mensagem de sucesso nunca aparece. Então digite primeiro:

```
/exit
```

Quando voltar a ver o cursor do terminal (sem a caixa de digitação do Claude
Code), digite e aperte `Enter`:

```
claude plugin marketplace add https://github.com/anthropics/claude-plugins-official
```

Espere aparecer:

```
✔ Successfully added marketplace: claude-plugins-official (declared in user settings)
```

(Se alguém já rodou isso antes na mesma máquina, aparece
`✔ Marketplace 'claude-plugins-official' already on disk` em vez disso —
também está certo, não precisa fazer nada.)

Depois, digite e aperte `Enter`:

```
claude plugin install skill-creator@claude-plugins-official
```

Espere aparecer:

```
✔ Successfully installed plugin: skill-creator@claude-plugins-official (scope: user)
```

(Se já estiver instalado, aparece
`✔ Plugin "skill-creator@claude-plugins-official" is already installed` em
vez disso — também está certo.) Rodar os dois comandos de novo não tem
problema nenhum: eles não fazem nada de errado se já estiver tudo pronto.

**Importante:** copie os comandos exatamente como estão acima, com o
endereço completo começando em `https://`. Não digite uma versão
resumida (só `anthropics/claude-plugins-official`, sem o `https://github.com/`
na frente) — essa forma resumida pode falhar de um jeito diferente, veja a
tabela de erros abaixo.

### Último detalhe: abrir o Claude Code de novo

O plugin só passa a valer **na próxima vez** que o Claude Code abrir. Se
você deixar aberta a sessão que já estava rodando, o comando
`/skill-creator` continua não existindo — e parece que a instalação falhou,
quando não falhou.

Então, depois da mensagem de sucesso, digite e aperte `Enter`:

```
claude
```

Para conferir que deu certo, digite uma barra:

```
/
```

Uma lista de comandos aparece. Procure `skill-creator` nela — se estiver
lá, está tudo pronto. (Se não estiver, saia com `/exit` e abra `claude` de
novo; é quase sempre isso.)

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
| `command not found: git` (mac) | git não instalou. Refazer Passo 2. |
| Uma frase com **git** e **"não é reconhecido"** (win) | git não instalou, ou a janela do PowerShell é a antiga. Fechar e reabrir o terminal; se ainda assim não aparecer versão, refazer Passo 2. |
| `xcode-select: note: Command line tools are already installed.` (mac) | Não é erro: o git já estava instalado. Rodar `git --version` para confirmar e seguir para o Passo 3. |
| No Mac, abre uma **janela de instalador** em vez de o comando terminar no terminal | É o comportamento esperado do `xcode-select --install`: ele dispara o instalador gráfico do macOS. Clicar em "Instalar", esperar o download acabar (leva minutos), e só então voltar ao terminal e rodar `git --version`. Não é travamento. |
| `EACCES: permission denied` (mac) | Rodar `sudo npm install -g @anthropic-ai/claude-code` e digitar a senha do computador. |
| `command not found: claude` após instalar (mac) | Fechar e reabrir o terminal. |
| Uma frase com **claude** e **"não é reconhecido"** (win) | Fechar e reabrir o terminal. |
| `npm ERR! network` | Wifi. Tentar de novo; se insistir, usar o 4G do celular. |
| Login não abre o navegador | Copiar a URL que apareceu no terminal e colar no navegador. |
| Uma frase com **"Failed to clone marketplace repository"** (vem depois de `✘ Failed to add marketplace:`), ao adicionar o marketplace | Falta o git na máquina — o comando do Passo 7 faz um `git clone` por baixo. Volte ao **Passo 2** e instale o git; depois rode o comando do Passo 7 de novo. |
| Uma frase com **"Permission denied"** e **"publickey"**, ao adicionar o marketplace | Você (ou alguém) digitou a versão resumida do comando do Passo 7, sem o `https://github.com/` na frente. Apague e digite de novo, copiando exatamente o bloco do Passo 7, começando em `https://`. |
| Uma frase com **"not found in marketplace"**, ao instalar o `skill-creator` | O comando de adicionar o marketplace (o primeiro do Passo 7) não rodou com sucesso antes deste. Volte um comando, confira que apareceu a mensagem de sucesso dele, e só depois rode o comando de instalar de novo. |
| Você digitou um comando do Passo 7 e, em vez da mensagem com `✔`, **o Claude respondeu em texto** — explicando o comando, ou perguntando o que você quer fazer | Você está **dentro** do Claude Code, e ali aquilo não é comando: é pergunta para o modelo. Nada foi instalado. Digite `/exit`, espere voltar o cursor do terminal, e rode o comando de novo. |
| `/skill-creator` não aparece na lista quando você digita `/`, mesmo depois da mensagem de sucesso | O plugin só entra na próxima abertura do Claude Code. Digitar `/exit`, depois `claude`, e conferir de novo. |
| Nenhuma linha acima bate com o que você está vendo | Não insista sozinho. Chame o facilitador e mostre a tela. |

**Nota sobre o `sudo`:** se você precisar rodar o comando com `sudo`, ao
digitar a senha **nada vai aparecer na tela** — nem letras, nem bolinhas,
nem o cursor se mexendo. Não travou: é assim mesmo, por segurança. Digite
a senha do computador normalmente e aperte `Enter`.

> **Não trave aqui.** Se a instalação não saiu no intervalo, você não perdeu
> a tarde — e não precisa resolver isso sozinho agora.
>
> - **O Bloco A, que abre a tarde, é inteiro sem máquina.** Não tem terminal
>   para abrir, não tem comando para rodar: é a parte conceitual, com dois
>   exercícios de papel no handout. Você acompanha do mesmo jeito que todo
>   mundo, sem desvantagem nenhuma.
> - **Nos blocos B e C**, o que importa está na tela do facilitador. Vá
>   anotando no handout; o guia continua sendo este, e você refaz a
>   instalação com calma em casa.
> - **No Bloco D, que é o exercício do dia, você faz em dupla.** Isso é
>   combinado, não plano de emergência: senta ao lado de quem conseguiu
>   instalar e vocês dois escrevem a skill juntos, na máquina de quem já
>   está rodando. A nota sai igual.
> - **E o Passo 7 (o do Skill Creator) nem precisa ser feito agora** — o
>   facilitador roda ele com a sala inteira, ao vivo, no início da parte da
>   tarde.
>
> Levante a mão quando puder e mostre a tela ao facilitador. Mas siga a
> tarde: nenhuma parte do conteúdo depende de você ter resolvido isso antes
> das 16h.
