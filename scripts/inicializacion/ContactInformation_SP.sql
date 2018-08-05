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