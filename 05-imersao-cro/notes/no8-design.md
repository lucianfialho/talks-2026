# Nó 8 — Enriquecer o contexto, do ponto de vista de design

> Bloco da tarde, item 8 do `caminho.md`. Duração alvo: **8 a 12 minutos**
> (3–5 de fala + 5–7 de demo). Comprime para 5 cortando a demo e mostrando um
> `DESIGN.md` pronto na tela.
>
> Público não é de tecnologia. Nada de nome de empresa, de spec ou de quem
> criou o quê no palco — isso fica aqui no roteiro, não na sala.

---

## O que abre o nó

De manhã a gente passou uma hora falando em enriquecer contexto: dado
qualitativo, objeção que o time de vendas ouve, reclamação do SAC, perfil de
quem já comprou. Tudo isso para quê? Para a **pessoa** decidir melhor.

Agora é a mesma coisa, para o **Claude**.

## A fala (3 a 5 minutos)

**1. O problema, primeiro. Sem mencionar ferramenta nenhuma.**

Peça para a sala imaginar o seguinte — ou, melhor, conte como aconteceu:

> Você pede uma versão nova da página de produto. Volta uma página bonita.
> Botão azul arredondado, sombrinha embaixo do card, fonte de sistema, muito
> espaço em branco. Bonita. E não é a sua loja.

O problema não é qualidade. É que ele **não sabe como é a sua loja**. Ele nunca
viu. Então ele desenha o padrão dele — que é a média da internet.

E aí acontece a pior coisa que pode acontecer num teste A/B: você sobe a
variante e ela perde. Você anota "a hipótese não funcionou". Mentira. O que não
funcionou foi que a variante parecia de outra empresa. **Você testou a
hipótese e o visual ao mesmo tempo, e leu o resultado como se fosse só a
hipótese.** Isso queima um slot de teste e, pior, queima um aprendizado
errado no backlog.

**2. O que resolve.**

Existe um arquivo, um só, que descreve a identidade visual de um site de um
jeito que o Claude entende: as cores em código hexadecimal, as fontes com
tamanho e peso, o espaçamento, o arredondamento das bordas, e como são o botão
principal, o card e o campo de formulário.

Chama `DESIGN.md`. É texto puro. Abre no bloco de notas.

Ponto importante para a sala: **isso não é um padrão inventado por mim para
esta aula.** É um formato aberto e público, com validador próprio, que as
ferramentas de código com IA já leem. Você escreve uma vez e ele serve em
qualquer uma delas.

**3. Por que ele funciona.**

Duas metades. A de cima é a lista de valores — `#000000`, Manrope, 14px,
peso 700. A de baixo é texto corrido explicando **quando** usar cada um: "esta
é a única cor de ação que o site tem, gastar em dois botões na mesma tela mata
a hierarquia".

A lista sozinha faz ele acertar a cor. O texto faz ele acertar a decisão.
É a diferença entre dar a paleta e dar o manual da marca.

**4. E a ponte para o dia seguinte.**

> Vocês já fizeram isso hoje de manhã, só que para gente. A gente pegou o SAC
> e transformou em uma lista de dores para o time ler. Agora a gente pega o
> site e transforma em uma lista de regras para o Claude ler. É o mesmo
> movimento: **tirar o que está na cabeça de alguém — ou na tela de alguém — e
> botar num arquivo que a próxima pessoa consegue usar.**

E fecha com a frase que sustenta o nó 9:

> E esse arquivo aqui não foi escrito à mão. Foi uma skill que leu o site e
> escreveu. Que é exatamente o que vocês vão construir daqui a pouco.

---

## A demo (5 a 7 minutos)

**Formato:** pede o site de alguém da plateia. Ao vivo, na URL da pessoa.

### Antes de subir ao palco

- [ ] `agent-browser --version` responde
- [ ] Rodar a skill **uma vez antes**, no intervalo, no site de uma pessoa
      que já se ofereceu. Guardar o `DESIGN.md` em `/tmp/backup-design.md`
- [ ] Ter um `DESIGN.md` de e-commerce brasileiro pronto para abrir se a rede
      cair (tem um em `skills/code/detecta-design-system/exemplo-DESIGN.md`, gerado na preparação)
- [ ] Conferir se a pessoa **quer** o site dela projetado. Perguntar antes,
      nunca escolher de surpresa

### O roteiro

