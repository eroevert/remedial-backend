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
