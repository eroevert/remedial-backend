/******************************************************************************
**  Name: SPA_GetTypeContracts
**  Desc: Procedimiento almacenado que devuelve la lista de Tipos de Contrato.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetTypeContracts]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetTypeContracts]
END
GO

CREATE PROCEDURE SPA_GetTypeContracts
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT TypeContractKey
		   ,[Name]
		   ,[Code]
			,[Status]
	FROM [dbo].[TypeContract]
END
GO

/******************************************************************************
**  Name: SPA_GetTypeContractById
**  Desc: Procedimiento almacenado que devuelve el detalle de un Typo de Contrato.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetTypeContractById]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetTypeContractById]
END
GO

CREATE PROCEDURE SPA_GetTypeContractById
(
  @TypeContractKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT TypeContractKey
		   ,[Name]
		   ,[Status]
			,[Code]
	FROM [dbo].[TypeContract]
	WHERE TypeContractKey=@TypeContractKey
END
GO