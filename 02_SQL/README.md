# Scripts SQL — Central Pedagogical Analytics

Esta pasta reúne os scripts SQL desenvolvidos durante a construção, exploração, validação e análise do banco de dados **Central Pedagogical Analytics**.

Os arquivos estão organizados em uma única pasta e numerados de 01 a 20, preservando a sequência de desenvolvimento do projeto.

## Organização dos scripts

| Scripts | Categoria | Descrição |
|---|---|---|
| 01–08 | Preparação e estruturação | Configuração inicial, importação dos dados e verificações preliminares do banco. |
| 09–12 | Auditoria e diagnóstico | Análise da qualidade dos dados, investigação de relacionamentos e validação de referências entre tabelas. |
| 13–18 | Tratamentos históricos | Scripts documentando procedimentos de recuperação e ajustes de referências identificados durante o desenvolvimento. |
| 19 | Auditoria final | Verificações consolidadas após as etapas de diagnóstico e tratamento. |
| 20 | Consultas analíticas | Consultas SQL para exploração dos dados e obtenção de informações relevantes para análises pedagógicas. |

## Tecnologias utilizadas

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

## Observações importantes

- A numeração original foi preservada para representar a sequência de desenvolvimento e facilitar o acompanhamento das etapas.
- Os scripts de auditoria e diagnóstico têm finalidade investigativa e de validação dos dados.
- Os scripts de tratamento histórico documentam procedimentos realizados durante o desenvolvimento. Alguns foram reconstruídos a partir do histórico do projeto e devem ser revisados antes de qualquer reutilização.
- Os scripts 13, 14 e 18 contêm operações de atualização (`UPDATE`).
- O script 06 contém uma operação de exclusão (`DELETE`) de registros vazios, com criação de backup prévio.
- Esses scripts não devem ser executados indiscriminadamente ou diretamente em ambientes de produção.
- Os dados utilizados no projeto são sintéticos e não representam registros reais de alunos, professores ou instituições.

## Escopo e limitações

O banco contém dez tabelas principais, utilizadas para representar cadastros, registros pedagógicos, acompanhamentos e informações relacionadas aos alunos.

Os relacionamentos identificados foram documentados como referências lógicas. A existência de correspondências entre os registros não significa que todas as tabelas possuam chaves estrangeiras físicas implementadas no banco.

Algumas inconsistências identificadas na fonte original foram preservadas e documentadas, evitando alterações sem respaldo nas regras de negócio.

---

**Projeto:** Central Pedagogical Analytics  
**Etapa:** Exploração, validação e análise de dados  
**Banco de dados:** CentralPedagogicalAnalytics
