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