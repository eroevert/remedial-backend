
USE SysSecurity;
-- TRIGGER PARA REGISTRAR NUEVOS ACCIDENTES
--VALIDACION
IF (OBJECT_ID('[dbo].[INSERT_ACCIDENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[INSERT_ACCIDENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER INSERT_ACCIDENT
ON Accident FOR INSERT
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @AccidentKey INT,
			@UserKey INT
	SELECT @AccidentKey = AccidentKey, @UserKey = UserKey 
	FROM inserted
	INSERT INTO AUDITORY VALUES (@AccidentKey, 'INSERTED', @UserKey, 'ACCIDENT', GETDATE())
	GO
--*******************************************************************************************************
--TRIGGER PARA REGISTRAR ACCIDENTES ELIMINADOS
USE SysSecurity;
--VALIDACION
IF (OBJECT_ID('[dbo].[DELETE_ACCIDENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[DELETE_ACCIDENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER DELETE_ACCIDENT
ON Accident FOR DELETE
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @AccidentKey INT,
			@UserKey INT
	SELECT @AccidentKey = AccidentKey, @UserKey = UserKey 
	FROM deleted
	INSERT INTO AUDITORY VALUES (@AccidentKey, 'DELETED', @UserKey, 'ACCIDENT', GETDATE())
	GO
--*************************************************************************************************************
--TRIGGER PARA UPDATE DE ACCIDENTES
USE SysSecurity;
--VALIDACION
IF (OBJECT_ID('[dbo].[UPDATE_ACCIDENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[UPDATE_ACCIDENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER UPDATE_ACCIDENT
ON Accident FOR UPDATE
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @AccidentKey INT,
			@UserKey INT
	SELECT @AccidentKey = AccidentKey, @UserKey = UserKey  
	FROM inserted
	INSERT INTO AUDITORY VALUES (@AccidentKey, 'UPDATED', @UserKey, 'ACCIDENT', GETDATE())
	GO
