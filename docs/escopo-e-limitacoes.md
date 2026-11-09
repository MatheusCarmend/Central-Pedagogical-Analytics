# Escopo e limitações

## Escopo adotado

O projeto foi delimitado às dez bases importadas para o SQL Server: professores, alunos, turmas, observações de aula, feedbacks, assessments, acompanhamentos, planos de ação, novos alunos e mapa de calor. Essas bases permitem demonstrar integração relacional, auditoria de qualidade e consultas analíticas.

## Abas não incluídas no banco

A planilha de origem também contém abas com funções diferentes das bases estruturadas:

- **Central Geral** e **Mini Centrais**: painéis de consolidação e visualização.
- **Radar Geral**: visão de prioridades e pendências.
- **Asana Controle**: acompanhamento de tarefas e ações operacionais.
- **Processos**: documentação de etapas, responsáveis e prazos.
- **Configurações**: listas de valores e parâmetros usados por validações e fórmulas.
- **README Projeto**, **Guia V5** e **Teste de Integração**: orientação e apoio ao funcionamento da planilha.

Essas abas ficaram fora do escopo do banco relacional desta versão. Algumas são camadas de apresentação ou documentação, e não tabelas transacionais. A aba Asana Controle não foi integrada ao Asana nem modelada como tabela SQL.

## Como apresentar essa decisão

O projeto demonstra a construção de uma camada de dados analítica a partir das bases pedagógicas. Os painéis e controles operacionais existentes na planilha original foram considerados fora do escopo da primeira entrega. Uma evolução futura pode modelar o controle de tarefas e integrar dados do Asana, caso exista uma necessidade analítica clara.

## Decisões de qualidade

- Não preencher automaticamente campos de status nulos sem regra de negócio validada.
- Preservar os 70 registros de Planos de Ação com área "Turma" cuja referência em `Professor/Aluno` corresponde a alunos, não a turmas.
- Tratar relacionamentos como lógicos quando não há chaves estrangeiras físicas na origem.
- Não criar identificadores artificiais retroativamente em Mapa de Calor e Novos Alunos sem documentar uma regra de negócio.