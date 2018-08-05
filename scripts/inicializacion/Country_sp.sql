/******************************************************************************
**  Name: InsertCountry
**  Desc: Inserta un nuevo Pais
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertCountry]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertCountry]
END
GO
CREATE PROCEDURE InsertCountry
(
	@Code VARCHAR(3),
	@Name VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Country(Code 
						   ,Name 
						   )
	VALUES (@Code
			,@Name 
			);

	SELECT @@IDENTITY AS NewCountryKey;
END
GO

/******************************************************************************
**  Name: getCountry
**  Desc: Obtener un Pais
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetCountry]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetCountry]
END
GO

CREATE PROCEDURE GetCountry
(
	@CountryKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 CountryKey
			,Code 
			,Name 
    FROM Country
	WHERE CountryKey = @CountryKey;
END
GO

/******************************************************************************
**  Name: updateCountry
**  Desc: Actualizar un Pais
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCountry]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateCountry]
END
GO

CREATE PROCEDURE UpdateCountry
(
	@CountryKey int,
	@Code VARCHAR(3),
	@Name VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Country 
	SET
		 Code		= @Code
		,Name		= @Name

	WHERE CountryKey = @CountryKey;
END
GO

/******************************************************************************
**  Name: deleteCountry
**  Desc: Eliminar un Pais
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteCountry]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteCountry]
END
GO
CREATE PROCEDURE deleteCountry
(
	@CountryKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Country 
	WHERE CountryKey  = @CountryKey ;
END
GO