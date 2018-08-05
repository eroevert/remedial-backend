/******************************************************************************
**  Name: InsertAcademicInformation
**  Desc: Inserta una nueva Informaci�n de Academia
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertAcademicInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertAcademicInformation]
END
GO
CREATE PROCEDURE InsertAcademicInformation
(
	@EmployeeKey          int,
	@CityKey              int,
	@AcademicLevelKey     int,
	@ProfessionKey        int,
	@Status               varchar(2),
	@Start                varchar(12),
	@End				  varchar(12),
	@Institution          varchar(500),
	@AcademicTitle        bit,
	@NationalTitle        bit
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO AcademicInformation(
						EmployeeKey,
						CityKey,
						AcademicLevelKey,
						ProfessionKey,
						Status,
						Start,
						"End",
						Institution,
						AcademicTitle,
						NationalTitle
						   )
	VALUES (
			@EmployeeKey,
			@CityKey,
			@AcademicLevelKey,
			@ProfessionKey,
			@Status,
			@Start,
			@End,
			@Institution,
			@AcademicTitle,
			@NationalTitle
			);

	SELECT @@IDENTITY AS NewAcademicInformationKey;
END
GO

/******************************************************************************
**  Name: getAcademicInformation
**  Desc: Obtener una Informacion Academica
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAcademicInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAcademicInformation]
END
GO

CREATE PROCEDURE GetAcademicInformation
(
	@AcademicInformationKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	AcademicInformationKey,
			EmployeeKey,
			CityKey,
			AcademicLevelKey,
			ProfessionKey,
			Status,
			Start,
			"End",
			Institution,
			AcademicTitle,
			NationalTitle
    FROM AcademicInformation
	WHERE AcademicInformationKey = @AcademicInformationKey;
END
GO

/******************************************************************************
**  Name: updateAcademicInformation
**  Desc: Actualizar Informacion Academica
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAcademicInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateAcademicInformation]
END
GO

CREATE PROCEDURE UpdateAcademicInformation
(
	@AcademicInformationKey INT,
	@EmployeeKey          int,
	@CityKey              int,
	@AcademicLevelKey     int,
	@ProfessionKey        int,
	@Status               varchar(2),
	@Start                varchar(12),
	@End				  varchar(12),
	@Institution          varchar(500),
	@AcademicTitle        bit,
	@NationalTitle        bit
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE AcademicInformation
	SET
		EmployeeKey			= @EmployeeKey,
		CityKey				= @CityKey,
		AcademicLevelKey	= @AcademicLevelKey,
		ProfessionKey		= @ProfessionKey,
		Status				= @Status,
		Start				= @Start,
		"End"				= @End,
		Institution			= @Institution,
		AcademicTitle		= @AcademicTitle,
		NationalTitle		= @NationalTitle

	WHERE AcademicInformationKey = @AcademicInformationKey;
END
GO

/******************************************************************************
**  Name: deleteAcademicInformation
**  Desc: Eliminar Informacion Academica
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteAcademicInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteAcademicInformation]
END
GO
CREATE PROCEDURE deleteAcademicInformation
(
	@AcademicInformationKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM AcademicInformation
	WHERE AcademicInformationKey  = @AcademicInformationKey ;
END
GO

/******************************************************************************
**  Name: InsertAcademicLevel
**  Desc: Inserta un Nivel Academico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertAcademicLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertAcademicLevel]
END
GO
CREATE PROCEDURE InsertAcademicLevel
(
	@Description VARCHAR(100),
	@Status VARCHAR(2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO AcademicLevel(Description
						   ,Status
						   )
	VALUES (@Description
			,@Status
			);

	SELECT @@IDENTITY AS NewAcademicLevelKey;
END
GO

/******************************************************************************
**  Name: getAcademicLevel
**  Desc: Obtener Nivel Academico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAcademicLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAcademicLevel]
END
GO

CREATE PROCEDURE GetAcademicLevel
(
	@AcademicLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 AcademicLevelKey
			,Description
			,Status
    FROM AcademicLevel
	WHERE AcademicLevelKey = @AcademicLevelKey;
END
GO

/******************************************************************************
**  Name: updateAcademicLevel
**  Desc: Actualizar un Nivel Academico
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAcademicLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateAcademicLevel]
END
GO

CREATE PROCEDURE UpdateAcademicLevel
(
	@AcademicLevelKey INT,
	@Description VARCHAR(100),
	@Status VARCHAR(2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE AcademicLevel
	SET
		Description		= @Description
		,Status			= @Status

	WHERE AcademicLevelKey = @AcademicLevelKey;
END
GO

/******************************************************************************
**  Name: deleteAcademicLevel
**  Desc: Eliminar un Nivel Academico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteAcademicLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteAcademicLevel]
END
GO
CREATE PROCEDURE deleteAcademicLevel
(
	@AcademicLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM AcademicLevel
	WHERE AcademicLevelKey  = @AcademicLevelKey ;
END
GO

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

/******************************************************************************
**  Name: InsertAccidentType
**  Desc: Inserta un nuevo Tipo de accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertAccidentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertAccidentType]
END
GO
CREATE PROCEDURE InsertAccidentType
(
	@ParentKey INT,
	@Name VARCHAR(80),
	@Description VARCHAR(400),
	@State VARCHAR(15),
	@HaveSubType BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO AccidentType(ParentKey
						   ,Name
						   ,Description
						   ,State
						   ,HaveSubType
						   )
	VALUES (@ParentKey,
			@Name,
			@Description,
			@State,
			@HaveSubType
			);

	SELECT @@IDENTITY AS NewAccidentTypeKey;
END
GO

/******************************************************************************
**  Name: getAccidentType
**  Desc: Obtener un Tipo de accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAccidentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAccidentType]
END
GO

CREATE PROCEDURE GetAccidentType
(
	@AccidentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 AccidentTypeKey
			,ParentKey
			,Name
			,Description
			,State
			,HaveSubType
    FROM AccidentType
	WHERE AccidentTypeKey = @AccidentTypeKey;
END
GO

/******************************************************************************
**  Name: updateAccidentType
**  Desc: Actualizar un Tipo de accidente
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAccidentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateAccidentType]
END
GO

CREATE PROCEDURE UpdateAccidentType
(
	@AccidentTypeKey int,
	@ParentKey INT,
	@Name VARCHAR(80),
	@Description VARCHAR(400),
	@State VARCHAR(15),
	@HaveSubType BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE AccidentType
	SET
		ParentKey		= @ParentKey
		,Name			= @Name
		,Description	= @Description
		,State			= @State
		,HaveSubType	= @HaveSubType

	WHERE AccidentTypeKey = @AccidentTypeKey;
END
GO

/******************************************************************************
**  Name: deleteAccidentType
**  Desc: Eliminar un Tipo de accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteAccidentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteAccidentType]
END
GO
CREATE PROCEDURE deleteAccidentType
(
	@AccidentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM AccidentType
	WHERE AccidentTypeKey  = @AccidentTypeKey ;
END
GO

/******************************************************************************
**  Name: InsertAfectedEmployee
**  Desc: Inserta un Empleado Afectado por un accidente
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertAfectedEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertAfectedEmployee]
END
GO
CREATE PROCEDURE InsertAfectedEmployee
(
	@AccidentKey INT,
	@EmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO AfectedEmployee(AccidentKey
						   ,EmployeeKey
						   )
	VALUES (@AccidentKey,
			@EmployeeKey
			);

	SELECT @@IDENTITY AS NewAfectedEmployeeKey;
END
GO

/******************************************************************************
**  Name: getAfectedEmployee
**  Desc: Obtener un Empleado Afectado
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAfectedEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAfectedEmployee]
END
GO

CREATE PROCEDURE GetAfectedEmployee
(
	@AfectedEmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 AfectedEmployeeKey
			,AccidentKey
			,EmployeeKey
    FROM AfectedEmployee
	WHERE AfectedEmployeeKey = @AfectedEmployeeKey;
END
GO

/******************************************************************************
**  Name: updateAfectedEmployee
**  Desc: Actualizar un Empleado Afectado
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAfectedEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateAfectedEmployee]
END
GO

CREATE PROCEDURE UpdateAfectedEmployee
(
	@AfectedEmployeeKey INT,
	@AccidentKey INT,
	@EmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE AfectedEmployee
	SET
		AccidentKey		= @AccidentKey
		,EmployeeKey	= @EmployeeKey

	WHERE AfectedEmployeeKey = @AfectedEmployeeKey;
END
GO

/******************************************************************************
**  Name: deleteAfectedEmployee
**  Desc: Eliminar un Empleado Afectado
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteAfectedEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteAfectedEmployee]
END
GO
CREATE PROCEDURE deleteAfectedEmployee
(
	@AfectedEmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM AfectedEmployee
	WHERE AfectedEmployeeKey  = @AfectedEmployeeKey ;
END
GO

/******************************************************************************
**  Name: InsertAttachment
**  Desc: Inserta un nuevo Attachment
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertAttachment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertAttachment]
END
GO
CREATE PROCEDURE InsertAttachment
(
	@Accidentkey INT,
	@Employeekey INT,
	@Namefile VARCHAR(200)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO attachment(accident_key
						   ,employee_key
						   ,name_file
						   )
	VALUES (@Accidentkey
			,@Employeekey
			,@Namefile
			);

	SELECT @@IDENTITY AS NewAttachmentKey;
END
GO

/******************************************************************************
**  Name: getAttachment
**  Desc: Obtener un Attachment
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAttachment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAttachment]
END
GO

CREATE PROCEDURE GetAttachment
(
	@AttachmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 attachment_key
			,accident_key
			,employee_key
			,name_file
    FROM attachment
	WHERE attachment_key = @AttachmentKey;
END
GO

/******************************************************************************
**  Name: updateAttachment
**  Desc: Actualizar un Attachment
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAttachment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateAttachment]
END
GO

CREATE PROCEDURE UpdateAttachment
(
	@AttachmentKey INT,
	@Accidentkey INT,
	@Employeekey INT,
	@Namefile VARCHAR(200)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Attachment
	SET
		accident_key		= @Accidentkey
		,employee_key		= @Employeekey
		,name_file			= @Namefile

	WHERE attachment_key  = @AttachmentKey ;
END
GO

/******************************************************************************
**  Name: deleteAttachment
**  Desc: Eliminar un Attachment
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteAttachment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteAttachment]
END
GO
CREATE PROCEDURE deleteAttachment
(
	@AttachmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Attachment
	WHERE attachment_key  = @AttachmentKey ;
END
GO

/******************************************************************************
**  Name: InsertContactInformation
**  Desc: Inserta un nuevo contacto de informacion
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertContactInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertContactInformation]
END
GO
CREATE PROCEDURE InsertContactInformation
(
	@TypeContactKey INT,
	@EmployeeKey INT,
	@Value VARCHAR(100),
	@Reference VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO ContactInformation(TypeContactKey
						   ,EmployeeKey
						   ,Value
						   ,Reference
						   )
	VALUES (@TypeContactKey
			,@EmployeeKey
			,@Value
			,@Reference
			);

	SELECT @@IDENTITY AS NewContactInformationKey;
END
GO

/******************************************************************************
**  Name: getContactInformation
**  Desc: Obtener un contacto de informacion
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetContactInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetContactInformation]
END
GO

CREATE PROCEDURE GetContactInformation
(
	@ContactInformationKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 ContactInformationKey
			,TypeContactKey
			,EmployeeKey
			,Value
			,Reference
    FROM ContactInformation
	WHERE ContactInformationKey = @ContactInformationKey;
END
GO

/******************************************************************************
**  Name: updateContactInformation
**  Desc: Actualizar un contacto de informacion
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateContactInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateContactInformation]
END
GO

CREATE PROCEDURE UpdateContactInformation
(
	@ContactInformationKey INT,
	@TypeContactKey INT,
	@EmployeeKey INT,
	@Value VARCHAR(100),
	@Reference VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE ContactInformation
	SET
		TypeContactKey	= @TypeContactKey
		,EmployeeKey	= @EmployeeKey
		,Value			= @Value
		,Reference		= @Reference

	WHERE ContactInformationKey = @ContactInformationKey;
END
GO

/******************************************************************************
**  Name: deleteContactInformation
**  Desc: Eliminar contacto de informacion
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteContactInformation]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteContactInformation]
END
GO
CREATE PROCEDURE deleteContactInformation
(
	@ContactInformationKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM ContactInformation
	WHERE ContactInformationKey  = @ContactInformationKey;
END
GO

/******************************************************************************
**  Name: InsertCorrectiveActionFile
**  Desc: Inserta un nuevo CorrectiveActionFile
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertCorrectiveActionFile]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertCorrectiveActionFile]
END
GO
CREATE PROCEDURE InsertCorrectiveActionFile
(
	@NameFile VARCHAR(200),
	@CorrectiveActionKey INT,
	@EmployeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO CorrectiveActionFile(NameFile
						   ,CorrectiveActionKey
						   ,EmployeKey
						   )
	VALUES (@NameFile
			,@CorrectiveActionKey
			,@EmployeKey
			);

	SELECT @@IDENTITY AS NewCorrectiveActionFileKey;
END
GO

/******************************************************************************
**  Name: getCorrectiveActionFile
**  Desc: Obtener un CorrectiveActionFile
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetCorrectiveActionFile]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetCorrectiveActionFile]
END
GO

CREATE PROCEDURE GetCorrectiveActionFile
(
	@CorrectiveActionFileKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 CorrectiveActionFileKey
			,NameFile
			,CorrectiveActionKey
			,EmployeKey
    FROM CorrectiveActionFile
	WHERE CorrectiveActionFileKey = @CorrectiveActionFileKey;
END
GO

/******************************************************************************
**  Name: updateCorrectiveActionFile
**  Desc: Actualizar un CorrectiveActionFile
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCorrectiveActionFile]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateCorrectiveActionFile]
END
GO

CREATE PROCEDURE UpdateCorrectiveActionFile
(
	@CorrectiveActionFileKey INT,
	@NameFile VARCHAR(200),
	@CorrectiveActionKey INT,
	@EmployeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE CorrectiveActionFile
	SET
		 NameFile			= @NameFile
		,CorrectiveActionKey= @CorrectiveActionKey
		,EmployeKey			= @EmployeKey

	WHERE CorrectiveActionFileKey = @CorrectiveActionFileKey;
END
GO

/******************************************************************************
**  Name: deleteCorrectiveActionFile
**  Desc: Eliminar un CorrectiveActionFile
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteCorrectiveActionFile]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteCorrectiveActionFile]
END
GO
CREATE PROCEDURE deleteCorrectiveActionFile
(
	@CorrectiveActionFileKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM CorrectiveActionFile
	WHERE CorrectiveActionFileKey  = @CorrectiveActionFileKey ;
END
GO

/******************************************************************************
**  Name: InsertCorrectiveActions
**  Desc: Inserta unA ACCION CORRECTIVA
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertCorrectiveActions]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertCorrectiveActions]
END
GO
CREATE PROCEDURE InsertCorrectiveActions
(
	@InvestigationKey INT,
	@Description VARCHAR(3000),
	@DateExecute DATETIME,
	@Status VARCHAR(50),
	@DateEnd DATETIME,
	@ResponsibleEmployeeKey INT,
	@Observation VARCHAR(5000),
	@EmpleadoKey INT,
	@StatusAccion INT,
	@ParentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO CorrectiveActions(InvestigationKey
						   ,Description
						   ,DateExecute
						   ,Status
						   ,DateEnd
						   ,ResponsibleEmployeeKey
						   ,Observation
						   ,EmpleadoKey
						   ,StatusAccion
						   ,ParentKey
						   )
	VALUES (@InvestigationKey
			,@Description
			,@DateExecute
			,@Status
			,@DateEnd
			,@ResponsibleEmployeeKey
			,@Observation
			,@EmpleadoKey
			,@StatusAccion
			,@ParentKey
			);

	SELECT @@IDENTITY AS NewCorrectiveActionKey;
END
GO

/******************************************************************************
**  Name: getCorrectiveActions
**  Desc: Obtener una accion correctiva
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetCorrectiveActions]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetCorrectiveActions]
END
GO

CREATE PROCEDURE GetCorrectiveActions
(
	@CorrectiveActionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 CorrectiveActionKey
			,InvestigationKey
			,Description
			,DateExecute
			,Status
			,DateEnd
			,ResponsibleEmployeeKey
			,Observation
			,EmpleadoKey
			,StatusAccion
			,ParentKey
    FROM CorrectiveActions
	WHERE CorrectiveActionKey = @CorrectiveActionKey;
END
GO

/******************************************************************************
**  Name: updateCorrectiveActions
**  Desc: Actualizar una accion correctiva
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCorrectiveActions]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateCorrectiveActions]
END
GO

CREATE PROCEDURE UpdateCorrectiveActions
(
	@CorrectiveActionKey int,
	@InvestigationKey INT,
	@Description VARCHAR(3000),
	@DateExecute DATETIME,
	@Status VARCHAR(50),
	@DateEnd DATETIME,
	@ResponsibleEmployeeKey INT,
	@Observation VARCHAR(5000),
	@EmpleadoKey INT,
	@StatusAccion INT,
	@ParentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE CorrectiveActions
	SET
		InvestigationKey		= @InvestigationKey
		,Description			= @Description
		,DateExecute			= @DateExecute
		,Status					= @Status
		,DateEnd				= @DateEnd
		,ResponsibleEmployeeKey	= @ResponsibleEmployeeKey
		,Observation			= @Observation
		,EmpleadoKey			= @EmpleadoKey
		,StatusAccion			= @StatusAccion
		,ParentKey				= @ParentKey

	WHERE CorrectiveActionKey = @CorrectiveActionKey;
END
GO

/******************************************************************************
**  Name: deleteCorrectiveActions
**  Desc: Eliminar una accion correctiva
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteCorrectiveActions]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteCorrectiveActions]
END
GO
CREATE PROCEDURE deleteCorrectiveActions
(
	@CorrectiveActionsKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM CorrectiveActions
	WHERE CorrectiveActionKey  = @CorrectiveActionsKey ;
END
GO

/******************************************************************************
**  Name: InsertCountry
**  Desc: Inserta un nuevo Pais
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertCountry]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertCountry]
END
GO
CREATE PROCEDURE InsertCountry
(
	@Code VARCHAR(3),
	@Name VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Country(Code
						   ,Name
						   )
	VALUES (@Code
			,@Name
			);

	SELECT @@IDENTITY AS NewCountryKey;
END
GO

/******************************************************************************
**  Name: getCountry
**  Desc: Obtener un Pais
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetCountry]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetCountry]
END
GO

CREATE PROCEDURE GetCountry
(
	@CountryKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 CountryKey
			,Code
			,Name
    FROM Country
	WHERE CountryKey = @CountryKey;
END
GO

/******************************************************************************
**  Name: updateCountry
**  Desc: Actualizar un Pais
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCountry]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateCountry]
END
GO

CREATE PROCEDURE UpdateCountry
(
	@CountryKey int,
	@Code VARCHAR(3),
	@Name VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Country
	SET
		 Code		= @Code
		,Name		= @Name

	WHERE CountryKey = @CountryKey;
END
GO

/******************************************************************************
**  Name: deleteCountry
**  Desc: Eliminar un Pais
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteCountry]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteCountry]
END
GO
CREATE PROCEDURE deleteCountry
(
	@CountryKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Country
	WHERE CountryKey  = @CountryKey ;
END
GO

/******************************************************************************
**  Name: InsertCurrency
**  Desc: Inserta una nueva moneda
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertCurrency]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertCurrency]
END
GO
CREATE PROCEDURE InsertCurrency
(
	@CountryKey INT,
	@Name VARCHAR(50),
	@Code VARCHAR(50),
	@Status VARCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Currency(CountryKey
						   ,Name
						   ,Code
						   ,Status
						   )
	VALUES (@CountryKey
			,@Name
			,@Code
			,@Status
			);

	SELECT @@IDENTITY AS NewCurrencyKey;
END
GO

/******************************************************************************
**  Name: getCurrency
**  Desc: Obtener una moneda
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetCurrency]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetCurrency]
END
GO

CREATE PROCEDURE GetCurrency
(
	@CurrencyKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 CurrencyKey
			,CountryKey
			,Name
			,Code
			,Status
    FROM Currency
	WHERE CurrencyKey = @CurrencyKey;
END
GO

/******************************************************************************
**  Name: updateCurrency
**  Desc: Actualizar moneda
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCurrency]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateCurrency]
END
GO

CREATE PROCEDURE UpdateCurrency
(
	@CurrencyKey INT,
	@CountryKey INT,
	@Name VARCHAR(50),
	@Code VARCHAR(50),
	@Status VARCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Currency
	SET
		 CountryKey		= @CountryKey
		,Name			= @Name
		,Code			= @Code
		,Status			= @Status

	WHERE CurrencyKey = @CurrencyKey;
END
GO

/******************************************************************************
**  Name: deleteCurrency
**  Desc: Eliminar moneda
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteCurrency]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteCurrency]
END
GO
CREATE PROCEDURE deleteCurrency
(
	@CurrencyKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Currency
	WHERE CurrencyKey  = @CurrencyKey ;
END
GO

/******************************************************************************
**  Name: InsertDocumentType
**  Desc: Inserta un nuevo tipo de documento
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertDocumentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertDocumentType]
END
GO
CREATE PROCEDURE InsertDocumentType
(
	@Name VARCHAR(50),
	@Status varCHAR(1),
	@Repeat VARCHAR(2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO DocumentType(Name
						   ,Status
						   ,Repeat
						   )
	VALUES (@Name
			,@Status
			,@Repeat
			);

	SELECT @@IDENTITY AS NewDocumentTypeKey;
END
GO

/******************************************************************************
**  Name: getDocumentType
**  Desc: Obtener un tipo de documento
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetDocumentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetDocumentType]
END
GO

CREATE PROCEDURE GetDocumentType
(
	@DocumentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 DocumentTypeKey
			,Name
			,Status
			,Repeat
    FROM DocumentType
	WHERE DocumentTypeKey = @DocumentTypeKey;
END
GO

/******************************************************************************
**  Name: updateDocumentType
**  Desc: Actualizar un tipo de documento
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateDocumentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateDocumentType]
END
GO

CREATE PROCEDURE UpdateDocumentType
(
	@DocumentTypeKey int,
	@Name VARCHAR(50),
	@Status varCHAR(1),
	@Repeat VARCHAR(2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE DocumentType
	SET
		 Name			= @Name
		,Status			= @Status
		,Repeat			= @Repeat

	WHERE DocumentTypeKey = @DocumentTypeKey;
END
GO

/******************************************************************************
**  Name: deleteDocumentType
**  Desc: Eliminar un tipo de documento
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteDocumentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteDocumentType]
END
GO
CREATE PROCEDURE deleteDocumentType
(
	@DocumentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM DocumentType
	WHERE DocumentTypeKey  = @DocumentTypeKey ;
END
GO

/******************************************************************************
**  Name: InsertEmployee
**  Desc: Inserta un nuevo Empleado
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEmployee]
END
GO
CREATE PROCEDURE InsertEmployee
(
	@FirstName VARCHAR(150),
	@LastName VARCHAR(40),
	@BirthDate DATETIME,
	@EmployeeCode VARCHAR(15),
	@Gender VARCHAR(2),
	@Nationality VARCHAR(50),
	@AdmissionDate DATETIME,
	@Status CHAR(1),
	@Photo VARCHAR(50),
	@OrganizationKey INT,
	@RegistrationDate DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	IF((SELECT COUNT(*)
		FROM dbo.Employee
		WHERE UPPER(EmployeeCode)=UPPER(@EmployeeCode))=0)
	BEGIN
		INSERT INTO Employee(FirstName
							   ,LastName
							   ,BirthDate
							   ,EmployeeCode
							   ,Gender
							   ,Nationality
							   ,AdmissionDate
							   ,Status
							   ,Photo
							   ,OrganizationKey
							   ,RegistrationDate
							   )
		VALUES (@FirstName
				,@LastName
				,@BirthDate
				,@EmployeeCode
				,@Gender
				,@Nationality
				,@AdmissionDate
				,@Status
				,@Photo
				,@OrganizationKey
				,@RegistrationDate
				);

		SELECT 1 AS code, @@IDENTITY AS NewEmployeeKey, '' AS messaje;
	END
	ELSE
	BEGIN
		SELECT -1 AS code, 0 AS NewEmployeeKey, 'El codigo de empleado '+@EmployeeCode+' ya se encuentra asignado a otro empleado' AS messaje;
	END
END
GO

/******************************************************************************
**  Name: getEmployee
**  Desc: Obtener un Empleado
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEmployee]
END
GO

CREATE PROCEDURE GetEmployee
(
	@EmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT EmployeeKey
			,OrganizationKey
			,EmployeeCode
			,FirstName
			,LastName
			,BirthDate
			,Gender
			,Nationality
			,AdmissionDate
			,Status
			,Photo
			,RegistrationDate
    FROM Employee
	WHERE EmployeeKey = @EmployeeKey;
END
GO

/******************************************************************************
**  Name: updateEmployee
**  Desc: Actualizar un Empleado
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEmployee]
END
GO

CREATE PROCEDURE UpdateEmployee
(
	@EmployeeKey int,
	@FirstName VARCHAR(150),
	@LastName VARCHAR(40),
	@BirthDate DATETIME,
	@EmployeeCode VARCHAR(15),
	@Gender VARCHAR(2),
	@Nationality VARCHAR(50),
	@AdmissionDate DATETIME,
	@Status CHAR(1),
	@Photo VARCHAR(50),
	@OrganizationKey INT,
	@RegistrationDate DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Employee
	SET
		FirstName		= @FirstName
		,LastName		= @LastName
		,BirthDate		= @BirthDate
		,EmployeeCode	= @EmployeeCode
		,Gender			= @Gender
		,Nationality	= @Nationality
		,AdmissionDate	= @AdmissionDate
		,Status			= @Status
		,Photo			= @Photo
		,OrganizationKey= @OrganizationKey
		,RegistrationDate=@RegistrationDate

	WHERE EmployeeKey = @EmployeeKey;

	SELECT @EmployeeKey AS EmployeeKey;
END
GO

/******************************************************************************
**  Name: deleteEmployee
**  Desc: Eliminar un Empleado
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEmployee]
END
GO
CREATE PROCEDURE deleteEmployee
(
	@EmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Employee
	WHERE EmployeeKey  = @EmployeeKey ;

	SELECT @EmployeeKey AS EmployeeKey;
END
GO

/******************************************************************************
**  Name: getAllEmployee
**  Desc: Get all employee
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllEmployee]
END
GO

CREATE PROCEDURE getAllEmployee
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	EmployeeKey
			,OrganizationKey
			,EmployeeCode
			,FirstName
			,LastName
			,BirthDate
			,Gender
			,Nationality
			,AdmissionDate
			,Status
			,Photo
			,RegistrationDate
    FROM Employee;
END
GO

/******************************************************************************
**  Name: InsertEquipment
**  Desc: Inserta un nuevo Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipment]
END
GO

CREATE PROCEDURE InsertEquipment
(
	@Name VARCHAR(150),
	@Code VARCHAR(50),
	@Description VARCHAR(500),
	@Status VARCHAR(50),
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Equipment(Name
						   ,Code
						   ,Description
						   ,Status
						   ,EquipmentTypeKey
						   )
	VALUES (@Name
			,@Code
			,@Description
			,@Status
			,@EquipmentTypeKey
			);
  SELECT 1 code,@@IDENTITY AS NewEquipmentKey, '';
END
GO

/******************************************************************************
**  Name: getEquipment
**  Desc: Obtener un Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipment]
END
GO

CREATE PROCEDURE GetEquipment
(
	@EquipmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentKey
			,Name
			,Code
			,Description
			,Status
			,EquipmentTypeKey
    FROM Equipment
	WHERE EquipmentKey = @EquipmentKey;
END
GO

/******************************************************************************
**  Name: getAllEquipment
**  Desc: Obtener todos los Equipos
**  Author: Nataly HUanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllEquipment]
END
GO

CREATE PROCEDURE getAllEquipment
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentKey
			,Name
			,Code
			,Description
			,Status
			,EquipmentTypeKey
    FROM Equipment
END
GO

/******************************************************************************
**  Name: updateEquipment
**  Desc: Actualizar un Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipment]
END
GO

CREATE PROCEDURE UpdateEquipment
(
	@EquipmentKey int,
	@Name VARCHAR(150),
	@Code VARCHAR(50),
	@Description VARCHAR(500),
	@Status VARCHAR(50),
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Equipment
	SET
		 Name			= @Name
		,Code			= @Code
		,Description	= @Description
		,Status			= @Status
		,EquipmentTypeKey	= @EquipmentTypeKey

	WHERE EquipmentKey = @EquipmentKey;
	SELECT 1 code,0 AS NewEquipmentKey, '';
END
GO

/******************************************************************************
**  Name: deleteEquipment
**  Desc: Eliminar un Equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipment]
END
GO

CREATE PROCEDURE deleteEquipment
(
	@EquipmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Equipment
	WHERE EquipmentKey  = @EquipmentKey ;
	SELECT 1 code,0 AS NewEquipmentKey, '';
END
GO

/******************************************************************************
**  Name: SPA_GetAllEquipments
**  Desc: Procedimiento almacenado para el Areas en la empresa.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 08/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 08/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetAllEquipments]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetAllEquipments]
END
GO

CREATE PROCEDURE SPA_GetAllEquipments
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentKey
			,Name
			,Code
			,Description
			,Status
			,EquipmentTypeKey
    FROM Equipment
END
GO

/******************************************************************************
**  Name: InsertEquipmentAssignment
**  Desc: Inserta una nueva asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipmentAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipmentAssignment]
END
GO
CREATE PROCEDURE InsertEquipmentAssignment
(
	@EquipmentKey INT,
	@UserKey INT,
	@EmployeeKey INT,
	@Date DATE,
	@DateRegistration DATETIME,
	@Status VARCHAR(50),
	@Observations VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO EquipmentAssignment(EquipmentKey
						   ,UserKey
						   ,EmployeeKey
						   ,Date
						   ,DateRegistration
						   ,Status
						   ,Observations
						   )
	VALUES (@EquipmentKey
			,@UserKey
			,@EmployeeKey
			,@Date
			,@DateRegistration
			,@Status
			,@Observations
			);

	SELECT 1 code,@@IDENTITY AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: getEquipmentAssignment
**  Desc: Obtener una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipmentAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipmentAssignment]
END
GO

CREATE PROCEDURE GetEquipmentAssignment
(
	@EquipmentAssignmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentAssignmentKey
			,EquipmentKey
			,UserKey
			,EmployeeKey
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentAssignment
	WHERE EquipmentAssignmentKey = @EquipmentAssignmentKey;
END
GO

/******************************************************************************
**  Name: updateEquipmentAssignment
**  Desc: Actualizar una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipmentAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipmentAssignment]
END
GO

CREATE PROCEDURE UpdateEquipmentAssignment
(
	@EquipmentAssignmentKey INT,
	@EquipmentKey INT,
	@UserKey INT,
	@EmployeeKey INT,
	@Date DATE,
	@DateRegistration DATETIME,
	@Status VARCHAR(50),
	@Observations VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE EquipmentAssignment
	SET
		 EquipmentKey		= @EquipmentKey
		,UserKey			= @UserKey
		,EmployeeKey		= @EmployeeKey
		,Date				= @Date
		,DateRegistration	= @DateRegistration
		,Status				= @Status
		,Observations		= @Observations

	WHERE EquipmentAssignmentKey = @EquipmentAssignmentKey;
END
GO

/******************************************************************************
**  Name: deleteEquipmentAssignment
**  Desc: Eliminar una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipmentAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipmentAssignment]
END
GO
CREATE PROCEDURE deleteEquipmentAssignment
(
	@EquipmentAssignmentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM EquipmentAssignment
	WHERE EquipmentAssignmentKey  = @EquipmentAssignmentKey ;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: getEquipmentAssignmentByEmployee
**  Desc: Obtener una asignacion de equipo en base a un empleado
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getEquipmentAssignmentByEmployee]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getEquipmentAssignmentByEmployee]
END
GO

CREATE PROCEDURE getEquipmentAssignmentByEmployee
(
	@EmployeeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentAssignmentKey
			,EquipmentKey
			,UserKey
			,EmployeeKey
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentAssignment
	WHERE EmployeeKey = @EmployeeKey;
END
GO


/******************************************************************************
**  Name: getEquipmentAssignment
**  Desc: Obtener una asignacion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllEquipmentAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllEquipmentAssignment]
END
GO

CREATE PROCEDURE getAllEquipmentAssignment
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentAssignmentKey
			,EquipmentKey
			,UserKey
			,EmployeeKey
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentAssignment;
END
GO

/******************************************************************************
**  Name: InsertEquipmentReturn
**  Desc: Registra una devolucion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipmentReturn]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipmentReturn]
END
GO
CREATE PROCEDURE InsertEquipmentReturn
(
	@EquipmentKey INT,
	@UserKey INT,
	@EmployeeKey INT,
	@Date DATE,
	@DateRegistration DATETIME,
	@Status VARCHAR(50),
	@Observations VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO EquipmentReturn(EquipmentKey
						   ,UserKey
						   ,EmployeeKey
						   ,Date
						   ,DateRegistration
						   ,Status
						   ,Observations
						   )
	VALUES (@EquipmentKey
			,@UserKey
			,@EmployeeKey
			,@Date
			,@DateRegistration
			,@Status
			,@Observations
			);

	SELECT @@IDENTITY AS NewEquipmentReturnKey;
END
GO

/******************************************************************************
**  Name: getEquipmentReturn
**  Desc: Obtener una devolucion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipmentReturn]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipmentReturn]
END
GO

CREATE PROCEDURE GetEquipmentReturn
(
	@EquipmentReturnKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentReturnKey
			,EquipmentKey
			,UserKey
			,EmployeeKey
			,Date
			,DateRegistration
			,Status
			,Observations
    FROM EquipmentReturn
	WHERE EquipmentReturnKey = @EquipmentReturnKey;
END
GO

/******************************************************************************
**  Name: updateEquipmentReturn
**  Desc: Actualizar devolucion de equipo
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipmentReturn]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipmentReturn]
END
GO

CREATE PROCEDURE UpdateEquipmentReturn
(
	@EquipmentReturnKey INT,
	@EquipmentKey INT,
	@UserKey INT,
	@EmployeeKey INT,
	@Date DATE,
	@DateRegistration DATETIME,
	@Status VARCHAR(50),
	@Observations VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE EquipmentReturn
	SET
		 EquipmentKey		= @EquipmentKey
		,UserKey			= @UserKey
		,EmployeeKey		= @EmployeeKey
		,Date				= @Date
		,DateRegistration	= @DateRegistration
		,Status				= @Status
		,Observations		= @Observations

	WHERE EquipmentReturnKey = @EquipmentReturnKey;
END
GO

/******************************************************************************
**  Name: deleteEquipmentReturn
**  Desc: Eliminar una devolucion de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipmentReturn]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipmentReturn]
END
GO
CREATE PROCEDURE deleteEquipmentReturn
(
	@EquipmentReturnKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM EquipmentReturn
	WHERE EquipmentReturnKey  = @EquipmentReturnKey ;
END
GO

/******************************************************************************
**  Name: InsertEquipmentType
**  Desc: Inserta un nuevo tipo de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertEquipmentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEquipmentType]
END
GO
CREATE PROCEDURE InsertEquipmentType
(
	@Name VARCHAR(50),
	@Description VARCHAR(150)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO EquipmentType(Name
						   ,Description
						   )
	VALUES (@Name
			,@Description
			);

	SELECT 1 code,@@IDENTITY AS NewEquipmentTypeKey, '';
END
GO

/******************************************************************************
**  Name: getEquipmentType
**  Desc: Obtener un tipo de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipmentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEquipmentType]
END
GO

CREATE PROCEDURE GetEquipmentType
(
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 EquipmentTypeKey
			,Name
			,Description

    FROM EquipmentType
	WHERE EquipmentTypeKey = @EquipmentTypeKey;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: updateEquipmentType
**  Desc: Actualizar tipo de equipo
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipmentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipmentType]
END
GO

CREATE PROCEDURE UpdateEquipmentType
(
	@EquipmentTypeKey int,
	@Name VARCHAR(50),
	@Description VARCHAR(150)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE EquipmentType
	SET
		 Name		= @Name
		,Description		= @Description

	WHERE EquipmentTypeKey = @EquipmentTypeKey;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: deleteEquipmentType
**  Desc: Eliminar un tipo de equipo
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteEquipmentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteEquipmentType]
END
GO
CREATE PROCEDURE deleteEquipmentType
(
	@EquipmentTypeKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM EquipmentType
	WHERE EquipmentTypeKey  = @EquipmentTypeKey ;
	SELECT 1 code,0 AS NewEquipmentAssignmentKey, '';
END
GO

/******************************************************************************
**  Name: SPA_GetEquipmentsType
**  Desc: Procedimiento almacenado que devuelve los tipos de equipos.
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
** 07/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetEquipmentsType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetEquipmentsType]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetEquipmentsType
AS
BEGIN
	SET NOCOUNT ON;

    SELECT	 EquipmentTypeKey
			,Name
			,Description
    FROM EquipmentType
END
GO

/******************************************************************************
**  Name: InsertFinalRiskLevel
**  Desc: Inserta un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertFinalRiskLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertFinalRiskLevel]
END
GO
CREATE PROCEDURE InsertFinalRiskLevel
(
	@RiskValueKey INT,
	@AccidentKey INT,
	@State VARCHAR(15),
	@DateRegister DATETIME

)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO FinalRiskLevel(RiskValueKey
						   ,AccidentKey
						   ,State
						   ,DateRegister
						   )
	VALUES (@RiskValueKey
			,@AccidentKey
			,@State
			,@DateRegister
			);

	SELECT @@IDENTITY AS NewFinalRiskLevelKey;
END
GO

/******************************************************************************
**  Name: getFinalRiskLevel
**  Desc: Obtener un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetFinalRiskLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetFinalRiskLevel]
END
GO

CREATE PROCEDURE GetFinalRiskLevel
(
	@FinalRiskLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 FinalRiskLevelKey
			,RiskValueKey
			,AccidentKey
			,State
			,DateRegister
    FROM FinalRiskLevel
	WHERE FinalRiskLevelKey = @FinalRiskLevelKey;
END
GO

/******************************************************************************
**  Name: updateFinalRiskLevel
**  Desc: Actualizar un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateFinalRiskLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateFinalRiskLevel]
END
GO

CREATE PROCEDURE UpdateFinalRiskLevel
(
	@FinalRiskLevelKey INT,
	@RiskValueKey INT,
	@AccidentKey INT,
	@State VARCHAR(15),
	@DateRegister DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE FinalRiskLevel
	SET
		 RiskValueKey		= @RiskValueKey
		,AccidentKey		= @AccidentKey
		,State				= @State
		,DateRegister		= @DateRegister

	WHERE FinalRiskLevelKey = @FinalRiskLevelKey;
END
GO

/******************************************************************************
**  Name: deleteFinalRiskLevel
**  Desc: Eliminar un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteFinalRiskLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteFinalRiskLevel]
END
GO
CREATE PROCEDURE deleteFinalRiskLevel
(
	@FinalRiskLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM FinalRiskLevel
	WHERE FinalRiskLevelKey  = @FinalRiskLevelKey ;
END
GO

/******************************************************************************
**  Name: InsertHierarchicalLevel
**  Desc: Inserta un nuevo Nivel jerarquico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertHierarchicalLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertHierarchicalLevel]
END
GO
CREATE PROCEDURE InsertHierarchicalLevel
(
	@Name VARCHAR(150),
	@Level VARCHAR(2),
	@Status varCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO HierarchicalLevel(Name
						   ,Level
						   ,Status
						   )
	VALUES (@Name
			,@Level
			,@Status
			);

	SELECT @@IDENTITY AS NewHierarchicalLevelKey;
END
GO

/******************************************************************************
**  Name: getHierarchicalLevel
**  Desc: Obtener un nivel jerarquico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetHierarchicalLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetHierarchicalLevel]
END
GO

CREATE PROCEDURE GetHierarchicalLevel
(
	@HierarchicalLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 HierarchicalLevelKey
			,Name
			,Level
			,Status
    FROM HierarchicalLevel
	WHERE HierarchicalLevelKey = @HierarchicalLevelKey;
END
GO

/******************************************************************************
**  Name: updateHierarchicalLevel
**  Desc: Actualizar nivel jerarquico
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateHierarchicalLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateHierarchicalLevel]
END
GO

CREATE PROCEDURE UpdateHierarchicalLevel
(
	@HierarchicalLevelKey INT,
	@Name VARCHAR(150),
	@Level VARCHAR(2),
	@Status varCHAR(1)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE HierarchicalLevel
	SET
		 Name		= @Name
		,Level		= @Level
		,Status		= @Status

	WHERE HierarchicalLevelKey = @HierarchicalLevelKey;
END
GO

/******************************************************************************
**  Name: deleteHierarchicalLevel
**  Desc: Eliminar un nivel jerarquico
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteHierarchicalLevel]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteHierarchicalLevel]
END
GO
CREATE PROCEDURE deleteHierarchicalLevel
(
	@HierarchicalLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM HierarchicalLevel
	WHERE HierarchicalLevelKey  = @HierarchicalLevelKey ;
END
GO

/******************************************************************************
**  Name: Institution
**  Desc: Insert new Institution
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertInstitution]
END
GO

CREATE PROCEDURE InsertInstitution
(
	@Name VARCHAR(50),
	@Type VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Institution(Name
		   ,[Type]
		   )
	VALUES (@Name
		,@Type
		);
	SELECT @@IDENTITY AS NewInstitutionKey;
END
GO

/******************************************************************************
**  Name: getInstitution
**  Desc: GetInstitution by Id
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getInstitution]
END
GO
  CREATE PROCEDURE getInstitution
  (
    @InstitutionKey INT
  )
  AS
  SET XACT_ABORT ON;
  SET NOCOUNT ON;
  BEGIN
    SELECT InstitutionKey
        ,Name
        ,[Type]
      FROM Institution
    WHERE InstitutionKey = @InstitutionKey;
  END
GO

/******************************************************************************
**  Name: updateInstitution
**  Desc: Update institution data
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateInstitution]
END
GO

CREATE PROCEDURE UpdateInstitution
(
	@InstitutionKey int,
	@Name VARCHAR(50),
	@Type VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Institution
	SET
		Name		= @Name
		,[Type]		= @Type
	WHERE InstitutionKey = @InstitutionKey;
END
GO


/******************************************************************************
**  Name: deleteInstitution
**  Desc: Delete an institution
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteInstitution]
END
GO

CREATE PROCEDURE deleteInstitution
(
	@InstitutionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Institution
	WHERE InstitutionKey  = @InstitutionKey;
END
GO

/******************************************************************************
**  Name: InsertRootCause
**  Desc: Insert a Root Cause
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertRootCause]
END
GO
CREATE PROCEDURE InsertRootCause
(
	@Description VARCHAR(5000),
	@Details VARCHAR(2000),
	@status VARCHAR(2),
	@code VARCHAR(8)

)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO RootCause([Description]
						   ,Details
						   ,[status]
						   ,code
						   )
	VALUES (@Description
      ,@Details
			,@status
			,@code
			);

	SELECT @@IDENTITY AS NewRootCause;
END
GO

/******************************************************************************
**  Name: getRootCause
**  Desc: Get root cause
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getRootCause]
END
GO

CREATE PROCEDURE getRootCause
(
	@RootCauseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT RootCauseKey
			,[Description]
			,Details
			,[status]
			,code
    FROM RootCause
	WHERE RootCauseKey = @RootCauseKey;
END
GO

/******************************************************************************
**  Name: updateRootCause
**  Desc: Update Root Cause
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateRootCause]
END
GO

CREATE PROCEDURE updateRootCause
(
	@RootCauseKey INT,
	@Description VARCHAR(5000),
	@Details VARCHAR(2000),
	@status VARCHAR(2),
	@code VARCHAR(8)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE RootCause
	SET
		[Description]		= @Description
		,Details				= @Details
		,[status]		= @status
    ,code = @code

	WHERE RootCauseKey = @RootCauseKey;
END
GO

/******************************************************************************
**  Name: deleteRootCause
**  Desc: Delete Root Cause
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteRootCause]
END
GO
CREATE PROCEDURE deleteRootCause
(
	@RootCauseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM RootCause
	WHERE RootCauseKey  = @RootCauseKey ;
END
GO

/******************************************************************************
**  Name: InsertSalaryScale
**  Desc: Insert a Salary Scale
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertSalaryScale]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertSalaryScale]
END
GO
CREATE PROCEDURE InsertSalaryScale
(
	@CurrencyKey INT,
	@Name VARCHAR(150),
	@NumberCases INT,
	@BasicSalary DECIMAL(10, 2),
  @Status VARCHAR(1),
  @Start VARCHAR(25),
  @End VARCHAR(25)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO SalaryScale([CurrencyKey],
  Name, NumberCases, BasicSalary, [Status],
  [Start], [End])
	VALUES (@CurrencyKey
      ,@Name
			,@NumberCases
			,@BasicSalary
      ,@Status
      ,@Start
      ,@End
			);

	SELECT @@IDENTITY AS NewSalaryScale;
END
GO

/******************************************************************************
**  Name: getSalaryScale
**  Desc: Get Salary Scale
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getSalaryScale]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getSalaryScale]
END
GO

CREATE PROCEDURE getSalaryScale
(
	@SalaryScaleKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [CurrencyKey],
  Name,
  NumberCases,
  BasicSalary,
  [Status],
  [Start],
  [End]
    FROM SalaryScale
	WHERE SalaryScaleKey = @SalaryScaleKey;
END
GO

/******************************************************************************
**  Name: updateSalaryScale
**  Desc: Update Salary Scale
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateSalaryScale]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateSalaryScale]
END
GO

CREATE PROCEDURE updateSalaryScale
(
	@SalaryScaleKey INT,
	@CurrencyKey INT,
	@Name VARCHAR(150),
	@NumberCases INT,
	@BasicSalary DECIMAL(10, 2),
  @Status VARCHAR(1),
  @Start VARCHAR(25),
  @End VARCHAR(25)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE SalaryScale
	SET
		[CurrencyKey]		= @CurrencyKey
		,Name	= @Name
		,[NumberCases]		= @NumberCases
    ,BasicSalary = @BasicSalary
    ,[Status] = @Status
    ,[Start] = @Start
    ,[End] = @End
	WHERE SalaryScaleKey = @SalaryScaleKey;
END
GO

/******************************************************************************
**  Name: deleteSalaryScale
**  Desc: Delete Salary Scale
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteSalaryScale]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteSalaryScale]
END
GO
CREATE PROCEDURE deleteSalaryScale
(
	@SalaryScaleKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM SalaryScale
	WHERE SalaryScaleKey  = @SalaryScaleKey ;
END
GO

/******************************************************************************
**  Name: InsertSeverity
**  Desc: Insert a Severity
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertSeverity]
END
GO
CREATE PROCEDURE InsertSeverity
(
	@Name VARCHAR(50),
	@Personnel VARCHAR(128),
	@Enviroment VARCHAR(128),
  @Material INT,
  @Mission VARCHAR(512),
  @Code VARCHAR(1),
  @indicatorBaseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO Severity(Name, Personnel, Enviroment,
  Material, Mission, Code, indicatorBaseKey)
	VALUES (@Name
      ,@Personnel
			,@Enviroment
			,@Material
      ,@Mission
      ,@Code
      ,@indicatorBaseKey
			);

	SELECT @@IDENTITY AS NewSeverity;
END
GO

/******************************************************************************
**  Name: getSeverity
**  Desc: Get Severity
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getSeverity]
END
GO

CREATE PROCEDURE getSeverity
(
	@SeverityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SeverityKey],
  Name,
  Personnel,
  Enviroment,
  [Material],
  [Mission],
  [Code],
  indicatorBaseKey
    FROM Severity
	WHERE SeverityKey = @SeverityKey;
END
GO

/******************************************************************************
**  Name: updateSeverity
**  Desc: Update Severity
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateSeverity]
END
GO

CREATE PROCEDURE updateSeverity
(
	@SeverityKey INT,
	@Name VARCHAR(50),
	@Personnel VARCHAR(128),
	@Enviroment VARCHAR(128),
  @Material INT,
  @Mission VARCHAR(512),
  @Code VARCHAR(1),
  @indicatorBaseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Severity
	SET
		[Name]		= @Name
		,Personnel	= @Personnel
		,[Enviroment]		= @Enviroment
    ,Material = @Material
    ,[Mission] = @Mission
    ,[Code] = @Code
    ,[indicatorBaseKey] = @indicatorBaseKey
	WHERE SeverityKey = @SeverityKey;
END
GO

/******************************************************************************
**  Name: deleteSeverity
**  Desc: Delete Severity
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteSeverity]
END
GO
CREATE PROCEDURE deleteSeverity
(
	@SeverityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Severity
	WHERE SeverityKey  = @SeverityKey ;
END
GO

/******************************************************************************
**  Name: InsertSkill
**  Desc: Insert a Skill
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertSkill]
END
GO
CREATE PROCEDURE InsertSkill
(
	@Description VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO Skill([Description])
	VALUES (@Description
			);

	SELECT @@IDENTITY AS NewSkill;
END
GO

/******************************************************************************
**  Name: getSkill
**  Desc: Get Skill
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getSkill]
END
GO

CREATE PROCEDURE getSkill
(
	@SkillKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SkillKey],
  [Description]
    FROM Skill
	WHERE SkillKey = @SkillKey;
END
GO

/******************************************************************************
**  Name: updateSkill
**  Desc: Update Skill
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateSkill]
END
GO

CREATE PROCEDURE updateSkill
(
	@SkillKey INT,
	@Description VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Skill
	SET
		[Description]		= @Description
	WHERE SkillKey = @SkillKey;
END
GO

/******************************************************************************
**  Name: deleteSkill
**  Desc: Delete Skill
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteSkill]
END
GO
CREATE PROCEDURE deleteSkill
(
	@SkillKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Skill
	WHERE SkillKey  = @SkillKey ;
END
GO

/******************************************************************************
**  Name: InsertSkillsPosition
**  Desc: Insert a SkillsPosition
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertSkillsPosition]
END
GO
CREATE PROCEDURE InsertSkillsPosition
(
	@PositionKey INT,
	@SkillKey INT,
	@Level VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO SkillsPosition(PositionKey, SkillKey, [Level])
	VALUES (@PositionKey
      ,@SkillKey
			,@Level
			);

	SELECT @@IDENTITY AS NewSkillsPosition;
END
GO

/******************************************************************************
**  Name: getSkillsPosition
**  Desc: Get SkillsPosition
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getSkillsPosition]
END
GO

CREATE PROCEDURE getSkillsPosition
(
	@SkillsPositionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SkillPositionKey],
  PositionKey,
  SkillKey,
  [Level]
    FROM SkillsPosition
	WHERE SkillPositionKey = @SkillsPositionKey;
END
GO

/******************************************************************************
**  Name: updateSkillsPosition
**  Desc: Update SkillsPosition
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateSkillsPosition]
END
GO

CREATE PROCEDURE updateSkillsPosition
(
	@SkillsPositionKey INT,
	@PositionKey INT,
	@SkillKey INT,
	@Level VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE SkillsPosition
	SET
		[PositionKey]		= @PositionKey
		,SkillKey	= @SkillKey
		,[Level]		= @Level
	WHERE SkillPositionKey = @SkillsPositionKey;
END
GO

/******************************************************************************
**  Name: deleteSkillsPosition
**  Desc: Delete SkillsPosition
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteSkillsPosition]
END
GO
CREATE PROCEDURE deleteSkillsPosition
(
	@SkillsPositionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM SkillsPosition
	WHERE SkillPositionKey  = @SkillsPositionKey ;
END
GO

USE SysSecurity
GO

/******************************************************************************
**  Name: Get List of Cities by Country
**  Desc: List of cities by country id
**  Author: Nataly Huanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getCitiesByCountryId]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getCitiesByCountryId]
END
GO

CREATE PROCEDURE getCitiesByCountryId
  (
    @CountryKey INT
  )
  AS
  SET XACT_ABORT ON;
  SET NOCOUNT ON;
  BEGIN
    SELECT CityKey
        ,CountryKey
        ,Name
        ,Code
      FROM City
    WHERE CountryKey = @CountryKey;
  END
  GO

/******************************************************************************
**  Name: SPA_InsertCity
**  Desc: Procedimiento almacenado para la creacion de ciudades.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertCity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertCity]
END
GO

CREATE PROCEDURE SPA_InsertCity
(
	@code varchar(3),
	@name varchar(50),
	@countryKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Country WHERE CountryKey  = @countryKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.City WHERE UPPER([Name])=UPPER(@name)) = 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.City WHERE UPPER([Code])=UPPER(@code)) = 0)
			BEGIN
				INSERT INTO [dbo].[City]
						([Code]
						,[Name]
						,[CountryKey])
				VALUES (@code
						,@name
						,@countryKey
						);
				SELECT 1 AS Code, @@IDENTITY AS Row_Key, '' AS [Message];
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a City with the code '+ @code+ '.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a City with the name '+ @name+ '.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, 0 AS Row_Key, 'The Country Leven whith key '+CAST(@countryKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GettCity
**  Desc: Procedimiento almacenado que devuelve el detalle de una ciudad.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetCity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetCity]
END
GO

CREATE PROCEDURE SPA_GetCity
(
	@CityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT CityKey
		   ,[Code]
			,[Name]
			,[CountryKey]
	FROM [dbo].[City]
	WHERE CityKey = @CityKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateCity
**  Desc: Procedimiento almacenado para la actualizacion de un area
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateCity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateCity]
END
GO

CREATE PROCEDURE SPA_UpdateCity
(
	@CityKey int,
	@code varchar(3),
	@name varchar(50),
	@countryKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  = @CityKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.Country WHERE CountryKey  = @countryKey) > 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  != @CityKey AND UPPER([Name])=UPPER(@name)) = 0)
			BEGIN
				IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  != @CityKey AND UPPER([Code])=UPPER(@code)) = 0)
				BEGIN
					UPDATE City
					SET [Code] = @code
						,[Name] = @name
						,[CountryKey] = @countryKey
					WHERE CityKey = @CityKey;
					SELECT 1 AS Code, @CityKey AS Row_Key, '' AS [Message];
					END
				ELSE
				BEGIN
					SELECT 0 AS Code, @CityKey AS Row_Key, 'Already exists a City with the code '+ @code+ '.' AS [Message];
				END
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, @CityKey AS Row_Key, 'Already exists a City with the name '+ @name+ '.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, @CityKey AS Row_Key, 'The Country whith key '+CAST(@countryKey as VARCHAR)+ ' do not exists.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @CityKey AS Row_Key, 'The City whith key '+CAST(@CityKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO


/******************************************************************************
**  Name: SPA_DeleteCity
**  Desc: Procedimiento almacenado que elimina un area.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteCity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteCity]
END
GO

CREATE PROCEDURE SPA_DeleteCity
(
	@CityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey  = @CityKey) > 0)
	BEGIN
		DELETE FROM City
		WHERE CityKey  = @CityKey;
		SELECT 1 AS Code, @CityKey AS Row_Key, '' AS [Message];
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @CityKey AS Row_Key, 'The City whith key '+@CityKey+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GettCities
**  Desc: Procedimiento almacenado que devuelve el detalle de una ciudad.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetCities]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetCities]
END
GO

CREATE PROCEDURE SPA_GetCities
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT CityKey
		   ,[Code]
			,[Name]
			,[CountryKey]
	FROM [dbo].[City]
END
GO

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

USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertInventoryInput
**  Desc: Procedimiento almacenado para el registro de ingreso de activos a
**        inventario.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertInventoryInput]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertInventoryInput]
END
GO

CREATE PROCEDURE SPA_InsertInventoryInput
(
	@equipmentKey int,
	@userKey int,
	@providerKey int,
	@date datetime,
	@quantity int,
	@unitPrice decimal(10,2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[InventoryInput]
           ([EquipmentKey]
           ,[UserKey]
           ,[ProviderKey]
           ,[Date]
           ,[Quantity]
           ,[UnitPrice]
           ,[DateRegistration])
	VALUES (@equipmentKey
			,@userKey
			,@providerKey
			,@date
			,@quantity
			,@unitPrice
			,getdate()
			);
	SELECT 1 AS Code, @@IDENTITY AS NewInventoryInputKey, '' AS Mess;
END
GO

/******************************************************************************
**  Name: SPA_GettInventoryInput
**  Desc: Procedimiento almacenado que devuelve el detalle de un ingreso al
**  inventario.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GettInventoryInput]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GettInventoryInput]
END
GO

CREATE PROCEDURE SPA_GettInventoryInput
(
	@InventoryInputKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT InventoryInputKey
		   ,[EquipmentKey]
           ,[UserKey]
           ,[ProviderKey]
           ,[Date]
           ,[Quantity]
           ,[UnitPrice]
           ,[DateRegistration]
	FROM [dbo].[InventoryInput]
	WHERE InventoryInputKey = @InventoryInputKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateInventoryInput
**  Desc: Procedimiento almacenado para la actualizacion de un registro de
**  ingreso de activos a inventario.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateInventoryInput]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateInventoryInput]
END
GO

CREATE PROCEDURE SPA_UpdateInventoryInput
(
	@InventoryInputKey int,
	@equipmentKey int,
	@userKey int,
	@providerKey int,
	@date datetime,
	@quantity int,
	@unitPrice decimal(10,2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE InventoryInput
	SET [EquipmentKey] = @equipmentKey
           ,[UserKey] = @userKey
           ,[ProviderKey] = @providerKey
           ,[Date] = @date
           ,[Quantity] = @quantity
           ,[UnitPrice] = @unitPrice
	WHERE InventoryInputKey = @InventoryInputKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteInventoryInput
**  Desc: Procedimiento almacenado que elimina un registro de inventorio.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteInventoryInput]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteInventoryInput]
END
GO

CREATE PROCEDURE SPA_DeleteInventoryInput
(
	@InventoryInputKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM InventoryInput
	WHERE InventoryInputKey  = @InventoryInputKey;
END
GO

USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertItem
**  Desc: Procedimiento almacenado para el registro de un item.
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
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertItem]
END
GO

CREATE PROCEDURE SPA_InsertItem
(
	@OrganizationKey int
	,@TypeContractKey int
	,@ItemNumber varchar(20)
	,@PositionKey int
	,@SalaryScaleKey int
	,@Code varchar(20)
	,@Status varchar(1)
	,@CityKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey=@OrganizationKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.TypeContract WHERE TypeContractKey=@TypeContractKey) > 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.Position WHERE PositionKey=@PositionKey) > 0)
			BEGIN
				IF((SELECT COUNT(*) FROM dbo.SalaryScale WHERE SalaryScaleKey=@SalaryScaleKey) > 0)
				BEGIN
					IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey=@CityKey) > 0)
					BEGIN
						IF((SELECT COUNT(*) FROM dbo.Item WHERE UPPER(Code)=UPPER(@Code)) = 0)
						BEGIN
							INSERT INTO [dbo].[Item]
									([OrganizationKey]
									,[TypeContractKey]
									,[ItemNumber]
									,[PositionKey]
									,[SalaryScaleKey]
									,[Code]
									,[Status]
									,[CityKey])
							VALUES (@OrganizationKey
									,@TypeContractKey
									,@ItemNumber
									,@PositionKey
									,@SalaryScaleKey
									,@Code
									,@Status
									,@CityKey
									);
							SELECT 1 AS Code, @@IDENTITY AS Row_Key, '' AS [Message];
						END
						ELSE
						BEGIN
							SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a Item with the code '+CAST(@Code as VARCHAR)+ '.' AS [Message];
						END
					END
					ELSE
					BEGIN
						SELECT 0 AS Code, 0 AS Row_Key, 'The City whith key '+CAST(@CityKey as VARCHAR)+ ' do not exists.' AS [Message];
					END
				END
				ELSE
				BEGIN
					SELECT 0 AS Code, 0 AS Row_Key, 'The SalaryScale whith key '+CAST(@SalaryScaleKey as VARCHAR)+ ' do not exists.' AS [Message];
				END
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, 0 AS Row_Key, 'The Position whith key '+CAST(@PositionKey as VARCHAR)+ ' do not exists.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The TypeContract whith key '+CAST(@TypeContractKey as VARCHAR)+ ' do not exists.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, 0 AS Row_Key, 'The Organization whith key '+CAST(@OrganizationKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GetItem
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetItem]
END
GO

CREATE PROCEDURE SPA_GetItem
(
	@ItemKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT ItemKey
		,[OrganizationKey]
		,[TypeContractKey]
		,[ItemNumber]
		,[PositionKey]
		,[SalaryScaleKey]
		,[Code]
		,[Status]
		,[CityKey]
	FROM [dbo].[Item]
	WHERE ItemKey = @ItemKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateItem
**  Desc: Procedimiento almacenado para la actualizacion de un Item
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateItem]
END
GO

CREATE PROCEDURE SPA_UpdateItem
(
	@ItemKey int,
	@OrganizationKey int
	,@TypeContractKey int
	,@ItemNumber varchar(20)
	,@PositionKey int
	,@SalaryScaleKey int
	,@Code varchar(20)
	,@Status varchar(1)
	,@CityKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey=@OrganizationKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.TypeContract WHERE TypeContractKey=@TypeContractKey) > 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.Position WHERE PositionKey=@PositionKey) > 0)
			BEGIN
				IF((SELECT COUNT(*) FROM dbo.SalaryScale WHERE SalaryScaleKey=@SalaryScaleKey) > 0)
				BEGIN
					IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey=@CityKey) > 0)
					BEGIN
						IF((SELECT COUNT(*) FROM dbo.Item WHERE UPPER(Code)=UPPER(@Code) AND ItemKey != @ItemKey) = 0)
						BEGIN
							UPDATE Item
							SET [OrganizationKey] = @OrganizationKey
									,[TypeContractKey] = @TypeContractKey
									,[ItemNumber] = @ItemNumber
									,[PositionKey] = @PositionKey
									,[SalaryScaleKey] = @SalaryScaleKey
									,[Code] = @Code
									,[Status] = @Status
									,[CityKey] = @CityKey
							WHERE ItemKey = @ItemKey;
							SELECT 1 AS Code, @ItemKey AS Row_Key, '' AS [Message];
							END
						ELSE
						BEGIN
							SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a Item with the code '+CAST(@Code as VARCHAR)+ '.' AS [Message];
						END
					END
					ELSE
					BEGIN
						SELECT 0 AS Code, 0 AS Row_Key, 'The City whith key '+CAST(@CityKey as VARCHAR)+ ' do not exists.' AS [Message];
					END
				END
				ELSE
				BEGIN
					SELECT 0 AS Code, 0 AS Row_Key, 'The SalaryScale whith key '+CAST(@SalaryScaleKey as VARCHAR)+ ' do not exists.' AS [Message];
				END
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, 0 AS Row_Key, 'The Position whith key '+CAST(@PositionKey as VARCHAR)+ ' do not exists.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The TypeContract whith key '+CAST(@TypeContractKey as VARCHAR)+ ' do not exists.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, 0 AS Row_Key, 'The Organization whith key '+CAST(@OrganizationKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO


/******************************************************************************
**  Name: SPA_DeleteItem
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteItem]
END
GO

CREATE PROCEDURE SPA_DeleteItem
(
	@ItemKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Item WHERE ItemKey  = @ItemKey) > 0)
	BEGIN
		DELETE FROM Item
		WHERE ItemKey  = @ItemKey;
		SELECT 1 AS Code, @ItemKey AS Row_Key, '' AS [Message];
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @ItemKey AS Row_Key, 'The Item whith key '+@ItemKey+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GetItemsFromOrganization
**  Desc: Procedimiento almacenado que devuelve los items de un area.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetItemsFromOrganization]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetItemsFromOrganization]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetItemsFromOrganization
	@OrgnanizationKey INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [ItemKey]
		,[OrganizationKey]
		,[TypeContractKey]
		,[ItemNumber]
		,[PositionKey]
		,[SalaryScaleKey]
		,[Code]
		,[Status]
		,[CityKey]
	FROM dbo.Item
	WHERE [OrganizationKey] = @OrgnanizationKey
END
GO

/******************************************************************************
**  Name: SPA_GetItemsFromOrganization
**  Desc: Procedimiento almacenado que devuelve los items.
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
** 08/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetItems]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetItems]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetItems
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [ItemKey]
		,[OrganizationKey]
		,[TypeContractKey]
		,[ItemNumber]
		,[PositionKey]
		,[SalaryScaleKey]
		,[Code]
		,[Status]
		,[CityKey]
	FROM dbo.Item
END
GO

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

USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertPersonalDocument
**  Desc: Procedimiento almacenado para el registro de documento personal.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertPersonalDocument]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertPersonalDocument]
END
GO

CREATE PROCEDURE SPA_InsertPersonalDocument
(
	@employeeKey int
	, @documentKey int
	, @number varchar(50)
	, @issueDate datetime
	, @dueDate datetime
	, @observation varchar(250)
	, @digital varbinary(max)
	, @status varchar(2)
	, @reference varchar(4)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[PersonalDocument]
           ([EmployeeKey]
           ,[DocumentKey]
           ,[Number]
           ,[IssueDate]
           ,[DueDate]
           ,[Observation]
           ,[Digital]
           ,[Status]
           ,[Reference])
	VALUES (@employeeKey
			,@documentKey
			,@number
			,@issueDate
			,@dueDate
			,@observation
			,@digital
			,@status
			,@reference
			);
	SELECT @@IDENTITY AS NewPersonalDocumentKey;
END
GO

/******************************************************************************
**  Name: SPA_GettPersonalDocument
**  Desc: Procedimiento almacenado que devuelve el detalle de documento personal.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetPersonalDocument]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetPersonalDocument]
END
GO

CREATE PROCEDURE SPA_GetPersonalDocument
(
	@PersonalDocumentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT PersonalDocumentKey
		   ,[EmployeeKey]
           ,[DocumentKey]
           ,[Number]
           ,[IssueDate]
           ,[DueDate]
           ,[Observation]
           ,[Digital]
           ,[Status]
           ,[Reference]
	FROM [dbo].[PersonalDocument]
	WHERE PersonalDocumentKey = @PersonalDocumentKey
END
GO

/******************************************************************************
**  Name: SPA_UpdatePersonalDocument
**  Desc: Procedimiento almacenado para la actualizacion de un documento personal
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdatePersonalDocument]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdatePersonalDocument]
END
GO

CREATE PROCEDURE SPA_UpdatePersonalDocument
(
	@PersonalDocumentKey int
	,@employeeKey int
	,@documentKey int
	,@number varchar(50)
	,@issueDate datetime
	,@dueDate datetime
	,@observation varchar(250)
	,@digital varbinary(max)
	,@status varchar(2)
	,@reference varchar(4)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE PersonalDocument
	SET [EmployeeKey] = @employeeKey
           ,[DocumentKey] = DocumentKey
           ,[Number] = @number
           ,[IssueDate] = @issueDate
           ,[DueDate] = @dueDate
           ,[Observation] = @observation
           ,[Digital] = @digital
           ,[Status] = @status
           ,[Reference] = @reference
	WHERE PersonalDocumentKey = @PersonalDocumentKey;
END
GO


/******************************************************************************
**  Name: SPA_DeletePersonalDocument
**  Desc: Procedimiento almacenado que elimina un nivel documento personal.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeletePersonalDocument]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeletePersonalDocument]
END
GO

CREATE PROCEDURE SPA_DeletePersonalDocument
(
	@PersonalDocumentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM PersonalDocument
	WHERE PersonalDocumentKey  = @PersonalDocumentKey;
END
GO

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

USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertProfession
**  Desc: Procedimiento almacenado para el registro de una profesion.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertProfession]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertProfession]
END
GO

CREATE PROCEDURE SPA_InsertProfession
(
	@name varchar(50),
	@studyingTime int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Profession]
           ([Name]
		  ,[StudyingTime])
	VALUES (@name,
			@StudyingTime
			);
	SELECT @@IDENTITY AS NewProfessionKey;
END
GO

/******************************************************************************
**  Name: SPA_GetProfession
**  Desc: Procedimiento almacenado que devuelve el detalle una profesion.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetProfession]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetProfession]
END
GO

CREATE PROCEDURE SPA_GetProfession
(
	@ProfessionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [ProfessionKey]
           ,[Name]
		  ,[StudyingTime]
	FROM [dbo].[Profession]
	WHERE ProfessionKey = @ProfessionKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateProfession
**  Desc: Procedimiento almacenado para la actualizacion de una profesion
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateProfession]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateProfession]
END
GO

CREATE PROCEDURE SPA_UpdateProfession
(
	@ProfessionKey int,
	@name varchar(50),
	@StudyingTime int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Profession
	SET [Name] = @name
		  ,[StudyingTime] = @StudyingTime
	WHERE ProfessionKey = @ProfessionKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteProfession
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteProfession]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteProfession]
END
GO

CREATE PROCEDURE SPA_DeleteProfession
(
	@ProfessionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Profession
	WHERE ProfessionKey  = @ProfessionKey;
END
GO

USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertProvider
**  Desc: Procedimiento almacenado para el registro de un proveedor.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertProvider]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertProvider]
END
GO

CREATE PROCEDURE SPA_InsertProvider
(
	@name varchar(150),
	@address varchar(150),
	@phone varchar(50),
	@contact varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Provider]
           ([Name]
           ,[Address]
           ,[Phone]
           ,[Contact])
	VALUES (@name,
			@address,
			@phone,
			@contact
			);
	SELECT @@IDENTITY AS NewProviderKey;
END
GO

/******************************************************************************
**  Name: SPA_GetProvider
**  Desc: Procedimiento almacenado que devuelve el detalle un proveedor.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetProvider]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetProvider]
END
GO

CREATE PROCEDURE SPA_GetProvider
(
	@ProviderKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [ProviderKey]
           ,[Name]
		   ,[Address]
           ,[Phone]
           ,[Contact]
	FROM [dbo].[Provider]
	WHERE ProviderKey = @ProviderKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateProvider
**  Desc: Procedimiento almacenado para la actualizacion de un proveedor
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateProvider]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateProvider]
END
GO

CREATE PROCEDURE SPA_UpdateProvider
(
	@ProviderKey int,
	@name varchar(150),
	@address varchar(150),
	@phone varchar(50),
	@contact varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Provider
	SET [Name] = @name
           ,[Address] = @address
           ,[Phone] = @phone
           ,[Contact] = @contact
	WHERE ProviderKey = @ProviderKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteProvider
**  Desc: Procedimiento almacenado que elimina un proveedor.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteProvider]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteProvider]
END
GO

CREATE PROCEDURE SPA_DeleteProvider
(
	@ProviderKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Provider
	WHERE ProviderKey  = @ProviderKey;
END
GO

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
	@daysToResolve TIMESTAMP,
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
	@daysToResolve TIMESTAMP,
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

/******************************************************************************
**  Name: SPA_GetSalaryScales
**  Desc: Procedimiento almacenado que devuelve la lista de Escalas Salariales.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetSalaryScales]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetSalaryScales]
END
GO

CREATE PROCEDURE SPA_GetSalaryScales
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SalaryScaleKey]
			,[CurrencyKey]
			,[Name]
			,[NumberCases]
			,[BasicSalary]
			,[Status]
			,[Start]
			,[End]
	FROM [dbo].[SalaryScale]
END
GO

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

USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_ValidateUser
**  Desc: Procedimiento almacenado para la validacion de un usuario y contrasena.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_ValidateUser]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_ValidateUser]
END
GO

CREATE PROCEDURE SPA_ValidateUser
(
	@username varchar(50),
	@password varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.[User] WHERE UPPER(Username)  = UPPER(@username) AND [Password]=@password) > 0)
	BEGIN
		SELECT 1 AS Code, 0 AS Row_Key, '' AS [Message];
	END
	ELSE
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.[User] WHERE UPPER(Username)  = UPPER(@username)) > 0)
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The credentials for '+@username+' are incorrects.' AS [Message];;
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The user '+CAST(@username as VARCHAR)+ ' do not exist.' AS [Message];
		END
	END
END
GO

/******************************************************************************
**  Name: SPA_GetByUsername
**  Desc: Procedimiento almacenado para obtener un usuario por su Username.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetByUsername]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetByUsername]
END
GO

CREATE PROCEDURE SPA_GetByUsername
(
	@username varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT UserKey
	,EmployeeKey
	,RolKey
	,Status
	,UserName
	FROM dbo.[User]
	WHERE UPPER(UserName)=UPPER(@username)
END
GO

/******************************************************************************
**  Name: getAllAccidentType
**  Desc: Obtener todos los Tipos de accidente
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getAllAccidentType]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getAllAccidentType]
END
GO

CREATE PROCEDURE getAllAccidentType
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	AccidentTypeKey
			,ParentKey
			,Name
			,Description
			,State
			,HaveSubType
    FROM AccidentType;
END
GO