1. **Pedir a URL.** "Quem tem um e-commerce no ar e topa que a gente olhe o
   site na tela?" Pegar a primeira mão levantada. Não escolher o site mais
   bonito — o efeito é melhor num site comum.

2. **Rodar.**

   ```
   /detecta-design-system https://site-da-pessoa.com.br
   ```

   Enquanto roda (leva menos de um minuto), narre o que está acontecendo:
   "ele abriu a página, está medindo elemento por elemento a cor, a fonte e o
   espaçamento de cada um. Não é o que está escrito no código — é o que está
   na tela."

3. **Abrir o arquivo e parar em três pontos. Só três.**

   - **Uma cor com o hexadecimal.** "Esse `#` aqui é a cor exata do botão de
     comprar de vocês. Ele mediu, não chutou."
   - **A coluna que diz de onde veio.** Este é o momento alto da demo:

     > Repara nesta coluna aqui. Todo valor tem um endereço: "saiu de tal
     > variável", "apareceu 24 vezes na página". **Ele não está me dizendo o
     > que acha. Está me dizendo o que mediu.**

   - **Um "não encontrado".** Procure um antes, tem sempre — cor de erro,
     estado de hover, título grande. E diga:

     > Olha o que ele fez aqui. Ele **não achou** a cor de erro de vocês,
     > porque a home não tem mensagem de erro. Ele podia ter posto um
     > vermelho qualquer e ninguém ia perceber. Ele escreveu "não encontrado,
     > rode no checkout". **Essa é a parte mais valiosa do arquivo inteiro.**

4. **Fechar com o dono do site.** Pergunte para a pessoa: "essa cor está
   certa? esse é o botão de vocês?" A confirmação dela, em voz alta, vale mais
   que qualquer slide.

### Se der errado

| O que acontece | O que fazer |
|---|---|
| Site não carrega / bloqueia robô | Não insista. "Alguns sites bloqueiam automação — isso também é um achado." Troca de site ou abre o backup |
| Popup de cookie cobre a tela | Fecha na hora, no navegador, e comenta: "isso atrapalha a medição — e provavelmente atrapalha a sua conversão também" |
| Sai muito lento | Abre o `/tmp/backup-design.md` enquanto roda. Ninguém perde nada |
| Rede caiu | Abre o `DESIGN.md` de exemplo. A demo vira leitura guiada — funciona igual |
| O arquivo sai com pouca coisa | **Ótimo material.** "Esse site tem tão pouca regra visual definida que não deu para extrair muita coisa. Isso é um diagnóstico." |

---

## A conexão de volta — em uma frase

O fio da tarde inteira é o mesmo, e vale dizer em voz alta antes de virar para
o nó 9:

> De manhã a gente enriqueceu o contexto **de quem decide**. Agora a gente
> enriqueceu o contexto **de quem executa**. Nos dois casos o trabalho foi o
> mesmo: pegar uma coisa que estava solta e escrever num arquivo.

E por que isso importa para CRO, concretamente: com o `DESIGN.md` no projeto,
a variante que o Claude gerar sai parecida com o site. Parecida com o site, a
única coisa diferente entre o controle e a variante é **a mudança que você
quis testar**. É a diferença entre um teste que responde alguma coisa e um
teste que você não sabe ler.

---

## O que NÃO falar neste nó

- O nome da empresa que publicou o formato, a versão da especificação, o link
  do repositório. Nada disso ajuda a sala. Fica no handout, para quem quiser.
- Como a skill foi escrita, quantas linhas tem, qual navegador usa. O nó 9 é
  inteiro sobre isso — não queime o assunto aqui.
- Comparação com Figma, com token de design, com biblioteca de componente.
  A sala não tem esse vocabulário e a comparação não paga o tempo.
- **Não avalie o site da pessoa.** A skill fotografa, não julga. Se escapar um
  "nossa, que espaçamento estranho", você perde a pessoa e perde a sala junto.
  Julgamento de página é a heurística — outro nó, outra hora.

---

## Handout — o que o aluno leva

Uma página, com:

1. O que é o arquivo, em duas linhas.
2. O comando: `/detecta-design-system <url do meu site>`.
3. Onde salvar: na raiz da pasta do projeto, com o nome `DESIGN.md`.
4. A regra de ouro, em destaque: **o que estiver marcado como "não
   encontrado" é para você completar à mão, não para o Claude preencher.**
5. O link da especificação, no rodapé, para os dois ou três que vão querer.
