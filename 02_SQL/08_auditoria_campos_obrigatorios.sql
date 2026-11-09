/*
Conta IDs e nomes ausentes nas tabelas principais.
*/
USE CentralPedagogicalAnalytics;
GO
SELECT 'BaseProfessores' AS Tabela,
 SUM(CASE WHEN [ID Professor] IS NULL OR LTRIM(RTRIM(CAST([ID Professor] AS varchar(100)))) = '' THEN 1 ELSE 0 END) AS IDAusente,
 SUM(CASE WHEN [Professor] IS NULL OR LTRIM(RTRIM([Professor])) = '' THEN 1 ELSE 0 END) AS NomeAusente
FROM dbo.BaseProfessores
UNION ALL
SELECT 'BaseAlunos',
 SUM(CASE WHEN [ID Aluno] IS NULL OR LTRIM(RTRIM(CAST([ID Aluno] AS varchar(100)))) = '' THEN 1 ELSE 0 END),
 SUM(CASE WHEN [Aluno] IS NULL OR LTRIM(RTRIM([Aluno])) = '' THEN 1 ELSE 0 END)
FROM dbo.BaseAlunos
UNION ALL
SELECT 'BaseTurmas',
 SUM(CASE WHEN [ID Turma] IS NULL OR LTRIM(RTRIM(CAST([ID Turma] AS varchar(100)))) = '' THEN 1 ELSE 0 END),
 SUM(CASE WHEN [Turma] IS NULL OR LTRIM(RTRIM([Turma])) = '' THEN 1 ELSE 0 END)
FROM dbo.BaseTurmas;
GO
