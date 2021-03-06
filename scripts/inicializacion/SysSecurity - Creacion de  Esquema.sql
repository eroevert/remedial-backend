/******************************************************************************
**  Name: [SysSecurity]
**  Desc: Script para generar la estructura de la base de datos de SysSecurity
**
**  Author: Gary Vera
**
**  Grupo: C
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Gary Vera       Initial version
** 29/05/2018 Gary Vera       Add RiskMatrix Table
*******************************************************************************/
USE [SysSecurity]
GO

PRINT 'Creating the AcademicInformation table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[AcademicInformation]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AcademicInformation](
		[AcademicInformationKey] [int] IDENTITY(1,1) NOT NULL,
		[EmployeeKey] [int] NOT NULL,
		[CityKey] [int] NOT NULL,
		[AcademicLevelKey] [int] NOT NULL,
		[ProfessionKey] [int] NOT NULL,
		[Status] [varchar](2) NOT NULL,
		[Start] [varchar](12) NOT NULL,
		[End] [varchar](12) NOT NULL,
		[Institution] [varchar](500) NOT NULL,
		[AcademicTitle] [bit] NOT NULL,
		[NationalTitle] [bit] NOT NULL,
	 CONSTRAINT [PK_DatosAcademicos] PRIMARY KEY CLUSTERED
	(
		[AcademicInformationKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table AcademicInformation already exists into the database';
END
GO


PRINT 'Creating the AcademicLevel table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[AcademicLevel]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AcademicLevel](
		[AcademicLevelKey] [int] IDENTITY(1,1) NOT NULL,
		[Description] [varchar](100) NOT NULL,
		[Status] [varchar](2) NOT NULL,
	 CONSTRAINT [PK_NivelAcademico] PRIMARY KEY CLUSTERED
	(
		[AcademicLevelKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table AcademicLevel already exists into the database';
END
GO


PRINT 'Creating the Accident table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Accident]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[Accident](
		[AccidentKey] [int] IDENTITY(1,1) NOT NULL,
		[DateEvent] [datetime] NOT NULL,
		[DateRegister] [datetime] NOT NULL,
		[Title] [varchar](200) NOT NULL,
		[DescribeIssue] [varchar](8000) NULL,
		[Suggestion] [varchar](2000) NULL,
		[levelRiskId] [int] NOT NULL,
		[AccidentTypeKey] [int] NOT NULL,
		[EmployeeKey] [int] NOT NULL,
		[IsAnonymous] [bit] NOT NULL,
		[ResponsibleEmployeeKey] [int] NULL,
		[Status] [varchar](50) NOT NULL,
		[CloseDate] [datetime] NULL,
		[Code] [varchar](30) NOT NULL,
		[IsMandatory] [bit] NULL,
		[isVoluntary] [bit] NULL,
		[EndDate] [datetime] NULL,
		[createdReportFromAdmin] [int] NULL,
		[StatusReport] [int] NULL,
	 CONSTRAINT [PK_FormularioSMS] PRIMARY KEY CLUSTERED
	(
		[AccidentKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Accident already exists into the database';
END
GO


PRINT 'Creating the AccidentType table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[AccidentType]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AccidentType](
		[AccidentTypeKey] [int] IDENTITY(1,1) NOT NULL,
		[ParentKey] [int] NULL,
		[Name] [varchar](80) NOT NULL,
		[Description] [varchar](400) NOT NULL,
		[State] [varchar](15) NOT NULL,
		[HaveSubType] [bit] NOT NULL,
	 CONSTRAINT [PK_OccurrenceType] PRIMARY KEY CLUSTERED
	(
		[AccidentTypeKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table AccidentType already exists into the database';
END
GO


PRINT 'Creating the AfectedEmployee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[AfectedEmployee]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AfectedEmployee](
		[AfectedEmployeeKey] [int] IDENTITY(1,1) NOT NULL,
		[AccidentKey] [int] NOT NULL,
		[EmployeeKey] [int] NOT NULL,
	 CONSTRAINT [PK_AfectedEmployee] PRIMARY KEY CLUSTERED
	(
		[AfectedEmployeeKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table AfectedEmployee already exists into the database';
END
GO


PRINT 'Creating the City table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[City]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[City](
		[Code] [varchar](3) NOT NULL,
		[Name] [varchar](50) NULL,
		[CountryKey] [int] NOT NULL,
		[CityKey] [int] IDENTITY(1,1) NOT NULL,
	 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED
	(
		[CityKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table City already exists into the database';
END
GO


PRINT 'Creating the ContactInformation table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[ContactInformation]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[ContactInformation](
		[ContactInformationKey] [int] IDENTITY(1,1) NOT NULL,
		[TypeContactKey] [int] NOT NULL,
		[EmployeeKey] [int] NOT NULL,
		[Value] [varchar](100) NOT NULL,
		[Reference] [varchar](50) NULL,
	 CONSTRAINT [PK_Comunicacion] PRIMARY KEY CLUSTERED
	(
		[ContactInformationKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table ContactInformation already exists into the database';
END
GO


PRINT 'Creating the CorrectiveActionFile table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[CorrectiveActionFile]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[CorrectiveActionFile](
		[CorrectiveActionFileKey] [int] IDENTITY(1,1) NOT NULL,
		[NameFile] [varchar](200) NOT NULL,
		[CorrectiveActionKey] [int] NOT NULL,
		[EmployeKey] [int] NULL,
	 CONSTRAINT [PK_CorrectiveActionFile] PRIMARY KEY CLUSTERED
	(
		[CorrectiveActionFileKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table CorrectiveActionFile already exists into the database';
END
GO


PRINT 'Creating the CorrectiveActions table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[CorrectiveActions]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[CorrectiveActions](
		[CorrectiveActionKey] [int] IDENTITY(1,1) NOT NULL,
		[InvestigationKey] [int] NOT NULL,
		[Description] [varchar](3000) NULL,
		[DateExecute] [datetime] NULL,
		[Status] [varchar](50) NOT NULL,
		[DateEnd] [datetime] NULL,
		[ResponsibleEmployeeKey] [int] NOT NULL,
		[Observation] [varchar](5000) NULL,
		[EmpleadoKey] [int] NULL,
		[StatusAccion] [int] NULL,
		[ParentKey] [int] NULL,
	 CONSTRAINT [PK_CorrectiveActions] PRIMARY KEY CLUSTERED
	(
		[CorrectiveActionKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table CorrectiveActions already exists into the database';
END
GO


PRINT 'Creating the Country table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Country]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[Country](
		[Code] [varchar](3) NOT NULL,
		[Name] [varchar](50) NULL,
		[CountryKey] [int] IDENTITY(1,1) NOT NULL,
	 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED
	(
		[CountryKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Country already exists into the database';
END
GO


PRINT 'Creating the Currency table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Currency]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Currency](
	[CurrencyKey] [int] IDENTITY(1,1) NOT NULL,
	[CountryKey] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Status] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED
(
	[CurrencyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Currency already exists into the database';
END
GO


PRINT 'Creating the DocumentType table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DocumentType]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DocumentType](
		[DocumentTypeKey] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](50) NOT NULL,
		[Status] [varchar](1) NOT NULL,
		[Repeat] [varchar](2) NULL,
	 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED
	(
		[DocumentTypeKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table DocumentType already exists into the database';
END
GO


PRINT 'Creating the Employee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Employee]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[Employee](
		[EmployeeKey] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[OrganizationKey] [int] NOT NULL,
		[EmployeeCode] [varchar](15) NULL,
		[FirstName] [varchar](150) NULL,
		[LastName] [varchar](40) NULL,
		[BirthDate] [datetime] NULL,
		[Gender] [varchar](2) NULL,
		[Nationality] [varchar](50) NULL,
		[AdmissionDate] [datetime] NULL,
		[Status] [char](1) NOT NULL,
		[Photo] [varchar](1) NULL,
		[RegistrationDate] [datetime] NULL,
	 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED
	(
		[EmployeeKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Employee already exists into the database';
END
GO


PRINT 'Creating the Equipment table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Equipment]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Equipment](
	[EquipmentKey] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentTypeKey] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED
(
	[EquipmentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Equipment already exists into the database';
END
GO


PRINT 'Creating the EquipmentAssignment table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentAssignment]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[EquipmentAssignment](
		[EquipmentAssignmentKey] [int] IDENTITY(1,1) NOT NULL,
		[EquipmentKey] [int] NOT NULL,
		[UserKey] [int] NOT NULL,
		[EmployeeKey] [int] NOT NULL,
		[Date] [date] NOT NULL,
		[DateRegistration] [datetime] NOT NULL,
		[Status] [varchar](50) NOT NULL,
		[Observations] [varchar](500) NOT NULL,
	 CONSTRAINT [PK_EquipmentAssignment] PRIMARY KEY CLUSTERED
	(
		[EquipmentAssignmentKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table EquipmentAssignment already exists into the database';
END
GO


PRINT 'Creating the EquipmentReturn table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentReturn]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[EquipmentReturn](
		[EquipmentReturnKey] [int] IDENTITY(1,1) NOT NULL,
		[EquipmentKey] [int] NOT NULL,
		[UserKey] [int] NOT NULL,
		[EmployeeKey] [int] NOT NULL,
		[Date] [date] NOT NULL,
		[DateRegistration] [datetime] NOT NULL,
		[Status] [varchar](50) NOT NULL,
		[Observations] [varchar](500) NOT NULL,
	 CONSTRAINT [PK_EquipmentReturn] PRIMARY KEY CLUSTERED
	(
		[EquipmentReturnKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table EquipmentReturn already exists into the database';
END
GO


PRINT 'Creating the EquipmentType table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentType]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[EquipmentType](
		[EquipmentTypeKey] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](50) NOT NULL,
		[Description] [varchar](150) NOT NULL,
	 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED
	(
		[EquipmentTypeKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table EquipmentType already exists into the database';
END
GO


PRINT 'Creating the FinalRiskLevel table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[FinalRiskLevel]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[FinalRiskLevel](
		[FinalRiskLevelKey] [int] IDENTITY(1,1) NOT NULL,
		[RiskValueKey] [int] NOT NULL,
		[AccidentKey] [int] NOT NULL,
		[State] [varchar](15) NOT NULL,
		[DateRegister] [datetime] NOT NULL,
	 CONSTRAINT [PK_FinalIndicatorForm] PRIMARY KEY CLUSTERED
	(
		[FinalRiskLevelKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table FinalRiskLevel already exists into the database';
END
GO


PRINT 'Creating the HierarchicalLevel table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[HierarchicalLevel]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[HierarchicalLevel](
		[HierarchicalLevelKey] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](50) NOT NULL,
		[Level] [varchar](2) NOT NULL,
		[Status] [varchar](1) NOT NULL,
	 CONSTRAINT [PK_NivelJerarquico] PRIMARY KEY CLUSTERED
	(
		[HierarchicalLevelKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table HierarchicalLevel already exists into the database';
END
GO


PRINT 'Creating the InitialRiskLevel table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[InitialRiskLevel]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InitialRiskLevel](
	[InitialRiskLevelKey] [int] IDENTITY(1,1) NOT NULL,
	[RiskValueKey] [int] NOT NULL,
	[AccidentKey] [int] NOT NULL,
	[State] [varchar](50) NOT NULL,
	[DateRegister] [datetime] NOT NULL,
 CONSTRAINT [PK_IndicatorForm] PRIMARY KEY CLUSTERED
(
	[InitialRiskLevelKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table InitialRiskLevel already exists into the database';
END
GO


PRINT 'Creating the Institution table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Institution]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[Institution](
		[InstitutionKey] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](50) NOT NULL,
		[Type] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_Institution] PRIMARY KEY CLUSTERED
	(
		[InstitutionKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Institution already exists into the database';
END
GO


PRINT 'Creating the InventoryInput table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[InventoryInput]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[InventoryInput](
		[InventoryInputKey] [int] IDENTITY(1,1) NOT NULL,
		[EquipmentKey] [int] NOT NULL,
		[UserKey] [int] NOT NULL,
		[ProviderKey] [int] NOT NULL,
		[Date] [date] NOT NULL,
		[Quantity] [int] NOT NULL,
		[UnitPrice] [decimal](10, 2) NOT NULL,
		[DateRegistration] [datetime] NOT NULL,
	 CONSTRAINT [PK_InventoryInput] PRIMARY KEY CLUSTERED
	(
		[InventoryInputKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table InventoryInput already exists into the database';
END
GO


PRINT 'Creating the Investigation table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Investigation]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Investigation](
	[InvestigationKey] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[AffectedArea] [varchar](1000) NULL,
	[ShortDescription] [varchar](8000) NULL,
	[AnalysisRootCause] [varchar](4000) NULL,
	[Conclusions] [varchar](3000) NULL,
	[Recommendations] [varchar](3000) NULL,
	[ItWasSolved] [bit] NULL,
	[AccidentKey] [int] NOT NULL,
	[formSMSOrganigramaId] [int] NOT NULL,
	[ResponsibleEmployeeKey] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[DesignateEmployeKey] [int] NULL,
	[StatusInvestigation] [int] NULL,
	[RootCauseKey] [int] NULL,
	[CloseDate] [date] NULL,
 CONSTRAINT [PK_Investigation] PRIMARY KEY CLUSTERED
(
	[InvestigationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Investigation already exists into the database';
END
GO


PRINT 'Creating the Item table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Item]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[Item](
		[ItemKey] [int] IDENTITY(1,1) NOT NULL,
		[OrganizationKey] [int] NOT NULL,
		[TypeContractKey] [int] NOT NULL,
		[ItemNumber] [varchar](20) NOT NULL,
		[PositionKey] [int] NOT NULL,
		[SalaryScaleKey] [int] NOT NULL,
		[Code] [varchar](20) NOT NULL,
		[Status] [varchar](1) NOT NULL,
		[CityKey] [int] NULL,
	 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED
	(
		[ItemKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Item already exists into the database';
END
GO


PRINT 'Creating the Organization table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Organization]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Organization](
	[OrganizationKey] [int] IDENTITY(1,1) NOT NULL,
	[HierarchicalLevelKey] [int] NOT NULL,
	[IdPadre] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
	[Status] [char](1) NOT NULL,
	[Gestion] [varchar](4) NULL,
 CONSTRAINT [PK_Organigrama] PRIMARY KEY CLUSTERED
(
	[OrganizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Organization already exists into the database';
END
GO


PRINT 'Creating the OrganizationalHierarchy table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[OrganizationalHierarchy]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrganizationalHierarchy](
	[OrganizationalHierarchyKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrganizationalHierarchy] PRIMARY KEY CLUSTERED
(
	[OrganizationalHierarchyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table OrganizationalHierarchy already exists into the database';
END
GO


PRINT 'Creating the PersonalDocument table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[PersonalDocument]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonalDocument](
	[PersonalDocumentKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[DocumentKey] [int] NOT NULL,
	[Number] [varchar](50) NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[Observation] [varchar](250) NOT NULL,
	[Digital] [varbinary](max) NULL,
	[Status] [varchar](2) NOT NULL,
	[Reference] [varchar](4) NULL,
 CONSTRAINT [PK_DocumentoPersonal] PRIMARY KEY CLUSTERED
(
	[PersonalDocumentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table PersonalDocument already exists into the database';
END
GO


PRINT 'Creating the Position table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Position]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Position](
	[PositionKey] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationalHierarchyKey] [int] NULL,
	[Name] [varchar](200) NOT NULL,
	[Education] [varchar](500) NULL,
	[Status] [varchar](1) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Cargo_1] PRIMARY KEY CLUSTERED
(
	[PositionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Position already exists into the database';
END
GO


PRINT 'Creating the PositionHistorical table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[PositionHistorical]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PositionHistorical](
	[historialCargoID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[ItemKey] [int] NOT NULL,
	[MemoNumber] [varchar](512) NOT NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
	[Status] [char](1) NOT NULL,
	[ResponsibleKey] [int] NOT NULL,
	[ApprovalDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HistorialCargo] PRIMARY KEY CLUSTERED
(
	[historialCargoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table PositionHistorical already exists into the database';
END
GO

PRINT 'Creating the RiskMatrix table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[RiskMatrix]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RiskMatrix](
	[RiskMatrixId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](512) NOT NULL,
	[InitialDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Status] [varchar](50) NOT NULL,
	[ValueN] [int] NOT NULL,
	[ValueM] [int] NOT NULL,
	[TolerabilidadColor1] [varchar](50) NULL,
	[TolerabilidadColor2] [varchar](50) NULL,
	[TolerabilidadColor3] [varchar](50) NULL,
	[PlazoColor1] [int] NULL,
	[PlazoColor2] [int] NULL,
	[PlazoColor3] [int] NULL,
 CONSTRAINT [PK_RiskMatrix] PRIMARY KEY CLUSTERED
(
	[RiskMatrixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table RiskMatrix already exists into the database';
END
GO

PRINT 'Creating the Probability table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Probability]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Probability](
	[ProbabilityKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IndiceP] [int] NOT NULL,
	[indicatorBaseKey] [int] NOT NULL,
 CONSTRAINT [PK_Probability] PRIMARY KEY CLUSTERED
(
	[ProbabilityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Probability already exists into the database';
END
GO


PRINT 'Creating the Profession table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Profession]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Profession](
	[ProfessionKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[StudyingTime] [int] NOT NULL,
 CONSTRAINT [PK_Profession] PRIMARY KEY CLUSTERED
(
	[ProfessionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Profession already exists into the database';
END
GO


PRINT 'Creating the Provider table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Provider]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Provider](
	[ProviderKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Contact] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED
(
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Provider already exists into the database';
END
GO


PRINT 'Creating the RiskValue table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[RiskValue]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RiskValue](
	[RiskValueKey] [int] IDENTITY(1,1) NOT NULL,
	[probabilityId] [int] NOT NULL,
	[severityId] [int] NOT NULL,
	[daysToResolve] [int] NULL,
	[color] [varchar](20) NOT NULL,
 CONSTRAINT [PK_IndicatorValue] PRIMARY KEY CLUSTERED
(
	[RiskValueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table RiskValue already exists into the database';
END
GO


PRINT 'Creating the Rol table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Rol]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rol](
	[RolKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED
(
	[RolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Rol already exists into the database';
END
GO


PRINT 'Creating the RootCause table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[RootCause]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RootCause](
	[RootCauseKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](5000) NOT NULL,
	[Details] [varchar](2000) NULL,
	[status] [varchar](2) NOT NULL,
	[code] [varchar](8) NULL,
 CONSTRAINT [PK_RootCause] PRIMARY KEY CLUSTERED
(
	[RootCauseKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table RootCause already exists into the database';
END
GO


PRINT 'Creating the SalaryScale table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[SalaryScale]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SalaryScale](
	[SalaryScaleKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[NumberCases] [int] NULL,
	[BasicSalary] [decimal](10, 2) NOT NULL,
	[Status] [varchar](1) NOT NULL,
	[Start] [varchar](25) NULL,
	[End] [varchar](25) NULL,
 CONSTRAINT [PK_EscalaSalarial] PRIMARY KEY CLUSTERED
(
	[SalaryScaleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table SalaryScale already exists into the database';
END
GO


PRINT 'Creating the Severity table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Severity]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Severity](
	[SeverityKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Personnel] [varchar](128) NOT NULL,
	[Enviroment] [varchar](128) NOT NULL,
	[Material] [int] NOT NULL,
	[Mission] [varchar](512) NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[indicatorBaseKey] [int] NOT NULL,
 CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED
(
	[SeverityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Severity already exists into the database';
END
GO


PRINT 'Creating the Skill table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Skill]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Skill](
	[SkillKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED
(
	[SkillKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Skill already exists into the database';
END
GO


PRINT 'Creating the SkillsPosition table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[SkillsPosition]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[SkillsPosition](
		[SkillPositionKey] [int] IDENTITY(1,1) NOT NULL,
		[PositionKey] [int] NULL,
		[SkillKey] [int] NOT NULL,
		[Level] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_SkillsPosition] PRIMARY KEY CLUSTERED
	(
		[SkillPositionKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table SkillsPosition already exists into the database';
END
GO


PRINT 'Creating the SuggestionProblem table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[SuggestionProblem]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[SuggestionProblem](
		[suggestionProblemId] [int] IDENTITY(1,1) NOT NULL,
		[formSMSId] [int] NOT NULL,
		[Description] [varchar](1000) NOT NULL,
		[DateRegistre] [datetime] NOT NULL,
		[Status] [varchar](100) NOT NULL,
		[usuario] [varchar](100) NULL,
	 CONSTRAINT [PK_SuggestionProblem] PRIMARY KEY CLUSTERED
	(
		[suggestionProblemId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table SuggestionProblem already exists into the database';
END
GO


PRINT 'Creating the Training table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Training]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[Training](
		[TrainingKey] [int] IDENTITY(1,1) NOT NULL,
		[Description] [varchar](300) NULL,
	 CONSTRAINT [PK_Training] PRIMARY KEY CLUSTERED
	(
		[TrainingKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Training already exists into the database';
END
GO


PRINT 'Creating the TrainingPosition table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[TrainingPosition]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TrainingPosition](
	[TrainingPositionKey] [int] IDENTITY(1,1) NOT NULL,
	[PositionKey] [int] NOT NULL,
	[TrainingKey] [int] NOT NULL,
	[Optional] [bit] NOT NULL,
 CONSTRAINT [PK_TrainingPosition] PRIMARY KEY CLUSTERED
(
	[TrainingPositionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table TrainingPosition already exists into the database';
END
GO


PRINT 'Creating the TypeContact table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[TypeContact]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[TypeContact](
		[TypeContactKey] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_TipoComunicacion] PRIMARY KEY CLUSTERED
	(
		[TypeContactKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table TypeContact already exists into the database';
END
GO


PRINT 'Creating the TypeContract table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[TypeContract]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[TypeContract](
		[TypeContractKey] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](50) NOT NULL,
		[Code] [varchar](5) NOT NULL,
		[Status] [varchar](1) NOT NULL,
	 CONSTRAINT [PK_TipoContrato] PRIMARY KEY CLUSTERED
	(
		[TypeContractKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table TypeContract already exists into the database';
END
GO


PRINT 'Creating the User table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[User]')
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[User](
		[UserKey] [int] IDENTITY(1,1) NOT NULL,
		[EmployeeKey] [int] NOT NULL,
		[RolKey] [int] NOT NULL,
		[UserName] [varchar](50) NOT NULL,
		[Password] [varchar](150) NOT NULL,
		[Status] [varchar](5) NOT NULL,
	 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED
	(
		[UserKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table User already exists into the database';
END
GO


PRINT 'Creating the WorkExperience table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[WorkExperience]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkExperience](
	[WorkExperienceKey] [int] IDENTITY(1,1) NOT NULL,
	[InstitutionKey] [int] NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[CityKey] [int] NOT NULL,
	[Position] [varchar](200) NOT NULL,
	[Start] [date] NOT NULL,
	[End] [date] NOT NULL,
	[ReasonChange] [varchar](500) NOT NULL,
 CONSTRAINT [PK_ExperienciaLaboral] PRIMARY KEY CLUSTERED
(
	[WorkExperienceKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table WorkExperience already exists into the database';
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcademicInformation_City]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[AcademicInformation]'))
BEGIN
	ALTER TABLE [dbo].[AcademicInformation]  WITH CHECK ADD  CONSTRAINT [FK_AcademicInformation_City] FOREIGN KEY([CityKey])
	REFERENCES [dbo].[City] ([CityKey])

	ALTER TABLE [dbo].[AcademicInformation] CHECK CONSTRAINT [FK_AcademicInformation_City]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcademicInformation_Employee]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[AcademicInformation]'))
BEGIN
	ALTER TABLE [dbo].[AcademicInformation]  WITH CHECK ADD  CONSTRAINT [FK_AcademicInformation_Employee] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[AcademicInformation] CHECK CONSTRAINT [FK_AcademicInformation_Employee]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcademicInformation_Profession]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[AcademicInformation]'))
BEGIN
	ALTER TABLE [dbo].[AcademicInformation]  WITH CHECK ADD  CONSTRAINT [FK_AcademicInformation_Profession] FOREIGN KEY([ProfessionKey])
	REFERENCES [dbo].[Profession] ([ProfessionKey])

	ALTER TABLE [dbo].[AcademicInformation] CHECK CONSTRAINT [FK_AcademicInformation_Profession]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_DatosAcademicos_NivelAcademico]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[AcademicInformation]'))
BEGIN
	ALTER TABLE [dbo].[AcademicInformation]  WITH CHECK ADD  CONSTRAINT [FK_DatosAcademicos_NivelAcademico] FOREIGN KEY([AcademicLevelKey])
	REFERENCES [dbo].[AcademicLevel] ([AcademicLevelKey])

	ALTER TABLE [dbo].[AcademicInformation] CHECK CONSTRAINT [FK_DatosAcademicos_NivelAcademico]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_FormSMS_OccurrenceType]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Accident]'))
BEGIN
	ALTER TABLE [dbo].[Accident]  WITH CHECK ADD  CONSTRAINT [FK_FormSMS_OccurrenceType] FOREIGN KEY([AccidentTypeKey])
	REFERENCES [dbo].[AccidentType] ([AccidentTypeKey])

	ALTER TABLE [dbo].[Accident] CHECK CONSTRAINT [FK_FormSMS_OccurrenceType]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_AfectedEmployee_FormSMS]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[AfectedEmployee]'))
BEGIN
	ALTER TABLE [dbo].[AfectedEmployee]  WITH CHECK ADD  CONSTRAINT [FK_AfectedEmployee_FormSMS] FOREIGN KEY([AccidentKey])
	REFERENCES [dbo].[Accident] ([AccidentKey])

	ALTER TABLE [dbo].[AfectedEmployee] CHECK CONSTRAINT [FK_AfectedEmployee_FormSMS]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Country]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
BEGIN
	ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryKey])
	REFERENCES [dbo].[Country] ([CountryKey])

	ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comunicacion_TipoComunicacion]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[ContactInformation]'))
BEGIN
	ALTER TABLE [dbo].[ContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_Comunicacion_TipoComunicacion] FOREIGN KEY([TypeContactKey])
	REFERENCES [dbo].[TypeContact] ([TypeContactKey])

	ALTER TABLE [dbo].[ContactInformation] CHECK CONSTRAINT [FK_Comunicacion_TipoComunicacion]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContactInformation_Employee]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[ContactInformation]'))
BEGIN
	ALTER TABLE [dbo].[ContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_ContactInformation_Employee] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[ContactInformation] CHECK CONSTRAINT [FK_ContactInformation_Employee]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorrectiveActionFile_CorrectiveActions]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[CorrectiveActionFile]'))
BEGIN
	ALTER TABLE [dbo].[CorrectiveActionFile]  WITH CHECK ADD  CONSTRAINT [FK_CorrectiveActionFile_CorrectiveActions] FOREIGN KEY([CorrectiveActionKey])
	REFERENCES [dbo].[CorrectiveActions] ([CorrectiveActionKey])

	ALTER TABLE [dbo].[CorrectiveActionFile] CHECK CONSTRAINT [FK_CorrectiveActionFile_CorrectiveActions]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorrectiveActions_Investigation]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[CorrectiveActions]'))
BEGIN
	ALTER TABLE [dbo].[CorrectiveActions]  WITH CHECK ADD  CONSTRAINT [FK_CorrectiveActions_Investigation] FOREIGN KEY([InvestigationKey])
	REFERENCES [dbo].[Investigation] ([InvestigationKey])

	ALTER TABLE [dbo].[CorrectiveActions] CHECK CONSTRAINT [FK_CorrectiveActions_Investigation]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Currency_Country]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Currency]'))
BEGIN
	ALTER TABLE [dbo].[Currency]  WITH CHECK ADD  CONSTRAINT [FK_Currency_Country] FOREIGN KEY([CountryKey])
	REFERENCES [dbo].[Country] ([CountryKey])

	ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_Country]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Organization]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
BEGIN
	ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Organization] FOREIGN KEY([OrganizationKey])
	REFERENCES [dbo].[Organization] ([OrganizationKey])

	ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Organization]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Equipment_EquipmentType]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Equipment]'))
BEGIN
	ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentType] FOREIGN KEY([EquipmentTypeKey])
	REFERENCES [dbo].[EquipmentType] ([EquipmentTypeKey])

	ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentType]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentAssignment_Employee]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentAssignment]'))
BEGIN
	ALTER TABLE [dbo].[EquipmentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentAssignment_Employee] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[EquipmentAssignment] CHECK CONSTRAINT [FK_EquipmentAssignment_Employee]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentAssignment_Equipment]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentAssignment]'))
BEGIN
	ALTER TABLE [dbo].[EquipmentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentAssignment_Equipment] FOREIGN KEY([EquipmentKey])
	REFERENCES [dbo].[Equipment] ([EquipmentKey])

	ALTER TABLE [dbo].[EquipmentAssignment] CHECK CONSTRAINT [FK_EquipmentAssignment_Equipment]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentAssignment_User]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentAssignment]'))
BEGIN
	ALTER TABLE [dbo].[EquipmentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentAssignment_User] FOREIGN KEY([UserKey])
	REFERENCES [dbo].[User] ([UserKey])

	ALTER TABLE [dbo].[EquipmentAssignment] CHECK CONSTRAINT [FK_EquipmentAssignment_User]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentReturn_Employee]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentReturn]'))
BEGIN
	ALTER TABLE [dbo].[EquipmentReturn]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentReturn_Employee] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[EquipmentReturn] CHECK CONSTRAINT [FK_EquipmentReturn_Employee]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentReturn_Equipment]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentReturn]'))
BEGIN
	ALTER TABLE [dbo].[EquipmentReturn]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentReturn_Equipment] FOREIGN KEY([EquipmentKey])
	REFERENCES [dbo].[Equipment] ([EquipmentKey])

	ALTER TABLE [dbo].[EquipmentReturn] CHECK CONSTRAINT [FK_EquipmentReturn_Equipment]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentReturn_User]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentReturn]'))
BEGIN
	ALTER TABLE [dbo].[EquipmentReturn]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentReturn_User] FOREIGN KEY([UserKey])
	REFERENCES [dbo].[User] ([UserKey])

	ALTER TABLE [dbo].[EquipmentReturn] CHECK CONSTRAINT [FK_EquipmentReturn_User]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_FinalIndicatorForm_FormSMS]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[FinalRiskLevel]'))
BEGIN
	ALTER TABLE [dbo].[FinalRiskLevel]  WITH CHECK ADD  CONSTRAINT [FK_FinalIndicatorForm_FormSMS] FOREIGN KEY([AccidentKey])
	REFERENCES [dbo].[Accident] ([AccidentKey])

	ALTER TABLE [dbo].[FinalRiskLevel] CHECK CONSTRAINT [FK_FinalIndicatorForm_FormSMS]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_FinalIndicatorForm_IndicatorValue]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[FinalRiskLevel]'))
BEGIN
	ALTER TABLE [dbo].[FinalRiskLevel]  WITH CHECK ADD  CONSTRAINT [FK_FinalIndicatorForm_IndicatorValue] FOREIGN KEY([RiskValueKey])
	REFERENCES [dbo].[RiskValue] ([RiskValueKey])

	ALTER TABLE [dbo].[FinalRiskLevel] CHECK CONSTRAINT [FK_FinalIndicatorForm_IndicatorValue]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_IndicatorForm_FormSMS]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[InitialRiskLevel]'))
BEGIN
	ALTER TABLE [dbo].[InitialRiskLevel]  WITH CHECK ADD  CONSTRAINT [FK_IndicatorForm_FormSMS] FOREIGN KEY([AccidentKey])
	REFERENCES [dbo].[Accident] ([AccidentKey])

	ALTER TABLE [dbo].[InitialRiskLevel] CHECK CONSTRAINT [FK_IndicatorForm_FormSMS]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_IndicatorForm_IndicatorValue]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[InitialRiskLevel]'))
BEGIN
	ALTER TABLE [dbo].[InitialRiskLevel]  WITH CHECK ADD  CONSTRAINT [FK_IndicatorForm_IndicatorValue] FOREIGN KEY([RiskValueKey])
	REFERENCES [dbo].[RiskValue] ([RiskValueKey])

	ALTER TABLE [dbo].[InitialRiskLevel] CHECK CONSTRAINT [FK_IndicatorForm_IndicatorValue]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_InventoryInput_Equipment]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[InventoryInput]'))
BEGIN
	ALTER TABLE [dbo].[InventoryInput]  WITH CHECK ADD  CONSTRAINT [FK_InventoryInput_Equipment] FOREIGN KEY([EquipmentKey])
	REFERENCES [dbo].[Equipment] ([EquipmentKey])

	ALTER TABLE [dbo].[InventoryInput] CHECK CONSTRAINT [FK_InventoryInput_Equipment]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_InventoryInput_Provider]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[InventoryInput]'))
BEGIN
	ALTER TABLE [dbo].[InventoryInput]  WITH CHECK ADD  CONSTRAINT [FK_InventoryInput_Provider] FOREIGN KEY([ProviderKey])
	REFERENCES [dbo].[Provider] ([ProviderKey])

	ALTER TABLE [dbo].[InventoryInput] CHECK CONSTRAINT [FK_InventoryInput_Provider]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_InventoryInput_User]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[InventoryInput]'))
BEGIN
	ALTER TABLE [dbo].[InventoryInput]  WITH CHECK ADD  CONSTRAINT [FK_InventoryInput_User] FOREIGN KEY([UserKey])
	REFERENCES [dbo].[User] ([UserKey])

	ALTER TABLE [dbo].[InventoryInput] CHECK CONSTRAINT [FK_InventoryInput_User]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Investigation_FormSMS]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Investigation]'))
BEGIN
	ALTER TABLE [dbo].[Investigation]  WITH CHECK ADD  CONSTRAINT [FK_Investigation_FormSMS] FOREIGN KEY([AccidentKey])
	REFERENCES [dbo].[Accident] ([AccidentKey])

	ALTER TABLE [dbo].[Investigation] CHECK CONSTRAINT [FK_Investigation_FormSMS]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Investigation_RootCause]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Investigation]'))
BEGIN
	ALTER TABLE [dbo].[Investigation]  WITH CHECK ADD  CONSTRAINT [FK_Investigation_RootCause] FOREIGN KEY([RootCauseKey])
	REFERENCES [dbo].[RootCause] ([RootCauseKey])

	ALTER TABLE [dbo].[Investigation] CHECK CONSTRAINT [FK_Investigation_RootCause]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Cargo]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
BEGIN
	ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Cargo] FOREIGN KEY([PositionKey])
	REFERENCES [dbo].[Position] ([PositionKey])

	ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Cargo]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_EscalaSalarial]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
BEGIN
	ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_EscalaSalarial] FOREIGN KEY([SalaryScaleKey])
	REFERENCES [dbo].[SalaryScale] ([SalaryScaleKey])

	ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_EscalaSalarial]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Organigrama]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
BEGIN
	ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Organigrama] FOREIGN KEY([OrganizationKey])
	REFERENCES [dbo].[Organization] ([OrganizationKey])

	ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Organigrama]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_TipoContrato]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
BEGIN
	ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_TipoContrato] FOREIGN KEY([TypeContractKey])
	REFERENCES [dbo].[TypeContract] ([TypeContractKey])

	ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_TipoContrato]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Organization_HierarchicalLevel]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Organization]'))
BEGIN
	ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_HierarchicalLevel] FOREIGN KEY([HierarchicalLevelKey])
	REFERENCES [dbo].[HierarchicalLevel] ([HierarchicalLevelKey])

	ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_HierarchicalLevel]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocumentoPersonal_Documento]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[PersonalDocument]'))
BEGIN
	ALTER TABLE [dbo].[PersonalDocument]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoPersonal_Documento] FOREIGN KEY([DocumentKey])
	REFERENCES [dbo].[DocumentType] ([DocumentTypeKey])

	ALTER TABLE [dbo].[PersonalDocument] CHECK CONSTRAINT [FK_DocumentoPersonal_Documento]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonalDocument_Employee]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[PersonalDocument]'))
BEGIN
	ALTER TABLE [dbo].[PersonalDocument]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDocument_Employee] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[PersonalDocument] CHECK CONSTRAINT [FK_PersonalDocument_Employee]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_Position_OrganizationalHierarchy]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Position]'))
BEGIN
	ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_Position_OrganizationalHierarchy] FOREIGN KEY([OrganizationalHierarchyKey])
	REFERENCES [dbo].[OrganizationalHierarchy] ([OrganizationalHierarchyKey])

	ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_Position_OrganizationalHierarchy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialCargo_Empleado]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[PositionHistorical]'))
BEGIN
	ALTER TABLE [dbo].[PositionHistorical]  WITH CHECK ADD  CONSTRAINT [FK_HistorialCargo_Empleado] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[PositionHistorical] CHECK CONSTRAINT [FK_HistorialCargo_Empleado]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialCargo_Item]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[PositionHistorical]'))
BEGIN
	ALTER TABLE [dbo].[PositionHistorical]  WITH CHECK ADD  CONSTRAINT [FK_HistorialCargo_Item] FOREIGN KEY([ItemKey])
	REFERENCES [dbo].[Item] ([ItemKey])

	ALTER TABLE [dbo].[PositionHistorical] CHECK CONSTRAINT [FK_HistorialCargo_Item]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_IndicatorValue_Probability]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[RiskValue]'))
BEGIN
	ALTER TABLE [dbo].[RiskValue]  WITH CHECK ADD  CONSTRAINT [FK_IndicatorValue_Probability] FOREIGN KEY([probabilityId])
	REFERENCES [dbo].[Probability] ([ProbabilityKey])

	ALTER TABLE [dbo].[RiskValue] CHECK CONSTRAINT [FK_IndicatorValue_Probability]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_IndicatorValue_Severity]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[RiskValue]'))
BEGIN
	ALTER TABLE [dbo].[RiskValue]  WITH CHECK ADD  CONSTRAINT [FK_IndicatorValue_Severity] FOREIGN KEY([severityId])
	REFERENCES [dbo].[Severity] ([SeverityKey])

	ALTER TABLE [dbo].[RiskValue] CHECK CONSTRAINT [FK_IndicatorValue_Severity]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalaryScale_Currency]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[SalaryScale]'))
BEGIN
	ALTER TABLE [dbo].[SalaryScale]  WITH CHECK ADD  CONSTRAINT [FK_SalaryScale_Currency] FOREIGN KEY([CurrencyKey])
	REFERENCES [dbo].[Currency] ([CurrencyKey])

	ALTER TABLE [dbo].[SalaryScale] CHECK CONSTRAINT [FK_SalaryScale_Currency]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_SkillsPosition_Position]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[SkillsPosition]'))
BEGIN
	ALTER TABLE [dbo].[SkillsPosition]  WITH CHECK ADD  CONSTRAINT [FK_SkillsPosition_Position] FOREIGN KEY([PositionKey])
	REFERENCES [dbo].[Position] ([PositionKey])

	ALTER TABLE [dbo].[SkillsPosition] CHECK CONSTRAINT [FK_SkillsPosition_Position]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_SkillsPosition_Skill]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[SkillsPosition]'))
BEGIN
	ALTER TABLE [dbo].[SkillsPosition]  WITH CHECK ADD  CONSTRAINT [FK_SkillsPosition_Skill] FOREIGN KEY([SkillKey])
	REFERENCES [dbo].[Skill] ([SkillKey])

	ALTER TABLE [dbo].[SkillsPosition] CHECK CONSTRAINT [FK_SkillsPosition_Skill]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_SuggestionProblem_FormSMS]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[SuggestionProblem]'))
BEGIN
	ALTER TABLE [dbo].[SuggestionProblem]  WITH CHECK ADD  CONSTRAINT [FK_SuggestionProblem_FormSMS] FOREIGN KEY([formSMSId])
	REFERENCES [dbo].[Accident] ([AccidentKey])

	ALTER TABLE [dbo].[SuggestionProblem] CHECK CONSTRAINT [FK_SuggestionProblem_FormSMS]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrainingPosition_Position]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[TrainingPosition]'))
BEGIN
	ALTER TABLE [dbo].[TrainingPosition]  WITH CHECK ADD  CONSTRAINT [FK_TrainingPosition_Position] FOREIGN KEY([PositionKey])
	REFERENCES [dbo].[Position] ([PositionKey])

	ALTER TABLE [dbo].[TrainingPosition] CHECK CONSTRAINT [FK_TrainingPosition_Position]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrainingPosition_Training]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[TrainingPosition]'))
BEGIN
	ALTER TABLE [dbo].[TrainingPosition]  WITH CHECK ADD  CONSTRAINT [FK_TrainingPosition_Training] FOREIGN KEY([TrainingKey])
	REFERENCES [dbo].[Training] ([TrainingKey])

	ALTER TABLE [dbo].[TrainingPosition] CHECK CONSTRAINT [FK_TrainingPosition_Training]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Employee]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
BEGIN
	ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Employee] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Employee]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Rol]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
