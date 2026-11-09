# Central Pedagogical Analytics

Projeto de portfólio de análise de dados com foco em organização, qualidade, modelagem e exploração de dados de uma operação pedagógica fictícia.

> **Dados 100% sintéticos.** Nomes, registros e situações foram criados para fins de estudo. Nenhum dado real de alunos, professores ou instituição deve ser publicado neste repositório.

## Objetivo

Construir uma base analítica relacional a partir de planilhas, documentar decisões de tratamento e qualidade dos dados e preparar consultas que apoiem análises sobre professores, alunos, turmas e processos de acompanhamento pedagógico.

## Escopo da versão atual

A etapa SQL contempla dez conjuntos de dados:

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

O trabalho inclui importação e organização das tabelas, auditorias de identificadores, análise de valores ausentes e duplicidades, validação de referências entre conjuntos de dados, documentação das limitações encontradas e consultas analíticas em SQL Server.

## O que ficou fora do escopo SQL

A planilha de origem também contém abas de visão gerencial e controle operacional, como **Central Geral**, **Mini Centrais**, **Radar Geral**, **Asana Controle**, **Processos** e **Configurações**. Essas abas não foram modeladas como tabelas nesta versão.

A decisão foi delimitar o projeto às bases estruturadas que sustentam análises pedagógicas. Em particular, a aba **Asana Controle** representa um fluxo de tarefas separado; não foi feita integração com a API do Asana nem análise de tarefas nessa etapa. As abas de dashboard e configurações também não foram tratadas como fontes transacionais independentes.

## Tecnologias

- Microsoft SQL Server / SQL Server Management Studio
- Excel (fonte de dados sintéticos)
- SQL (auditoria, validação e consultas analíticas)
- Modelagem de dados (DER)

## Estrutura

- `01_Excel/`: arquivo de exemplo com somente as dez bases incluídas no escopo e o dicionário de dados.
- `02_SQL/`: scripts SQL organizados por etapa.
- `03_Modelagem/`: diagrama entidade-relacionamento (a ser incluído na próxima atualização).
- `docs/`: documentação de escopo, qualidade e decisões.

## Limitações e decisões de modelagem

- As relações entre tabelas foram identificadas por referências lógicas; as tabelas de origem não possuíam chaves estrangeiras físicas.
- Os campos de status nulos em algumas tabelas foram preservados, pois não havia regra de negócio validada para preenchimento.
- Foram identificados 70 registros de `PlanosAcao` classificados como área "Turma" cuja referência em `Professor/Aluno` corresponde a alunos cadastrados, e não a turmas. Esses registros foram preservados sem correção automática e a tabela não foi conectada ao DER por essa referência ambígua.
- `MapaCalor` e `NovosAlunos` não apresentaram uma coluna de identificador único validada no processo de auditoria.

Consulte [docs/escopo-e-limitacoes.md](docs/escopo-e-limitacoes.md) e [docs/qualidade-dos-dados.md](docs/qualidade-dos-dados.md) para detalhes.

## Arquivo de dados

O arquivo `Central_Pedagogical_Analytics_Dados_Sinteticos.xlsx` contém somente as dez bases do escopo e o dicionário de dados. As abas de painéis, controle operacional, processos e configurações foram deixadas de fora dessa cópia enxuta; a planilha de origem completa foi preservada separadamente.

## Status

**Versão 1 — etapa SQL:** documentação inicial publicada com scripts e diagrama adicionados.  
**Power BI:** etapa posterior, em desenvolvimento; os dashboards ainda não fazem parte desta entrega.
