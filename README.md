# Central Pedagogical Analytics

Projeto pessoal de análise de dados com informações pedagógicas sintéticas. A ideia é praticar organização de dados, SQL, modelagem e análise a partir de planilhas.

**Todos os dados são fictícios** e foram criados para este projeto.

## O projeto

Foram selecionadas dez bases de uma planilha de estudo e importadas para o SQL Server, totalizando **3.870 registros**.

O trabalho inclui:
- organização das bases no SQL Server;
- verificações de qualidade e consistência;
- análise de referências entre tabelas;
- consultas SQL para explorar os dados;
- diagrama de relacionamento entre as tabelas.

## Ferramentas

- Excel
- SQL Server e SSMS
- SQL
- diagrams.net (Draw.io)

## Estrutura do repositório

- `01_Excel/`: planilha com as bases utilizadas e o dicionário de dados.
- `02_SQL/`: scripts usados durante o projeto.
- `03_Modelagem/`: diagrama entidade-relacionamento.
- `docs/`: notas sobre o escopo e os pontos encontrados na análise.

## Alguns pontos encontrados

As tabelas de origem não tinham chaves estrangeiras físicas; por isso, os relacionamentos foram identificados pelas referências existentes nos dados. Também foram preservados campos de status sem preenchimento quando não havia uma regra clara para completá-los.

Em 70 registros de `PlanosAcao` classificados como área "Turma", a referência corresponde a alunos, e não a turmas. Esses registros foram mantidos sem correção automática.

Mais detalhes:
- [Escopo e limitações](docs/escopo-e-limitacoes.md)
- [Qualidade dos dados](docs/qualidade-dos-dados.md)

## Status

A etapa de exploração, auditoria e consultas SQL está documentada. A parte de Power BI será desenvolvida posteriormente.
