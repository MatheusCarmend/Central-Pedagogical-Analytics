USE CentralPedagogicalAnalytics;
GO

/* Diagnóstico inicial de correspondência entre nomes usados nas tabelas.
   Apenas leitura: não altera os dados. */

SELECT N'ObservacoesAula.Professor sem correspondência em BaseProfessores' AS Verificacao,
       COUNT(*) AS Total
FROM dbo.ObservacoesAula o
LEFT JOIN dbo.BaseProfessores p ON LTRIM(RTRIM(o.Professor)) = LTRIM(RTRIM(p.[Nome]))
WHERE o.Professor IS NOT NULL AND p.[Nome] IS NULL
UNION ALL
SELECT N'Feedbacks.Professor sem correspondência em BaseProfessores',
       COUNT(*)
FROM dbo.Feedbacks f
LEFT JOIN dbo.BaseProfessores p ON LTRIM(RTRIM(f.Professor)) = LTRIM(RTRIM(p.[Nome]))
WHERE f.Professor IS NOT NULL AND p.[Nome] IS NULL
UNION ALL
SELECT N'BaseAlunos.Turma sem correspondência em BaseTurmas',
       COUNT(*)
FROM dbo.BaseAlunos a
LEFT JOIN dbo.BaseTurmas t ON LTRIM(RTRIM(a.Turma)) = LTRIM(RTRIM(t.Turma))
WHERE a.Turma IS NOT NULL AND t.Turma IS NULL;
GO

/* Distribuição dos valores de Área nos planos de ação. */
SELECT Área, COUNT(*) AS TotalPlanos
FROM dbo.PlanosAcao
GROUP BY Área
ORDER BY TotalPlanos DESC;
GO
