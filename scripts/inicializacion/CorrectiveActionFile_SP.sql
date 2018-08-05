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