/******************************************************************************
**  Name: InsertEquipmentAssignment
**  Desc: Inserta una nueva asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipmentAssignment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipmentAssignment]
END
GO
CREATE PROCEDURE InsertEquipmentAssignment
(
	@EquipmentKey INT,
	@UserKey INT,
	@EmployeeKey INT,
	@Date DATE,
	@DateRegistration DATETIME,
	@Status VARCHAR(50),
	@Observations VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO EquipmentAssignment(EquipmentKey 
						   ,UserKey 
						   ,EmployeeKey 
						   ,Date
						   ,DateRegistration
						   ,Status
						   ,Observations
						   )
	VALUES (@EquipmentKey
			,@UserKey 
			,@EmployeeKey 
			,@Date    
			,@DateRegistration
			,@Status
			,@Observations
			);

	SELECT 1 code,@@IDENTITY AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: getEquipmentAssignment
**  Desc: Obtener una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipmentAssignment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipmentAssignment]
END
GO

CREATE PROCEDURE GetEquipmentAssignment
(
	@EquipmentAssignmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentAssignmentKey
			,EquipmentKey 
			,UserKey 
			,EmployeeKey 
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentAssignment
	WHERE EquipmentAssignmentKey = @EquipmentAssignmentKey;
END
GO

/******************************************************************************
**  Name: updateEquipmentAssignment
**  Desc: Actualizar una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipmentAssignment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipmentAssignment]
END
GO

CREATE PROCEDURE UpdateEquipmentAssignment
(
	@EquipmentAssignmentKey INT,
	@EquipmentKey INT,
	@UserKey INT,
	@EmployeeKey INT,
	@Date DATE,
	@DateRegistration DATETIME,
	@Status VARCHAR(50),
	@Observations VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE EquipmentAssignment 
	SET
		 EquipmentKey		= @EquipmentKey
		,UserKey			= @UserKey
		,EmployeeKey		= @EmployeeKey
		,Date				= @Date
		,DateRegistration	= @DateRegistration
		,Status				= @Status
		,Observations		= @Observations

	WHERE EquipmentAssignmentKey = @EquipmentAssignmentKey;
END
GO

/******************************************************************************
**  Name: deleteEquipmentAssignment
**  Desc: Eliminar una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipmentAssignment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipmentAssignment]
END
GO
CREATE PROCEDURE deleteEquipmentAssignment
(
	@EquipmentAssignmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM EquipmentAssignment 
	WHERE EquipmentAssignmentKey  = @EquipmentAssignmentKey ;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: getEquipmentAssignmentByEmployee
**  Desc: Obtener una asignacion de equipo en base a un empleado
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getEquipmentAssignmentByEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getEquipmentAssignmentByEmployee]
END
GO

CREATE PROCEDURE getEquipmentAssignmentByEmployee
(
	@EmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentAssignmentKey
			,EquipmentKey
			,UserKey
			,EmployeeKey
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentAssignment
	WHERE EmployeeKey = @EmployeeKey;
END
GO


/******************************************************************************
**  Name: getEquipmentAssignment
**  Desc: Obtener una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllEquipmentAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllEquipmentAssignment]
END
GO

CREATE PROCEDURE getAllEquipmentAssignment
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentAssignmentKey
			,EquipmentKey
			,UserKey
			,EmployeeKey
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentAssignment;
END
GO