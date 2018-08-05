/******************************************************************************
**  Name: InsertEquipmentType
**  Desc: Inserta un nuevo tipo de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipmentType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipmentType]
END
GO
CREATE PROCEDURE InsertEquipmentType
(
	@Name VARCHAR(50),
	@Description VARCHAR(150)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO EquipmentType(Name 
						   ,Description 
						   )
	VALUES (@Name
			,@Description
			);

	SELECT 1 code,@@IDENTITY AS NewEquipmentTypeKey, '';
END
GO

/******************************************************************************
**  Name: getEquipmentType
**  Desc: Obtener un tipo de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipmentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipmentType]
END
GO

CREATE PROCEDURE GetEquipmentType
(
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentTypeKey
			,Name
			,Description

    FROM EquipmentType
	WHERE EquipmentTypeKey = @EquipmentTypeKey;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: updateEquipmentType
**  Desc: Actualizar tipo de equipo
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipmentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipmentType]
END
GO

CREATE PROCEDURE UpdateEquipmentType
(
	@EquipmentTypeKey int,
	@Name VARCHAR(50),
	@Description VARCHAR(150)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE EquipmentType
	SET
		 Name		= @Name
		,Description		= @Description

	WHERE EquipmentTypeKey = @EquipmentTypeKey;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: deleteEquipmentType
**  Desc: Eliminar un tipo de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipmentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipmentType]
END
GO
CREATE PROCEDURE deleteEquipmentType
(
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM EquipmentType
	WHERE EquipmentTypeKey  = @EquipmentTypeKey ;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: SPA_GetEquipmentsType
**  Desc: Procedimiento almacenado que devuelve los tipos de equipos.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 07/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetEquipmentsType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetEquipmentsType]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetEquipmentsType
AS
BEGIN
	SET NOCOUNT ON;

    SELECT	 EquipmentTypeKey
			,Name
			,Description
    FROM EquipmentType
END
GO