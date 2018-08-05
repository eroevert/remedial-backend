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