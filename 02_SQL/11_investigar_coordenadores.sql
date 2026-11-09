USE CentralPedagogicalAnalytics;
GO

/* Investigação antes de recuperar coordenadores.
   Confira os resultados antes de qualquer UPDATE. */

SELECT N'BaseAlunos' AS Tabela, COUNT(*) AS Total,
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END) AS CoordenadorAusente
FROM dbo.BaseAlunos
UNION ALL
SELECT N'Acompanhamentos', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.Acompanhamentos
UNION ALL
SELECT N'NovosAlunos', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.NovosAlunos
UNION ALL
SELECT N'ObservacoesAula', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.ObservacoesAula
UNION ALL
SELECT N'Feedbacks', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.Feedbacks
UNION ALL
SELECT N'TeachersAssessment', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.TeachersAssessment
UNION ALL
SELECT N'PlanosAcao', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.PlanosAcao;
GO

/* Confere os nomes de professores disponíveis para usar como referência. */
SELECT [Nome], Coordenador
FROM dbo.BaseProfessores
ORDER BY [Nome];
GO
