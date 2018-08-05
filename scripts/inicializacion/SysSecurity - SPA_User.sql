USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_ValidateUser
**  Desc: Procedimiento almacenado para la validacion de un usuario y contrasena.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_ValidateUser]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_ValidateUser]
END
GO

CREATE PROCEDURE SPA_ValidateUser
(
	@username varchar(50),
	@password varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.[User] WHERE UPPER(Username)  = UPPER(@username) AND [Password]=@password) > 0)
	BEGIN
		SELECT 1 AS Code, 0 AS Row_Key, '' AS [Message];
	END
	ELSE
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.[User] WHERE UPPER(Username)  = UPPER(@username)) > 0)
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The credentials for '+@username+' are incorrects.' AS [Message];;
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The user '+CAST(@username as VARCHAR)+ ' do not exist.' AS [Message];
		END
	END
END
GO

/******************************************************************************
**  Name: SPA_GetByUsername
**  Desc: Procedimiento almacenado para obtener un usuario por su Username.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetByUsername]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetByUsername]
END
GO

CREATE PROCEDURE SPA_GetByUsername
(
	@username varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT UserKey
	,EmployeeKey
	,RolKey
	,Status
	,UserName
	FROM dbo.[User]
	WHERE UPPER(UserName)=UPPER(@username)
END
GO
