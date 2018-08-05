USE SysSecurity
GO

/******************************************************************************
**  Name: Get List of Cities by Country
**  Desc: List of cities by country id
**  Author: Nataly Huanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getCitiesByCountryId]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getCitiesByCountryId]
END
GO

CREATE PROCEDURE getCitiesByCountryId
  (
    @CountryKey INT
  )
  AS
  SET XACT_ABORT ON;
  SET NOCOUNT ON;
  BEGIN
    SELECT CityKey
        ,CountryKey
        ,Name
        ,Code
      FROM City
    WHERE CountryKey = @CountryKey;
  END
  GO

/******************************************************************************
**  Name: SPA_InsertCity
**  Desc: Procedimiento almacenado para la creacion de ciudades.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertCity]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertCity]
END
GO

CREATE PROCEDURE SPA_InsertCity
(
	@code varchar(3),
	@name varchar(50),
	@countryKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Country WHERE CountryKey  = @countryKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.City WHERE UPPER([Name])=UPPER(@name)) = 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.City WHERE UPPER([Code])=UPPER(@code)) = 0)
			BEGIN
				INSERT INTO [dbo].[City]
						([Code]
						,[Name]
						,[CountryKey])
				VALUES (@code
						,@name
						,@countryKey
						);
				SELECT 1 AS Code, @@IDENTITY AS Row_Key, '' AS [Message];
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a City with the code '+ @code+ '.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a City with the name '+ @name+ '.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, 0 AS Row_Key, 'The Country Leven whith key '+CAST(@countryKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GettCity
**  Desc: Procedimiento almacenado que devuelve el detalle de una ciudad.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetCity]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetCity]
END
GO

CREATE PROCEDURE SPA_GetCity
(
	@CityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT CityKey
		   ,[Code]
			,[Name]
			,[CountryKey]
	FROM [dbo].[City]
	WHERE CityKey = @CityKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateCity
**  Desc: Procedimiento almacenado para la actualizacion de un area
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateCity]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateCity]
END
GO

CREATE PROCEDURE SPA_UpdateCity
(
	@CityKey int,
	@code varchar(3),
	@name varchar(50),
	@countryKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  = @CityKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.Country WHERE CountryKey  = @countryKey) > 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  != @CityKey AND UPPER([Name])=UPPER(@name)) = 0)
			BEGIN
				IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  != @CityKey AND UPPER([Code])=UPPER(@code)) = 0)
				BEGIN
					UPDATE City
					SET [Code] = @code
						,[Name] = @name
						,[CountryKey] = @countryKey
					WHERE CityKey = @CityKey;
					SELECT 1 AS Code, @CityKey AS Row_Key, '' AS [Message];
					END
				ELSE
				BEGIN
					SELECT 0 AS Code, @CityKey AS Row_Key, 'Already exists a City with the code '+ @code+ '.' AS [Message];
				END
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, @CityKey AS Row_Key, 'Already exists a City with the name '+ @name+ '.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, @CityKey AS Row_Key, 'The Country whith key '+CAST(@countryKey as VARCHAR)+ ' do not exists.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @CityKey AS Row_Key, 'The City whith key '+CAST(@CityKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO


/******************************************************************************
**  Name: SPA_DeleteCity
**  Desc: Procedimiento almacenado que elimina un area.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteCity]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteCity]
END
GO

CREATE PROCEDURE SPA_DeleteCity
(
	@CityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  = @CityKey) > 0)
	BEGIN
		DELETE FROM City
		WHERE CityKey  = @CityKey;
		SELECT 1 AS Code, @CityKey AS Row_Key, '' AS [Message];
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @CityKey AS Row_Key, 'The City whith key '+@CityKey+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GettCities
**  Desc: Procedimiento almacenado que devuelve el detalle de una ciudad.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetCities]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetCities]
END
GO

CREATE PROCEDURE SPA_GetCities
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT CityKey
		   ,[Code]
			,[Name]
			,[CountryKey]
	FROM [dbo].[City]
END
GO