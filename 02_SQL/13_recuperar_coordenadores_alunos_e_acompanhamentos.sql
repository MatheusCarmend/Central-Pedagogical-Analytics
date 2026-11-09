USE CentralPedagogicalAnalytics;
GO

/* ATENÇÃO: este arquivo contém UPDATEs históricos do processo de limpeza.
   Execute somente se precisar repetir a recuperação e depois de validar
   os resultados dos scripts 11 e 12. Os UPDATEs só preenchem valores ausentes. */

/* Recupera o coordenador de Acompanhamentos usando aluno + turma. */
UPDATE a
SET Coordenador = b.Coordenador
FROM dbo.Acompanhamentos a
INNER JOIN dbo.BaseAlunos b
  ON LTRIM(RTRIM(a.Aluno)) = LTRIM(RTRIM(b.Aluno))
 AND LTRIM(RTRIM(a.Turma)) = LTRIM(RTRIM(b.Turma))
WHERE (a.Coordenador IS NULL OR LTRIM(RTRIM(a.Coordenador)) = '')
  AND b.Coordenador IS NOT NULL
  AND LTRIM(RTRIM(b.Coordenador)) <> '';
GO

/* Recupera o coordenador da tabela NovosAlunos usando a turma.
   A correspondência deve ter sido validada previamente. */
UPDATE n
SET Coordenador = t.Coordenador
FROM dbo.NovosAlunos n
INNER JOIN dbo.BaseTurmas t
  ON LTRIM(RTRIM(n.Turma)) = LTRIM(RTRIM(t.Turma))
WHERE (n.Coordenador IS NULL OR LTRIM(RTRIM(n.Coordenador)) = '')
  AND t.Coordenador IS NOT NULL
  AND LTRIM(RTRIM(t.Coordenador)) <> '';
GO
