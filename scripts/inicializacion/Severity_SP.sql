/******************************************************************************
**  Name: InsertSeverity
**  Desc: Insert a Severity
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertSeverity]
END
GO
CREATE PROCEDURE InsertSeverity
(
	@Name VARCHAR(50),
	@Personnel VARCHAR(128),
	@Enviroment VARCHAR(128),
  @Material INT,
  @Mission VARCHAR(512),
  @Code VARCHAR(1),
  @indicatorBaseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO Severity(Name, Personnel, Enviroment,
  Material, Mission, Code, indicatorBaseKey)
	VALUES (@Name
      ,@Personnel
			,@Enviroment
			,@Material
      ,@Mission
      ,@Code
      ,@indicatorBaseKey
			);

	SELECT @@IDENTITY AS NewSeverity;
END
GO

/******************************************************************************
**  Name: getSeverity
**  Desc: Get Severity
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getSeverity]
END
GO

CREATE PROCEDURE getSeverity
(
	@SeverityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SeverityKey],
  Name,
  Personnel,
  Enviroment,
  [Material],
  [Mission],
  [Code],
  indicatorBaseKey
    FROM Severity
	WHERE SeverityKey = @SeverityKey;
END
GO

/******************************************************************************
**  Name: updateSeverity
**  Desc: Update Severity
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateSeverity]
END
GO

CREATE PROCEDURE updateSeverity
(
	@SeverityKey INT,
	@Name VARCHAR(50),
	@Personnel VARCHAR(128),
	@Enviroment VARCHAR(128),
  @Material INT,
  @Mission VARCHAR(512),
  @Code VARCHAR(1),
  @indicatorBaseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Severity
	SET
		[Name]		= @Name
		,Personnel	= @Personnel
		,[Enviroment]		= @Enviroment
    ,Material = @Material
    ,[Mission] = @Mission
    ,[Code] = @Code
    ,[indicatorBaseKey] = @indicatorBaseKey
	WHERE SeverityKey = @SeverityKey;
END
GO

/******************************************************************************
**  Name: deleteSeverity
**  Desc: Delete Severity
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteSeverity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteSeverity]
END
GO
CREATE PROCEDURE deleteSeverity
(
	@SeverityKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Severity
	WHERE SeverityKey  = @SeverityKey ;
END
GO