USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertPositionHistorical
**  Desc: Procedimiento almacenado para el registro de un Cargo  historico en la empresa.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertPositionHistorical]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertPositionHistorical]
END
GO

CREATE PROCEDURE SPA_InsertPositionHistorical
(
	@employeeKey int,
	@itemKey int,
	@memoNumer varchar(512),
	@start datetime,
	@end datetime,
	@status char(1),
	@responsibleKey int,
	@approbalDate datetime
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[PositionHistorical]
           ([EmployeeKey]
           ,[ItemKey]
           ,[MemoNumber]
           ,[Start]
           ,[End]
           ,[Status]
           ,[ResponsibleKey]
           ,[ApprovalDate])
	VALUES (@employeeKey,
			@itemKey,
			@memoNumer,
			@start,
			@end,
			@status,
			@responsibleKey,
			@approbalDate
			);
	SELECT 1 AS Code, @@IDENTITY AS Row_Key, '' AS [Message];
END
GO

/******************************************************************************
**  Name: SPA_GettPositionHistorical
**  Desc: Procedimiento almacenado que devuelve el detalle de un historial de cargo.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetPositionHistorical]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetPositionHistorical]
END
GO

CREATE PROCEDURE SPA_GetPositionHistorical
(
	@historialCargoID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [historialCargoID]
           ,[EmployeeKey]
           ,[ItemKey]
           ,[MemoNumber]
           ,[Start]
           ,[End]
           ,[Status]
           ,[ResponsibleKey]
           ,[ApprovalDate]
	FROM [dbo].[PositionHistorical]
	WHERE historialCargoID = @historialCargoID
END
GO

/******************************************************************************
**  Name: SPA_GettPositionHistoricalByEmployee
**  Desc: Procedimiento almacenado que devuelve el detalle de un historial de cargo por empleado.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GettPositionHistoricalByEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GettPositionHistoricalByEmployee]
END
GO

CREATE PROCEDURE SPA_GettPositionHistoricalByEmployee
(
	@employeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [historialCargoID]
           ,[EmployeeKey]
           ,[ItemKey]
           ,[MemoNumber]
           ,[Start]
           ,[End]
           ,[Status]
           ,[ResponsibleKey]
           ,[ApprovalDate]
	FROM [dbo].[PositionHistorical]
	WHERE EmployeeKey = @employeeKey
END
GO

/******************************************************************************
**  Name: SPA_GetAllPositionHistorical
**  Desc: Procedimiento almacenado que devuelve el detalle de un historial de cargo.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetAllPositionHistorical]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetAllPositionHistorical]
END
GO

CREATE PROCEDURE SPA_GetAllPositionHistorical
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [historialCargoID]
           ,[EmployeeKey]
           ,[ItemKey]
           ,[MemoNumber]
           ,[Start]
           ,[End]
           ,[Status]
           ,[ResponsibleKey]
           ,[ApprovalDate]
	FROM [dbo].[PositionHistorical]
END
GO

/******************************************************************************
**  Name: SPA_UpdatePositionHistorical
**  Desc: Procedimiento almacenado para la actualizacion de un historial de cargo
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdatePositionHistorical]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdatePositionHistorical]
END
GO

CREATE PROCEDURE SPA_UpdatePositionHistorical
(
	@historialCargoID int,
	@employeeKey int,
	@itemKey int,
	@memoNumer varchar(250),
	@start datetime,
	@end datetime,
	@status char(1),
	@responsibleKey int,
	@approbalDate datetime
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE PositionHistorical 
	SET [EmployeeKey] = @employeeKey
           ,[ItemKey] = @itemKey
           ,[MemoNumber] = @memoNumer
           ,[Start] = @start
           ,[End] = @end
           ,[Status] = @status
           ,[ResponsibleKey] = @responsibleKey
           ,[ApprovalDate] = @approbalDate
	WHERE historialCargoID = @historialCargoID;
END
GO


/******************************************************************************
**  Name: SPA_DeletePositionHistorical
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeletePositionHistorical]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeletePositionHistorical]
END
GO

CREATE PROCEDURE SPA_DeletePositionHistorical
(
	@historialCargoID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM PositionHistorical 
	WHERE historialCargoID  = @historialCargoID;
END
GO
