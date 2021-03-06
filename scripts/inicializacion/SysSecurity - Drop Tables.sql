USE [SysSecurity]
GO
ALTER TABLE [dbo].[WorkExperience] DROP CONSTRAINT [FK_WorkExperience_Institution]
ALTER TABLE [dbo].[WorkExperience] DROP CONSTRAINT [FK_WorkExperience_Employee]
ALTER TABLE [dbo].[WorkExperience] DROP CONSTRAINT [FK_WorkExperience_City]
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Rol]
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Employee]
ALTER TABLE [dbo].[TrainingPosition] DROP CONSTRAINT [FK_TrainingPosition_Training]
ALTER TABLE [dbo].[TrainingPosition] DROP CONSTRAINT [FK_TrainingPosition_Position]
ALTER TABLE [dbo].[SuggestionProblem] DROP CONSTRAINT [FK_SuggestionProblem_FormSMS]
ALTER TABLE [dbo].[SkillsPosition] DROP CONSTRAINT [FK_SkillsPosition_Skill]
ALTER TABLE [dbo].[SkillsPosition] DROP CONSTRAINT [FK_SkillsPosition_Position]
ALTER TABLE [dbo].[Severity] DROP CONSTRAINT [FK_RiskMatrix_Severity]
ALTER TABLE [dbo].[SalaryScale] DROP CONSTRAINT [FK_SalaryScale_Currency]
ALTER TABLE [dbo].[RiskValue] DROP CONSTRAINT [FK_IndicatorValue_Severity]
ALTER TABLE [dbo].[RiskValue] DROP CONSTRAINT [FK_IndicatorValue_Probability]
ALTER TABLE [dbo].[Probability] DROP CONSTRAINT [FK_RiskMatrix_Probability]
ALTER TABLE [dbo].[PositionHistorical] DROP CONSTRAINT [FK_HistorialCargo_Item]
ALTER TABLE [dbo].[PositionHistorical] DROP CONSTRAINT [FK_HistorialCargo_Empleado]
ALTER TABLE [dbo].[Position] DROP CONSTRAINT [FK_Position_OrganizationalHierarchy]
ALTER TABLE [dbo].[PersonalDocument] DROP CONSTRAINT [FK_PersonalDocument_Employee]
ALTER TABLE [dbo].[PersonalDocument] DROP CONSTRAINT [FK_DocumentoPersonal_Documento]
ALTER TABLE [dbo].[Organization] DROP CONSTRAINT [FK_Organization_HierarchicalLevel]
ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_TipoContrato]
ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_Organigrama]
ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_EscalaSalarial]
ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_Cargo]
ALTER TABLE [dbo].[Investigation] DROP CONSTRAINT [FK_Investigation_RootCause]
ALTER TABLE [dbo].[Investigation] DROP CONSTRAINT [FK_Investigation_FormSMS]
ALTER TABLE [dbo].[InventoryInput] DROP CONSTRAINT [FK_InventoryInput_User]
ALTER TABLE [dbo].[InventoryInput] DROP CONSTRAINT [FK_InventoryInput_Provider]
ALTER TABLE [dbo].[InventoryInput] DROP CONSTRAINT [FK_InventoryInput_Equipment]
ALTER TABLE [dbo].[InitialRiskLevel] DROP CONSTRAINT [FK_IndicatorForm_IndicatorValue]
ALTER TABLE [dbo].[InitialRiskLevel] DROP CONSTRAINT [FK_IndicatorForm_FormSMS]
ALTER TABLE [dbo].[FinalRiskLevel] DROP CONSTRAINT [FK_FinalIndicatorForm_IndicatorValue]
ALTER TABLE [dbo].[FinalRiskLevel] DROP CONSTRAINT [FK_FinalIndicatorForm_FormSMS]
ALTER TABLE [dbo].[EquipmentReturn] DROP CONSTRAINT [FK_EquipmentReturn_User]
ALTER TABLE [dbo].[EquipmentReturn] DROP CONSTRAINT [FK_EquipmentReturn_Equipment]
ALTER TABLE [dbo].[EquipmentReturn] DROP CONSTRAINT [FK_EquipmentReturn_Employee]
ALTER TABLE [dbo].[EquipmentAssignment] DROP CONSTRAINT [FK_EquipmentAssignment_User]
ALTER TABLE [dbo].[EquipmentAssignment] DROP CONSTRAINT [FK_EquipmentAssignment_Equipment]
ALTER TABLE [dbo].[EquipmentAssignment] DROP CONSTRAINT [FK_EquipmentAssignment_Employee]
ALTER TABLE [dbo].[Equipment] DROP CONSTRAINT [FK_Equipment_EquipmentType]
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Organization]
ALTER TABLE [dbo].[Currency] DROP CONSTRAINT [FK_Currency_Country]
ALTER TABLE [dbo].[CorrectiveActions] DROP CONSTRAINT [FK_CorrectiveActions_Investigation]
ALTER TABLE [dbo].[CorrectiveActionFile] DROP CONSTRAINT [FK_CorrectiveActionFile_CorrectiveActions]
ALTER TABLE [dbo].[ContactInformation] DROP CONSTRAINT [FK_ContactInformation_Employee]
ALTER TABLE [dbo].[ContactInformation] DROP CONSTRAINT [FK_Comunicacion_TipoComunicacion]
ALTER TABLE [dbo].[City] DROP CONSTRAINT [FK_City_Country]
ALTER TABLE [dbo].[AfectedEmployee] DROP CONSTRAINT [FK_AfectedEmployee_FormSMS]
ALTER TABLE [dbo].[Accident] DROP CONSTRAINT [FK_FormSMS_OccurrenceType]
ALTER TABLE [dbo].[AcademicInformation] DROP CONSTRAINT [FK_DatosAcademicos_NivelAcademico]
ALTER TABLE [dbo].[AcademicInformation] DROP CONSTRAINT [FK_AcademicInformation_Profession]
ALTER TABLE [dbo].[AcademicInformation] DROP CONSTRAINT [FK_AcademicInformation_Employee]
ALTER TABLE [dbo].[AcademicInformation] DROP CONSTRAINT [FK_AcademicInformation_City]
GO
/****** Object:  Table [dbo].[WorkExperience]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[WorkExperience]
/****** Object:  Table [dbo].[User]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[User]
/****** Object:  Table [dbo].[TypeContract]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[TypeContract]
/****** Object:  Table [dbo].[TypeContact]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[TypeContact]
/****** Object:  Table [dbo].[TrainingPosition]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[TrainingPosition]
/****** Object:  Table [dbo].[Training]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Training]
/****** Object:  Table [dbo].[SuggestionProblem]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[SuggestionProblem]
/****** Object:  Table [dbo].[SkillsPosition]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[SkillsPosition]
/****** Object:  Table [dbo].[Skill]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Skill]
/****** Object:  Table [dbo].[Severity]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Severity]
/****** Object:  Table [dbo].[SalaryScale]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[SalaryScale]
/****** Object:  Table [dbo].[RootCause]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[RootCause]
/****** Object:  Table [dbo].[Rol]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Rol]
/****** Object:  Table [dbo].[RiskValue]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[RiskValue]
/****** Object:  Table [dbo].[RiskMatrix]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[RiskMatrix]
/****** Object:  Table [dbo].[Provider]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Provider]
/****** Object:  Table [dbo].[Profession]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Profession]
/****** Object:  Table [dbo].[Probability]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Probability]
/****** Object:  Table [dbo].[PositionHistorical]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[PositionHistorical]
/****** Object:  Table [dbo].[Position]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Position]
/****** Object:  Table [dbo].[PersonalDocument]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[PersonalDocument]
/****** Object:  Table [dbo].[OrganizationalHierarchy]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[OrganizationalHierarchy]
/****** Object:  Table [dbo].[Organization]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Organization]
/****** Object:  Table [dbo].[Item]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Item]
/****** Object:  Table [dbo].[Investigation]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Investigation]
/****** Object:  Table [dbo].[InventoryInput]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[InventoryInput]
/****** Object:  Table [dbo].[Institution]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Institution]
/****** Object:  Table [dbo].[InitialRiskLevel]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[InitialRiskLevel]
/****** Object:  Table [dbo].[HierarchicalLevel]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[HierarchicalLevel]
/****** Object:  Table [dbo].[FinalRiskLevel]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[FinalRiskLevel]
/****** Object:  Table [dbo].[EquipmentType]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[EquipmentType]
/****** Object:  Table [dbo].[EquipmentReturn]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[EquipmentReturn]
/****** Object:  Table [dbo].[EquipmentAssignment]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[EquipmentAssignment]
/****** Object:  Table [dbo].[Equipment]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Equipment]
/****** Object:  Table [dbo].[Employee]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Employee]
/****** Object:  Table [dbo].[DocumentType]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[DocumentType]
/****** Object:  Table [dbo].[Currency]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Currency]
/****** Object:  Table [dbo].[Country]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Country]
/****** Object:  Table [dbo].[CorrectiveActions]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[CorrectiveActions]
/****** Object:  Table [dbo].[CorrectiveActionFile]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[CorrectiveActionFile]
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[ContactInformation]
/****** Object:  Table [dbo].[City]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[City]
/****** Object:  Table [dbo].[AfectedEmployee]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[AfectedEmployee]
/****** Object:  Table [dbo].[AccidentType]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[AccidentType]
/****** Object:  Table [dbo].[Accident]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[Accident]
/****** Object:  Table [dbo].[AcademicLevel]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[AcademicLevel]
/****** Object:  Table [dbo].[AcademicInformation]    Script Date: 7/6/2018 23:35:21 ******/
DROP TABLE [dbo].[AcademicInformation]
