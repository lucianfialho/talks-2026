---
name: heuristic-scan
description: Análise heurística visual de uma variante de teste A/B usando agent-browser. Verifica CTA acima da dobra, contraste, hierarquia visual, mobile UX e friction points. Complementa a análise quantitativa com hipóteses sobre o porquê do resultado.
---

## Tarefa

Dada uma URL de variante de teste, fazer varredura heurística automática e gerar hipóteses sobre o resultado quantitativo.

## Input necessário

Antes de começar, perguntar:
1. URL da variante de controle
2. URL da variante B (ou parâmetro de variação)
3. Resultado quantitativo que queremos explicar (ex: "lift de 12% concentrado em mobile")

## Checklist de heurísticas (rodar com agent-browser)

### Desktop (viewport 1440x900)

1. CTA principal: está acima da dobra sem scroll?
2. Contraste do botão CTA: passa WCAG AA (ratio >= 4.5:1)?
3. Hierarquia visual: onde o olho vai primeiro? (headline, imagem, CTA, preço)
4. Número de campos no form principal (se existir)
5. Presença de elementos de confiança: selos, reviews, garantia
6. Velocidade percebida: conteúdo acima da dobra carrega em < 2s?

### Mobile (viewport 390x844 — iPhone 14)

7. CTA principal: está no thumb zone (bottom 40% da tela)?
8. Tap targets: botões principais >= 44x44px?
9. Texto legível sem zoom: font-size >= 16px no corpo?
10. Form fields: teclado numérico disparado automaticamente em campos de número?
11. Distância entre links clicáveis: >= 8px de espaçamento?

## Instruções de execução

Para cada item do checklist:
1. Usar `agent-browser` para capturar screenshot no viewport correto
2. Avaliar: ✅ passa / ⚠️ atenção / ❌ falha
3. Para itens ❌: descrever o problema em 1 linha e sugerir hipótese de impacto

## Output esperado

```markdown
## Heuristic Scan — [URL]
**Viewport:** Desktop 1440 / Mobile 390

### Desktop
- ✅ CTA acima da dobra
- ✅ Contraste do botão: ratio 5.2:1
- ⚠️ Hierarquia visual: imagem de hero disputa atenção com CTA
- ❌ Form tem 6 campos (baseline: 4 campos)

### Mobile
- ✅ CTA no thumb zone
- ❌ Tap target do botão secundário: 32px (abaixo de 44px)
- ✅ Font-size: 16px

### Hipóteses para o resultado quantitativo
1. **Lift em mobile provavelmente vem do CTA no thumb zone** — na variante B o botão foi movido pra parte inferior da tela. Isso explica preferência mobile.
2. **Desktop não moveu porque o form ainda tem 6 campos** — a fricção não mudou. Testar redução de campos pode destravar desktop.
3. **Tap target do botão secundário pode causar cliques errados** — usuários tentando clicar em X podem estar ativando Y.
```

## Contexto esperado

- `agent-browser` disponível no Claude Code (MCP tool)
- URL acessível publicamente ou em ambiente de staging
- Resultado quantitativo da análise `/post-test-segments` disponível para correlacionar hipóteses
