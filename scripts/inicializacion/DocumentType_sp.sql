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