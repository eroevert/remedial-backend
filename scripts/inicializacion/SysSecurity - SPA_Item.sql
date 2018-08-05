USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertItem
**  Desc: Procedimiento almacenado para el registro de un item.
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
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertItem]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertItem]
END
GO

CREATE PROCEDURE SPA_InsertItem
(	
	@OrganizationKey int
	,@TypeContractKey int
	,@ItemNumber varchar(20)
	,@PositionKey int
	,@SalaryScaleKey int
	,@Code varchar(20)
	,@Status varchar(1)
	,@CityKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey=@OrganizationKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.TypeContract WHERE TypeContractKey=@TypeContractKey) > 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.Position WHERE PositionKey=@PositionKey) > 0)
			BEGIN
				IF((SELECT COUNT(*) FROM dbo.SalaryScale WHERE SalaryScaleKey=@SalaryScaleKey) > 0)
				BEGIN
					IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey=@CityKey) > 0)
					BEGIN
						IF((SELECT COUNT(*) FROM dbo.Item WHERE UPPER(Code)=UPPER(@Code)) = 0)
						BEGIN
							INSERT INTO [dbo].[Item]
									([OrganizationKey]
									,[TypeContractKey]
									,[ItemNumber]
									,[PositionKey]
									,[SalaryScaleKey]
									,[Code]
									,[Status]
									,[CityKey])
							VALUES (@OrganizationKey
									,@TypeContractKey
									,@ItemNumber
									,@PositionKey
									,@SalaryScaleKey
									,@Code
									,@Status
									,@CityKey
									);
							SELECT 1 AS Code, @@IDENTITY AS Row_Key, '' AS [Message];
						END
						ELSE
						BEGIN
							SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a Item with the code '+CAST(@Code as VARCHAR)+ '.' AS [Message];
						END
					END
					ELSE
					BEGIN
						SELECT 0 AS Code, 0 AS Row_Key, 'The City whith key '+CAST(@CityKey as VARCHAR)+ ' do not exists.' AS [Message];
					END
				END
				ELSE
				BEGIN
					SELECT 0 AS Code, 0 AS Row_Key, 'The SalaryScale whith key '+CAST(@SalaryScaleKey as VARCHAR)+ ' do not exists.' AS [Message];
				END
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, 0 AS Row_Key, 'The Position whith key '+CAST(@PositionKey as VARCHAR)+ ' do not exists.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The TypeContract whith key '+CAST(@TypeContractKey as VARCHAR)+ ' do not exists.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, 0 AS Row_Key, 'The Organization whith key '+CAST(@OrganizationKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GetItem
**  Desc: Procedimiento almacenado que devuelve el detalle de un area.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetItem]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetItem]
END
GO

CREATE PROCEDURE SPA_GetItem
(
	@ItemKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT ItemKey
		,[OrganizationKey]
		,[TypeContractKey]
		,[ItemNumber]
		,[PositionKey]
		,[SalaryScaleKey]
		,[Code]
		,[Status]
		,[CityKey]
	FROM [dbo].[Item]
	WHERE ItemKey = @ItemKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateItem
**  Desc: Procedimiento almacenado para la actualizacion de un Item
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateItem]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateItem]
END
GO

