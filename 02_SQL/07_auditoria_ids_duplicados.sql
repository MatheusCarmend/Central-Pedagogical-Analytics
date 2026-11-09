/*
Localiza IDs duplicados nas tabelas que possuem identificadores.
Nenhuma linha retornada significa que não foram encontradas duplicidades nos IDs preenchidos.
*/
USE CentralPedagogicalAnalytics;
GO
SELECT 'BaseProfessores' AS Tabela, CAST([ID Professor] AS varchar(100)) AS ID, COUNT(*) AS Quantidade
FROM dbo.BaseProfessores WHERE [ID Professor] IS NOT NULL GROUP BY [ID Professor] HAVING COUNT(*) > 1
UNION ALL
SELECT 'BaseAlunos', CAST([ID Aluno] AS varchar(100)), COUNT(*)
FROM dbo.BaseAlunos WHERE [ID Aluno] IS NOT NULL GROUP BY [ID Aluno] HAVING COUNT(*) > 1
UNION ALL
SELECT 'BaseTurmas', CAST([ID Turma] AS varchar(100)), COUNT(*)
FROM dbo.BaseTurmas WHERE [ID Turma] IS NOT NULL GROUP BY [ID Turma] HAVING COUNT(*) > 1
UNION ALL
SELECT 'ObservacoesAula', CAST([ID Observação] AS varchar(100)), COUNT(*)
FROM dbo.ObservacoesAula WHERE [ID Observação] IS NOT NULL GROUP BY [ID Observação] HAVING COUNT(*) > 1
UNION ALL
SELECT 'Feedbacks', CAST([ID Feedback] AS varchar(100)), COUNT(*)
FROM dbo.Feedbacks WHERE [ID Feedback] IS NOT NULL GROUP BY [ID Feedback] HAVING COUNT(*) > 1
UNION ALL
SELECT 'TeachersAssessment', CAST([ID Assessment] AS varchar(100)), COUNT(*)
FROM dbo.TeachersAssessment WHERE [ID Assessment] IS NOT NULL GROUP BY [ID Assessment] HAVING COUNT(*) > 1
UNION ALL
SELECT 'Acompanhamentos', CAST([ID Acompanhamento] AS varchar(100)), COUNT(*)
FROM dbo.Acompanhamentos WHERE [ID Acompanhamento] IS NOT NULL GROUP BY [ID Acompanhamento] HAVING COUNT(*) > 1
UNION ALL
SELECT 'PlanosAcao', CAST([ID Plano] AS varchar(100)), COUNT(*)
FROM dbo.PlanosAcao WHERE [ID Plano] IS NOT NULL GROUP BY [ID Plano] HAVING COUNT(*) > 1;
GO
