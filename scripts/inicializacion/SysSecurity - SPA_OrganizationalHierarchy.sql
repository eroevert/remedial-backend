USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertOrganizationalHierarchy
**  Desc: Procedimiento almacenado para el Nivel Organizacional.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertOrganizationalHierarchy]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertOrganizationalHierarchy]
END
GO

CREATE PROCEDURE SPA_InsertOrganizationalHierarchy
(
	@description varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[OrganizationalHierarchy]
           ([Description])
	VALUES (@description
			);
	SELECT 1 AS Code, @@IDENTITY AS NewOrganizationalHierarchyKey, '' AS Mess;
END
GO

/******************************************************************************
**  Name: SPA_GettOrganizationalHierarchy
**  Desc: Procedimiento almacenado que devuelve el detalle de un nivel organizacional.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetOrganizationalHierarchy]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetOrganizationalHierarchy]
END
GO

CREATE PROCEDURE SPA_GetOrganizationalHierarchy
(
	@OrganizationalHierarchyKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT OrganizationalHierarchyKey
		   ,[Description]
	FROM [dbo].[OrganizationalHierarchy]
	WHERE OrganizationalHierarchyKey = @OrganizationalHierarchyKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateOrganizationalHierarchy
**  Desc: Procedimiento almacenado para la actualizacion de un nivel organizacional
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateOrganizationalHierarchy]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateOrganizationalHierarchy]
END
GO

CREATE PROCEDURE SPA_UpdateOrganizationalHierarchy
(
	@OrganizationalHierarchyKey int,
	@description VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE OrganizationalHierarchy 
	SET [Description] = @description
	WHERE OrganizationalHierarchyKey = @OrganizationalHierarchyKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteOrganizationalHierarchy
**  Desc: Procedimiento almacenado que elimina un nivel organizacional.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteOrganizationalHierarchy]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteOrganizationalHierarchy]
END
GO

CREATE PROCEDURE SPA_DeleteOrganizationalHierarchy
(
	@OrganizationalHierarchyKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM OrganizationalHierarchy 
	WHERE OrganizationalHierarchyKey  = @OrganizationalHierarchyKey;
END
GO
