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