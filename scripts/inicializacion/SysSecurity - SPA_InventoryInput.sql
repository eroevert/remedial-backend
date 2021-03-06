USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertInventoryInput
**  Desc: Procedimiento almacenado para el registro de ingreso de activos a
**        inventario.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertInventoryInput]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertInventoryInput]
END
GO

CREATE PROCEDURE SPA_InsertInventoryInput
(
	@equipmentKey int,
	@userKey int,
	@providerKey int,
	@date datetime,
	@quantity int,
	@unitPrice decimal(10,2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[InventoryInput]
           ([EquipmentKey]
           ,[UserKey]
           ,[ProviderKey]
           ,[Date]
           ,[Quantity]
           ,[UnitPrice]
           ,[DateRegistration])
	VALUES (@equipmentKey
			,@userKey
			,@providerKey
			,@date
			,@quantity
			,@unitPrice
			,getdate()
			);
	SELECT 1 AS Code, @@IDENTITY AS NewInventoryInputKey, '' AS Mess;
END
GO

/******************************************************************************
**  Name: SPA_GettInventoryInput
**  Desc: Procedimiento almacenado que devuelve el detalle de un ingreso al
**  inventario.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GettInventoryInput]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GettInventoryInput]
END
GO

CREATE PROCEDURE SPA_GettInventoryInput
(
	@InventoryInputKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT InventoryInputKey
		   ,[EquipmentKey]
           ,[UserKey]
           ,[ProviderKey]
           ,[Date]
           ,[Quantity]
           ,[UnitPrice]
           ,[DateRegistration]
	FROM [dbo].[InventoryInput]
	WHERE InventoryInputKey = @InventoryInputKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateInventoryInput
**  Desc: Procedimiento almacenado para la actualizacion de un registro de
**  ingreso de activos a inventario.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateInventoryInput]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateInventoryInput]
END
GO

CREATE PROCEDURE SPA_UpdateInventoryInput
(
	@InventoryInputKey int,
	@equipmentKey int,
	@userKey int,
	@providerKey int,
	@date datetime,
	@quantity int,
	@unitPrice decimal(10,2)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE InventoryInput 
	SET [EquipmentKey] = @equipmentKey
           ,[UserKey] = @userKey
           ,[ProviderKey] = @providerKey
           ,[Date] = @date
           ,[Quantity] = @quantity
           ,[UnitPrice] = @unitPrice
	WHERE InventoryInputKey = @InventoryInputKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteInventoryInput
**  Desc: Procedimiento almacenado que elimina un registro de inventorio.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteInventoryInput]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteInventoryInput]
END
GO

CREATE PROCEDURE SPA_DeleteInventoryInput
(
	@InventoryInputKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM InventoryInput 
	WHERE InventoryInputKey  = @InventoryInputKey;
END
GO
