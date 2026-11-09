USE CentralPedagogicalAnalytics;
GO

/* Consultas analíticas iniciais para explorar os dados.
   São consultas somente de leitura; nenhuma tabela é alterada. */

/* 1. Quantidade de registros nas principais tabelas */
SELECT N'Professores' AS Indicador, COUNT(*) AS Total FROM dbo.BaseProfessores
UNION ALL SELECT N'Alunos', COUNT(*) FROM dbo.BaseAlunos
UNION ALL SELECT N'Turmas', COUNT(*) FROM dbo.BaseTurmas
UNION ALL SELECT N'Observações de aula', COUNT(*) FROM dbo.ObservacoesAula
UNION ALL SELECT N'Feedbacks', COUNT(*) FROM dbo.Feedbacks
UNION ALL SELECT N'Planos de ação', COUNT(*) FROM dbo.PlanosAcao;
GO

/* 2. Alunos por situação de matrícula */
SELECT [Status matrícula], COUNT(*) AS TotalAlunos
FROM dbo.BaseAlunos
GROUP BY [Status matrícula]
ORDER BY TotalAlunos DESC;
GO

/* 3. Turmas por status */
SELECT Status, COUNT(*) AS TotalTurmas
FROM dbo.BaseTurmas
GROUP BY Status
ORDER BY TotalTurmas DESC;
GO

/* 4. Observações de aula por status */
SELECT Status, COUNT(*) AS TotalObservacoes
FROM dbo.ObservacoesAula
GROUP BY Status
ORDER BY TotalObservacoes DESC;
GO

/* 5. Feedbacks por status */
SELECT Status, COUNT(*) AS TotalFeedbacks
FROM dbo.Feedbacks
GROUP BY Status
ORDER BY TotalFeedbacks DESC;
GO

/* 6. Planos de ação por área e status */
SELECT Área, Status, COUNT(*) AS TotalPlanos
FROM dbo.PlanosAcao
GROUP BY Área, Status
ORDER BY Área, TotalPlanos DESC;
GO

/* 7. Observações de aula por professor */
SELECT Professor, COUNT(*) AS TotalObservacoes
FROM dbo.ObservacoesAula
GROUP BY Professor
ORDER BY TotalObservacoes DESC;
GO

/* 8. Feedbacks por professor */
SELECT Professor, COUNT(*) AS TotalFeedbacks
FROM dbo.Feedbacks
GROUP BY Professor
ORDER BY TotalFeedbacks DESC;
GO

/* 9. Alunos por turma */
SELECT Turma, COUNT(*) AS TotalAlunos
FROM dbo.BaseAlunos
GROUP BY Turma
ORDER BY TotalAlunos DESC;
GO

/* 10. Distribuição dos níveis de risco */
SELECT Risco, COUNT(*) AS TotalRegistros
FROM dbo.MapaCalor
GROUP BY Risco
ORDER BY TotalRegistros DESC;
GO
