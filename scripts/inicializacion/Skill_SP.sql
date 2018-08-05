/******************************************************************************
**  Name: InsertSkill
**  Desc: Insert a Skill
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertSkill]
END
GO
CREATE PROCEDURE InsertSkill
(
	@Description VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO Skill([Description])
	VALUES (@Description
			);

	SELECT @@IDENTITY AS NewSkill;
END
GO

/******************************************************************************
**  Name: getSkill
**  Desc: Get Skill
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getSkill]
END
GO

CREATE PROCEDURE getSkill
(
	@SkillKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SkillKey],
  [Description]
    FROM Skill
	WHERE SkillKey = @SkillKey;
END
GO

/******************************************************************************
**  Name: updateSkill
**  Desc: Update Skill
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateSkill]
END
GO

CREATE PROCEDURE updateSkill
(
	@SkillKey INT,
	@Description VARCHAR(500)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Skill
	SET
		[Description]		= @Description
	WHERE SkillKey = @SkillKey;
END
GO

/******************************************************************************
**  Name: deleteSkill
**  Desc: Delete Skill
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteSkill]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteSkill]
END
GO
CREATE PROCEDURE deleteSkill
(
	@SkillKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Skill
	WHERE SkillKey  = @SkillKey ;
END
GO