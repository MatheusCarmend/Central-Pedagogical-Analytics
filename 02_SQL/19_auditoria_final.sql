USE CentralPedagogicalAnalytics;
GO

/* 1. Quantidade de registros por tabela */
SELECT N'Acompanhamentos' AS Tabela, COUNT(*) AS Total FROM dbo.Acompanhamentos
UNION ALL SELECT N'BaseAlunos', COUNT(*) FROM dbo.BaseAlunos
UNION ALL SELECT N'BaseProfessores', COUNT(*) FROM dbo.BaseProfessores
UNION ALL SELECT N'BaseTurmas', COUNT(*) FROM dbo.BaseTurmas
UNION ALL SELECT N'Feedbacks', COUNT(*) FROM dbo.Feedbacks
UNION ALL SELECT N'MapaCalor', COUNT(*) FROM dbo.MapaCalor
UNION ALL SELECT N'NovosAlunos', COUNT(*) FROM dbo.NovosAlunos
UNION ALL SELECT N'ObservacoesAula', COUNT(*) FROM dbo.ObservacoesAula
UNION ALL SELECT N'PlanosAcao', COUNT(*) FROM dbo.PlanosAcao
UNION ALL SELECT N'TeachersAssessment', COUNT(*) FROM dbo.TeachersAssessment
ORDER BY Tabela;
GO

/* 2. Coordenadores ausentes nas tabelas principais */
SELECT N'BaseProfessores' AS Tabela, COUNT(*) AS TotalSemCoordenador
FROM dbo.BaseProfessores WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL SELECT N'BaseAlunos', COUNT(*) FROM dbo.BaseAlunos WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL SELECT N'BaseTurmas', COUNT(*) FROM dbo.BaseTurmas WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL SELECT N'ObservacoesAula', COUNT(*) FROM dbo.ObservacoesAula WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL SELECT N'Feedbacks', COUNT(*) FROM dbo.Feedbacks WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL SELECT N'TeachersAssessment', COUNT(*) FROM dbo.TeachersAssessment WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL SELECT N'Acompanhamentos', COUNT(*) FROM dbo.Acompanhamentos WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL SELECT N'NovosAlunos', COUNT(*) FROM dbo.NovosAlunos WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '';
GO

/* 3. Planos de ação: a expectativa conhecida é manter os 70 registros da área
   Turma sem coordenador enquanto não houver relacionamento confiável. */
SELECT Área, COUNT(*) AS TotalPlanos,
       SUM(CASE WHEN Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END) AS SemCoordenador
FROM dbo.PlanosAcao
GROUP BY Área
ORDER BY Área;
GO

/* 4. Duplicidades por identificador */
SELECT N'BaseProfessores - ID Professor' AS Verificacao, COUNT(*) AS GruposDuplicados
FROM (SELECT [ID Professor] FROM dbo.BaseProfessores GROUP BY [ID Professor] HAVING COUNT(*) > 1) d
UNION ALL SELECT N'BaseAlunos - ID Aluno', COUNT(*)
FROM (SELECT [ID Aluno] FROM dbo.BaseAlunos GROUP BY [ID Aluno] HAVING COUNT(*) > 1) d
UNION ALL SELECT N'BaseTurmas - ID Turma', COUNT(*)
FROM (SELECT [ID Turma] FROM dbo.BaseTurmas GROUP BY [ID Turma] HAVING COUNT(*) > 1) d
UNION ALL SELECT N'ObservacoesAula - ID Observação', COUNT(*)
FROM (SELECT [ID Observação] FROM dbo.ObservacoesAula GROUP BY [ID Observação] HAVING COUNT(*) > 1) d
UNION ALL SELECT N'Feedbacks - ID Feedback', COUNT(*)
FROM (SELECT [ID Feedback] FROM dbo.Feedbacks GROUP BY [ID Feedback] HAVING COUNT(*) > 1) d
UNION ALL SELECT N'TeachersAssessment - ID Assessment', COUNT(*)
FROM (SELECT [ID Assessment] FROM dbo.TeachersAssessment GROUP BY [ID Assessment] HAVING COUNT(*) > 1) d
UNION ALL SELECT N'Acompanhamentos - ID Acompanhamento', COUNT(*)
FROM (SELECT [ID Acompanhamento] FROM dbo.Acompanhamentos GROUP BY [ID Acompanhamento] HAVING COUNT(*) > 1) d
UNION ALL SELECT N'PlanosAcao - ID Plano', COUNT(*)
FROM (SELECT [ID Plano] FROM dbo.PlanosAcao GROUP BY [ID Plano] HAVING COUNT(*) > 1) d;
GO
