/******************************************************************************
**  Name: InsertEquipmentReturn
**  Desc: Registra una devolucion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipmentReturn]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipmentReturn]
END
GO
CREATE PROCEDURE InsertEquipmentReturn
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

	INSERT INTO EquipmentReturn(EquipmentKey 
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

	SELECT @@IDENTITY AS NewEquipmentReturnKey;
END
GO

/******************************************************************************
**  Name: getEquipmentReturn
**  Desc: Obtener una devolucion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipmentReturn]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipmentReturn]
END
GO

CREATE PROCEDURE GetEquipmentReturn
(
	@EquipmentReturnKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentReturnKey
			,EquipmentKey 
			,UserKey 
			,EmployeeKey 
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentReturn
	WHERE EquipmentReturnKey = @EquipmentReturnKey;
END
GO

/******************************************************************************
**  Name: updateEquipmentReturn
**  Desc: Actualizar devolucion de equipo
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipmentReturn]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipmentReturn]
END
GO

CREATE PROCEDURE UpdateEquipmentReturn
(
	@EquipmentReturnKey INT,
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
	UPDATE EquipmentReturn 
	SET
		 EquipmentKey		= @EquipmentKey
		,UserKey			= @UserKey
		,EmployeeKey		= @EmployeeKey
		,Date				= @Date
		,DateRegistration	= @DateRegistration
		,Status				= @Status
		,Observations		= @Observations

	WHERE EquipmentReturnKey = @EquipmentReturnKey;
END
GO

/******************************************************************************
**  Name: deleteEquipmentReturn
**  Desc: Eliminar una devolucion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipmentReturn]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipmentReturn]
END
GO
CREATE PROCEDURE deleteEquipmentReturn
(
	@EquipmentReturnKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM EquipmentReturn 
	WHERE EquipmentReturnKey  = @EquipmentReturnKey ;
END
GO