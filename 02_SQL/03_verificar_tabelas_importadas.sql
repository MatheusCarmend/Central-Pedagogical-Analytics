/*
Lista as tabelas importadas e a quantidade de registros.
A importação das abas foi realizada pela interface do assistente do SSMS.
*/
USE CentralPedagogicalAnalytics;
GO
SELECT s.name AS SchemaName, t.name AS TableName, SUM(p.rows) AS TotalRegistros
FROM sys.tables AS t
JOIN sys.schemas AS s ON t.schema_id = s.schema_id
LEFT JOIN sys.partitions AS p ON t.object_id = p.object_id AND p.index_id IN (0, 1)
GROUP BY s.name, t.name
ORDER BY s.name, t.name;
GO
