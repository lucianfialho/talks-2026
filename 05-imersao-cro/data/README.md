# Datasets — imersão CRO

| Arquivo | O que tem | Usado em |
|---|---|---|
| `cro.db` | Teste A/B com **SRM** — control 4000 / variant_b 4400 | Bloco 16h05, `srm-check`. O aluno vê a skill invalidar um teste que parecia vencedor. |
| `cro-clean.db` | Mesmo teste, tráfego equilibrado | Bloco 16h05, `post-test-segments`. Segmentação só faz sentido em teste válido. |

Rodar segmentação em teste com SRM é exatamente o erro que a skill anterior existe para impedir. Os dois arquivos tornam essa sequência demonstrável em vez de teórica.

## Detalhes técnicos

- `cro.db` é uma cópia direta do `cro.db` da raiz do repositório. SRM proposital: χ² ≈ 19,05, p ≈ 1,3e-5 (control 4000 usuários, variant_b 4400 usuários).
- `cro-clean.db` foi derivado de `cro.db` por amostragem estratificada por `device_category`: cada célula (variante × device) de `variant_b` foi reduzida na mesma proporção (4000/4400), preservando a distribuição de dispositivos. Resultado: control 4000 / variant_b 4000, χ² = 0, sem SRM residual.
- Ambos os arquivos expõem a mesma estrutura: tabela `events` (`user_pseudo_id VARCHAR, event_name VARCHAR, event_timestamp TIMESTAMP, device_category VARCHAR, traffic_source VARCHAR, experiment_variant VARCHAR, session_duration BIGINT, converted BIGINT, is_new_user BIGINT`) e as views `sessions` e `events_clean`.
- O balanceamento por device preserva os achados por segmento: o lift forte de `mobile` na variante B e o lift **negativo** de `tablet` continuam presentes em `cro-clean.db`, sustentando a fala de que "winner e loser é uma leitura pobre do resultado" quando o teste não é olhado por segmento.

## Por que os `.db` estão versionados

`cro.db` e `cro-clean.db` são versionados de propósito neste repositório — são asset de curso distribuído ao aluno, não banco de scratch. O `.gitignore` da raiz tem uma regra `*.db` para artefatos de desenvolvimento, mas com uma exceção explícita para `05-imersao-cro/data/*.db`. Quem clonar o repositório já recebe os dois datasets prontos, sem nenhum passo de geração — importante numa sala de aula com 50 pessoas e um intervalo curto entre os blocos.
