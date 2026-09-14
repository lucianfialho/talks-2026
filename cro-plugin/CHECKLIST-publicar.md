# Checklist — publicar o plugin no GitHub

1. Criar o repositório público `lucianfialho/cro-plugin` (vazio, sem README gerado pelo GitHub).
2. Copiar o **conteúdo** de `cro-plugin/` para a raiz do clone — `.claude-plugin/` precisa ficar na raiz do repo, não numa subpasta.
3. Conferir que `.claude-plugin/marketplace.json`, `.claude-plugin/plugin.json`, `skills/` (10 pastas) e `README.md` estão lá.
   Copiar também `05-imersao-cro/hooks/` → `hooks/` e `05-imersao-cro/aluno/` → `aluno/` (o slide 13 promete "tudo na mesma URL"; o plugin ignora essas pastas).
4. Rodar `claude plugin validate .` na raiz do clone — precisa dar `✔ Validation passed`.
5. `git add .` + `git commit -m "feat: plugin de CRO 0.1.0"` + `git push -u origin main`.
6. Opcional: `claude plugin tag .` para criar a tag `cro--v0.1.0` do release.
7. Fora do Claude Code, testar de fora: `claude plugin marketplace add lucianfialho/cro-plugin`.
8. `claude plugin install cro-ai-day@cro-plugin` e conferir `claude plugin details cro-ai-day@cro-plugin` → `Skills (10)`.
9. Abrir o `claude`, digitar `/` e confirmar que as skills aparecem com prefixo `cro-ai-day:`.
10. Se o teste foi só de validação, limpar: `claude plugin uninstall cro-ai-day@cro-plugin` + `claude plugin marketplace remove cro-plugin`.
