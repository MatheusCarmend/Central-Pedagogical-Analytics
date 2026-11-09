USE CentralPedagogicalAnalytics;
GO

/* Confere os planos por área e os nomes de referência.
   A área Turma foi mantida sem recuperação automática quando não havia
   correspondência inequívoca para coordenador. */

SELECT Área, COUNT(*) AS TotalPlanos,
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END) AS SemCoordenador
FROM dbo.PlanosAcao
GROUP BY Área
ORDER BY Área;
GO

/* Lista os planos ainda sem coordenador para revisão manual. */
SELECT *
FROM dbo.PlanosAcao
WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
ORDER BY Área;
GO
