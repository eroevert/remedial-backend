/******************************************************************************
**  Name: [SysSecurity]
**  Desc: Script para la inicializacion de datos de la DB SysSecurity (Parte 2)
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
*******************************************************************************/
USE [SysSecurity]
GO

SET XACT_ABORT ON; 
SET NOCOUNT ON;

SET IDENTITY_INSERT [dbo].[AcademicLevel] OFF
SET IDENTITY_INSERT [dbo].[Currency] OFF
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
SET IDENTITY_INSERT [dbo].[EquipmentType] OFF
SET IDENTITY_INSERT [dbo].[Equipment] OFF
SET IDENTITY_INSERT [dbo].[HierarchicalLevel] OFF
SET IDENTITY_INSERT [dbo].[Organization] OFF
SET IDENTITY_INSERT [dbo].[OrganizationalHierarchy] OFF
SET IDENTITY_INSERT [dbo].[Profession] OFF
SET IDENTITY_INSERT [dbo].[Provider] OFF
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Skill] OFF
SET IDENTITY_INSERT [dbo].[TypeContact] OFF
SET IDENTITY_INSERT [dbo].[AccidentType] OFF
SET IDENTITY_INSERT [dbo].[RiskMatrix] OFF
SET IDENTITY_INSERT [dbo].[Probability] OFF
SET IDENTITY_INSERT [dbo].[Severity] OFF
SET IDENTITY_INSERT [dbo].[RiskValue] OFF
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[SalaryScale] OFF
SET IDENTITY_INSERT [dbo].[TypeContract] OFF
SET IDENTITY_INSERT [dbo].[Item] OFF


delete from [dbo].[PositionHistorical]
delete from [dbo].[Item]
delete from [dbo].[SalaryScale]
delete from [dbo].[EquipmentAssignment]
delete from [dbo].[User]
delete from [dbo].[Employee]
delete from [dbo].[RiskValue]
delete from [dbo].[Severity]
delete from [dbo].[Probability]
delete from [dbo].[RiskMatrix]
delete from [dbo].[AccidentType]
delete from [dbo].[TypeContact]
delete from [dbo].[TypeContract]
delete from [dbo].[Organization]
delete from [dbo].[Skill]
delete from [dbo].[Rol]
delete from [dbo].[Provider]
delete from [dbo].[Profession]
delete from [dbo].[Position]
delete from [dbo].[OrganizationalHierarchy]
delete from [dbo].[HierarchicalLevel]
delete from [dbo].[Equipment]
delete from [dbo].[EquipmentType]
delete from [dbo].[DocumentType]
delete from [dbo].[Currency]
delete from [dbo].[AcademicLevel]



DBCC CHECKIDENT ('[dbo].[AcademicLevel]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Currency]', reseed,0);
DBCC CHECKIDENT ('[dbo].[DocumentType]', reseed,0);
DBCC CHECKIDENT ('[dbo].[EquipmentType]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Equipment]', reseed,0);
DBCC CHECKIDENT ('[dbo].[HierarchicalLevel]', reseed,0);
DBCC CHECKIDENT ('[dbo].[OrganizationalHierarchy]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Profession]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Provider]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Rol]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Skill]', reseed,0);
DBCC CHECKIDENT ('[dbo].[TypeContact]', reseed,0);
DBCC CHECKIDENT ('[dbo].[TypeContract]', reseed,0);
DBCC CHECKIDENT ('[dbo].[AccidentType]', reseed,0);
DBCC CHECKIDENT ('[dbo].[RiskMatrix]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Probability]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Severity]', reseed,0);
DBCC CHECKIDENT ('[dbo].[RiskValue]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Employee]', reseed,0);
DBCC CHECKIDENT ('[dbo].[User]', reseed,0);
DBCC CHECKIDENT ('[dbo].[SalaryScale]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Organization]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Position]', reseed,0);
DBCC CHECKIDENT ('[dbo].[Item]', reseed,0);

BEGIN TRANSACTION;

PRINT 'Insercion de datos en tabla AcademicLevel...';

SET IDENTITY_INSERT [dbo].[AcademicLevel] ON
INSERT [dbo].[AcademicLevel] ([AcademicLevelKey], [Description], [Status])
VALUES (1, N'Tecnico Medio', N'1')
INSERT [dbo].[AcademicLevel] ([AcademicLevelKey], [Description], [Status])
VALUES (2, N'Tecnico Superior', N'1')
INSERT [dbo].[AcademicLevel] ([AcademicLevelKey], [Description], [Status])
VALUES (3, N'Licenciatura', N'1')
INSERT [dbo].[AcademicLevel] ([AcademicLevelKey], [Description], [Status])
VALUES (4, N'Maestria', N'1')
INSERT [dbo].[AcademicLevel] ([AcademicLevelKey], [Description], [Status])
VALUES (5, N'Doctorado', N'1')
SET IDENTITY_INSERT [dbo].[AcademicLevel] OFF

PRINT 'Insercion AcademicLevel Realizada...';

PRINT 'Insercion de datos en tabla AcademicLevel...';

SET IDENTITY_INSERT [dbo].[Currency] ON
INSERT [dbo].[Currency] ([CurrencyKey], [CountryKey], [Name], [Code], [Status])
VALUES (1, 1, N'Bolivianos', N'BOB', N'1')
INSERT [dbo].[Currency] ([CurrencyKey], [CountryKey], [Name], [Code], [Status])
VALUES (2, 1, N'Dolares', N'USD', N'1')
INSERT [dbo].[Currency] ([CurrencyKey], [CountryKey], [Name], [Code], [Status])
VALUES (3, 1, N'Euros', N'EUR', N'1')
INSERT [dbo].[Currency] ([CurrencyKey], [CountryKey], [Name], [Code], [Status])
VALUES (4, 1, N'Pesos Argentinos', N'ARS', N'1')
INSERT [dbo].[Currency] ([CurrencyKey], [CountryKey], [Name], [Code], [Status])
VALUES (5, 1, N'Real', N'BRL', N'1')
SET IDENTITY_INSERT [dbo].[Currency] OFF

PRINT 'Insercion Currency Realizada...';

PRINT 'Insercion de datos en tabla DocumentType...';

SET IDENTITY_INSERT [dbo].[DocumentType] ON
INSERT [dbo].[DocumentType] ([DocumentTypeKey], [Name], [Status], [Repeat])
VALUES (1, N'Pasaporte', N'1', N'1')
INSERT [dbo].[DocumentType] ([DocumentTypeKey], [Name], [Status], [Repeat])
VALUES (2, N'Visa Residente', N'1', N'1')
INSERT [dbo].[DocumentType] ([DocumentTypeKey], [Name], [Status], [Repeat])
VALUES (3, N'Carnet de Discapacitado', N'1', N'0')
INSERT [dbo].[DocumentType] ([DocumentTypeKey], [Name], [Status], [Repeat])
VALUES (4, N'Carnet de Identidad', N'1', N'0')
INSERT [dbo].[DocumentType] ([DocumentTypeKey], [Name], [Status], [Repeat])
VALUES (5, N'Licencia de Conducir', N'1', N'1')
INSERT [dbo].[DocumentType] ([DocumentTypeKey], [Name], [Status], [Repeat])
VALUES (6, N'Libreta Militar', N'1', N'0')
INSERT [dbo].[DocumentType] ([DocumentTypeKey], [Name], [Status], [Repeat])
VALUES (7, N'Visa Turista', N'1', N'1')
SET IDENTITY_INSERT [dbo].[DocumentType] OFF

PRINT 'Insercion DocumentType Realizada...';

PRINT 'Insercion de datos en tabla EquipmentType...';

SET IDENTITY_INSERT [dbo].[EquipmentType] ON
INSERT [dbo].[EquipmentType] ([EquipmentTypeKey], [Name], [Description])
VALUES (1, N'Protectores de Cabeza', N'Protectores de Cabeza')
INSERT [dbo].[EquipmentType] ([EquipmentTypeKey], [Name], [Description])
VALUES (2, N'Protectores de Mano', N'Protectores de Mano')
INSERT [dbo].[EquipmentType] ([EquipmentTypeKey], [Name], [Description])
VALUES (3, N'Protectores de Ojo', N'Protectores de Ojos')
INSERT [dbo].[EquipmentType] ([EquipmentTypeKey], [Name], [Description])
VALUES (4, N'Vestimenta', N'Vestimenta')
INSERT [dbo].[EquipmentType] ([EquipmentTypeKey], [Name], [Description])
VALUES (5, N'Protectores de Oido', N'Protectores de Oidos')
INSERT [dbo].[EquipmentType] ([EquipmentTypeKey], [Name], [Description])
VALUES (6, N'Otros', N'Otros')
SET IDENTITY_INSERT [dbo].[EquipmentType] OFF

PRINT 'Insercion EquipmentType Realizada...';

PRINT 'Insercion de datos en tabla Equipment...';

