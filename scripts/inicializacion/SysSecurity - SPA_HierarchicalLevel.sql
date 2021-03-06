/******************************************************************************
**  Name: SPA_GetHierarchicalLevels
**  Desc: Procedimiento almacenado que devuelve la lista de Niveles Gerarquicos.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetHierarchicalLevels]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetHierarchicalLevels]
END
GO

CREATE PROCEDURE SPA_GetHierarchicalLevels
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT HierarchicalLevelKey
		   ,[Name]
		   ,[Status]
			,[Level]
	FROM [dbo].[HierarchicalLevel]
END
GO

/******************************************************************************
**  Name: SPA_GetHierarchicalLevelById
**  Desc: Procedimiento almacenado que devuelve el detalle de un Nivel Gerarquico.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetHierarchicalLevelById]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetHierarchicalLevelById]
END
GO

CREATE PROCEDURE SPA_GetHierarchicalLevelById
(
  @hierarchicalLevelKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT HierarchicalLevelKey
		   ,[Name]
		   ,[Status]
			,[Level]
	FROM [dbo].[HierarchicalLevel]
	WHERE hierarchicalLevelKey=@hierarchicalLevelKey
END
GO