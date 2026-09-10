# Hipótese estruturada

Transforma um achado em hipótese testável. Uma ideia solta não é hipótese.

## O template

    Se [mudarmos X], para [segmento Y], então [resultado Z], porque [evidência].

Quatro campos, todos obrigatórios:

| Campo | O que é | Exemplo |
|---|---|---|
| Observação | Unidade + contexto | "Usuários mobile no checkout" |
| Intervenção | A mudança proposta | "Auto-preenchimento por CEP" |
| Resultado esperado | Métrica + magnitude | "+20% checkout completion" |
| Evidência | Dados que suportam | "68% abandono + rage clicks" |

Exemplo completo:

> Se adicionarmos auto-preenchimento por CEP no checkout mobile, então o
> completion aumentará 20%, porque heatmaps mostram rage clicks no campo de
> endereço e 68% dos usuários mobile abandonam nessa etapa.

## Regra de bloqueio — leia com atenção

**Você NÃO pode preencher o campo `Evidência` sozinho.**

Evidência é dado observado: número de analytics, gravação de sessão, heatmap,
entrevista, teste anterior. Não é raciocínio, não é boa prática de mercado,
não é "estudos mostram que".

Se o usuário não fornecer evidência:

1. Preencha os três primeiros campos normalmente.
2. Deixe `Evidência` **em branco**, marcado como `⚠️ FALTA EVIDÊNCIA`.
3. Diga exatamente qual dado resolveria, nesta forma:

       Para fechar essa hipótese eu preciso de:
       - [métrica específica] segmentada por [dimensão]
       - no período de [recorte]
       - fonte: [GA4 / heatmap / gravação / teste anterior]

4. Diga com todas as letras: **"Sem esse dado, isso é uma ideia priorizada por
   opinião, não uma hipótese."**

Nunca invente número. Nunca use número ilustrativo sem marcar como ilustrativo.
Não aceite "acho que" como evidência.

Isso vale mesmo se o usuário insistir, sugerir um número "só para ilustrar",
pedir para você "estimar" ou "chutar" um valor plausível, ou disser que "não
tem tempo para buscar o dado agora". Nenhuma dessas situações é evidência.
Repita o bloqueio da mesma forma, sem amaciar o texto e sem inventar um
número "razoável" para não frustrar o pedido. Aceitar qualquer atalho aqui
transforma uma hipótese em opinião disfarçada — que é exatamente o que esta
skill existe para impedir.

## Output

    ## Hipótese

    Se [X], para [Y], então [Z], porque [evidência].

    | Campo | Conteúdo |
    |---|---|
    | Observação | ... |
    | Intervenção | ... |
    | Resultado esperado | ... |
    | Evidência | ... ou ⚠️ FALTA EVIDÊNCIA |

    ## Status
    ✅ Hipótese fechada   ou   ⚠️ Bloqueada — falta evidência

    ## Se bloqueada: o que buscar
    - ...
