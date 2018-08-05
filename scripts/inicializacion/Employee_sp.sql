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