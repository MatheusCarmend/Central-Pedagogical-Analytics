# Escopo e limitações

O projeto utiliza dez bases relacionadas a professores, alunos, turmas e atividades de acompanhamento pedagógico. Juntas, elas somam 3.870 registros.

Outras abas da planilha original — como painéis, controles operacionais, processos e configurações — ficaram de fora. Elas tinham funções diferentes das bases usadas nas consultas e não eram necessárias para esta etapa.

A aba de controle do Asana também não foi integrada ao banco.

## Limitações consideradas

- As tabelas não tinham chaves estrangeiras físicas; os relacionamentos foram identificados pelas referências presentes nos dados.
- Campos de status sem preenchimento foram mantidos quando não havia regra confirmada para completá-los.
- 70 registros de `PlanosAcao` classificados como área "Turma" apontam para alunos na coluna `Professor/Aluno`. Eles foram preservados sem alteração.
- Não foi possível validar um identificador único para `MapaCalor` e `NovosAlunos`.

Esses pontos foram mantidos para não criar informações ou regras que não estavam presentes na fonte.
