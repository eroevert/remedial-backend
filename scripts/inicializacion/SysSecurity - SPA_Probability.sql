USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertProbability
**  Desc: Procedimiento almacenado para el registro de una probabilidad de ocurrencia.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertProbability]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertProbability]
END
GO

CREATE PROCEDURE SPA_InsertProbability
(
	@name varchar(50),
	@indiceP int,
	@indicatorBaseKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Probability]
           ([Name]
		  ,[IndiceP]
		  ,[indicatorBaseKey])
	VALUES (@name,
			@indiceP,
			@indicatorBaseKey
			);
	SELECT @@IDENTITY AS NewprobabilityKey;
END
GO

/******************************************************************************
**  Name: SPA_GetProbability
**  Desc: Procedimiento almacenado que devuelve el detalle una probabilidad de ocurrencia.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetProbability]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetProbability]
END
GO

CREATE PROCEDURE SPA_GetProbability
(
	@probabilityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [probabilityKey]
           ,[Name]
		  ,[IndiceP]
		  ,[indicatorBaseKey]
	FROM [dbo].[Probability]
	WHERE probabilityKey = @probabilityKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateProbability
**  Desc: Procedimiento almacenado para la actualizacion de una probabilidad
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateProbability]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateProbability]
END
GO

CREATE PROCEDURE SPA_UpdateProbability
(
	@probabilityKey int,
	@name varchar(50),
	@indiceP int,
	@indicatorBaseKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Probability 
	SET [Name] = @name
		  ,[IndiceP] = @indiceP
		  ,[indicatorBaseKey] = @indicatorBaseKey
	WHERE probabilityKey = @probabilityKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteProbability
**  Desc: Procedimiento almacenado que elimina una probabilidad de ocurrencia.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteProbability]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteProbability]
END
GO

CREATE PROCEDURE SPA_DeleteProbability
(
	@probabilityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Probability 
	WHERE probabilityKey  = @probabilityKey;
END
GO