CREATE PROCEDURE SPA_UpdateItem
(
	@ItemKey int,
	@OrganizationKey int
	,@TypeContractKey int
	,@ItemNumber varchar(20)
	,@PositionKey int
	,@SalaryScaleKey int
	,@Code varchar(20)
	,@Status varchar(1)
	,@CityKey int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Organization WHERE OrganizationKey=@OrganizationKey) > 0)
	BEGIN
		IF((SELECT COUNT(*) FROM dbo.TypeContract WHERE TypeContractKey=@TypeContractKey) > 0)
		BEGIN
			IF((SELECT COUNT(*) FROM dbo.Position WHERE PositionKey=@PositionKey) > 0)
			BEGIN
				IF((SELECT COUNT(*) FROM dbo.SalaryScale WHERE SalaryScaleKey=@SalaryScaleKey) > 0)
				BEGIN
					IF((SELECT COUNT(*) FROM dbo.City WHERE CityKey=@CityKey) > 0)
					BEGIN
						IF((SELECT COUNT(*) FROM dbo.Item WHERE UPPER(Code)=UPPER(@Code) AND ItemKey != @ItemKey) = 0)
						BEGIN
							UPDATE Item
							SET [OrganizationKey] = @OrganizationKey
									,[TypeContractKey] = @TypeContractKey
									,[ItemNumber] = @ItemNumber
									,[PositionKey] = @PositionKey
									,[SalaryScaleKey] = @SalaryScaleKey
									,[Code] = @Code
									,[Status] = @Status
									,[CityKey] = @CityKey
							WHERE ItemKey = @ItemKey;
							SELECT 1 AS Code, @ItemKey AS Row_Key, '' AS [Message];
							END
						ELSE
						BEGIN
							SELECT 0 AS Code, 0 AS Row_Key, 'Already exists a Item with the code '+CAST(@Code as VARCHAR)+ '.' AS [Message];
						END
					END
					ELSE
					BEGIN
						SELECT 0 AS Code, 0 AS Row_Key, 'The City whith key '+CAST(@CityKey as VARCHAR)+ ' do not exists.' AS [Message];
					END
				END
				ELSE
				BEGIN
					SELECT 0 AS Code, 0 AS Row_Key, 'The SalaryScale whith key '+CAST(@SalaryScaleKey as VARCHAR)+ ' do not exists.' AS [Message];
				END
			END
			ELSE
			BEGIN
				SELECT 0 AS Code, 0 AS Row_Key, 'The Position whith key '+CAST(@PositionKey as VARCHAR)+ ' do not exists.' AS [Message];
			END
		END
		ELSE
		BEGIN
			SELECT 0 AS Code, 0 AS Row_Key, 'The TypeContract whith key '+CAST(@TypeContractKey as VARCHAR)+ ' do not exists.' AS [Message];
		END
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, 0 AS Row_Key, 'The Organization whith key '+CAST(@OrganizationKey as VARCHAR)+ ' do not exists.' AS [Message];
	END
END
GO


/******************************************************************************
**  Name: SPA_DeleteItem
**  Desc: Procedimiento almacenado que elimina un area.
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
** 04/06/2018 Gary Vera       Implement IF EXISTS control
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteItem]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteItem]
END
GO

CREATE PROCEDURE SPA_DeleteItem
(
	@ItemKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF((SELECT COUNT(*) FROM dbo.Item WHERE ItemKey  = @ItemKey) > 0)
	BEGIN
		DELETE FROM Item
		WHERE ItemKey  = @ItemKey;
		SELECT 1 AS Code, @ItemKey AS Row_Key, '' AS [Message];
	END
	ELSE
	BEGIN
		SELECT 0 AS Code, @ItemKey AS Row_Key, 'The Item whith key '+@ItemKey+ ' do not exists.' AS [Message];
	END
END
GO

/******************************************************************************
**  Name: SPA_GetItemsFromOrganization
**  Desc: Procedimiento almacenado que devuelve los items de un area.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetItemsFromOrganization]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetItemsFromOrganization]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetItemsFromOrganization
	@OrgnanizationKey INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [ItemKey]
		,[OrganizationKey]
		,[TypeContractKey]
		,[ItemNumber]
		,[PositionKey]
		,[SalaryScaleKey]
		,[Code]
		,[Status]
		,[CityKey]
	FROM dbo.Item
	WHERE [OrganizationKey] = @OrgnanizationKey
END
GO

/******************************************************************************
**  Name: SPA_GetItemsFromOrganization
**  Desc: Procedimiento almacenado que devuelve los items.
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 05/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 08/06/2018 Gary Vera       Initial version
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetItems]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetItems]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SPA_GetItems
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [ItemKey]
		,[OrganizationKey]
		,[TypeContractKey]
		,[ItemNumber]
		,[PositionKey]
		,[SalaryScaleKey]
		,[Code]
		,[Status]
		,[CityKey]
	FROM dbo.Item
END
GO