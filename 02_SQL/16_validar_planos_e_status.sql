USE CentralPedagogicalAnalytics;
GO

/* Distribuição dos status disponíveis. NULL é mantido quando não há regra
   de negócio confiável para preencher o valor. */

SELECT N'BaseProfessores' AS Tabela, Status, COUNT(*) AS Total
FROM dbo.BaseProfessores
GROUP BY Status
UNION ALL
SELECT N'TeachersAssessment', Status, COUNT(*)
FROM dbo.TeachersAssessment
GROUP BY Status
UNION ALL
SELECT N'Feedbacks', Status, COUNT(*)
FROM dbo.Feedbacks
GROUP BY Status
UNION ALL
SELECT N'ObservacoesAula', Status, COUNT(*)
FROM dbo.ObservacoesAula
GROUP BY Status
UNION ALL
SELECT N'BaseTurmas', Status, COUNT(*)
FROM dbo.BaseTurmas
GROUP BY Status
ORDER BY Tabela, Total DESC;
GO

SELECT Área, Status, COUNT(*) AS TotalPlanos
FROM dbo.PlanosAcao
GROUP BY Área, Status
ORDER BY Área, TotalPlanos DESC;
GO
