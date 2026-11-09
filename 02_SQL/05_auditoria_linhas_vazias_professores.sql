/*
Investiga linhas sem ID, linhas sem nome e linhas totalmente vazias em BaseProfessores.
*/
USE CentralPedagogicalAnalytics;
GO
SELECT COUNT(*) AS TotalLinhas,
 SUM(CASE WHEN NULLIF(LTRIM(RTRIM(COALESCE(CAST([ID Professor] AS varchar(100)), ''))), '') IS NOT NULL THEN 1 ELSE 0 END) AS LinhasComID,
 SUM(CASE WHEN NULLIF(LTRIM(RTRIM(COALESCE(CAST([Professor] AS varchar(255)), ''))), '') IS NOT NULL THEN 1 ELSE 0 END) AS LinhasComNome,
 SUM(CASE WHEN NULLIF(LTRIM(RTRIM(COALESCE(CAST([ID Professor] AS varchar(100)), ''))), '') IS NULL
   AND (NULLIF(LTRIM(RTRIM(COALESCE(CAST([Professor] AS varchar(255)), ''))), '') IS NOT NULL
   OR NULLIF(LTRIM(RTRIM(COALESCE(CAST([Coordenador] AS varchar(255)), ''))), '') IS NOT NULL
   OR NULLIF(LTRIM(RTRIM(COALESCE(CAST([Perfil] AS varchar(255)), ''))), '') IS NOT NULL
   OR NULLIF(LTRIM(RTRIM(COALESCE(CAST([Segmento] AS varchar(255)), ''))), '') IS NOT NULL)
 THEN 1 ELSE 0 END) AS LinhasSemIDComOutrosDados
FROM dbo.BaseProfessores;
GO

SELECT COUNT(*) AS TotalLinhas,
 SUM(CASE WHEN NULLIF(LTRIM(RTRIM(COALESCE(CAST([ID Professor] AS varchar(100)), ''))), '') IS NULL
 AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Professor] AS varchar(255)), ''))), '') IS NULL
 AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Coordenador] AS varchar(255)), ''))), '') IS NULL
 AND [Data entrada] IS NULL
 AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Perfil] AS varchar(255)), ''))), '') IS NULL
 AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Segmento] AS varchar(255)), ''))), '') IS NULL
 AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Turmas] AS varchar(255)), ''))), '') IS NULL
 AND [Último Assessment] IS NULL AND [Próximo Assessment] IS NULL
 AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Status] AS varchar(255)), ''))), '') IS NULL
 AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Observações] AS varchar(1000)), ''))), '') IS NULL
 THEN 1 ELSE 0 END) AS LinhasTotalmenteVazias
FROM dbo.BaseProfessores;
GO
