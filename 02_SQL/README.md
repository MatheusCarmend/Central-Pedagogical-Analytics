# Scripts SQL

Os scripts estão organizados por finalidade:

- `01_setup`: criação e verificações iniciais do banco e das tabelas.
- `02_auditorias`: diagnósticos, validações de integridade, investigação e auditoria final.
- `03_tratamentos_historicos`: scripts que alteram dados ou removem linhas vazias.
- `04_consultas_analiticas`: consultas de exploração e análise.

## Atenção antes de executar

Os scripts de tratamento histórico contêm comandos de alteração (`UPDATE` e/ou `DELETE`). Eles documentam etapas realizadas durante o tratamento dos dados e **não devem ser executados novamente sem revisar o conteúdo, conferir o estado atual do banco e criar um backup**.

A ordem numérica original foi preservada nos nomes para manter a rastreabilidade. Alguns scripts das etapas 09–20 foram reconstruídos a partir do processo documentado e devem ser revisados antes de uso em outro ambiente.