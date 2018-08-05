/******************************************************************************
**  Name: InsertHierarchicalLevel
**  Desc: Inserta un nuevo Nivel jerarquico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertHierarchicalLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertHierarchicalLevel]
END
GO
CREATE PROCEDURE InsertHierarchicalLevel
(
	@Name VARCHAR(150),
	@Level VARCHAR(2),
	@Status varCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO HierarchicalLevel(Name 
						   ,Level
						   ,Status
						   )
	VALUES (@Name
			,@Level
			,@Status
			);

	SELECT @@IDENTITY AS NewHierarchicalLevelKey;
END
GO

/******************************************************************************
**  Name: getHierarchicalLevel
**  Desc: Obtener un nivel jerarquico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetHierarchicalLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetHierarchicalLevel]
END
GO

CREATE PROCEDURE GetHierarchicalLevel
(
	@HierarchicalLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 HierarchicalLevelKey
			,Name 
			,Level
			,Status
    FROM HierarchicalLevel
	WHERE HierarchicalLevelKey = @HierarchicalLevelKey;
END
GO

/******************************************************************************
**  Name: updateHierarchicalLevel
**  Desc: Actualizar nivel jerarquico
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateHierarchicalLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateHierarchicalLevel]
END
GO

CREATE PROCEDURE UpdateHierarchicalLevel
(
	@HierarchicalLevelKey INT,
	@Name VARCHAR(150),
	@Level VARCHAR(2),
	@Status varCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE HierarchicalLevel 
	SET
		 Name		= @Name
		,Level		= @Level
		,Status		= @Status

	WHERE HierarchicalLevelKey = @HierarchicalLevelKey;
END
GO

/******************************************************************************
**  Name: deleteHierarchicalLevel
**  Desc: Eliminar un nivel jerarquico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteHierarchicalLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteHierarchicalLevel]
END
GO
CREATE PROCEDURE deleteHierarchicalLevel
(
	@HierarchicalLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM HierarchicalLevel 
	WHERE HierarchicalLevelKey  = @HierarchicalLevelKey ;
END
GO