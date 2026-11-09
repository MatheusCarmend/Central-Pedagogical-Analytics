USE CentralPedagogicalAnalytics;
GO

/* Diagnóstico de qualidade:
   procura valores NULL, textos vazios/espaços e espaços no início/fim.
   Este script apenas consulta os dados; não altera nenhuma tabela. */

SELECT N'Acompanhamentos.Coordenador' AS Campo, COUNT(*) AS Total,
       SUM(CASE WHEN Coordenador IS NULL THEN 1 ELSE 0 END) AS Nulos,
       SUM(CASE WHEN Coordenador IS NOT NULL AND LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END) AS Vazios
FROM dbo.Acompanhamentos
UNION ALL
SELECT N'Acompanhamentos.Observações restritas', COUNT(*),
       SUM(CASE WHEN [Observações restritas] IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN [Observações restritas] IS NOT NULL AND LTRIM(RTRIM([Observações restritas])) = '' THEN 1 ELSE 0 END)
FROM dbo.Acompanhamentos
UNION ALL
SELECT N'BaseAlunos.Coordenador', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Coordenador IS NOT NULL AND LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.BaseAlunos
UNION ALL
SELECT N'BaseAlunos.Observações', COUNT(*),
       SUM(CASE WHEN Observações IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Observações IS NOT NULL AND LTRIM(RTRIM(Observações)) = '' THEN 1 ELSE 0 END)
FROM dbo.BaseAlunos
UNION ALL
SELECT N'BaseProfessores.Observações', COUNT(*),
       SUM(CASE WHEN Observações IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Observações IS NOT NULL AND LTRIM(RTRIM(Observações)) = '' THEN 1 ELSE 0 END)
FROM dbo.BaseProfessores
UNION ALL
SELECT N'BaseProfessores.Status', COUNT(*),
       SUM(CASE WHEN Status IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Status IS NOT NULL AND LTRIM(RTRIM(Status)) = '' THEN 1 ELSE 0 END)
FROM dbo.BaseProfessores
UNION ALL
SELECT N'Feedbacks.Coordenador', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Coordenador IS NOT NULL AND LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.Feedbacks
UNION ALL
SELECT N'MapaCalor.Observações', COUNT(*),
       SUM(CASE WHEN Observações IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Observações IS NOT NULL AND LTRIM(RTRIM(Observações)) = '' THEN 1 ELSE 0 END)
FROM dbo.MapaCalor
UNION ALL
SELECT N'NovosAlunos.Coordenador', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Coordenador IS NOT NULL AND LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.NovosAlunos
UNION ALL
SELECT N'ObservacoesAula.Coordenador', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Coordenador IS NOT NULL AND LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.ObservacoesAula
UNION ALL
SELECT N'PlanosAcao.Coordenador', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Coordenador IS NOT NULL AND LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.PlanosAcao
UNION ALL
SELECT N'TeachersAssessment.Coordenador', COUNT(*),
       SUM(CASE WHEN Coordenador IS NULL THEN 1 ELSE 0 END),
       SUM(CASE WHEN Coordenador IS NOT NULL AND LTRIM(RTRIM(Coordenador)) = '' THEN 1 ELSE 0 END)
FROM dbo.TeachersAssessment;
GO

/* Verificação adicional: espaços no começo/fim em algumas colunas textuais.
   Retorna somente linhas com espaços externos. */
SELECT N'BaseProfessores' AS Tabela, [Nome] AS Valor
FROM dbo.BaseProfessores
WHERE [Nome] <> LTRIM(RTRIM([Nome]))
UNION ALL
SELECT N'BaseAlunos', [Aluno]
FROM dbo.BaseAlunos
WHERE [Aluno] <> LTRIM(RTRIM([Aluno]));
GO
