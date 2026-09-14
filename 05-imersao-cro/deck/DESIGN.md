---
version: alpha
name: Claude Editorial
description: Design system do deck da Imersão Claude para CRO, derivado de claude.com — canvas creme, coral como único acento, serif display em peso 400 com tracking negativo, superfícies escuras quentes para código e produto.
colors:
  primary: "#cc785c"
  primary-active: "#a9583e"
  primary-disabled: "#e6dfd8"
  accent-teal: "#5db8a6"
  accent-amber: "#e8a55a"
  canvas: "#faf9f5"
  surface-soft: "#f5f0e8"
  surface-card: "#efe9de"
  surface-cream-strong: "#e8e0d2"
  surface-dark: "#181715"
  surface-dark-elevated: "#252320"
  surface-dark-soft: "#1f1e1b"
  hairline: "#e6dfd8"
  hairline-soft: "#ebe6df"
  ink: "#141413"
  body-strong: "#252523"
  body: "#3d3d3a"
  muted: "#6c6a64"
  muted-soft: "#8e8b82"
  on-primary: "#ffffff"
  on-dark: "#faf9f5"
  on-dark-soft: "#a09d96"
  success: "#5db872"
  warning: "#d4a017"
  error: "#c64545"
typography:
  display-xl:
    fontFamily: Copernicus, Tiempos Headline, Cormorant Garamond, Garamond, serif
    fontSize: 64px
    fontWeight: 400
    lineHeight: 1.05
    letterSpacing: -1.5px
  display-lg:
    fontFamily: Copernicus, Tiempos Headline, Cormorant Garamond, Garamond, serif
    fontSize: 48px
    fontWeight: 400
    lineHeight: 1.1
    letterSpacing: -1px
  display-md:
    fontFamily: Copernicus, Tiempos Headline, Cormorant Garamond, Garamond, serif
    fontSize: 36px
    fontWeight: 400
    lineHeight: 1.15
    letterSpacing: -0.5px
  display-sm:
    fontFamily: Copernicus, Tiempos Headline, Cormorant Garamond, Garamond, serif
    fontSize: 28px
    fontWeight: 400
    lineHeight: 1.2
    letterSpacing: -0.3px
  title-lg:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 22px
    fontWeight: 500
    lineHeight: 1.3
  title-md:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 18px
    fontWeight: 500
    lineHeight: 1.4
  title-sm:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.4
  body-md:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.55
  body-sm:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.55
  caption:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 13px
    fontWeight: 500
    lineHeight: 1.4
  caption-uppercase:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 12px
    fontWeight: 500
    lineHeight: 1.4
    letterSpacing: 1.5px
  code:
    fontFamily: JetBrains Mono, monospace
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.6
  button:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1
  nav-link:
    fontFamily: StyreneB, Inter, sans-serif
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.4
rounded:
  xs: 4px
  sm: 6px
  md: 8px
  lg: 12px
  xl: 16px
  pill: 9999px
  full: 9999px
spacing:
  xxs: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  section: 96px
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: 12px 20px
    height: 40px
  button-primary-active:
    backgroundColor: "{colors.primary-active}"
    textColor: "{colors.on-primary}"
  button-secondary:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
  button-secondary-on-dark:
    backgroundColor: "{colors.surface-dark-elevated}"
    textColor: "{colors.on-dark}"
    rounded: "{rounded.md}"
  text-link:
    textColor: "{colors.primary}"
  feature-card:
    backgroundColor: "{colors.surface-card}"
    rounded: "{rounded.lg}"
    padding: "{spacing.xl}"
  product-mockup-card-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.on-dark}"
    rounded: "{rounded.lg}"
    padding: "{spacing.xl}"
  code-window-card:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.on-dark}"
    typography: "{typography.code}"
    rounded: "{rounded.lg}"
    padding: "{spacing.lg}"
  callout-card-coral:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.lg}"
    padding: "{spacing.xxl}"
  badge-pill:
    backgroundColor: "{colors.surface-card}"
    textColor: "{colors.ink}"
    typography: "{typography.caption}"
    rounded: "{rounded.pill}"
    padding: 4px 12px
  badge-coral:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.caption-uppercase}"
    rounded: "{rounded.pill}"
    padding: 4px 12px
  text-input:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    height: 40px
  footer:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.on-dark-soft}"
---

## Como este arquivo é usado neste deck

Este DESIGN.md é a fonte de verdade visual da apresentação. Os tokens do frontmatter
estão mapeados em `deck-styles.css` (variáveis `--bg`, `--ink`, `--accent`, `--noir-*`,
`--f-display`, `--f-sans`, `--f-mono`) e o deck é o exemplo vivo mostrado no nó 8.
Tradução para a escala de slide (1920×1080): os tamanhos tipográficos abaixo são de web;
no deck cada passo é multiplicado por ~2,5 mantendo peso, entrelinha e tracking.