BEGIN
	ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Rol] FOREIGN KEY([RolKey])
	REFERENCES [dbo].[Rol] ([RolKey])

	ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Rol]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkExperience_City]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[WorkExperience]'))
BEGIN
	ALTER TABLE [dbo].[WorkExperience]  WITH CHECK ADD  CONSTRAINT [FK_WorkExperience_City] FOREIGN KEY([CityKey])
	REFERENCES [dbo].[City] ([CityKey])

	ALTER TABLE [dbo].[WorkExperience] CHECK CONSTRAINT [FK_WorkExperience_City]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkExperience_Employee]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[WorkExperience]'))
BEGIN
	ALTER TABLE [dbo].[WorkExperience]  WITH CHECK ADD  CONSTRAINT [FK_WorkExperience_Employee] FOREIGN KEY([EmployeeKey])
	REFERENCES [dbo].[Employee] ([EmployeeKey])

	ALTER TABLE [dbo].[WorkExperience] CHECK CONSTRAINT [FK_WorkExperience_Employee]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkExperience_Institution]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[WorkExperience]'))
BEGIN
	ALTER TABLE [dbo].[WorkExperience]  WITH CHECK ADD  CONSTRAINT [FK_WorkExperience_Institution] FOREIGN KEY([InstitutionKey])
	REFERENCES [dbo].[Institution] ([InstitutionKey])

	ALTER TABLE [dbo].[WorkExperience] CHECK CONSTRAINT [FK_WorkExperience_Institution]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_RiskMatrix_Probability]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Probability]'))
