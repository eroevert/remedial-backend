/******************************************************************************
**  Name: InsertCorrectiveActions
**  Desc: Inserta unA ACCION CORRECTIVA
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertCorrectiveActions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertCorrectiveActions]
END
GO
CREATE PROCEDURE InsertCorrectiveActions
(
	@InvestigationKey INT,
	@Description VARCHAR(3000),
	@DateExecute DATETIME,
	@Status VARCHAR(50),
	@DateEnd DATETIME,
	@ResponsibleEmployeeKey INT,
	@Observation VARCHAR(5000),
	@EmpleadoKey INT,
	@StatusAccion INT,
	@ParentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO CorrectiveActions(InvestigationKey 
						   ,Description  
						   ,DateExecute  
						   ,Status
						   ,DateEnd 
						   ,ResponsibleEmployeeKey
						   ,Observation
						   ,EmpleadoKey
						   ,StatusAccion
						   ,ParentKey
						   )
	VALUES (@InvestigationKey
			,@Description
			,@DateExecute
			,@Status
			,@DateEnd
			,@ResponsibleEmployeeKey
			,@Observation
			,@EmpleadoKey
			,@StatusAccion
			,@ParentKey
			);

	SELECT @@IDENTITY AS NewCorrectiveActionKey;
END
GO

/******************************************************************************
**  Name: getCorrectiveActions
**  Desc: Obtener una accion correctiva
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetCorrectiveActions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetCorrectiveActions]
END
GO

CREATE PROCEDURE GetCorrectiveActions
(
	@CorrectiveActionKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 CorrectiveActionKey
			,InvestigationKey 
			,Description  
			,DateExecute  
			,Status
			,DateEnd 
			,ResponsibleEmployeeKey
			,Observation
			,EmpleadoKey
			,StatusAccion
			,ParentKey
    FROM CorrectiveActions
	WHERE CorrectiveActionKey = @CorrectiveActionKey;
END
GO

/******************************************************************************
**  Name: updateCorrectiveActions
**  Desc: Actualizar una accion correctiva
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCorrectiveActions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateCorrectiveActions]
END
GO

CREATE PROCEDURE UpdateCorrectiveActions
(
	@CorrectiveActionKey int,
	@InvestigationKey INT,
	@Description VARCHAR(3000),
	@DateExecute DATETIME,
	@Status VARCHAR(50),
	@DateEnd DATETIME,
	@ResponsibleEmployeeKey INT,
	@Observation VARCHAR(5000),
	@EmpleadoKey INT,
	@StatusAccion INT,
	@ParentKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE CorrectiveActions 
	SET
		InvestigationKey		= @InvestigationKey
		,Description			= @Description
		,DateExecute			= @DateExecute
		,Status					= @Status
		,DateEnd				= @DateEnd
		,ResponsibleEmployeeKey	= @ResponsibleEmployeeKey
		,Observation			= @Observation
		,EmpleadoKey			= @EmpleadoKey
		,StatusAccion			= @StatusAccion
		,ParentKey				= @ParentKey

	WHERE CorrectiveActionKey = @CorrectiveActionKey;
END
GO

/******************************************************************************
**  Name: deleteCorrectiveActions
**  Desc: Eliminar una accion correctiva
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteCorrectiveActions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteCorrectiveActions]
END
GO
CREATE PROCEDURE deleteCorrectiveActions
(
	@CorrectiveActionsKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM CorrectiveActions 
	WHERE CorrectiveActionKey  = @CorrectiveActionsKey ;
END
GO