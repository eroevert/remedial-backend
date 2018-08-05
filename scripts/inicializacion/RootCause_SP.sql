/******************************************************************************
**  Name: InsertRootCause
**  Desc: Insert a Root Cause
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertRootCause]
END
GO
CREATE PROCEDURE InsertRootCause
(
	@Description VARCHAR(5000),
	@Details VARCHAR(2000),
	@status VARCHAR(2),
	@code VARCHAR(8)

)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO RootCause([Description]
						   ,Details
						   ,[status]
						   ,code
						   )
	VALUES (@Description
      ,@Details
			,@status
			,@code
			);

	SELECT @@IDENTITY AS NewRootCause;
END
GO

/******************************************************************************
**  Name: getRootCause
**  Desc: Get root cause
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getRootCause]
END
GO

CREATE PROCEDURE getRootCause
(
	@RootCauseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT RootCauseKey
			,[Description]
			,Details
			,[status]
			,code
    FROM RootCause
	WHERE RootCauseKey = @RootCauseKey;
END
GO

/******************************************************************************
**  Name: updateRootCause
**  Desc: Update Root Cause
**  Author: Nataly HUanca
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[updateRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[updateRootCause]
END
GO

CREATE PROCEDURE updateRootCause
(
	@RootCauseKey INT,
	@Description VARCHAR(5000),
	@Details VARCHAR(2000),
	@status VARCHAR(2),
	@code VARCHAR(8)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE RootCause
	SET
		[Description]		= @Description
		,Details				= @Details
		,[status]		= @status
    ,code = @code

	WHERE RootCauseKey = @RootCauseKey;
END
GO

/******************************************************************************
**  Name: deleteRootCause
**  Desc: Delete Root Cause
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteRootCause]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteRootCause]
END
GO
CREATE PROCEDURE deleteRootCause
(
	@RootCauseKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM RootCause
	WHERE RootCauseKey  = @RootCauseKey ;
END
GO