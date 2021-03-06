USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertRol
**  Desc: Procedimiento almacenado para el registro de un Rol.
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
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertRol]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertRol]
END
GO

CREATE PROCEDURE SPA_InsertRol
(
	@name varchar(50),
	@description varchar(150)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Rol]
           ([Name]
           ,[Description])
	VALUES (@name,
			@description
			);
	SELECT @@IDENTITY AS NewRolKey;
END
GO

/******************************************************************************
**  Name: SPA_GetRol
**  Desc: Procedimiento almacenado que devuelve el detalle un Rol.
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
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetRol]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetRol]
END
GO

CREATE PROCEDURE SPA_GetRol
(
	@RolKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [RolKey]
           ,[Name]
           ,[Description]
	FROM [dbo].[Rol]
	WHERE RolKey = @RolKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateRol
**  Desc: Procedimiento almacenado para la actualizacion de un rol
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
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateRol]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateRol]
END
GO

CREATE PROCEDURE SPA_UpdateRol
(
	@RolKey int,
	@name varchar(50),
	@description varchar(150)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Rol 
	SET [Name] = @name
           ,[Description] = @description
	WHERE RolKey = @RolKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteRol
**  Desc: Procedimiento almacenado que elimina un rol.
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
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteRol]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteRol]
END
GO

CREATE PROCEDURE SPA_DeleteRol
(
	@RolKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Rol 
	WHERE RolKey  = @RolKey;
END
GO
