USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertRiskValue
**  Desc: Procedimiento almacenado para el registro de un Riesgo.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertRiskValue]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertRiskValue]
END
GO

CREATE PROCEDURE SPA_InsertRiskValue
(
	@probabilityId int,
	@severityId int,
	@daysToResolve datetime,
	@color varchar(20)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[RiskValue]
           ([probabilityId]
           ,[severityId]
           ,[daysToResolve]
           ,[color])
	VALUES (@probabilityId,
			@severityId,
			@daysToResolve,
			@color
			);
	SELECT @@IDENTITY AS NewRiskValueKey;
END
GO

/******************************************************************************
**  Name: SPA_GetRiskValue
**  Desc: Procedimiento almacenado que devuelve el detalle un riesgo.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetRiskValue]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetRiskValue]
END
GO

CREATE PROCEDURE SPA_GetRiskValue
(
	@RiskValueKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [RiskValueKey]
           ,[probabilityId]
           ,[severityId]
           ,[daysToResolve]
           ,[color]
	FROM [dbo].[RiskValue]
	WHERE RiskValueKey = @RiskValueKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateRiskValue
**  Desc: Procedimiento almacenado para la actualizacion de un riesgo
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateRiskValue]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateRiskValue]
END
GO

CREATE PROCEDURE SPA_UpdateRiskValue
(
	@RiskValueKey int,
	@probabilityId int,
	@severityId int,
	@daysToResolve datetime,
	@color varchar(20)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE RiskValue 
	SET [probabilityId] = @probabilityId
           ,[severityId] = @severityId
           ,[daysToResolve] = @daysToResolve
           ,[color] = @color
	WHERE RiskValueKey = @RiskValueKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteRiskValue
**  Desc: Procedimiento almacenado que elimina un riesgo.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteRiskValue]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteRiskValue]
END
GO

CREATE PROCEDURE SPA_DeleteRiskValue
(
	@RiskValueKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM RiskValue 
	WHERE RiskValueKey  = @RiskValueKey;
END
GO
