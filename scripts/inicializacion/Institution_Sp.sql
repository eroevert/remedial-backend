/******************************************************************************
**  Name: Institution
**  Desc: Insert new Institution
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertInstitution]
END
GO

CREATE PROCEDURE InsertInstitution
(
	@Name VARCHAR(50),
	@Type VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO Institution(Name 
		   ,[Type]
		   )
	VALUES (@Name
		,@Type
		);
	SELECT @@IDENTITY AS NewInstitutionKey;
END
GO

/******************************************************************************
**  Name: getInstitution
**  Desc: GetInstitution by Id
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[getInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[getInstitution]
END
GO
  CREATE PROCEDURE getInstitution
  (
    @InstitutionKey INT
  )
  AS
  SET XACT_ABORT ON;
  SET NOCOUNT ON;
  BEGIN
    SELECT InstitutionKey
        ,Name
        ,[Type]
      FROM Institution
    WHERE InstitutionKey = @InstitutionKey;
  END
GO

/******************************************************************************
**  Name: updateInstitution
**  Desc: Update institution data
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateInstitution]
END
GO

CREATE PROCEDURE UpdateInstitution
(
	@InstitutionKey int,
	@Name VARCHAR(50),
	@Type VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Institution 
	SET
		Name		= @Name
		,[Type]		= @Type
	WHERE InstitutionKey = @InstitutionKey;
END
GO


/******************************************************************************
**  Name: deleteInstitution
**  Desc: Delete an institution
**  Author: Nataly Huanca
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteInstitution]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteInstitution]
END
GO

CREATE PROCEDURE deleteInstitution
(
	@InstitutionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Institution 
	WHERE InstitutionKey  = @InstitutionKey;
END
GO
