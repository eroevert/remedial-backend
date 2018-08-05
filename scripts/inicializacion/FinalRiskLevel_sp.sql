/******************************************************************************
**  Name: InsertFinalRiskLevel
**  Desc: Inserta un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[InsertFinalRiskLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertFinalRiskLevel]
END
GO
CREATE PROCEDURE InsertFinalRiskLevel
(
	@RiskValueKey INT,
	@AccidentKey INT,
	@State VARCHAR(15),
	@DateRegister DATETIME
	
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO FinalRiskLevel(RiskValueKey 
						   ,AccidentKey 
						   ,State
						   ,DateRegister
						   )
	VALUES (@RiskValueKey
			,@AccidentKey 
			,@State 
			,@DateRegister    
			);

	SELECT @@IDENTITY AS NewFinalRiskLevelKey;
END
GO

/******************************************************************************
**  Name: getFinalRiskLevel
**  Desc: Obtener un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetFinalRiskLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetFinalRiskLevel]
END
GO

CREATE PROCEDURE GetFinalRiskLevel
(
	@FinalRiskLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT	 FinalRiskLevelKey
			,RiskValueKey 
			,AccidentKey 
			,State
			,DateRegister
    FROM FinalRiskLevel
	WHERE FinalRiskLevelKey = @FinalRiskLevelKey;
END
GO

/******************************************************************************
**  Name: updateFinalRiskLevel
**  Desc: Actualizar un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateFinalRiskLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateFinalRiskLevel]
END
GO

CREATE PROCEDURE UpdateFinalRiskLevel
(
	@FinalRiskLevelKey INT,
	@RiskValueKey INT,
	@AccidentKey INT,
	@State VARCHAR(15),
	@DateRegister DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE FinalRiskLevel 
	SET
		 RiskValueKey		= @RiskValueKey
		,AccidentKey		= @AccidentKey
		,State				= @State
		,DateRegister		= @DateRegister

	WHERE FinalRiskLevelKey = @FinalRiskLevelKey;
END
GO

/******************************************************************************
**  Name: deleteFinalRiskLevel
**  Desc: Eliminar un FinalRiskLevel
**  Author: Grupo C
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[deleteFinalRiskLevel]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[deleteFinalRiskLevel]
END
GO
CREATE PROCEDURE deleteFinalRiskLevel
(
	@FinalRiskLevelKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM FinalRiskLevel 
	WHERE FinalRiskLevelKey  = @FinalRiskLevelKey ;
END
GO