/******************************************************************************
**  Name: InsertSkillsPosition
**  Desc: Insert a SkillsPosition
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertSkillsPosition]
END
GO
CREATE PROCEDURE InsertSkillsPosition
(
	@PositionKey INT,
	@SkillKey INT,
	@Level VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO SkillsPosition(PositionKey, SkillKey, [Level])
	VALUES (@PositionKey
      ,@SkillKey
			,@Level
			);

	SELECT @@IDENTITY AS NewSkillsPosition;
END
GO

/******************************************************************************
**  Name: getSkillsPosition
**  Desc: Get SkillsPosition
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getSkillsPosition]
END
GO

CREATE PROCEDURE getSkillsPosition
(
	@SkillsPositionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SkillPositionKey],
  PositionKey,
  SkillKey,
  [Level]
    FROM SkillsPosition
	WHERE SkillPositionKey = @SkillsPositionKey;
END
GO

/******************************************************************************
**  Name: updateSkillsPosition
**  Desc: Update SkillsPosition
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateSkillsPosition]
END
GO

CREATE PROCEDURE updateSkillsPosition
(
	@SkillsPositionKey INT,
	@PositionKey INT,
	@SkillKey INT,
	@Level VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE SkillsPosition
	SET
		[PositionKey]		= @PositionKey
		,SkillKey	= @SkillKey
		,[Level]		= @Level
	WHERE SkillPositionKey = @SkillsPositionKey;
END
GO

/******************************************************************************
**  Name: deleteSkillsPosition
**  Desc: Delete SkillsPosition
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteSkillsPosition]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteSkillsPosition]
END
GO
CREATE PROCEDURE deleteSkillsPosition
(
	@SkillsPositionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM SkillsPosition
	WHERE SkillPositionKey  = @SkillsPositionKey ;
END
GO