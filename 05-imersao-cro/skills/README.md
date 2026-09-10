# Pacote de skills — Imersão CRO com Claude

Sete skills, três cadeiras, duas camadas. Este documento é o que você leva
para casa: se perdeu o dia da imersão, dá para reinstalar tudo sozinho lendo
só este arquivo.

## O mapa

| Cadeira | Skill | Desktop | Claude Code |
|---|---|---|---|
| CRO | `heuristica-morys` | ✅ | ✅ |
| CRO | `hipotese-estruturada` | ✅ (bloqueia sem evidência) | ✅ (busca no DuckDB) |
| CRO | `ice-score` | ✅ | ✅ (+ persiste backlog) |
| Analytics | `srm-check` | ❌ | ✅ |
| Analytics | `post-test-segments` | ❌ | ✅ |
| Dev | `variante-builder` | ❌ | ✅ |
| Dev | `pre-flight-check` | ❌ | ✅ |

Repare no padrão: as três skills de CRO existem nas duas camadas porque não
dependem de ler arquivo nem rodar código — são raciocínio estruturado sobre o
que você cola na conversa. As quatro de Analytics e Dev só existem em Claude
Code porque dependem de rodar SQL contra o DuckDB local ou escrever arquivo em
disco. Isso não é uma limitação de implementação — é a fronteira real entre as
duas camadas, e é o assunto da próxima seção.

## Por que só três das sete funcionam no Desktop

Claude Desktop, quando você cola instruções em **Instruções do projeto**, não
tem acesso a ferramentas — não lê arquivo, não roda SQL, não escreve no disco.
Ele só enxerga o que você cola na própria conversa (texto, prints, uma
planilha copiada). É um modelo de linguagem seguindo um roteiro escrito em
linguagem natural, sem execução de código por trás.

Isso é suficiente para `heuristica-morys` (você cola a URL e um print),
`hipotese-estruturada` (você cola o achado e a evidência) e `ice-score` (você
cola a lista de hipóteses). Não é suficiente para `srm-check` (precisa rodar
uma query e um chi-quadrado sobre dados reais), `post-test-segments` (idem,
sobre `cro-clean.db`), `variante-builder` (precisa escrever um arquivo `.js`
em disco) ou `pre-flight-check` na sua forma completa (o checklist é só
texto, mas o valor da imersão é acoplá-lo ao dado real).

Essa é a limitação declarada, não escondida: **as instruções coladas num
Project do Desktop não leem arquivo, não rodam SQL e não escrevem no disco.**
Se seu fluxo de CRO depende de dado real, a camada certa é Claude Code, não
Desktop.

## Instalação no Claude Desktop

1. Abrir Claude Desktop → **Projects** → criar projeto "CRO".
2. Em **Instruções do projeto**, colar o conteúdo de `skills/desktop/<skill>.md`
   (os três arquivos são `heuristica-morys.md`, `hipotese-estruturada.md` e
   `ice-score.md`).
3. Dois caminhos possíveis:
   - Um projeto por skill (três projetos "CRO — Heurística", "CRO —
     Hipótese", "CRO — ICE"); ou
   - Um projeto único "CRO" com as três instruções coladas em sequência —
     mais rápido de montar e funciona, porque o Claude reconhece qual delas
     usar pelo pedido que você faz na conversa.
4. **Limitação declarada:** essas instruções não leem arquivo, não rodam SQL
   e não escrevem no disco. Tudo que a skill precisa (URL, print, achado,
   lista de hipóteses) você cola na própria conversa.

## Instalação no Claude Code

```bash
cp -r 05-imersao-cro/skills/code/* ~/.claude/skills/
ls ~/.claude/skills/ | grep -E 'morys|hipotese|ice-score|srm|segments|variante|pre-flight'
```

Esperado: as 7 skills listadas.

## Dataset

```bash
cp -r 05-imersao-cro/data ./data
duckdb data/cro.db -c "SELECT COUNT(*) FROM events_clean;"
```

`data/cro.db` traz o dataset bruto (com o problema de SRM que `srm-check`
existe para pegar); `data/cro-clean.db` é a versão já validada, usada por
`post-test-segments`. As skills de Claude Code assumem que `data/` está no
diretório de trabalho a partir de onde você abre o Claude Code — copie a
pasta para o projeto onde for rodar as skills, não só para um lugar solto.

## Como saber se funcionou

Abrir o Claude Code no diretório com `data/` e pedir *"roda srm-check"*.

Se a skill não for encontrada, confira se o arquivo está em
`~/.claude/skills/<nome>/SKILL.md` — **a pasta precisa ter o mesmo nome do
campo `name` do frontmatter.** Esse é o erro mais comum de instalação manual:
renomear a pasta ao copiar, ou copiar o conteúdo sem a pasta em volta.

## Troubleshooting rápido

| Sintoma | Causa provável | Correção |
|---|---|---|
| Claude Code não reconhece a skill | Nome da pasta ≠ `name` do frontmatter | Renomear a pasta para bater exatamente com o `name` |
| Skill de Analytics/Dev não roda queries | `data/` não está no diretório de onde o Claude Code foi aberto | Copiar `05-imersao-cro/data` para a raiz do projeto atual |
| Skill de CRO "trava" pedindo evidência que você já deu | Evidência não está explícita no texto colado (ex.: só um número solto, sem fonte) | Cole a evidência com a fonte (ex.: "GA4, últimos 28 dias: 4,2% vs 3,1%") |
| No Desktop, a skill tenta "rodar" algo | Confundiu a versão Desktop com a de Code | Use a versão Desktop só para as três skills de CRO — as outras quatro não têm equivalente Desktop |
