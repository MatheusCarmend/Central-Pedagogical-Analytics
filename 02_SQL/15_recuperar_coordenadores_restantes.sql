USE CentralPedagogicalAnalytics;
GO

/* Validação antes de recuperação adicional: registros ainda sem coordenador. */
SELECT N'BaseAlunos' AS Tabela, COUNT(*) AS SemCoordenador
FROM dbo.BaseAlunos
WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL
SELECT N'Acompanhamentos', COUNT(*)
FROM dbo.Acompanhamentos
WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL
SELECT N'NovosAlunos', COUNT(*)
FROM dbo.NovosAlunos
WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL
SELECT N'ObservacoesAula', COUNT(*)
FROM dbo.ObservacoesAula
WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL
SELECT N'Feedbacks', COUNT(*)
FROM dbo.Feedbacks
WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = ''
UNION ALL
SELECT N'TeachersAssessment', COUNT(*)
FROM dbo.TeachersAssessment
WHERE Coordenador IS NULL OR LTRIM(RTRIM(Coordenador)) = '';
GO

/* Este script é intencionalmente somente de diagnóstico.
   Não preencha valores sem uma chave de correspondência confirmada. */
