/*
Confere a instância do SQL Server e o banco atual.
*/
USE CentralPedagogicalAnalytics;
GO
SELECT @@SERVERNAME AS Servidor, DB_NAME() AS BancoAtual, @@VERSION AS VersaoSQL;
GO
SELECT SERVERPROPERTY('InstanceName') AS Instancia,
       SERVERPROPERTY('ProductVersion') AS Versao,
       DB_NAME() AS BancoAtual;
GO
