USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertProfession
**  Desc: Procedimiento almacenado para el registro de una profesion.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertProfession]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertProfession]
END
GO

CREATE PROCEDURE SPA_InsertProfession
(
	@name varchar(50),
	@studyingTime int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Profession]
           ([Name]
		  ,[StudyingTime])
	VALUES (@name,
			@StudyingTime
			);
	SELECT @@IDENTITY AS NewProfessionKey;
END
GO

/******************************************************************************
**  Name: SPA_GetProfession
**  Desc: Procedimiento almacenado que devuelve el detalle una profesion.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetProfession]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetProfession]
END
GO

CREATE PROCEDURE SPA_GetProfession
(
	@ProfessionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [ProfessionKey]
           ,[Name]
		  ,[StudyingTime]
	FROM [dbo].[Profession]
	WHERE ProfessionKey = @ProfessionKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateProfession
**  Desc: Procedimiento almacenado para la actualizacion de una profesion
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateProfession]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateProfession]
END
GO

CREATE PROCEDURE SPA_UpdateProfession
(
	@ProfessionKey int,
	@name varchar(50),
	@StudyingTime int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Profession 
	SET [Name] = @name
		  ,[StudyingTime] = @StudyingTime
	WHERE ProfessionKey = @ProfessionKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteProfession
**  Desc: Procedimiento almacenado que elimina una probabilidad de ocurrencia.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteProfession]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteProfession]
END
GO

CREATE PROCEDURE SPA_DeleteProfession
(
	@ProfessionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Profession 
	WHERE ProfessionKey  = @ProfessionKey;
END
GO
