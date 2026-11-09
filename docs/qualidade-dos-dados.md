# Qualidade dos dados

A etapa de auditoria avaliou preenchimento e unicidade de identificadores, linhas vazias, duplicidades, campos obrigatórios e consistência de referências entre as bases.

## Volume analisado

| Tabela | Registros |
|---|---:|
| BaseProfessores | 30 |
| BaseAlunos | 1.200 |
| BaseTurmas | 100 |
| ObservacoesAula | 550 |
| Feedbacks | 520 |
| TeachersAssessment | 280 |
| Acompanhamentos | 250 |
| PlanosAcao | 220 |
| NovosAlunos | 420 |
| MapaCalor | 300 |
| **Total** | **3.870** |

## Identificadores validados

Foram identificadas colunas candidatas a chave única e preenchida nas seguintes tabelas: BaseProfessores (30/30), BaseAlunos (1.200/1.200), BaseTurmas (100/100), ObservacoesAula (550/550), Feedbacks (520/520), TeachersAssessment (280/280), Acompanhamentos (250/250) e PlanosAcao (220/220).

MapaCalor e NovosAlunos não apresentaram identificador único validado na auditoria.

## Relacionamentos

As referências por nome foram verificadas entre as bases principais. Como a origem não possuía chaves estrangeiras físicas, as ligações identificadas são relações lógicas e dependem da consistência dos valores de referência.

## Limitações preservadas

- `BaseProfessores.Status` e `TeachersAssessment.Status` apresentaram valores nulos. Não foram preenchidos sem regra confirmada.
- Foram identificadas 70 linhas de `PlanosAcao` com área "Turma" cuja referência em `Professor/Aluno` corresponde a nomes de alunos. Esses registros foram preservados sem alteração e a relação ambígua não foi representada como relacionamento.
- A tabela PlanosAcao não foi ligada por essa coluna polimórfica, pois ela mistura referências a entidades diferentes.
- A auditoria encontrou linhas pré-formatadas vazias em BaseProfessores; a etapa histórica de limpeza removeu somente as linhas integralmente vazias, mantendo uma cópia de backup da tabela antes da exclusão.