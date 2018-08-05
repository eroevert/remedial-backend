/******************************************************************************
**  Name: InsertCurrency
**  Desc: Inserta una nueva moneda
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertCurrency]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertCurrency]
END
GO
CREATE PROCEDURE InsertCurrency
(
	@CountryKey INT,
	@Name VARCHAR(50),
	@Code VARCHAR(50),
	@Status VARCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Currency(CountryKey 
						   ,Name 
						   ,Code 
						   ,Status
						   )
	VALUES (@CountryKey
			,@Name 
			,@Code
			,@Status
			);

	SELECT @@IDENTITY AS NewCurrencyKey;
END
GO

/******************************************************************************
**  Name: getCurrency
**  Desc: Obtener una moneda
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetCurrency]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetCurrency]
END
GO

CREATE PROCEDURE GetCurrency
(
	@CurrencyKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 CurrencyKey
			,CountryKey 
			,Name 
			,Code 
			,Status
    FROM Currency
	WHERE CurrencyKey = @CurrencyKey;
END
GO

/******************************************************************************
**  Name: updateCurrency
**  Desc: Actualizar moneda
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCurrency]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateCurrency]
END
GO

CREATE PROCEDURE UpdateCurrency
(
	@CurrencyKey INT,
	@CountryKey INT,
	@Name VARCHAR(50),
	@Code VARCHAR(50),
	@Status VARCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Currency 
	SET
		 CountryKey		= @CountryKey
		,Name			= @Name
		,Code			= @Code
		,Status			= @Status

	WHERE CurrencyKey = @CurrencyKey;
END
GO

/******************************************************************************
**  Name: deleteCurrency
**  Desc: Eliminar moneda
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteCurrency]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteCurrency]
END
GO
CREATE PROCEDURE deleteCurrency
(
	@CurrencyKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Currency 
	WHERE CurrencyKey  = @CurrencyKey ;
END
GO