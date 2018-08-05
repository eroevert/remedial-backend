/******************************************************************************
**  Name: InsertEquipment
**  Desc: Inserta un nuevo Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipment]
END
GO

CREATE PROCEDURE InsertEquipment
(
	@Name VARCHAR(150),
	@Code VARCHAR(50),
	@Description VARCHAR(500),
	@Status VARCHAR(50),
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Equipment(Name 
						   ,Code 
						   ,Description 
						   ,Status
						   ,EquipmentTypeKey
						   )
	VALUES (@Name
			,@Code
			,@Description
			,@Status
			,@EquipmentTypeKey
			);
  SELECT 1 code,@@IDENTITY AS NewEquipmentKey, '';
END
GO

/******************************************************************************
**  Name: getEquipment
**  Desc: Obtener un Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipment]
END
GO

CREATE PROCEDURE GetEquipment
(
	@EquipmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentKey
			,Name 
			,Code 
			,Description 
			,Status
			,EquipmentTypeKey
    FROM Equipment
	WHERE EquipmentKey = @EquipmentKey;
END
GO

/******************************************************************************
**  Name: getAllEquipment
**  Desc: Obtener todos los Equipos
**  Author: Nataly HUanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllEquipment]
END
GO

CREATE PROCEDURE getAllEquipment
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentKey
			,Name
			,Code
			,Description
			,Status
			,EquipmentTypeKey
    FROM Equipment
END
GO

/******************************************************************************
**  Name: updateEquipment
**  Desc: Actualizar un Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipment]
END
GO

CREATE PROCEDURE UpdateEquipment
(
	@EquipmentKey int,
	@Name VARCHAR(150),
	@Code VARCHAR(50),
	@Description VARCHAR(500),
	@Status VARCHAR(50),
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Equipment 
	SET
		 Name			= @Name
		,Code			= @Code
		,Description	= @Description
		,Status			= @Status 
		,EquipmentTypeKey	= @EquipmentTypeKey

	WHERE EquipmentKey = @EquipmentKey;
	SELECT 1 code,0 AS NewEquipmentKey, '';
END
GO

/******************************************************************************
**  Name: deleteEquipment
**  Desc: Eliminar un Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipment]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipment]
END
GO

CREATE PROCEDURE deleteEquipment
(
	@EquipmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Equipment 
	WHERE EquipmentKey  = @EquipmentKey ;
	SELECT 1 code,0 AS NewEquipmentKey, '';
END
GO

/******************************************************************************
**  Name: SPA_GetAllEquipments
**  Desc: Procedimiento almacenado para el Areas en la empresa.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 08/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 08/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetAllEquipments]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetAllEquipments]
END
GO

CREATE PROCEDURE SPA_GetAllEquipments
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentKey
			,Name
			,Code
			,Description
			,Status
			,EquipmentTypeKey
    FROM Equipment
END
GO