USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertOrganization
**  Desc: Procedimiento almacenado para el Areas en la empresa.
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
** 05/06/2018 Gary Vera       Change OutPut for control
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertOrganization]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertOrganization]
END
GO

CREATE PROCEDURE SPA_InsertOrganization
(
	@hierarchicalLevelKey int,
	@fatherId int,
	@name varchar(200),
	@description varchar(200),
	@code varchar(20),
	@start datetime,
	@end datetime,
	@status char(1),
	@gestion varchar(4)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.HierarchicalLevel WHERE HierarchicalLevelKey  = @hierarchicalLevelKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.Organization WHERE UPPER([Name])=UPPER(@name)) = 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.Organization WHERE UPPER([Code])=UPPER(@code)) = 0)
			BEGIN
				INSERT INTO [dbo].[Organization]
						([HierarchicalLevelKey]
						,[IdPadre]
						,[Name]
						,[Description]
						,[Code]
						,[Start]
						,[End]
						,[Status]
						,[Gestion])
				VALUES (@hierarchicalLevelKey
						,@fatherId
						,@name
						,@description
						,@code
						,@start
						,@end
						,@status
						,@gestion
						);
				SELECT 1 AS Code, @@IDENTITY AS Row_Key, '' AS [Message];
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a Organization with the code '+ @code+ '.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a Organization with the name '+ @name+ '.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, 0 AS Row_Key, 'The Hierarchical Leven whith key '+CAST(@hierarchicalLevelKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GettOrganization
**  Desc: Procedimiento almacenado que devuelve el detalle de un area.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetOrganization]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetOrganization]
END
GO

CREATE PROCEDURE SPA_GetOrganization
(
	@OrganizationKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT OrganizationKey
		   ,[HierarchicalLevelKey]
           ,[IdPadre]
           ,[Name]
           ,[Description]
           ,[Code]
           ,[Start]
           ,[End]
           ,[Status]
           ,[Gestion]
	FROM [dbo].[Organization]
	WHERE OrganizationKey = @OrganizationKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateOrganization
**  Desc: Procedimiento almacenado para la actualizacion de un area
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
** 05/06/2018 Gary Vera       Implements foreingKeys and duplicate validations
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateOrganization]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateOrganization]
END
GO

CREATE PROCEDURE SPA_UpdateOrganization
(
	@OrganizationKey int,
	@hierarchicalLevelKey int,
	@fatherId int,
	@name varchar(200),
	@description varchar(200),
	@code varchar(20),
	@start datetime,
	@end datetime,
	@status char(1),
	@gestion varchar(4)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey  = @OrganizationKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.HierarchicalLevel WHERE HierarchicalLevelKey  = @hierarchicalLevelKey) > 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey  != @OrganizationKey AND UPPER([Name])=UPPER(@name)) = 0)
			BEGIN
				IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey  != @OrganizationKey AND UPPER([Code])=UPPER(@code)) = 0)
				BEGIN
					UPDATE Organization
					SET [HierarchicalLevelKey] = @hierarchicalLevelKey
						   ,[IdPadre] = @fatherId
						   ,[Name] = @name
						   ,[Description] = @description
						   ,[Code] = @code
						   ,[Start] = @start
						   ,[End] = @end
						   ,[Status] = @status
						   ,[Gestion] = @gestion
					WHERE OrganizationKey = @OrganizationKey;
					SELECT 1 AS Code, @OrganizationKey AS Row_Key, '' AS [Message];
					END
				ELSE
				BEGIN
					SELECT 0 AS Code, @OrganizationKey AS Row_Key, 'Already exists a Organization with the code '+ @code+ '.' AS [Message];
				END
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, @OrganizationKey AS Row_Key, 'Already exists a Organization with the name '+ @name+ '.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, @OrganizationKey AS Row_Key, 'The Hierarchical Leven whith key '+CAST(@hierarchicalLevelKey as VARCHAR)+ ' do not exists.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @OrganizationKey AS Row_Key, 'The Organization whith key '+CAST(@OrganizationKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO


/******************************************************************************
**  Name: SPA_DeleteOrganization
**  Desc: Procedimiento almacenado que elimina un area.
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
** 04/06/2018 Gary Vera       Implement IF EXISTS control
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteOrganization]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteOrganization]
END
GO

CREATE PROCEDURE SPA_DeleteOrganization
(
	@OrganizationKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey  = @OrganizationKey) > 0)
	BEGIN
		IF(((SELECT COUNT(*) FROM dbo.Organization WHERE IdPadre=@OrganizationKey)=0) AND
		((SELECT COUNT(*) FROM dbo.Employee WHERE OrganizationKey=@OrganizationKey)=0))
		BEGIN
			DELETE FROM Organization
			WHERE OrganizationKey  = @OrganizationKey;
			SELECT 1 AS Code, @OrganizationKey AS Row_Key, '' AS [Message];
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, @OrganizationKey AS Row_Key, 'El area con id '+CAST(@OrganizationKey AS VARCHAR)+ ' no puede eliminarse ya que tiene areas y/o empleados asignados.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @OrganizationKey AS Row_Key, 'The Organization whith key '+CAST(@OrganizationKey AS VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GetOrganizationsFromOrganization
**  Desc: Procedimiento almacenado que devuelve las areas hijas de una area.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetOrganizationsFromOrganization]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetOrganizationsFromOrganization]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetOrganizationsFromOrganization
	@idOrgnanizationFather INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT[OrganizationKey]
      ,[HierarchicalLevelKey]
      ,[IdPadre]
      ,[Name]
      ,[Description]
      ,[Code]
      ,[Start]
      ,[End]
      ,[Status]
      ,[Gestion]
	FROM dbo.Organization
	WHERE IdPadre = @idOrgnanizationFather
END
GO

/******************************************************************************
**  Name: SPA_GetAllOrganization
**  Desc: Procedimiento almacenado que devuelve todas las areas.
**
**  Author: Nataly Huanca
**
**  Grupo: C
**
**  Date: 06/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/06/2018 Nataly Huanca       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetAllOrganization]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetAllOrganization]
END
GO
CREATE PROCEDURE [dbo].[SPA_GetAllOrganization]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT[OrganizationKey]
      ,[HierarchicalLevelKey]
      ,[IdPadre]
      ,[Name]
      ,[Description]
      ,[Code]
      ,[Start]
      ,[End]
      ,[Status]
      ,[Gestion]
	FROM dbo.Organization
END
GO

/******************************************************************************
**  Name: SPA_GetAllOrganizations
**  Desc: Procedimiento almacenado que devuelve las areas.
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
** 08/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetAllOrganizations]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetAllOrganizations]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetAllOrganizations
AS
BEGIN
	SET NOCOUNT ON;

    SELECT[OrganizationKey]
      ,[HierarchicalLevelKey]
      ,[IdPadre]
      ,[Name]
      ,[Description]
      ,[Code]
      ,[Start]
      ,[End]
      ,[Status]
      ,[Gestion]
	FROM dbo.Organization
END
GO