USE SysSecurity;
-- PARA REGISTRAR NUEVAS ASIGNACIONES DE EQUIPOS
--VALIDACION
IF (OBJECT_ID('[dbo].[INSERT_EQUIPMENT_ASSIGNMENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[INSERT_EQUIPMENT_ASSIGNMENT]
GO
CREATE TRIGGER INSERT_EQUIPMENT_ASSIGNMENT
--CREACION DEL TRIGGER
ON EquipmentAssignment FOR INSERT
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @EquipmentAssignmentKey INT,
			@UserKey INT
	SELECT @EquipmentAssignmentKey = EquipmentAssignmentKey, @UserKey = UserKey 
	FROM inserted
	INSERT INTO AUDITORY VALUES (@EquipmentAssignmentKey, 'INSERTED', @UserKey, 'EQUIPMENT ASSIGNMENT', GETDATE())
	GO
--*******************************************************************************************************************
--PARA REGISTRAR ASIGNACIONES DE EQUIPOS ELIMINADOS
USE SysSecurity;
--VALIDACION
IF (OBJECT_ID('[dbo].[DELETE_EQUIPMENT_ASSIGNMENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[DELETE_EQUIPMENT_ASSIGNMENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER DELETE_EQUIPMENT_ASSIGNMENT
ON EquipmentAssignment FOR DELETE
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @EquipmentAssignmentKey INT,
			@UserKey INT

	SELECT @EquipmentAssignmentKey = EquipmentAssignmentKey, @UserKey = UserKey 
	FROM deleted
	INSERT INTO AUDITORY VALUES (@EquipmentAssignmentKey, 'DELETED', @UserKey, 'EQUIPMENT ASSIGNMENT', GETDATE())
	GO
--******************************************************************************************************************
--PARA UPDATE DE ASIGNACIONES DE EQUIPOS
USE SysSecurity;
--VALIDACION
IF (OBJECT_ID('[dbo].[UPDATE_EQUIPMENT_ASSIGNMENT]')) IS NOT NULL
  DROP TRIGGER [dbo].[UPDATE_EQUIPMENT_ASSIGNMENT]
GO
--CREACION DEL TRIGGER
CREATE TRIGGER UPDATE_EQUIPMENT_ASSIGNMENT
ON EquipmentAssignment FOR UPDATE
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @EquipmentAssignmentKey INT,
			@UserKey INT
	SELECT @EquipmentAssignmentKey = EquipmentAssignmentKey, @UserKey = UserKey 
	FROM inserted
	INSERT INTO AUDITORY VALUES (@EquipmentAssignmentKey, 'UPDATED', @UserKey, 'EQUIPMENT ASSIGNMENT', GETDATE())
	GO
