/******************************************************************************
**  Name: InsertAccidentType
**  Desc: Inserta un nuevo Tipo de accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertAccidentType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertAccidentType]
END
GO
CREATE PROCEDURE InsertAccidentType
(
	@ParentKey INT,
	@Name VARCHAR(80),
	@Description VARCHAR(400),
	@State VARCHAR(15),
	@HaveSubType BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO AccidentType(ParentKey 
						   ,Name 
						   ,Description 
						   ,State
						   ,HaveSubType
						   )
	VALUES (@ParentKey,
			@Name,
			@Description,
			@State,
			@HaveSubType
			);

	SELECT @@IDENTITY AS NewAccidentTypeKey;
END
GO

/******************************************************************************
**  Name: getAccidentType
**  Desc: Obtener un Tipo de accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAccidentType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAccidentType]
END
GO

CREATE PROCEDURE GetAccidentType
(
	@AccidentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 AccidentTypeKey
			,ParentKey 
			,Name 
			,Description 
			,State
			,HaveSubType
    FROM AccidentType
	WHERE AccidentTypeKey = @AccidentTypeKey;
END
GO

/******************************************************************************
**  Name: getAllAccidentType
**  Desc: Obtener todos los Tipos de accidente
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllAccidentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllAccidentType]
END
GO

CREATE PROCEDURE getAllAccidentType
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	AccidentTypeKey
			,ParentKey
			,Name
			,Description
			,State
			,HaveSubType
    FROM AccidentType;
END
GO

/******************************************************************************
**  Name: updateAccidentType
**  Desc: Actualizar un Tipo de accidente
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAccidentType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateAccidentType]
END
GO

CREATE PROCEDURE UpdateAccidentType
(
	@AccidentTypeKey int,
	@ParentKey INT,
	@Name VARCHAR(80),
	@Description VARCHAR(400),
	@State VARCHAR(15),
	@HaveSubType BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE AccidentType 
	SET
		ParentKey		= @ParentKey
		,Name			= @Name
		,Description	= @Description
		,State			= @State
		,HaveSubType	= @HaveSubType

	WHERE AccidentTypeKey = @AccidentTypeKey;
END
GO

/******************************************************************************
**  Name: deleteAccidentType
**  Desc: Eliminar un Tipo de accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteAccidentType]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteAccidentType]
END
GO
CREATE PROCEDURE deleteAccidentType
(
	@AccidentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM AccidentType 
	WHERE AccidentTypeKey  = @AccidentTypeKey ;
END
GO