/*
Compara total de linhas, IDs preenchidos e IDs distintos nas tabelas que têm ID.
*/
USE CentralPedagogicalAnalytics;
GO
SELECT 'BaseProfessores' AS Tabela, COUNT(*) AS TotalLinhas,
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Professor] AS varchar(100)))), '')) AS IDsPreenchidos,
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Professor] AS varchar(100)))), '')) AS IDsDistintos
FROM dbo.BaseProfessores
UNION ALL
SELECT 'BaseAlunos', COUNT(*),
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Aluno] AS varchar(100)))), '')),
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Aluno] AS varchar(100)))), ''))
FROM dbo.BaseAlunos
UNION ALL
SELECT 'BaseTurmas', COUNT(*),
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Turma] AS varchar(100)))), '')),
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Turma] AS varchar(100)))), ''))
FROM dbo.BaseTurmas
UNION ALL
SELECT 'ObservacoesAula', COUNT(*),
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Observação] AS varchar(100)))), '')),
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Observação] AS varchar(100)))), ''))
FROM dbo.ObservacoesAula
UNION ALL
SELECT 'Feedbacks', COUNT(*),
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Feedback] AS varchar(100)))), '')),
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Feedback] AS varchar(100)))), ''))
FROM dbo.Feedbacks
UNION ALL
SELECT 'TeachersAssessment', COUNT(*),
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Assessment] AS varchar(100)))), '')),
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Assessment] AS varchar(100)))), ''))
FROM dbo.TeachersAssessment
UNION ALL
SELECT 'Acompanhamentos', COUNT(*),
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Acompanhamento] AS varchar(100)))), '')),
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Acompanhamento] AS varchar(100)))), ''))
FROM dbo.Acompanhamentos
UNION ALL
SELECT 'PlanosAcao', COUNT(*),
 COUNT(NULLIF(LTRIM(RTRIM(CAST([ID Plano] AS varchar(100)))), '')),
 COUNT(DISTINCT NULLIF(LTRIM(RTRIM(CAST([ID Plano] AS varchar(100)))), ''))
FROM dbo.PlanosAcao;
GO
