# Qualidade dos dados

Foram feitas verificações de preenchimento e unicidade de identificadores, linhas vazias, duplicidades e referências entre as dez bases do projeto.

## Identificadores

Foram encontrados identificadores preenchidos e únicos nas tabelas:

- `BaseProfessores`: 30 de 30
- `BaseAlunos`: 1.200 de 1.200
- `BaseTurmas`: 100 de 100
- `ObservacoesAula`: 550 de 550
- `Feedbacks`: 520 de 520
- `TeachersAssessment`: 280 de 280
- `Acompanhamentos`: 250 de 250
- `PlanosAcao`: 220 de 220

Em `MapaCalor` e `NovosAlunos`, não foi validada uma coluna de identificador único.

## Pontos observados

- `BaseProfessores.Status` e `TeachersAssessment.Status` possuem valores nulos. Eles foram mantidos porque não havia uma regra confirmada para preenchê-los.
- A tabela `BaseProfessores` continha linhas totalmente vazias, geradas pela formatação da planilha. A limpeza removeu apenas essas linhas, após a criação de um backup.
- As referências entre tabelas foram conferidas pelos valores de nome. Como não existem chaves estrangeiras físicas na origem, esses relacionamentos são lógicos.
- Em 70 registros de `PlanosAcao` classificados como área "Turma", a referência aponta para alunos. A inconsistência foi documentada e os registros foram preservados.

As verificações e decisões estão refletidas nos scripts SQL do projeto.
