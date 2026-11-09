USE CentralPedagogicalAnalytics;
GO

/* Validação de possíveis referências entre registros.
   Não altera dados. Use os resultados para decidir se a correspondência
   é suficientemente confiável antes de atualizar qualquer tabela. */

SELECT a.Aluno, a.Turma, a.Coordenador AS CoordenadorAtual,
       b.Coordenador AS CoordenadorNaBaseAlunos
FROM dbo.Acompanhamentos a
LEFT JOIN dbo.BaseAlunos b
  ON LTRIM(RTRIM(a.Aluno)) = LTRIM(RTRIM(b.Aluno))
 AND LTRIM(RTRIM(a.Turma)) = LTRIM(RTRIM(b.Turma))
ORDER BY a.Aluno, a.Turma;
GO

SELECT n.Aluno, n.Turma, n.Coordenador AS CoordenadorAtual,
       t.Coordenador AS CoordenadorNaBaseTurmas
FROM dbo.NovosAlunos n
LEFT JOIN dbo.BaseTurmas t
  ON LTRIM(RTRIM(n.Turma)) = LTRIM(RTRIM(t.Turma))
ORDER BY n.Turma, n.Aluno;
GO
