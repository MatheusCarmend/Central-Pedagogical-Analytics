USE CentralPedagogicalAnalytics;
GO

/* ATENÇÃO: UPDATEs históricos para PlanosAcao.
   Preenche somente áreas Aluno e Professor, usando correspondência de nome.
   Não altera os 70 planos da área Turma porque a relação não foi confirmada. */

/* Área Aluno: nome do registro comparado com BaseAlunos.Aluno. */
UPDATE pa
SET Coordenador = a.Coordenador
FROM dbo.PlanosAcao pa
INNER JOIN dbo.BaseAlunos a
  ON LTRIM(RTRIM(pa.Nome)) = LTRIM(RTRIM(a.Aluno))
WHERE pa.Área = N'Aluno'
  AND (pa.Coordenador IS NULL OR LTRIM(RTRIM(pa.Coordenador)) = '')
  AND a.Coordenador IS NOT NULL
  AND LTRIM(RTRIM(a.Coordenador)) <> '';
GO

/* Área Professor: nome do registro comparado com BaseProfessores.Nome. */
UPDATE pa
SET Coordenador = p.Coordenador
FROM dbo.PlanosAcao pa
INNER JOIN dbo.BaseProfessores p
  ON LTRIM(RTRIM(pa.Nome)) = LTRIM(RTRIM(p.[Nome]))
WHERE pa.Área = N'Professor'
  AND (pa.Coordenador IS NULL OR LTRIM(RTRIM(pa.Coordenador)) = '')
  AND p.Coordenador IS NOT NULL
  AND LTRIM(RTRIM(p.Coordenador)) <> '';
GO

/* Revisão posterior: não tenta inferir coordenador para Área = Turma. */
SELECT Área, COUNT(*) AS TotalPlanos,
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END) AS SemCoordenador
FROM dbo.PlanosAcao
GROUP BY Área
ORDER BY Área;
GO