BEGIN
	ALTER TABLE [dbo].[Probability]  WITH CHECK ADD  CONSTRAINT [FK_RiskMatrix_Probability] FOREIGN KEY([indicatorBaseKey])
	REFERENCES [dbo].[RiskMatrix] ([RiskMatrixId])

	ALTER TABLE [dbo].[Probability] CHECK CONSTRAINT [FK_RiskMatrix_Probability]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_RiskMatrix_Severity]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Severity]'))
BEGIN
	ALTER TABLE [dbo].[Severity]  WITH CHECK ADD  CONSTRAINT [FK_RiskMatrix_Severity] FOREIGN KEY([indicatorBaseKey])
	REFERENCES [dbo].[RiskMatrix] ([RiskMatrixId])

	ALTER TABLE [dbo].[Severity] CHECK CONSTRAINT [FK_RiskMatrix_Severity]
END
GO

PRINT 'Creating the NOTIFICATION table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Notification]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Notification](
	[Notificationkey] [int] IDENTITY(1,1) NOT NULL,
	[politicsName] [varchar](max) NOT NULL,
	[PoliticsKey] [int] NOT NULL,
	[UserKey] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED
(
	[Notificationkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table NOTIFICATION already exists into the database';
END
PRINT 'Creating the NOTIFICATION table...';
GO
PRINT 'Creating the Politics table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Politics]')
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Politics](
	[PoliticsKey] [int] IDENTITY(1,1) NOT NULL,
	[PoliticsName] [varchar](max) NOT NULL,
	[PoliticsDescrip] [varchar](max) NULL,
 CONSTRAINT [PK_Politics] PRIMARY KEY CLUSTERED
(
	[PoliticsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
ELSE
BEGIN
	PRINT 'Table Politics already exists into the database';
END
PRINT 'Creating the NOTIFICATION table...';
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
	WHERE object_id = OBJECT_ID(N'[dbo].[FK_RiskMatrix_Severity]')
	AND parent_object_id = OBJECT_ID(N'[dbo].[Severity]'))
BEGIN
	ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Politics] FOREIGN KEY([PoliticsKey])
	REFERENCES [dbo].[Politics] ([PoliticsKey])

	ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Politics]
END
GO

