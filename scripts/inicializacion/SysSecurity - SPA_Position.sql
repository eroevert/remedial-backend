USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertPosition
**  Desc: Procedimiento almacenado para el registro de un Cargo en la empresa.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertPosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertPosition]
END
GO

CREATE PROCEDURE SPA_InsertPosition
(
	@organizationalHierarchyKey int,
	@name varchar(200),
	@education varchar(500),
	@status varchar(1),
	@description varchar(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Position]
           ([OrganizationalHierarchyKey]
           ,[Name]
           ,[Education]
           ,[Status]
           ,[Description])
	VALUES (@organizationalHierarchyKey,
			@name,
			@education,
			@status,
			@description
			);
	SELECT @@IDENTITY AS NewPositionKey;
END
GO

/******************************************************************************
**  Name: SPA_GettPosition
**  Desc: Procedimiento almacenado que devuelve el detalle de un cargo.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetPosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetPosition]
END
GO

CREATE PROCEDURE SPA_GetPosition
(
	@PositionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT PositionKey
		   ,[OrganizationalHierarchyKey]
           ,[Name]
           ,[Education]
           ,[Status]
           ,[Description]
	FROM [dbo].[Position]
	WHERE PositionKey = @PositionKey
END
GO

/******************************************************************************
**  Name: SPA_UpdatePosition
**  Desc: Procedimiento almacenado para la actualizacion de un cargo
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdatePosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdatePosition]
END
GO

CREATE PROCEDURE SPA_UpdatePosition
(
	@PositionKey int,
	@organizationalHierarchyKey int,
	@name varchar(200),
	@education varchar(500),
	@status varchar(1),
	@description varchar(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Position 
	SET [OrganizationalHierarchyKey] = @organizationalHierarchyKey
           ,[Name] = @name
           ,[Education] = @education
           ,[Status] = @status
           ,[Description] = @description
	WHERE PositionKey = @PositionKey;
END
GO


/******************************************************************************
**  Name: SPA_DeletePosition
**  Desc: Procedimiento almacenado que elimina un cargo.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeletePosition]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeletePosition]
END
GO

CREATE PROCEDURE SPA_DeletePosition
(
	@PositionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Position 
	WHERE PositionKey  = @PositionKey;
END
GO
/******************************************************************************
**  Name: SPA_GetPositions
**  Desc: Procedimiento almacenado que devuelve la lista de Cargos.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetPositions]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetPositions]
END
GO

CREATE PROCEDURE SPA_GetPositions
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT PositionKey
			,[OrganizationalHierarchyKey]
			,[Name]
			,[Education]
			,[Status]
			,[Description]
	FROM [dbo].[Position]
END
GO