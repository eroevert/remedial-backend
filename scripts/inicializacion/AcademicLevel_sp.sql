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