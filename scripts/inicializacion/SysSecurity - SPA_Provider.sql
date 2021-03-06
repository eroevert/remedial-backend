USE SysSecurity
GO

/******************************************************************************
**  Name: SPA_InsertProvider
**  Desc: Procedimiento almacenado para el registro de un proveedor.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_InsertProvider]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_InsertProvider]
END
GO

CREATE PROCEDURE SPA_InsertProvider
(
	@name varchar(150),
	@address varchar(150),
	@phone varchar(50),
	@contact varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Provider]
           ([Name]
           ,[Address]
           ,[Phone]
           ,[Contact])
	VALUES (@name,
			@address,
			@phone,
			@contact
			);
	SELECT @@IDENTITY AS NewProviderKey;
END
GO

/******************************************************************************
**  Name: SPA_GetProvider
**  Desc: Procedimiento almacenado que devuelve el detalle un proveedor.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetProvider]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetProvider]
END
GO

CREATE PROCEDURE SPA_GetProvider
(
	@ProviderKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [ProviderKey]
           ,[Name]
		   ,[Address]
           ,[Phone]
           ,[Contact]
	FROM [dbo].[Provider]
	WHERE ProviderKey = @ProviderKey
END
GO

/******************************************************************************
**  Name: SPA_UpdateProvider
**  Desc: Procedimiento almacenado para la actualizacion de un proveedor
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_UpdateProvider]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_UpdateProvider]
END
GO

CREATE PROCEDURE SPA_UpdateProvider
(
	@ProviderKey int,
	@name varchar(150),
	@address varchar(150),
	@phone varchar(50),
	@contact varchar(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Provider 
	SET [Name] = @name
           ,[Address] = @address
           ,[Phone] = @phone
           ,[Contact] = @contact
	WHERE ProviderKey = @ProviderKey;
END
GO


/******************************************************************************
**  Name: SPA_DeleteProvider
**  Desc: Procedimiento almacenado que elimina un proveedor.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_DeleteProvider]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_DeleteProvider]
END
GO

CREATE PROCEDURE SPA_DeleteProvider
(
	@ProviderKey INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Provider 
	WHERE ProviderKey  = @ProviderKey;
END
GO
