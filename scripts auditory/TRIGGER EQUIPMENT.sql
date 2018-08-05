Use SysSecurity
-- TRIGGER PARA REGISTRAR EQUIPOS INSERTADOS
--VALIDACION
IF (OBJECT_ID('[dbo].[INSERT_EQUIPMENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[INSERT_EQUIPMENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER INSERT_EQUIPMENT
ON Equipment FOR INSERT
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @EquipmentKey INT,
			@UserKey INT
	SELECT @EquipmentKey = EquipmentKey, @UserKey = UserKey 
	FROM inserted
	INSERT INTO AUDITORY VALUES (@EquipmentKey, 'INSERTED', @UserKey, 'EQUIPMENT', GETDATE())
	GO
--******************************************************************************************************
--TRIGGER PARA REGISTRAR EQUIPOS ELIMINADOS
USE SysSecurity
--VALIDACION
IF (OBJECT_ID('[dbo].[DELETE_EQUIPMENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[DELETE_EQUIPMENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER DELETE_EQUIPMENT
ON Equipment FOR DELETE
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @EquipmentKey INT,
			@UserKey INT
	SELECT @EquipmentKey = EquipmentKey, @UserKey = UserKey 
	FROM deleted
	INSERT INTO AUDITORY VALUES (@EquipmentKey, 'DELETED', @UserKey, 'EQUIPMENT', GETDATE())
	GO
--**********************************************************************************************************
--TRIGGER PARA UPDATE DE EQUIPOS
USE SysSecurity
--VALIDACION
IF (OBJECT_ID('[dbo].[UPDATE_EQUIPMENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[UPDATE_EQUIPMENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER UPDATE_EQUIPMENT
ON Equipment FOR UPDATE
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @EquipmentKey INT,
			@UserKey INT
	SELECT @EquipmentKey = EquipmentKey,
		   @UserKey = UserKey
	FROM inserted
	INSERT INTO AUDITORY VALUES (@EquipmentKey, 'UPDATED', @UserKey, 'EQUIPMENT', GETDATE())
	GO
