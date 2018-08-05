--Añadiendo campos en las tablas
USE SysSecurity;
--EQUIPMENT
--VALIDACION
IF not exists
(
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'UserKey' AND TABLE_NAME = 'Equipment'
)
--CREACION DE LA COLUMNA
BEGIN
  ALTER TABLE Equipment 
  ADD UserKey INT
  PRINT 'Column UserKey created into the table Equipment'
END
ELSE
PRINT 'Column UserKey already exists into the table Equipment'

--##############################################################################################
--EQUIPMENTTYPE
--VALIDACION
IF NOT EXISTS
(
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'UserKey' AND TABLE_NAME = 'EquipmentType'
)
--CREACION DE LA COLUMNA
BEGIN
  ALTER TABLE EquipmentType
  ADD UserKey INT
  PRINT 'Column UserKey created into the table EquipmentType'
END
ELSE
PRINT 'Column UserKey already exists into the table EquipmentType'

--##############################################################################################
--EQUIPMENTASSIGNMENT
--VALIDACION
IF NOT EXISTS
(
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'UserKey' AND TABLE_NAME = 'EquipmentAssignment'
)
--CREACION DE LA COLUMNA
BEGIN
  ALTER TABLE EquipmentAssignment
  ADD UserKey INT
  PRINT 'Column UserKey created into the table EquipmentAssignment'
END
ELSE
PRINT 'Column UserKey already exists into the table EquipmentAssignment'

--##############################################################################################
--ACCIDENT
--VALIDACION
IF NOT EXISTS
(
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'UserKey' AND TABLE_NAME = 'Accident'
)
--CREACION DE LA COLUMNA
BEGIN
  ALTER TABLE Accident
  ADD UserKey INT
  PRINT 'Column UserKey created into the table Accident'
END
ELSE
PRINT 'Column UserKey already exists into the table Accident'
