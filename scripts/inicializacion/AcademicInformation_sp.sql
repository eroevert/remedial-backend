/******************************************************************************
**  Name: InsertAcademicInformation
**  Desc: Inserta una nueva Informaciòn de Academia
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