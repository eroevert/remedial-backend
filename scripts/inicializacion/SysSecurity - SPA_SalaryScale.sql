/******************************************************************************
**  Name: SPA_GetSalaryScales
**  Desc: Procedimiento almacenado que devuelve la lista de Escalas Salariales.
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
		WHERE object_id = OBJECT_ID(N'[dbo].[SPA_GetSalaryScales]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[SPA_GetSalaryScales]
END
GO

CREATE PROCEDURE SPA_GetSalaryScales
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT [SalaryScaleKey]
			,[CurrencyKey]
			,[Name]
			,[NumberCases]
			,[BasicSalary]
			,[Status]
			,[Start]
			,[End]
	FROM [dbo].[SalaryScale]
END
GO