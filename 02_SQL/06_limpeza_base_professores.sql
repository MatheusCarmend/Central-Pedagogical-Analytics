/*
Cria cópia de segurança e remove apenas linhas totalmente vazias de BaseProfessores.
A operação já foi executada no projeto; este arquivo registra o procedimento.
*/
USE CentralPedagogicalAnalytics;
GO
SET XACT_ABORT ON;
BEGIN TRY
    BEGIN TRANSACTION;
    IF OBJECT_ID('dbo.BaseProfessores_Backup', 'U') IS NULL
        SELECT * INTO dbo.BaseProfessores_Backup FROM dbo.BaseProfessores;

    DELETE FROM dbo.BaseProfessores
    WHERE NULLIF(LTRIM(RTRIM(COALESCE(CAST([ID Professor] AS varchar(100)), ''))), '') IS NULL
      AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Professor] AS varchar(255)), ''))), '') IS NULL
      AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Coordenador] AS varchar(255)), ''))), '') IS NULL
      AND [Data entrada] IS NULL
      AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Perfil] AS varchar(255)), ''))), '') IS NULL
      AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Segmento] AS varchar(255)), ''))), '') IS NULL
      AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Turmas] AS varchar(255)), ''))), '') IS NULL
      AND [Último Assessment] IS NULL AND [Próximo Assessment] IS NULL
      AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Status] AS varchar(255)), ''))), '') IS NULL
      AND NULLIF(LTRIM(RTRIM(COALESCE(CAST([Observações] AS varchar(1000)), ''))), '') IS NULL;
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
SELECT COUNT(*) AS TotalLinhas, COUNT([ID Professor]) AS LinhasComID,
       COUNT(DISTINCT [ID Professor]) AS IDsDistintos
FROM dbo.BaseProfessores;
GO
