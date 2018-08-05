/******************************************************************************
**  Name: InsertAccident
**  Desc: Inserta un nuevo Accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertAccident]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertAccident]
END
GO

CREATE PROCEDURE InsertAccident
(
	@DateEvent DATETIME,
	@DateRegister DATETIME,
	@Title VARCHAR(200),
	@DescribeIssue VARCHAR(8000),
	@Suggestion VARCHAR(2000),
	@levelRiskId INT,
	@AccidentTypeKey INT,
	@EmployeeKey INT,
	@IsAnonymous BIT,
	@ResponsibleEmployeeKey INT,
	@Status VARCHAR(50),
	@CloseDate DATETIME,
	@Code VARCHAR(30),
	@IsMandatory BIT,
	@isVoluntary BIT,
	@EndDate DATETIME,
	@createdReportFromAdmin INT,
	@StatusReport INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Accident(DateEvent
	,DateRegister
	,Title
	,DescribeIssue
	,Suggestion
	,levelRiskId
	,AccidentTypeKey
	,EmployeeKey
	,IsAnonymous
	,ResponsibleEmployeeKey
	,Status
	,CloseDate
	,Code
	,IsMandatory
	,isVoluntary
	,EndDate
	,createdReportFromAdmin
	,StatusReport
)
	VALUES (@DateEvent,
	@DateRegister,
	@Title,
	@DescribeIssue,
	@Suggestion,
	@levelRiskId,
	@AccidentTypeKey,
	@EmployeeKey,
	@IsAnonymous,
	@ResponsibleEmployeeKey,
	@Status,
	@CloseDate,
	@Code,
	@IsMandatory,
	@isVoluntary,
	@EndDate,
	@createdReportFromAdmin,
	@StatusReport
			);

	SELECT @@IDENTITY AS NewAccidentKey;
END
GO

/******************************************************************************
**  Name: getAccident
**  Desc: Obtener un Accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAccident]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAccident]
END
GO

CREATE PROCEDURE GetAccident
(
	@AccidentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 AccidentKey 
		,DateEvent
		,DateRegister
		,Title
		,DescribeIssue
		,Suggestion
		,levelRiskId
		,AccidentTypeKey
		,EmployeeKey
		,IsAnonymous
		,ResponsibleEmployeeKey
		,Status
		,CloseDate
		,Code
		,IsMandatory
		,isVoluntary
		,EndDate
		,createdReportFromAdmin
		,StatusReport
    FROM Accident
	WHERE AccidentKey = @AccidentKey;
END
GO

/******************************************************************************
**  Name: updateAccident
**  Desc: Actualizar un Accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAccident]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateAccident]
END
GO

CREATE PROCEDURE UpdateAccident
(
	@AccidentKey int,
	@DateEvent DATETIME,
	@DateRegister DATETIME,
	@Title VARCHAR(200),
	@DescribeIssue VARCHAR(8000),
	@Suggestion VARCHAR(2000),
	@levelRiskId INT,
	@AccidentTypeKey INT,
	@EmployeeKey INT,
	@IsAnonymous BIT,
	@ResponsibleEmployeeKey INT,
	@Status VARCHAR(50),
	@CloseDate DATETIME,
	@Code VARCHAR(30),
	@IsMandatory BIT,
	@isVoluntary BIT,
	@EndDate DATETIME,
	@createdReportFromAdmin INT,
	@StatusReport INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Accident 
	SET
		 DateEvent			= @DateEvent
		,DateRegister		= @DateRegister
		,Title				= @Title
		,DescribeIssue		= @DescribeIssue
		,Suggestion			= @Suggestion
		,levelRiskId		= @levelRiskId
		,AccidentTypeKey	= @AccidentTypeKey
		,EmployeeKey		= @EmployeeKey
		,IsAnonymous		= @IsAnonymous
		,ResponsibleEmployeeKey= @ResponsibleEmployeeKey
		,Status				= @Status
		,CloseDate			= @CloseDate
		,Code				= @Code
		,IsMandatory		= @IsMandatory
		,isVoluntary		= @isVoluntary
		,EndDate			= @EndDate
		,createdReportFromAdmin = @createdReportFromAdmin
		,StatusReport		= @StatusReport

	WHERE AccidentKey = @AccidentKey;
END
GO

/******************************************************************************
**  Name: deleteAccident
**  Desc: Eliminar un Accident
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteAccident]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteAccident]
END
GO

CREATE PROCEDURE deleteAccident
(
	@AccidentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Accident 
	WHERE AccidentKey  = @AccidentKey;
	SELECT @AccidentKey AS AccidentId;
END
GO

/******************************************************************************
**  Name: getAllAccident
**  Desc: Get all accident
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllAccident]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllAccident]
END
GO

CREATE PROCEDURE getAllAccident
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT AccidentKey
		,DateEvent
		,DateRegister
		,Title
		,DescribeIssue
		,Suggestion
		,levelRiskId
		,AccidentTypeKey
		,EmployeeKey
		,IsAnonymous
		,ResponsibleEmployeeKey
		,Status
		,CloseDate
		,Code
		,IsMandatory
		,isVoluntary
		,EndDate
		,createdReportFromAdmin
		,StatusReport
    FROM Accident;
END
GO