Adaptações assumidas (fora da spec original de claude.com):
- Copernicus e StyreneB são licenciadas. O deck usa **Cormorant Garamond 500** e **Inter**,
  os substitutos documentados abaixo.
- As cores semânticas (success, warning, error) não foram observadas no site; estão no
  frontmatter por completude e **não aparecem no deck**.
- "Navy" no texto original descreve `{colors.surface-dark}`, que é um preto quente
  (#181715), não azul.

## Overview

Claude.com is the warmest, most editorial interface in the AI-product category. The base atmosphere is a **tinted cream canvas** (`{colors.canvas}` — #faf9f5) — distinctly warm, deliberately not the cool gray-white that every other AI brand uses. Headlines run a **slab-serif display** ("Copernicus" / Tiempos Headline) at weight 400 with negative letter-spacing, paired with **StyreneB / Inter** body sans. The combination feels like a literary publication, not a SaaS marketing page.

Brand voltage comes from the **cream + coral pairing** — coral (`{colors.primary}` — #cc785c) is the signature Anthropic accent, used on every primary CTA, on the brand wordmark, and on full-bleed callout cards. The coral is warm, slightly muted, never cyan/blue.

The system has three surface modes that alternate page-by-page:
1. **Cream canvas** (`{colors.canvas}`) — default body floor
2. **Light cream cards** (`{colors.surface-card}`) — feature card backgrounds
3. **Dark warm product surfaces** (`{colors.surface-dark}`) — code editor mockups, model showcase cards, pre-footer CTAs, footer itself

The dark surfaces are where Claude shows its product chrome — code blocks, terminal output, model comparison tables. The cream-to-dark contrast is the page's pacing rhythm.

**Key Characteristics:**
- Warm cream canvas (`{colors.canvas}`) with dark warm-ink text (`{colors.ink}`).
- Coral primary (`{colors.primary}`). Scarce on individual elements, generous on full-bleed coral callout cards.
- Serif display headlines at weight 400 with negative letter-spacing. Humanist sans body.
- Dark product mockup cards (`{colors.surface-dark}`) carrying code blocks and terminal panels.
- Light cream feature cards (`{colors.surface-card}`), one step darker than canvas.
- Border radius is hierarchical: `{rounded.md}` for buttons and inputs, `{rounded.lg}` for content and product cards, `{rounded.xl}` for hero containers, `{rounded.pill}` for badges.
- Section rhythm `{spacing.section}`; internal card padding `{spacing.xl}`.

## Colors

### Brand & Accent
- **Coral / Primary** (`{colors.primary}`): every primary CTA, full-bleed coral callout cards, the wordmark accent.
- **Coral Active** (`{colors.primary-active}`): the press / darker variant.
- **Coral Disabled** (`{colors.primary-disabled}`): desaturated cream-tinted disabled state.
- **Accent Teal** (`{colors.accent-teal}`) and **Accent Amber** (`{colors.accent-amber}`): sparse companions on secondary product surfaces and category badges.

### Surface
- **Canvas** (`{colors.canvas}`): the default page floor. Tinted cream, deliberately not pure white.
- **Surface Soft** (`{colors.surface-soft}`): section dividers, very-soft band backgrounds.
- **Surface Card** (`{colors.surface-card}`): feature and content cards.
- **Surface Cream Strong** (`{colors.surface-cream-strong}`): selected tabs and emphasized bands.
- **Surface Dark** (`{colors.surface-dark}`): code mockups, showcase cards, footer.
- **Surface Dark Elevated** (`{colors.surface-dark-elevated}`): elevated cards inside dark bands.
- **Surface Dark Soft** (`{colors.surface-dark-soft}`): code block backgrounds inside larger dark cards.
- **Hairline** (`{colors.hairline}`) and **Hairline Soft** (`{colors.hairline-soft}`): 1px border tones. Borders feel like one elevation step, not ink lines.

### Text
- **Ink** (`{colors.ink}`): headlines and primary text.
- **Body Strong** (`{colors.body-strong}`), **Body** (`{colors.body}`): lead and running text.
- **Muted** (`{colors.muted}`), **Muted Soft** (`{colors.muted-soft}`): sub-headings, captions, fine print.
- **On Primary** (`{colors.on-primary}`): text on coral.
- **On Dark** (`{colors.on-dark}`), **On Dark Soft** (`{colors.on-dark-soft}`): text on dark surfaces. On Dark echoes the canvas tone.

### Semantic
- **Success** (`{colors.success}`), **Warning** (`{colors.warning}`), **Error** (`{colors.error}`): não observados no site de marketing; mantidos por completude.

## Typography

Display: serif at weight 400 with negative tracking, never bold. Body: humanist sans at 400, labels at 500. Code: JetBrains Mono.

| Token | Use |
|---|---|
| `{typography.display-xl}` | hero h1 |
| `{typography.display-lg}` | section heads |
| `{typography.display-md}` | sub-section heads, model names |
| `{typography.display-sm}` | callout headlines, pricing tier names |
| `{typography.title-lg}` `{typography.title-md}` `{typography.title-sm}` | labels and card titles, sans 500 |
| `{typography.body-md}` `{typography.body-sm}` | running text, sans 400 |
| `{typography.caption}` `{typography.caption-uppercase}` | badges, category tags |
| `{typography.code}` | code blocks and terminal text |
| `{typography.button}` `{typography.nav-link}` | UI labels |

**Principles.** Negative letter-spacing on display sizes is essential. Switching the display to a sans would make the brand feel like every other AI tool. Body stays humanist, never geometric; Helvetica or Arial break the warm-editorial feel.

**Substitutes.** Copernicus → Tiempos Headline → **Cormorant Garamond 500 with -0.02em** → EB Garamond. StyreneB → **Inter** → Söhne.

## Layout

Base unit 4px. `{spacing.section}` between major bands; `{spacing.xl}` inside feature cards; `{spacing.lg}` inside code windows. Max content width ~1200px on web. Whitespace is generous and uniform: the page reads like a long-form column, not a template.

## Elevation & Depth

Color-block first, shadow rare. Depth comes from cream-vs-dark surface contrast. Cards have no shadow; a faint `0 1px 3px rgba(20,20,19,0.08)` is the only shadow the system uses, and rarely. Dark code windows carry their own internal chrome (line numbers, status bar in `{colors.surface-dark-elevated}`).

## Shapes

`{rounded.xs}` badge accents · `{rounded.sm}` small inline buttons · `{rounded.md}` CTAs, inputs, tabs · `{rounded.lg}` content cards, code windows · `{rounded.xl}` hero containers · `{rounded.pill}` badges · `{rounded.full}` avatars.

Illustration over photography: line-art with coral and dark strokes on cream, code editor mockups, terminal output. Avatars, when used, crop to circles.

## Components

- `{component.button-primary}` and `{component.button-primary-active}`: the coral CTA and its pressed state.
- `{component.button-secondary}`: cream with hairline outline. `{component.button-secondary-on-dark}`: stays dark, never inverts to light.
- `{component.text-link}`: inline coral links.
- `{component.feature-card}`: cream card, `{rounded.lg}`, `{spacing.xl}` padding, icon + title + body.
- `{component.product-mockup-card-dark}`: dark card showing real product chrome.
- `{component.code-window-card}`: dark code editor with `{colors.surface-dark-soft}` inner block. The signature visual of Claude Code pages.
- `{component.callout-card-coral}`: full-bleed coral card; the CTA inside uses an inverted cream button.
- `{component.badge-pill}` and `{component.badge-coral}`: category tags and NEW/BETA highlights.
- `{component.text-input}`: canvas background, hairline border, `{rounded.md}`.
- `{component.footer}`: dark, never inverts.

## Do's and Don'ts

### Do
- Anchor every surface on the cream canvas. Pure white reads as "any other AI tool".
- Serif for every display headline, at 400, with negative tracking. Sans body.
- Reserve coral for primary CTAs and full-bleed coral moments.
- Show real product chrome (code windows, terminal) instead of illustrations of code.
- Alternate cream and dark bands; the rhythm is the pacing mechanism.
- Keep `{spacing.section}` between major bands.

### Don't
- No cool grays or pure white canvas.
- No bold serif display. 700 reads as bombastic.
- No cool blue or saturated cyan accent.
- No coral everywhere.
- No sans display headlines.
- No two consecutive bands in the same surface mode.
- No hover styling beyond primary darkening on press.

## Responsive Behavior

Mobile < 768px: single column, hero h1 64→32px, grids 1-up. Tablet 768–1024: 2-up grids. Desktop 1024–1440: full nav, 3-up grids. Wide > 1440: same, content capped at 1200px. Code windows scroll horizontally rather than wrapping. Touch targets: buttons at least 40×40px.

## Iteration Guide

1. One component at a time, by its key (`{component.feature-card}`, `{component.code-window-card}`).
2. Variants (`-active`, `-disabled`, `-focused`) are separate entries in `components:`.
3. Use `{token.refs}` everywhere; never inline hex in the body.
4. Document default and pressed states only.
5. Display stays serif 400 with negative tracking; body stays sans 400. The split is unbreakable.
6. Cream + coral + dark is the trinity. No fourth surface tone.
7. When in doubt about emphasis: bigger serif before bolder weight.

## Known Gaps

- Copernicus and StyreneB are licensed and not available as web fonts; substitutes are documented above.
- The Anthropic spike-mark is a logo asset, not a token.
- Animation and transition timings are out of scope.
- Form validation states beyond focus were not extracted.
- Semantic colors were not observed on the marketing surface.
- The claude.ai product surface adds components (chat bubbles, upload chips, sidebar) out of scope here.