SET IDENTITY_INSERT [dbo].[Equipment] ON
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (1, 1, N'Casco', N'C', N'Cascos de seguridad', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (2, 2, N'Guantes de Goma', N'G', N'Guantes de goma de alta resistencia', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (3, 3, N'Gafa', N'G', N'Gafas de seguridad', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (4, 4, N'Botas', N'B', N'Botas de trabajo resistentes a perforaciones y resbalones', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (5, 4, N'Zapato', N'Z', N'Zapatos de seguridad con punta de acero', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (6, 2, N'Guantes de Soldar', N'G', N'Guantes para soldaduras', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (7, 2, N'Guantes con aislamiento', N'G', N'Guantes con aislamiento eléctrico', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (8, 5, N'Orejeras', N'O', N'Orejeras', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (9, 5, N'Tapón Desechable', N'T', N'Protectores auditivos de inserción', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (10, 2, N'Guantes anti-vibracional', N'G', N'Guantes anti-vibracional', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (11, 4, N'Chaleco', N'C', N'Chaleco reflectivo', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (12, 4, N'Cinturones de sujeción del troncote', N'G', N'Cinturones de sujeción del tronco', N'1')
INSERT [dbo].[Equipment] ([EquipmentKey], [EquipmentTypeKey], [Name], [Code], [Description], [Status])
VALUES (13, 6, N'Arnés de Seguridad', N'A', N'Arnés de Seguridad', N'1')
SET IDENTITY_INSERT [dbo].[Equipment] OFF

PRINT 'Insercion Equipment Realizada...';

PRINT 'Insercion de datos en tabla HierarchicalLevel...';

SET IDENTITY_INSERT [dbo].[HierarchicalLevel] ON
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (1, N'Directorio', N'0', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (2, N'Gerencia General', N'1', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (3, N'Gerencia de Areas', N'2', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (4, N'Jefaturas de Departamento', N'4', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (5, N'Unidad', N'5', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (6, N'Area', N'6', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (7, N'Funcionario Base', N'7', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (8, N'Funcionario Base I', N'8', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (9, N'Funcionario Base II', N'9', N'1')
INSERT [dbo].[HierarchicalLevel] ([HierarchicalLevelKey], [Name], [Level], [Status])
VALUES (10, N'Direccion', N'3', N'1')
SET IDENTITY_INSERT [dbo].[HierarchicalLevel] OFF

PRINT 'Insercion HierarchicalLevel Realizada...';

PRINT 'Insercion de datos en tabla OrganizationalHierarchy...';

SET IDENTITY_INSERT [dbo].[OrganizationalHierarchy] ON
INSERT [dbo].[OrganizationalHierarchy] ([OrganizationalHierarchyKey], [Description])
VALUES (1, N'Gerente General')
INSERT [dbo].[OrganizationalHierarchy] ([OrganizationalHierarchyKey], [Description])
VALUES (2, N'Gerentes de Area')
INSERT [dbo].[OrganizationalHierarchy] ([OrganizationalHierarchyKey], [Description])
VALUES (3, N'Jefes de Departamento')
INSERT [dbo].[OrganizationalHierarchy] ([OrganizationalHierarchyKey], [Description])
VALUES (4, N'Empleado')
INSERT [dbo].[OrganizationalHierarchy] ([OrganizationalHierarchyKey], [Description])
VALUES (5, N'Direcciones')
SET IDENTITY_INSERT [dbo].[OrganizationalHierarchy] OFF

PRINT 'Insercion OrganizationHierarchy Realizada...';

PRINT 'Insercion de datos en tabla Profession...';

SET IDENTITY_INSERT [dbo].[Profession] ON
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (1, N'Ing.  de Sistemas', 5)
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (2, N'Contador publico', 5)
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (3, N'Administracion de empresas', 5)
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (4, N'Auditoria', 5)
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (5, N'Secretaria', 3)
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (6, N'Ing. civil', 5)
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (7, N'Arquitecto', 6)
INSERT [dbo].[Profession] ([ProfessionKey], [Name], [StudyingTime])
VALUES (8, N'Abogado', 6)
SET IDENTITY_INSERT [dbo].[Profession] OFF

PRINT 'Insercion Profession Realizada...';

PRINT 'Insercion de datos en tabla Provider...';

SET IDENTITY_INSERT [dbo].[Provider] ON
INSERT [dbo].[Provider] ([ProviderKey], [Name], [Address], [Phone], [Contact])
VALUES (1, N'mochilas', N'jm carrasco', N'2323232', N'juan perez')
INSERT [dbo].[Provider] ([ProviderKey], [Name], [Address], [Phone], [Contact])
VALUES (2, N'import', N'jm fred', N'1213', N'pepito mendez')
INSERT [dbo].[Provider] ([ProviderKey], [Name], [Address], [Phone], [Contact])
VALUES (3, N'import metal', N'jm fred', N'1213233', N'ruben mendez')
INSERT [dbo].[Provider] ([ProviderKey], [Name], [Address], [Phone], [Contact])
VALUES (4, N'trailer', N'jm fred', N'1267613', N'erio flores')
SET IDENTITY_INSERT [dbo].[Provider] OFF

PRINT 'Insercion Provider Realizada...';

PRINT 'Insercion de datos en tabla Rol...';

SET IDENTITY_INSERT [dbo].[Rol] ON
INSERT [dbo].[Rol] ([RolKey], [Name], [Description])
VALUES (1, N'Administrator', N'Administrador del sistema ')
INSERT [dbo].[Rol] ([RolKey], [Name], [Description])
VALUES (2, N'Recurso Humanos', N'Administracion de recursos Humanos ')
SET IDENTITY_INSERT [dbo].[Rol] OFF

PRINT 'Insercion Rol Realizada...';

PRINT 'Insercion de datos en tabla Skill...';

SET IDENTITY_INSERT [dbo].[Skill] ON
INSERT [dbo].[Skill] ([SkillKey], [Description])
VALUES (1, N'Facilidad de comunicacion')
INSERT [dbo].[Skill] ([SkillKey], [Description])
VALUES (2, N'Manejo de grupos de personas')
INSERT [dbo].[Skill] ([SkillKey], [Description])
VALUES (3, N'Trabajo en equipo')
INSERT [dbo].[Skill] ([SkillKey], [Description])
VALUES (4, N'Hablar Otros idiomas')
INSERT [dbo].[Skill] ([SkillKey], [Description])
VALUES (5, N'Ser Pro Activo')
SET IDENTITY_INSERT [dbo].[Skill] OFF

PRINT 'Insercion Skill Realizada...';

PRINT 'Insercion de datos en tabla TypeContact...';

SET IDENTITY_INSERT [dbo].[TypeContact] ON
INSERT [dbo].[TypeContact] ([TypeContactKey], [Name])
VALUES (1, N'Telefono fijo')
INSERT [dbo].[TypeContact] ([TypeContactKey], [Name])
VALUES (2, N'Telefono Celular')
INSERT [dbo].[TypeContact] ([TypeContactKey], [Name])
VALUES (3, N'Correo Personal')
INSERT [dbo].[TypeContact] ([TypeContactKey], [Name])
VALUES (4, N'Correo Corporativo')
INSERT [dbo].[TypeContact] ([TypeContactKey], [Name])
VALUES (5, N'Direccion domicilio')
INSERT [dbo].[TypeContact] ([TypeContactKey], [Name])
VALUES (6, N'Direccion trabajo')
INSERT [dbo].[TypeContact] ([TypeContactKey], [Name])
VALUES (7, N'pagina facebook')
SET IDENTITY_INSERT [dbo].[TypeContact] OFF

PRINT 'Insercion TypeContact Realizada...';

PRINT 'Insercion de datos en tabla TypeContract...';

SET IDENTITY_INSERT [dbo].[TypeContract] ON
INSERT [dbo].[TypeContract] ([TypeContractKey], [Name], [Code], [Status])
VALUES (1, N'Planta', N'PLA', N'1')
INSERT [dbo].[TypeContract] ([TypeContractKey], [Name], [Code], [Status])
VALUES (2, N'Consultor', N'CONS', N'1')
INSERT [dbo].[TypeContract] ([TypeContractKey], [Name], [Code], [Status])
VALUES (3, N'Servicio', N'SERV', N'1')
INSERT [dbo].[TypeContract] ([TypeContractKey], [Name], [Code], [Status])
VALUES (4, N'Eventual', N'EVE', N'1')
INSERT [dbo].[TypeContract] ([TypeContractKey], [Name], [Code], [Status])
VALUES (8, N'Consultor Externo', N'CONSE', N'1')
SET IDENTITY_INSERT [dbo].[TypeContract] OFF

PRINT 'Insercion TypeContract Realizada...';

PRINT 'Insercion de datos en tabla AccidentType...';

SET IDENTITY_INSERT [dbo].[AccidentType] ON
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (1, 0, N'Caídas', N'', N'1', 1)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (2, 1, N'Caídas al mismo nivel', N'tropiezos, choques, resbalones', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (5, 2, N'Caídas de altura', N'Caídas de altura', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (6, 0, N'Contactos eléctricos', N'Contactos eléctricos', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (7, 0, N'Corte', N'Corte', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (8, 0, N'Caida de Objeto', N'Caida de Objeto', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (9, 0, N'Choque', N'Choque contra objeto', N'1', 1)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (10, 9, N'Choque contra objeto inmovil', N'Choque contra objeto inmovil', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (11, 9, N'Choque contra objeto movil', N'Choque contra objeto movil', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (12, 0, N'Golpe por herramienta', N'Golpe por herramienta', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (13, 0, N'Proyeccion de fragmento', N'Proyeccion de Fragmento', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (14, 0, N'Aprisionamiento', N'Atrapamiento', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (15, 0, N'Sobreesfuerzo', N'Sobreesfuerzo', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (16, 0, N'Atropello', N'Atropelli', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (17, 0, N'Exposicion a temperaturas extremas', N'Exposicion a temperaturas extremas', N'1', 1)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (18, 17, N'Exposicion a Frio', N'Exposicion a frio', N'1', 0)
INSERT [dbo].[AccidentType] ([AccidentTypeKey], [ParentKey], [Name], [Description], [State], [HaveSubType])
VALUES (19, 17, N'Exposicion a Calor', N'Exposicion a calor', N'1', 0)
SET IDENTITY_INSERT [dbo].[AccidentType] OFF

PRINT 'Insercion AccidentType Realizada...';

PRINT 'Insercion de datos en tabla Organization...';

SET IDENTITY_INSERT [dbo].[Organization] ON
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (1, 2, 0, N'Gerencia General', N'Gerente General', N'ORG-0001', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (2, 3, 1, N'Gerencia Administrativo Financiera', N'Gerente Administrativo Financiero', N'ORG-0002', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (3, 3, 1, N'Gerencia Comercial', N'Gerente Comercial', N'ORG-0003', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (4, 3, 1, N'Gerencia de Produccion', N'Gerente de Produccion', N'ORG-0004', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (5, 10, 2, N'Direccion de Aseguramiento a la Calidad', N'Director de Aseguramiento a la Calidad', N'ORG-0005', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (6, 4, 2, N'Departamento Legal', N'Departamento Legal', N'ORG-0006', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (7, 4, 3, N'Departamento de Finanzas', N'Jefe Departamento de Finanzas', N'ORG-0007', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (8, 4, 3, N'Departamento de Telecomunicaciones e Informatica', N'Jefe de Departemento de Telecomunicaciones e Informatica', N'ORG-0008', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (9, 7, 3, N'Secretaria', N'Secretaria', N'ORG-0009', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (10, 4, 3, N'Departamento Recursos Humanos', N'Departamento Recursos Humanos', N'ORG-0010', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (11, 4, 4, N'Departamento de Planificacion Comercial y Marketing', N'Departamento de Planificacion Comercial y Marketing', N'ORG-0011', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (12, 4, 4, N'Departamento de Ventas', N'Departamento de  Ventas', N'ORG-0012', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (13, 7, 4, N'Secretaria', N'secretaria', N'ORG-0013', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (14, 7, 6, N'Auditor Aseguramiento Control de Calidad', N'Auditor Aseguramiento Control de Calidad', N'ORG-0014', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (15, 7, 6, N'Auditor Aseguramiento a la Calidad', N'Auditor Aseguramiento a la Calidad', N'ORG-0015', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (16, 7, 7, N'Analisis Juridico', N'Auxiliar Apoyo Departamento Legal', N'ORG-0016', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (17, 7, 7, N'Gestion Juridica', N'Responsable Gestion Juridica', N'ORG-0017', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (18, 8, 17, N'Abogado', N'Abogado', N'ORG-0018', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (19, 8, 18, N'Abogado', N'Abogado Gestion Juridica', N'ORG-0019', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (20, 5, 8, N'Unidad de Contabilidad y Revision', N'Responsable de Contabilidad y Revision', N'ORG-0020', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (21, 5, 8, N'Unidad de Costos y Presupuestos', N'Responsable de Costos y Presupuestos', N'ORG-0021', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (22, 5, 8, N'Unidad de Tesoreria', N'Jefe de Tesoreria', N'ORG-0022', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (23, 7, 21, N'Responsable Contabilidad Egresos', N'Contador Egresos', N'ORG-0023', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (24, 7, 21, N'Contador Ingresos', N'Contador Ingresos', N'ORG-0024', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (25, 7, 22, N'Analista I Presupuestos', N'Analista I Presupuestos', N'ORG-0025', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (26, 7, 22, N'Analista I Costos', N'Analista I Costos', N'ORG-0026', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (27, 7, 23, N'Analista I Ingresos', N'Analista de Ingresos', N'ORG-0027', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (28, 7, 23, N'Analista I Egresos', N'Analista I Egresos', N'ORG-0028', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (29, 5, 9, N'Unidad de Desarrollo de Sistemas Y Base de Datos', N'Jefe Desarrollo Sistemas y Base de Datos', N'ORG-0029', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (30, 5, 9, N'Tecnologias de la Informacion e Infraestructura', N'Tecnologias de la Informacion e Infraestructura', N'ORG-0030', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (31, 5, 9, N'Telecomunicaciones y Redes', N'Telecomunicaciones y Redes', N'ORG-0031', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (32, 7, 30, N'Analista de Sistemas', N'Analista de Sistemas', N'ORG-0032', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (33, 7, 30, N'Encargado Soporte y Administración de Sistemas', N'Encargado Soporte y Administración de Sistemas', N'ORG-0033', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (34, 7, 30, N'Tecnico en Administracion de  Base de Datos', N'Tecnico en Administracion de  Base de Datos', N'ORG-0034', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (35, 7, 31, N'Tecnico en Administracion de Tecnologias de Informacion', N'Tecnico en Administracion de Tecnologias de Informacion', N'ORG-0035', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (36, 7, 32, N'Tecnico Infraestructura, Conectividad y Comunicacion', N'Tec. Infraestructura Conecciones  Comunicacion', N'ORG-0036', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (37, 7, 32, N'Nombre', N'Descripcion', N'ORG-0037', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (38, 7, 32, N'Help Desk', N'Help Desk', N'ORG-0038', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (39, 7, 11, N'Auxiliar Apoyo en Recursos Humanos', N'Auxiliar Apoyo en Recursos Humanos', N'ORG-0039', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (40, 7, 11, N'Profesional en Recursos Humanos', N'Profesional en Recursos Humanos', N'ORG-0040', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (41, 5, 12, N'Marketing', N' Area de Marketing', N'ORG-0041', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (42, 7, 42, N'Tecnico Marketing', N'Tecnico en Marketing', N'ORG-0042', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (43, 5, 13, N'Promociones y Ventas', N'Responsable de Promociones y Ventas', N'ORG-0043', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (44, 7, 13, N'Especialista ventas WEB', N'Especialista ventas WEB', N'ORG-0044', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (45, 7, 44, N'Tecnico Promocion y Ventas', N'Tecnico Promocion y Ventas', N'ORG-0045', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (46, 7, 44, N'Especialista Convenios Ctas. Corpor.', N'Especialista Convenios Ctas. Corpor.', N'ORG-0046', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (47, 7, 44, N'Tecnico Cuentas Corporativas', N'Tecnico Cuentas Corporativas', N'ORG-0047', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (48, 4, 5, N'Departamento de Planeacion', N'Jefe del Departamento de Planeacion', N'ORG-0048', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (49, 5, 5, N'Direccion de Obras', N'Director de Obras', N'ORG-0049', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (50, 7, 49, N'Arquitecto', N'Arquitecto', N'ORG-0050', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (51, 7, 49, N'Especialista Estructural', N'Especialista Estructural', N'ORG-0051', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (52, 7, 49, N'Especialista Geologogia', N'Especialista Geologogia', N'ORG-0052', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (53, 7, 49, N'Especialista Electico', N'Especialista Electico', N'ORG-0053', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (54, 7, 49, N'Consultos Hidro-Sanitario', N'Consultos Hidro-Sanitario', N'ORG-0054', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (55, 7, 50, N'Maestro', N'Maestro', N'ORG-0055', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (56, 7, 50, N'Oficial', N'Oficial', N'ORG-0056', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (57, 8, 50, N'Obrero', N'Obrero', N'ORG-0057', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (58, 8, 50, N'Almacenista', N'Almacenista', N'ORG-0058', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (59, 8, 50, N'Vigilante', N'Vigilante', N'ORG-0059', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2050-12-30T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (77, 1, 0, N'GERENCIA GENERAL', N'GERENCIA GENERAL', N'ORG-0077', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (78, 2, 1, N'GERENCIA TECNICA', N'GERENCIA TECNICAL', N'ORG-0078', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (79, 2, 1, N'GERENCIA ADMDINISTRATIVA', N'GERENCIA ADMDINISTRATIVA', N'ORG-0079', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (80, 2, 1, N'GERENCIA COMERCIAL', N'GERENCIA COMERCIAL', N'ORG-0080', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (81, 5, 2, N'DIRECCION DE OBRAS', N'DIRECCION DE OBRAS', N'ORG-0081', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (82, 5, 2, N'MAESTRANZA', N'MAESTRANZA', N'ORG-0082', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (83, 4, 5, N'SUPERVICION DE OBRA', N'SUPERVICION DE OBRA', N'ORG-0083', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (84, 4, 5, N'EJECUCION OBRA', N'EJECUCION DE OBRA', N'ORG-0084', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (85, 4, 6, N'METAL MECANICA', N'METAL MECANICA', N'ORG-0085', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (86, 4, 6, N'EQUIPO PESADO Y LIVIANO', N'EQUIPO PESADO Y LIVIANO', N'ORG-0086', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (87, 4, 6, N'INSTALACIONES SMARTHELEC', N'INSTALACIONES DE EQUIPOS INTELIGENTES Y ELECTRICOS', N'ORG-0087', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (88, 3, 3, N'DEPARTAMENTO DE PLANIFICACION', N'DEPARTAMENTO DE PLANIFICACIONS', N'ORG-0088', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (89, 3, 3, N'DEPARTAMENTO DE CONTABILIDAD', N'DEPARTAMENTO DE CONTABILIDAD', N'ORG-0089', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (90, 3, 3, N'ALMACENES', N'ALMACENES', N'ORG-0090', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (91, 3, 3, N'DEPARTAMENTO DE RECURSOS HUMANOS', N'DEPARTAMENTO DE RECURSOS HUMANOS', N'ORG-0091', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (92, 3, 3, N'DEPARTAMENTO DE ADMINISTRACION DE OBRA', N'DEPARTAMENTO DE ADMINISTRACION DE OBRA', N'ORG-0092', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
INSERT [dbo].[Organization] ([OrganizationKey], [HierarchicalLevelKey], [IdPadre], [Name], [Description], [Code], [Start], [End], [Status], [Gestion]) VALUES (93, 3, 4, N'DEPARTAMENTO COMPRAS', N'DEPARTAMENTO DE COMPRAS', N'ORG-0093', CAST(N'1995-03-22T00:00:00.000' AS DateTime), CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'2018')
SET IDENTITY_INSERT [dbo].[Organization] OFF

PRINT 'Insercion Organization Realizada...';

PRINT 'Insercion de datos en tabla Position...';

INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Abogado Analisis Jurídico','Superior','1','Abogado Analisis Jurídico')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Abogado Gestion Juridica','Superior','1','Abogado Gestion Juridica')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Administrador de Infraestructura y Telecomunicación','Superior','1','Administrador de Infraestructura y Telecomunicación')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Administrador Tecnologias de Informacion e Infraestructura','Superior','1','Administrador Tecnologias de Informacion e Infraestructura')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Control Ingresos Ventas Propias','Superior','1','Analista Control Ingresos Ventas Propias')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Costos I','Superior','1','Analista Costos I')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Costos II','Superior','1','Analista Costos II')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista de Sistemas','Superior','1','Analista de Sistemas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Devoluciones','Superior','1','Analista Devoluciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Egresos I','Superior','1','Analista Egresos I')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Ingresos I','Superior','1','Analista Ingresos I')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Presupuestos I','Superior','1','Analista Presupuestos I')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Analista Presupuestos II','Superior','1','Analista Presupuestos II')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Arquitecto','Superior','1','Arquitecto')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Arquitecto Software','Superior','1','Arquitecto Software')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Auditor Aseguramiento a la Calidad (QA)','Superior','1','Auditor Aseguramiento a la Calidad (QA)')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Auditor Interno I','Superior','1','Auditor Interno I')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Auditor Interno II','Superior','1','Auditor Interno II')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Auditor QA Operaciones','Superior','1','Auditor QA Operaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Consultor de RRHH','Superior','1','Consultor de RRHH')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Consultor en Linea','Superior','1','Consultor en Linea')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Consultor Sistemas','Superior','1','Consultor Sistemas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Contador Control Tributario y Devoluciones','Superior','1','Contador Control Tributario y Devoluciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Contador Egresos','Superior','1','Contador Egresos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Contador Revisión Ventas','Superior','1','Contador Revisión Ventas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Contador Revision Ventas Cuentas Corrientes','Superior','1','Contador Revision Ventas Cuentas Corrientes')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Control Egresos','Superior','1','Control Egresos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Desarrollador Senior','Superior','1','Desarrollador Senior')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Director de Calidad y Seguridad','Superior','1','Director de Calidad y Seguridad')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Enlace Administrativo Gerencia de Operaciones','Superior','1','Enlace Administrativo Gerencia de Operaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista - Instructor Atencion al Cliente','Superior','1','Especialista - Instructor Atencion al Cliente')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Comercio Electronico','Superior','1','Especialista Comercio Electronico')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Comunicación y Redes Sociales','Superior','1','Especialista Comunicación y Redes Sociales')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Control Producción / Planificacion','Superior','1','Especialista Control Producción / Planificacion')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Control Rendimiento','Superior','1','Especialista Control Rendimiento')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista de Convenios y Cuentas Corporativas','Superior','1','Especialista de Convenios y Cuentas Corporativas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista en Data Warehouse','Superior','1','Especialista en Data Warehouse')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista en Infraestructura','Superior','1','Especialista en Infraestructura')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista en Ingenieria de Operaciones','Superior','1','Especialista en Ingenieria de Operaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista en Seguridad Informatica','Superior','1','Especialista en Seguridad Informatica')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista en Sistemas Operativos y Publicaciones Técnicas','Superior','1','Especialista en Sistemas Operativos y Publicaciones Técnicas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista En Ventas','Superior','1','Especialista En Ventas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista en Ventas WEB','Superior','1','Especialista en Ventas WEB')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Estructuras','Superior','1','Especialista Estructuras')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Gestion Corporativa','Superior','1','Especialista Gestion Corporativa')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Ingenieria de Operaciones','Superior','1','Especialista Ingenieria de Operaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Linea y Base','Superior','1','Especialista Linea y Base')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Planificación Servicios','Superior','1','Especialista Planificación Servicios')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Publicidad y Marketing','Superior','1','Especialista Publicidad y Marketing')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Servicio de Equipaje','Superior','1','Especialista Servicio de Equipaje')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Sistemas Operativos y Publicaciones Técnicas','Superior','1','Especialista Sistemas Operativos y Publicaciones Técnicas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Especialista Ventas Nacionales','Superior','1','Especialista Ventas Nacionales')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 2,'Gerente Administrativo Financiero','Superior','1','Gerente Administrativo Financiero')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 2,'Gerente Comercial','Superior','1','Gerente Comercial')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 2,'Gerente de Operaciones','Superior','1','Gerente de Operaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 1,'Gerente General','Superior','1','Gerente General')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Help Desk','Tecnico','1','Help Desk')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Inspector Control Calidad','Superior','1','Inspector Control Calidad')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Inspector Control Calidad (Estructuras)','Superior','1','Inspector Control Calidad (Estructuras)')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Inspector Control Calidad (Línea)','Superior','1','Inspector Control Calidad (Línea)')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Inspector Control de Calidad(Estructuras)','Superior','1','Inspector Control de Calidad(Estructuras)')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Inspector de Control de Calidad (Línea)','Superior','1','Inspector de Control de Calidad (Línea)')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Activos Fijos - Almacenes y Servicios Generales','Superior','1','Jefe Activos Fijos - Almacenes y Servicios Generales')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Adquisiciones','Superior','1','Jefe Adquisiciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Auditoría Interna','Superior','1','Jefe Auditoría Interna')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Contabilidad y Revision','Superior','1','Jefe Contabilidad y Revision')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Control de Gestion y Desarrollo Organizacional','Superior','1','Jefe Control de Gestion y Desarrollo Organizacional')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Costos y Presupuestos','Superior','1','Jefe Costos y Presupuestos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe de Departamento de Administración','Superior','1','Jefe de Departamento de Administración')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe de Departamento de Planificación Comercial y Marketing','Superior','1','Jefe de Departamento de Planificación Comercial y Marketing')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe de Departamento de Telecomunicaciones e Informática','Superior','1','Jefe de Departamento de Telecomunicaciones e Informática')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe de Departamento de Ventas','Superior','1','Jefe de Departamento de Ventas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe de Departamento Ingenieria de Operaciones','Superior','1','Jefe de Departamento Ingenieria de Operaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Departamento Aseguramiento de Calidad','Superior','1','Jefe Departamento Aseguramiento de Calidad')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Departamento Aseguramiento de Calidad (Operacional)','Superior','1','Jefe Departamento Aseguramiento de Calidad (Operacional)')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Departamento Finanzas','Superior','1','Jefe Departamento Finanzas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Departamento Ingenieria - Planeamiento','Superior','1','Jefe Departamento Ingenieria - Planeamiento')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Departamento Legal','Superior','1','Jefe Departamento Legal')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Departamento Planificación y Control de Gestión','Superior','1','Jefe Departamento Planificación y Control de Gestión')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 3,'Jefe Departamento Recursos Humanos','Superior','1','Jefe Departamento Recursos Humanos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Despachos Operativos','Superior','1','Jefe Despachos Operativos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Ingenieria Estructuras','Superior','1','Jefe Ingenieria Estructuras')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Planificacion Estrategica','Superior','1','Jefe Planificacion Estrategica')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Planificacion Servicios','Superior','1','Jefe Planificacion Servicios')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Recursos Humanos','Superior','1','Jefe Recursos Humanos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Talleres','Superior','1','Jefe Talleres')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Tecnologias de Informacion e Infraestructura','Superior','1','Jefe Tecnologias de Informacion e Infraestructura')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Telecomunicaciones y Redes','Superior','1','Jefe Telecomunicaciones y Redes')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe Tesoreria','Superior','1','Jefe Tesoreria')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Profesional de Recursos Humanos','Superior','1','Profesional de Recursos Humanos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Project Manager','Superior','1','Project Manager')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Analisis Juridico','Superior','1','Responsable Analisis Juridico')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Área Atención al Cliente','Superior','1','Responsable Área Atención al Cliente')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Contabilidad Egresos','Superior','1','Responsable Contabilidad Egresos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Contabilidad Ingresos','Superior','1','Responsable Contabilidad Ingresos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable de Control de Servicios','Superior','1','Responsable de Control de Servicios')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable de Proyectos','Superior','1','Responsable de Proyectos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable en Organización y Métodos','Superior','1','Responsable en Organización y Métodos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Gestion Juridica','Superior','1','Responsable Gestion Juridica')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Marketing','Superior','1','Responsable Marketing')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Promocion y Ventas Nacionales','Superior','1','Responsable Promocion y Ventas Nacionales')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Responsable Rendimiento y Gestion','Superior','1','Responsable Rendimiento y Gestion')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Secretaria Gerencia Administrativa Financiera','Superior','1','Secretaria Gerencia Administrativa Financiera')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Secretaria Gerencia Comercial','Superior','1','Secretaria Gerencia Comercial')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Secretaria Gerencia de Operaciones','Superior','1','Secretaria Gerencia de Operaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Secretaria Gerencia General','Superior','1','Secretaria Gerencia General')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Supervisor Contact Center','Superior','1','Supervisor Contact Center')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Administrador de Tecnologias de Información','Superior','1','Técnico Administrador de Tecnologias de Información')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Administrativo Financiero','Superior','1','Tecnico Administrativo Financiero')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Adquisiciones','Superior','1','Tecnico Adquisiciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Apoyo Administrativo - Financiero','Superior','1','Técnico Apoyo Administrativo - Financiero')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Apoyo Sistemas Operativos y Procesos','Superior','1','Técnico Apoyo Sistemas Operativos y Procesos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Comunicación y Redes Sociales','Superior','1','Técnico Comunicación y Redes Sociales')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Contac Center','Superior','1','Técnico Contac Center')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Control de Produccion','Superior','1','Tecnico Control de Produccion')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Control Egresos','Superior','1','Tecnico Control Egresos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Control Ingresos','Superior','1','Tecnico Control Ingresos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Control Produccion / Planificacion','Superior','1','Técnico Control Produccion / Planificacion')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico de Activos Fijos','Superior','1','Técnico de Activos Fijos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Atención al Cliente','Superior','1','Técnico en Atención al Cliente')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Control de Gestión y Desarrollo Organizacional','Superior','1','Técnico en Control de Gestión y Desarrollo Organizacional')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico en Control Documentos','Superior','1','Tecnico en Control Documentos')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Cuentas Corporativas','Superior','1','Técnico en Cuentas Corporativas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Desarrollo de Sistemas','Superior','1','Técnico en Desarrollo de Sistemas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Estructuras','Superior','1','Técnico en Estructuras')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Infraestructura, Conectividad y Comunicaciones','Superior','1','Técnico en Infraestructura, Conectividad y Comunicaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Marketing','Superior','1','Técnico en Marketing')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Planificación Estrategíca','Superior','1','Técnico en Planificación Estrategíca')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico en Rendimiento y Gestión','Superior','1','Técnico en Rendimiento y Gestión')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Enlace Administrativo Interinstitucional','Superior','1','Técnico Enlace Administrativo Interinstitucional')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Estructuras Línea y Base','Superior','1','Técnico Estructuras Línea y Base')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Fidelización','Superior','1','Técnico Fidelización')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Gestion Corporativa','Superior','1','Técnico Gestion Corporativa')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Ingenieria Sistemas','Superior','1','Tecnico Ingenieria Sistemas')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Planificación de Servicios','Superior','1','Técnico Planificación de Servicios')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Promoción y Ventas Nacionales','Superior','1','Técnico Promoción y Ventas Nacionales')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Técnico Publicidad y Marketing','Superior','1','Técnico Publicidad y Marketing')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Redes','Superior','1','Tecnico Redes')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Telecomunicaciones','Superior','1','Tecnico Telecomunicaciones')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico de Obra','Superior','1','Tecnico de Obra')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Jefe de Obra','Superior','1','Jefe de Obra')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Capataz','Media','1','Capataz')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Tecnico Sanitario','Superior','1','Tecnico Sanitario')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Ingeniero Civil','Superior','1','Ingeniero Civil')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Arquitecto','Superior','1','Arquitecto')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Decorador','Media','1','Decorador')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Ayudante de Obra','Superior','1','Ayudante de Obra')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Obrero','Primaria','1','Obrero')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Encargado Obra Fina','Primaria','1','Encargado Obra Fina')
INSERT INTO [dbo].[Position] ([OrganizationalHierarchyKey] ,[Name] ,[Education] ,[Status] ,[Description])
VALUES ( 4,'Encargado Obra Gruesa','Primaria','1','Encargado Obra Gruesa')

PRINT 'Insercion Position Realizada...';

PRINT 'Insercion de datos en tabla RiskMatrix...';

SET IDENTITY_INSERT [dbo].[RiskMatrix] ON
INSERT [dbo].[RiskMatrix] ([RiskMatrixId], [Description], [InitialDate], [EndDate], [Status], [ValueN], [ValueM], [TolerabilidadColor1], [TolerabilidadColor2], [TolerabilidadColor3], [PlazoColor1], [PlazoColor2], [PlazoColor3])
VALUES (1050, N'Indicator CSR', CAST(N'2014-06-07 11:25:17.847' AS DateTime), NULL, N'In Process', 5, 5, N'Inacceptable', N'Tolerable under mitigation', N'Acceptable', 3, 7, 20)
INSERT [dbo].[RiskMatrix] ([RiskMatrixId], [Description], [InitialDate], [EndDate], [Status], [ValueN], [ValueM], [TolerabilidadColor1], [TolerabilidadColor2], [TolerabilidadColor3], [PlazoColor1], [PlazoColor2], [PlazoColor3])
VALUES (1051, N'ASR Indicator', CAST(N'2014-07-03 16:53:53.347' AS DateTime), NULL, N'Active', 5, 5, N'Inacceptable', N'Tolerable under mitigation', N'Acceptable', 3, 7, 20)
INSERT [dbo].[RiskMatrix] ([RiskMatrixId], [Description], [InitialDate], [EndDate], [Status], [ValueN], [ValueM], [TolerabilidadColor1], [TolerabilidadColor2], [TolerabilidadColor3], [PlazoColor1], [PlazoColor2], [PlazoColor3])
VALUES (1052, N'GSR Indicator', CAST(N'2014-07-03 17:07:37.650' AS DateTime), NULL, N'In Process', 5, 5, N'Inacceptable', N'Tolerable under mitigation', N'Acceptable', 3, 7, 20)
INSERT [dbo].[RiskMatrix] ([RiskMatrixId], [Description], [InitialDate], [EndDate], [Status], [ValueN], [ValueM], [TolerabilidadColor1], [TolerabilidadColor2], [TolerabilidadColor3], [PlazoColor1], [PlazoColor2], [PlazoColor3])
VALUES (1053, N'Base Indicator', CAST(N'2014-07-04 12:12:23.947' AS DateTime), NULL, N'Active', 5, 5, N'Inacceptable', N'Tolerable under mitigation', N'Acceptable', 3, 7, 20)
SET IDENTITY_INSERT [dbo].[RiskMatrix] OFF

PRINT 'Insercion RiskMatrix Realizada...';

PRINT 'Insercion de datos en tabla Probability...';

SET IDENTITY_INSERT [dbo].[Probability] ON
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2265, N'Frequent', 5, 1050)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2266, N'Occasional', 4, 1050)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2267, N'Remote', 3, 1050)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2268, N'Improbable', 2, 1050)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2269, N'Extremely Improbable', 1, 1050)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2270, N'Frequent', 5, 1051)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2271, N'Occasional', 4, 1051)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2272, N'Remote', 3, 1051)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2273, N'Improbable', 2, 1051)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2274, N'Extremely Improbable', 1, 1051)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2275, N'Frequent', 5, 1052)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2276, N'Occasional', 4, 1052)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2277, N'Remote', 3, 1052)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2278, N'Improbable', 2, 1052)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2279, N'Extremely Improbable', 1, 1052)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2280, N'Frequent', 5, 1053)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2281, N'Occasional', 4, 1053)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2282, N'Remote', 3, 1053)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2283, N'Improbable', 2, 1053)
INSERT [dbo].[Probability] ([ProbabilityKey], [Name], [IndiceP], [indicatorBaseKey])
VALUES (2284, N'Extremely Improbable', 1, 1053)
SET IDENTITY_INSERT [dbo].[Probability] OFF

PRINT 'Insercion Probability Realizada...';

PRINT 'Insercion de datos en tabla Severity...';

SET IDENTITY_INSERT [dbo].[Severity] ON
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2288, N'Catastrophic', N'Undefined', N'Undefined', 1, N'Undefined', N'A', 1050)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2289, N'Hazardous', N'Undefined', N'Undefined', 1, N'Undefined', N'B', 1050)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2290, N'Major', N'Undefined', N'Undefined', 1, N'Undefined', N'C', 1050)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2291, N'Minor', N'Undefined', N'Undefined', 1, N'Undefined', N'D', 1050)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2292, N'Negligible', N'Undefined', N'Undefined', 1, N'Undefined', N'E', 1050)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2293, N'Catastrophic', N'Undefined', N'Undefined', 1, N'Undefined', N'A', 1051)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2294, N'Hazardous', N'Undefined', N'Undefined', 1, N'Undefined', N'B', 1051)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2295, N'Mayor', N'Undefined', N'Undefined', 1, N'Undefined', N'C', 1051)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2296, N'Minor', N'Undefined', N'Undefined', 1, N'Undefined', N'D', 1051)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2297, N'Negligible', N'Undefined', N'Undefined', 1, N'Undefined', N'E', 1051)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2298, N'Catastrophic', N'Undefined', N'Undefined', 1, N'Undefined', N'A', 1052)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2299, N'Hazardous', N'Undefined', N'Undefined', 1, N'Undefined', N'B', 1052)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2300, N'Major', N'Undefined', N'Undefined', 1, N'Undefined', N'C', 1052)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2301, N'Minor', N'Undefined', N'Undefined', 1, N'Undefined', N'D', 1052)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2302, N'Negligible', N'Undefined', N'Undefined', 1, N'Undefined', N'E', 1052)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2303, N'Catastrophic', N'Undefined', N'Undefined', 1, N'Undefined', N'A', 1053)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2304, N'Hazardous', N'Undefined', N'Undefined', 1, N'Undefined', N'B', 1053)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2305, N'Major', N'Undefined', N'Undefined', 1, N'Undefined', N'C', 1053)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2306, N'Minor', N'Undefined', N'Undefined', 1, N'Undefined', N'D', 1053)
INSERT [dbo].[Severity] ([SeverityKey], [Name], [Personnel], [Enviroment], [Material], [Mission], [Code], [indicatorBaseKey])
VALUES (2307, N'Negligible', N'Undefined', N'Undefined', 1, N'Undefined', N'E', 1053)
SET IDENTITY_INSERT [dbo].[Severity] OFF

PRINT 'Insercion Severity Realizada...';
PRINT 'Insercion de datos en tabla RiskValue...';

SET IDENTITY_INSERT [dbo].[RiskValue] ON
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3204, 2265, 2288, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3205, 2266, 2288, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3206, 2267, 2288, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3207, 2268, 2288, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3208, 2269, 2288, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3209, 2265, 2289, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3210, 2266, 2289, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3211, 2267, 2289, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3212, 2268, 2289, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3213, 2269, 2289, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3214, 2265, 2290, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3215, 2266, 2290, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3216, 2267, 2290, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3217, 2268, 2290, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3218, 2269, 2290, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3219, 2265, 2291, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3220, 2266, 2291, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3221, 2267, 2291, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3222, 2268, 2291, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3223, 2269, 2291, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3224, 2265, 2292, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3225, 2266, 2292, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3226, 2267, 2292, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3227, 2268, 2292, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3228, 2269, 2292, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3229, 2270, 2293, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3230, 2271, 2293, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3231, 2272, 2293, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3232, 2273, 2293, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3233, 2274, 2293, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3234, 2270, 2294, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3235, 2271, 2294, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3236, 2272, 2294, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3237, 2273, 2294, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3238, 2274, 2294, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3239, 2270, 2295, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3240, 2271, 2295, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3241, 2272, 2295, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3242, 2273, 2295, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3243, 2274, 2295, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3244, 2270, 2296, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3245, 2271, 2296, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3246, 2272, 2296, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3247, 2273, 2296, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3248, 2274, 2296, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3249, 2270, 2297, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3250, 2271, 2297, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3251, 2272, 2297, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3252, 2273, 2297, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3253, 2274, 2297, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3254, 2275, 2298, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3255, 2276, 2298, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3256, 2277, 2298, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3257, 2278, 2298, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3258, 2279, 2298, N'rgb(0, 128, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3259, 2275, 2299, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3260, 2276, 2299, N'rgb(255, 0, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3261, 2277, 2299, N'rgb(255, 255, 0)', NULL)
INSERT [dbo].[RiskValue] ([RiskValueKey], [probabilityId], [severityId], [color], [daysToResolve])
VALUES (3262, 2278, 2299, N'Undefined', NULL)
SET IDENTITY_INSERT [dbo].[RiskValue] OFF

PRINT 'Insercion RiskValue Realizada...'

PRINT 'Insercion de datos en tabla SalaryScale...';

SET IDENTITY_INSERT [dbo].[SalaryScale] ON
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (4, 1, N'RESPONSABLE DE AREA I', NULL, CAST(8000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (5, 1, N'RESPONSABLE I', NULL, CAST(8000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (6, 1, N'RESPONSABLE DE AREA II', NULL, CAST(7000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (7, 1, N'RESPONSABLE REGIONAL TIPO II', NULL, CAST(7000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (8, 1, N'RESPONSABLE II', NULL, CAST(7500.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (9, 1, N'RESPONSABLE III', NULL, CAST(7000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (10, 1, N'RESPONSABLE IV', NULL, CAST(6500.00 AS Decimal(10, 2)), N'2', NULL, N'2012-12-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (11, 1, N'PROFESIONAL I', NULL, CAST(6000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (12, 1, N'PROFESIONAL II', NULL, CAST(5000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (13, 1, N'PROFESIONAL III', NULL, CAST(4500.00 AS Decimal(10, 2)), N'2', NULL, N'2012-12-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (14, 1, N'ESPECIALISTA I', NULL, CAST(5500.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (15, 1, N'ESPECIALISTA II', NULL, CAST(5000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-01-11')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (16, 1, N'ESPECIALISTA III', NULL, CAST(4500.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (17, 1, N'ESPECIALISTA IV', NULL, CAST(4000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-01-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (18, 1, N'TECNICO ADMINISTRATIVO I', NULL, CAST(4000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (19, 1, N'TECNICO ADMINISTRATIVO II', NULL, CAST(3500.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (20, 1, N'TECNICO I', NULL, CAST(3500.00 AS Decimal(10, 2)), N'2', NULL, N'2012-12-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (21, 1, N'TECNICO II', NULL, CAST(3000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-05-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (22, 1, N'TECNICO  III', NULL, CAST(2300.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (23, 1, N'ADMINISTRATIVO I', NULL, CAST(3000.00 AS Decimal(10, 2)), N'2', NULL, N'2012-12-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (24, 1, N'ADMINISTRATIVO II', NULL, CAST(2500.00 AS Decimal(10, 2)), N'2', NULL, N'2012-12-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (25, 1, N'ADMINISTRATIVO III', NULL, CAST(2000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (42, 1, N'GERENCIA GENERAL', NULL, CAST(139.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (43, 1, N'GERENCIA DE AREA', NULL, CAST(12000.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (44, 1, N'JEFATURA DE DEPARTAMENTO', NULL, CAST(10500.00 AS Decimal(10, 2)), N'2', NULL, NULL)
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (54, 1, N'GERENTE GENERAL', NULL, CAST(13950.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (55, 1, N'GERENTE DE AREA', NULL, CAST(12500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (56, 1, N'JEFE DE DEPARTAMENTO', NULL, CAST(11000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (57, 1, N'RESPONSABLE REGIONAL I', NULL, CAST(11000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (58, 1, N'JEFE DE UNIDAD I', NULL, CAST(9500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (59, 1, N'JEFE DE UNIDAD II', NULL, CAST(8500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (60, 1, N'JEFE DE UNIDAD III', NULL, CAST(7500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (61, 1, N'RESPONSABLE REGIONAL II', NULL, CAST(7500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (62, 1, N'RESPONSABLE I', NULL, CAST(7500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (63, 1, N'RESPONSABLE II', NULL, CAST(7000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (64, 1, N'ESPECIALISTA I', NULL, CAST(7000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (65, 1, N'RESPONSABLE III', NULL, CAST(6000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (66, 1, N'PROFESIONAL I', NULL, CAST(6000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (67, 1, N'ESPECIALISTA II', NULL, CAST(6000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (68, 1, N'PROFESIONAL II', NULL, CAST(5500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (69, 1, N'ESPECIALISTA III', NULL, CAST(5500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (70, 1, N'PROFESIONAL III', NULL, CAST(5000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (71, 1, N'ESPECIALISTA IV', NULL, CAST(5000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (72, 1, N'ESPECIALISTA V', NULL, CAST(4900.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (73, 1, N'TECNICO I', NULL, CAST(4500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (74, 1, N'TECNICO ESPECIALIZADO I', NULL, CAST(4500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (75, 1, N'TECNICO ESPECIALIZADO II', NULL, CAST(4300.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (76, 1, N'TECNICO II', NULL, CAST(4000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (77, 1, N'TECNICO ESPECIALIZADO III', NULL, CAST(4000.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (78, 1, N'TECNICO III', NULL, CAST(3850.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (79, 1, N'TECNICO ESPECIALIZADO IV', NULL, CAST(3850.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (80, 1, N'TECNICO IV', NULL, CAST(3500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (81, 1, N'TECNICO ESPECIALIZADO V', NULL, CAST(3500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (82, 1, N'SECRETARIA I', NULL, CAST(3500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (83, 1, N'TECNICO V', NULL, CAST(3300.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (84, 1, N'SECRETARIA II', NULL, CAST(3300.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (85, 1, N'ADMINISTRATIVO I', NULL, CAST(3300.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (86, 1, N'SECRETARIA III', NULL, CAST(2800.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (87, 1, N'ADMINISTRATIVO II', NULL, CAST(2800.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
INSERT [dbo].[SalaryScale] ([SalaryScaleKey], [CurrencyKey], [Name], [NumberCases], [BasicSalary], [Status], [Start], [End]) VALUES (89, 1, N'ADMINISTRATIVO III', NULL, CAST(2500.00 AS Decimal(10, 2)), N'2', NULL, N'2013-07-31')
SET IDENTITY_INSERT [dbo].[SalaryScale] OFF

PRINT 'Insercion AcademicLevel Realizada...';

PRINT 'Insercion de datos en tabla Item...';
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (1, 2, 1, N'1', 1, 4, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (2, 24, 1, N'2', 2, 5, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (3, 25, 1, N'3', 3, 5, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (4, 26, 1, N'269', 4, 7, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (5, 23, 1, N'4', 5, 8, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (6, 22, 1, N'398', 6, 9, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (7, 23, 1, N'399', 7, 11, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (8, 24, 1, N'400', 8, 12, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (9, 21, 1, N'5', 8, 13, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (10, 22, 1, N'396', 14, 14, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (11, 23, 1, N'397', 14, 15, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (12, 25, 1, N'8', 15, 16, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (13, 26, 1, N'477', 1, 17, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (14, 27, 1, N'9', 3, 18, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (15, 28, 1, N'57', 2, 19, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (16, 29, 1, N'401', 19, 20, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (17, 20, 1, N'10', 20, 21, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (18, 21, 1, N'6', 21, 22, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (19, 33, 1, N'402', 22, 23, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (20, 34, 1, N'7', 23, 24, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (21, 35, 1, N'403', 24, 25, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (22, 15, 1, N'370', 25, 11, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (23, 16, 1, N'110', 26, 12, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (24, 17, 1, N'421', 13, 13, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (25, 18, 1, N'11', 14, 14, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (26, 19, 1, N'422', 15, 15, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (27, 20, 1, N'111', 16, 16, N'', N'2', 2)
INSERT [dbo].[Item] ([itemKey], [organizationKey], [TypeContractKey], [ItemNumber], [PositionKey], [SalaryScaleKey], [Code], [Status], [CityKey]) VALUES (28, 21, 1, N'222', 17, 17, N'', N'2', 2)
SET IDENTITY_INSERT [dbo].[Item] OFF

PRINT 'Insercion Item Realizada...';

PRINT 'Insercion de datos en tabla [Employee]...';

SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (1, 77, N'EMP-1', N'Ruben', N'Moscoso', CAST(N'1984-02-02T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2002-01-14T00:00:00.000' AS DateTime), N'1', NULL, CAST(N'2000-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (2, 77, N'ADM', N'Juan', N'Perez', CAST(N'1986-01-01T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2015-07-01T00:00:00.000' AS DateTime), N'1', NULL, CAST(N'2018-06-08T06:11:38.063' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (3, 78, N'EMP-3', N'Fancy Ximena', N'Cardona Rivas', CAST(N'1978-12-10T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1999-02-28T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1999-02-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (4, 78, N'EMP-4', N'Raul Milko', N'Cuadros Saavedra', CAST(N'1984-02-02T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2005-01-01T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2005-01-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (5, 79, N'EMP-5', N'Raul Julio', N'Flores Chavez', CAST(N'1967-05-31T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1987-04-01T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1987-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (6, 79, N'EMP-6', N'Karla Ivanna', N'Franco Campos', CAST(N'1993-05-18T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2011-10-16T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2011-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (7, 80, N'EMP-7', N'Albina Leonor', N'Gonzales Aldunate', CAST(N'1981-02-13T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2002-01-14T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2002-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (8, 80, N'EMP-8', N'Juan Roger', N'Guzman Suarez', CAST(N'1990-07-26T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2009-11-06T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2009-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (9, 80, N'EMP-9', N'Williams German', N'Hinojosa Avila', CAST(N'1993-12-07T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2012-04-02T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2012-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (10, 81, N'EMP-10', N'Mauricio', N'Hinojosa Santa Cruz', CAST(N'1981-01-20T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2000-01-22T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2000-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (11, 82, N'EMP-11', N'Luis Fernando', N'Loayza Cabero', CAST(N'1980-03-09T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2000-01-23T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2000-01-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (12, 83, N'EMP-12', N'Albaro Pedro', N'Martinez Challapa', CAST(N'1991-03-18T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2011-10-27T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2011-10-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (13, 83, N'EMP-13', N'Matilde Isabel Mercedes', N'Martinez Mariaca', CAST(N'1972-06-19T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1990-09-19T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1990-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (14, 83, N'EMP-14', N'David Justiniano', N'Negrete López', CAST(N'1994-06-27T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2014-04-03T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2014-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (15, 84, N'EMP-15', N'David Max', N'Olivares Alvares', CAST(N'1997-10-19T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2016-11-07T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2016-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (16, 84, N'EMP-16', N'Melina', N'Orellana Aguirre', CAST(N'1971-09-29T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1992-07-30T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1992-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (17, 85, N'EMP-17', N'Carmen Ninoska', N'Ponce Ledezma', CAST(N'1965-03-07T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1983-10-09T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1983-10-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (18, 85, N'EMP-18', N'Ylce Margot', N'Rocabado Vargas', CAST(N'1977-07-05T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1996-01-02T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1996-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (19, 85, N'EMP-19', N'Josue Manuel', N'Rodriguez Del Valle', CAST(N'1984-10-26T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2002-11-11T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2002-11-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (20, 86, N'EMP-20', N'Victor Hugo', N'Saavedra Gómez', CAST(N'1966-08-20T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1984-09-20T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1984-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (21, 86, N'EMP-21', N'Licette Jenny', N'Torres Claure', CAST(N'1965-09-30T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1985-07-10T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1985-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (22, 86, N'EMP-22', N'Sergio Mauricio', N'Vidal Avaroma', CAST(N'1965-12-28T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1984-12-05T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1984-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (23, 86, N'EMP-23', N'Eduardo Wilfredo', N'Aguirre Uzeda', CAST(N'1983-09-15T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2003-10-03T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2003-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (24, 87, N'EMP-24', N'Helen', N'Alarcon Paredes', CAST(N'1967-11-24T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1988-01-15T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1988-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (25, 87, N'EMP-25', N'Faviola', N'Alfaro Flores', CAST(N'1992-12-23T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2012-11-29T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2012-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (26, 87, N'EMP-26', N'David', N'Arébalo Aira', CAST(N'1976-11-23T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1996-03-14T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1996-03-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (27, 88, N'EMP-27', N'Rosario', N'Arnez Zapata', CAST(N'1968-02-05T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1988-03-27T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1988-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (28, 88, N'EMP-28', N'Teresa del Rosario', N'Barco Soto', CAST(N'1997-08-30T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2017-01-18T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2017-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (29, 88, N'EMP-29', N'José Antonio', N'Becerra Orellana', CAST(N'1990-05-26T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2008-06-26T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2008-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (30, 89, N'EMP-30', N'Mirtha Viviana', N'Calderón La Fuente', CAST(N'1994-05-28T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2013-07-22T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2013-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (31, 89, N'EMP-31', N'Maria Alicia', N'Cusilayme Ramirez', CAST(N'1967-09-13T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1985-09-15T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1985-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (32, 89, N'EMP-32', N'Karina', N'Florero Arce', CAST(N'1994-04-11T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2013-10-27T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2013-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (33, 90, N'EMP-33', N'Sergio Remy', N'García Montaño', CAST(N'1995-07-27T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2015-05-05T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2015-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (34, 90, N'EMP-34', N'Juan Carlos', N'Luján Soliz', CAST(N'1970-09-21T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1989-06-05T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1989-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (35, 90, N'EMP-35', N'Silvia Verónica', N'Mendivil Santa Cruz', CAST(N'1982-06-18T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2001-03-09T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2001-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (36, 90, N'EMP-36', N'Erik Ernesto', N'Muñoz Royo', CAST(N'1968-10-24T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1989-07-16T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1989-07-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (37, 90, N'EMP-37', N'Osman Richard', N'Nogales García', CAST(N'1984-09-18T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2004-01-01T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2004-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (38, 91, N'EMP-38', N'Mireya Carmen', N'Perez Saavedra', CAST(N'1988-08-02T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2008-10-22T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2008-10-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (39, 91, N'EMP-39', N'Rodrigo', N'Rocha Valencia', CAST(N'1997-03-14T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2017-07-23T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2017-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (40, 91, N'EMP-40', N'Marcela Agustina', N'Rojas Blum', CAST(N'1983-02-06T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2002-01-14T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2002-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (41, 92, N'EMP-41', N'Juan Ruly', N'Saravia Vargas', CAST(N'1997-01-01T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2016-03-24T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2016-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (42, 92, N'EMP-42', N'Jared Spencer', N'Suarez Escalante', CAST(N'1993-02-12T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2011-06-04T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2011-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (43, 93, N'EMP-43', N'María Tereza', N'Vargas Bazoalto', CAST(N'1976-10-31T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1996-08-11T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1996-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (44, 77, N'EMP-44', N'Noel Alejandro', N'Vedia Camacho', CAST(N'1998-10-20T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2019-01-12T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2019-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (45, 77, N'EMP-45', N'Freddy Roberto', N'Zubieta Guzmán', CAST(N'1989-10-07T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2008-12-13T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2008-12-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (46, 77, N'EMP-46', N'Carmen Giovanna', N'Arandia Aliendre', CAST(N'1991-01-30T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2009-05-19T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2009-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (47, 77, N'EMP-47', N'Jhony', N'Ayala Fernández', CAST(N'1984-05-30T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2004-10-19T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2004-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (48, 77, N'EMP-48', N'Maria Teresa', N'Delgadillo Mejia', CAST(N'1977-03-14T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1995-03-22T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1995-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (49, 78, N'EMP-49', N'Margotd Leticia', N'Fernández García', CAST(N'1992-09-08T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2012-04-22T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2012-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (50, 78, N'EMP-50', N'María Nelly', N'Fernández Peredo', CAST(N'1971-10-27T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1991-11-14T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1991-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (51, 78, N'EMP-51', N'Ramiro', N'Terán Encinas', CAST(N'1988-08-16T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2007-06-15T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2007-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (52, 78, N'EMP-52', N'Julieta Rosario', N'Torrico Sanchez', CAST(N'1972-11-20T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1993-03-15T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1993-03-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (53, 79, N'EMP-53', N'Alain', N'Veizaga Ovando', CAST(N'1980-06-15T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1998-12-09T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1998-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (54, 79, N'EMP-54', N'Carlhiño Boris', N'Alvarez Hidalgo', CAST(N'1986-07-23T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2005-07-14T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2005-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (55, 79, N'EMP-55', N'Patricia', N'Améstegui Urriolagoitia', CAST(N'1973-11-27T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1994-05-31T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1994-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (56, 79, N'EMP-56', N'Nelly Lydia', N'Andia Vega', CAST(N'1984-07-17T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2005-05-29T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2005-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (57, 78, N'EMP-57', N'Ramill Amilcar', N'Araoz Choque', CAST(N'1993-09-06T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2014-03-09T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2014-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (58, 80, N'EMP-58', N'Juan Pablo', N'Ascárraga Vargas', CAST(N'1971-07-26T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1991-09-24T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1991-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (59, 80, N'EMP-59', N'Ingrid', N'Córdova Peña', CAST(N'1975-06-24T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1994-02-11T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1994-02-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (60, 80, N'EMP-60', N'Irma Del Carmen', N'Delgadillo Aguilar', CAST(N'1995-08-01T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2016-06-29T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2016-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (61, 80, N'EMP-61', N'Paola Sandra ', N'Fernández Montoya', CAST(N'1971-03-21T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1989-12-24T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1989-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (62, 81, N'EMP-62', N'Luís Fernando', N'Flores Castellón', CAST(N'1967-04-25T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1987-10-07T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1987-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (63, 81, N'EMP-63', N'Héctor Fabián', N'García Vargas', CAST(N'1973-03-02T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1993-12-21T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1994-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (64, 81, N'EMP-64', N'María Del Carmen', N'Hinojosa Choque', CAST(N'1998-06-24T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2018-03-08T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (65, 81, N'EMP-65', N'Ernesto Flavio', N'Hinojosa Guzman', CAST(N'1985-11-07T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2004-02-05T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2004-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (66, 82, N'EMP-66', N'Zaida Eufronia', N'Juaniquina Flores', CAST(N'1968-06-02T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1986-11-25T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1986-11-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (67, 82, N'EMP-67', N'Sonia Daniela', N'La Fuente Cardona', CAST(N'1970-03-25T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1989-02-07T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1989-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (68, 82, N'EMP-68', N'Jaime Javier', N'Lizarazu Enriquez', CAST(N'1981-12-04T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2002-02-15T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2002-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (69, 82, N'EMP-69', N'Ronald Milton', N'Medinaceli Villarroel', CAST(N'1993-03-24T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2014-03-05T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2014-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (70, 83, N'EMP-70', N'Eber Joaquin', N'Mendia Pardo', CAST(N'1986-10-13T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2005-11-21T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2005-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (71, 83, N'EMP-71', N'Jenny Karen', N'Ortega Sarmiento', CAST(N'1972-12-13T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1991-03-17T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1991-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (72, 84, N'EMP-72', N'Ana Natividad', N'Paniagua Bilbao La Vieja', CAST(N'1989-03-11T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2007-03-24T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2007-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (73, 84, N'EMP-73', N'Verónica Paola', N'Quiroz Balboa', CAST(N'1979-05-29T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1997-12-26T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1998-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (74, 84, N'EMP-74', N'Rina', N'Ramirez Chávez', CAST(N'1987-09-06T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2007-11-26T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2007-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (75, 84, N'EMP-75', N'Daniel Mauricio', N'Rojas Vargas ', CAST(N'1971-04-02T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1989-10-06T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1989-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (76, 85, N'EMP-76', N'Ronald Enrique', N'Romero Lavadenz', CAST(N'1978-06-21T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1998-08-15T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1998-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (77, 85, N'EMP-77', N'Ramiro Mauricio', N'Santos Valdéz', CAST(N'1995-11-25T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2015-01-16T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2015-01-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (78, 85, N'EMP-78', N'Johnny Pedro', N'Sejas Pozo', CAST(N'1975-11-22T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1995-04-17T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1995-04-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (79, 85, N'EMP-79', N'Roberto Elías', N'Soruco Solís', CAST(N'1985-09-21T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2004-07-17T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2004-07-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (80, 85, N'EMP-80', N'Rodolfo', N'Vasquez Gonzales', CAST(N'1996-09-24T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2015-10-12T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2015-10-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (81, 86, N'EMP-81', N'Grace Nathalie', N'Zubieta Mendoza', CAST(N'1996-08-21T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2015-05-17T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2015-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (82, 86, N'EMP-82', N'Guillermo Eloy ', N'Altuzarra Gastelú', CAST(N'1968-03-10T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1988-10-15T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1988-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (83, 86, N'EMP-83', N'Jhonny  ', N'Ayma Morales', CAST(N'1996-10-05T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2015-07-31T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2015-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (84, 86, N'EMP-84', N'Marcelo  ', N'Azuga Selaya', CAST(N'1977-05-05T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1996-05-09T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1996-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (85, 86, N'EMP-85', N'Dolly Jimena ', N'Carvajal Garcés', CAST(N'1984-05-26T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2002-09-25T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2002-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (86, 85, N'EMP-86', N'Miguel Alejandro ', N'Cerpa Polo', CAST(N'1990-12-09T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2009-08-20T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2009-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (87, 87, N'EMP-87', N'Marco Antonio ', N'Delgadillo Ortíz', CAST(N'1970-02-18T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1990-01-19T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1990-01-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (88, 87, N'EMP-88', N'Gilmar  ', N'Flores Inturias', CAST(N'1987-03-03T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2007-08-28T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2007-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (89, 87, N'EMP-89', N'Bernabé Tito', N'Goytia Sardon', CAST(N'1980-04-14T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1998-07-10T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1998-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (90, 88, N'EMP-90', N'Ana  María ', N'Miashiro Durán', CAST(N'1965-05-02T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1983-10-26T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1983-10-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (91, 88, N'EMP-91', N'David', N'Molina Romero', CAST(N'1994-08-25T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2013-10-19T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2013-10-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (92, 89, N'EMP-92', N'Raúl Alejandro ', N'Morales Revuelta', CAST(N'1968-03-22T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1988-07-25T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1988-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (93, 89, N'EMP-93', N'Lisbeth  ', N'Nogales García', CAST(N'1965-07-31T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1983-12-18T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1983-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (94, 89, N'EMP-94', N'Winder Albaro ', N'Pardo Cuellar', CAST(N'1974-06-30T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1994-08-05T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1994-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (95, 90, N'EMP-95', N'Juan Eddy ', N'Pinto Mancilla', CAST(N'1969-06-02T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1990-05-25T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1990-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (96, 90, N'EMP-96', N'Edward  ', N'Quiróz Ardaya', CAST(N'1974-02-24T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1993-02-12T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1993-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (97, 90, N'EMP-97', N'Cecilio Marcos ', N'Quispe Mayta', CAST(N'1983-04-02T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'2003-01-22T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2003-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (98, 91, N'EMP-98', N'Lolita Selvy Katia', N'Ramirez Molina', CAST(N'1980-10-01T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'1999-10-23T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1999-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (99, 91, N'EMP-99', N'David Gregorio ', N'Ramos Chambi', CAST(N'1975-11-26T00:00:00.000' AS DateTime), N'M', N'BOLIVIANO', CAST(N'1994-12-24T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'1995-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeKey], [OrganizationKey], [EmployeeCode], [FirstName], [LastName], [BirthDate], [Gender], [Nationality], [AdmissionDate], [Status], [Photo], [RegistrationDate]) VALUES (100, 91, N'EMP-100', N'Janett Leonilda ', N'Ramos Linares', CAST(N'1991-06-05T00:00:00.000' AS DateTime), N'F', N'BOLIVIANO', CAST(N'2009-08-27T00:00:00.000' AS DateTime), N'1', N'F', CAST(N'2009-09-09T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Employee] OFF

PRINT 'Insercion de datos en tabla [User]...';

SET IDENTITY_INSERT [dbo].[User] ON
INSERT INTO [dbo].[User]([UserKey],[EmployeeKey],[RolKey],[UserName],[Password],[Status]) VALUES(2,2,1,'ADMIN','123','1')
SET IDENTITY_INSERT [dbo].[User] OFF

COMMIT TRANSACTION;