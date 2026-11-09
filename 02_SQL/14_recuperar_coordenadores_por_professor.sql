USE CentralPedagogicalAnalytics;
GO

/* ATENÇÃO: UPDATEs históricos. Execute somente após validar os vínculos.
   Preenche apenas Coordenador ausente, usando o nome do professor como chave. */

UPDATE o
SET Coordenador = p.Coordenador
FROM dbo.ObservacoesAula o
INNER JOIN dbo.BaseProfessores p
  ON LTRIM(RTRIM(o.Professor)) = LTRIM(RTRIM(p.[Nome]))
WHERE (o.Coordenador IS NULL OR LTRIM(RTRIM(o.Coordenador)) = '')
  AND p.Coordenador IS NOT NULL
  AND LTRIM(RTRIM(p.Coordenador)) <> '';
GO

UPDATE f
SET Coordenador = p.Coordenador
FROM dbo.Feedbacks f
INNER JOIN dbo.BaseProfessores p
  ON LTRIM(RTRIM(f.Professor)) = LTRIM(RTRIM(p.[Nome]))
WHERE (f.Coordenador IS NULL OR LTRIM(RTRIM(f.Coordenador)) = '')
  AND p.Coordenador IS NOT NULL
  AND LTRIM(RTRIM(p.Coordenador)) <> '';
GO

UPDATE ta
SET Coordenador = p.Coordenador
FROM dbo.TeachersAssessment ta
INNER JOIN dbo.BaseProfessores p
  ON LTRIM(RTRIM(ta.Professor)) = LTRIM(RTRIM(p.[Nome]))
WHERE (ta.Coordenador IS NULL OR LTRIM(RTRIM(ta.Coordenador)) = '')
  AND p.Coordenador IS NOT NULL
  AND LTRIM(RTRIM(p.Coordenador)) <> '';
GO
