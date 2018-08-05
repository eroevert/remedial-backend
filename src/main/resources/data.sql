INSERT INTO TYPE_CONTACT  (TYPE_CONTACT_KEY, NAME) VALUES (1, N'Telefono fijo')
INSERT INTO TYPE_CONTACT  (TYPE_CONTACT_KEY, NAME) VALUES (2, N'Telefono Celular')
INSERT INTO TYPE_CONTACT  (TYPE_CONTACT_KEY, NAME) VALUES (3, N'Correo Personal')
INSERT INTO TYPE_CONTACT  (TYPE_CONTACT_KEY, NAME) VALUES (4, N'Correo Corporativo')
INSERT INTO TYPE_CONTACT  (TYPE_CONTACT_KEY, NAME) VALUES (5, N'Oficina Boa')
INSERT INTO TYPE_CONTACT  (TYPE_CONTACT_KEY, NAME) VALUES (6, N'Celular Boa')
INSERT INTO TYPE_CONTACT  (TYPE_CONTACT_KEY, NAME) VALUES (7, N'Correo Personal 2')

INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (1, 'Grado Linguistico', '1', '0')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (2, 'Pasaporte', '1', '1')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (3, 'Visa Residente', '1', '1')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (4, 'Visa Tripulante', '1', '1')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (5, 'Carnet de Discapacitado', '1', '0')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (6, 'Carnet de Identidad', '1', '0')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (7, 'Licencia de Conducir', '1', '1')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (8, 'Libreta Militar', '1', '0')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (9, 'Visa Turista', '1', '1')
INSERT INTO Document_Type (Document_Type_Key, Name, Status, Repeat) VALUES (10, 'Credencial  Corporativa', '1', '0')

INSERT INTO Profession (Profession_Key, Name, Studying_Time) VALUES (1, 'Ing.  de Sistemas', 5)
INSERT INTO Profession (Profession_Key, Name, Studying_Time) VALUES (2, 'Contador publico', 5)
INSERT INTO Profession (Profession_Key, Name, Studying_Time) VALUES (3, 'Administracion de empresas', 5)
INSERT INTO Profession (Profession_Key, Name, Studying_Time) VALUES (4, 'Auditoria', 5)
INSERT INTO Profession (Profession_Key, Name, Studying_Time) VALUES (5, 'Secretaria', 3)
INSERT INTO Profession (Profession_Key, Name, Studying_Time) VALUES (6, 'Ing. civil', 5)
INSERT INTO Profession (Profession_Key, Name, Studying_Time) VALUES (7, 'Arquitectura', 6)

INSERT INTO Academic_Level (Academic_Level_Key, Description, Status) VALUES (1, 'Tecnico Medio', '1')
INSERT INTO Academic_Level (Academic_Level_Key, Description, Status) VALUES (2, 'Tecnico Superior', '1')
INSERT INTO Academic_Level (Academic_Level_Key, Description, Status) VALUES (3, 'Licenciatura', '1')
INSERT INTO Academic_Level (Academic_Level_Key, Description, Status) VALUES (4, 'Maestria', '1')
INSERT INTO Academic_Level (Academic_Level_Key, Description, Status) VALUES (5, 'Doctorado', '1')

INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (1, 'Directorio', '0', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (2, 'Gerencia General', '1', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (3, 'Gerencia de Areas', '2', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (4, 'Jefaturas de Departamento', '4', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (5, 'Unidad', '5', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (6, 'Area', '6', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (7, 'Funcionario Base', '7', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (8, 'Funcionario Base I', '8', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (9, 'Funcionario Base II', '9', '1')
INSERT INTO Hierarchical_Level (Hierarchical_Level_Key, Name, Level, Status) VALUES (10, 'Direccion', '3', '1')

INSERT INTO Country (Code, Name, Country_Key) VALUES ('AR', ' ARGENTINA', 1)
INSERT INTO Country (Code, Name, Country_Key) VALUES ('BO', ' BOLIVIA', 2)
INSERT INTO Country (Code, Name, Country_Key) VALUES ('BR', ' BRASIL', 3)

INSERT INTO Organizational_Hierarchy (Organizational_Hierarchy_Key, Description) VALUES (1, 'Gerente General')
INSERT INTO Organizational_Hierarchy (Organizational_Hierarchy_Key, Description) VALUES (2, 'Gerentes de Area')
INSERT INTO Organizational_Hierarchy (Organizational_Hierarchy_Key, Description) VALUES (3, 'Jefes de Departamento')
INSERT INTO Organizational_Hierarchy (Organizational_Hierarchy_Key, Description) VALUES (4, 'Empleado')
INSERT INTO Organizational_Hierarchy (Organizational_Hierarchy_Key, Description) VALUES (5, 'Direcciones')

INSERT INTO Skill (Skill_Key, Description) VALUES (1, 'Facilidad de comunicacion')
INSERT INTO Skill (Skill_Key, Description) VALUES (2, 'Manejo de grupos de personas')
INSERT INTO Skill (Skill_Key, Description) VALUES (3, 'Trabajo en equipo')

INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (1, 'Planta', 'PLA', '1')
INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (2, 'Consultor', 'CONS', '1')
INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (3, 'Servicio', 'SERV', '1')
INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (4, 'Eventual', 'EVE', '1')
INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (5, 'PAE', 'PAE', '1')
INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (6, 'Personal Exterior Planta', 'PEXT', '1')
INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (7, 'Personal Exterior Eventual', 'PEXTE', '1')
INSERT INTO Type_Contract (Type_Contract_Key, Name, Code, Status) VALUES (8, 'Consultor Externo', 'CONSE', '1')

INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('CIJ', 'Cobija',1, 1)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('TJA', 'Tarija',1, 2)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('LPB', 'La Paz',1, 3)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('POI', 'Potosi',1, 4)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('ORU', 'Oruro', 1, 5)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('TDD', 'Trinidad', 1, 6)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('SRE', 'Sucre', 1, 7)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('CBB', 'Cochabamba', 1, 8)
INSERT INTO City (Code, Name, Country_Key, City_Key) VALUES ('SRZ', 'Santa Cruz', 1, 9)

INSERT INTO currency(currency_key,code,country_key,name,status) VALUES(1,'BOB',1,'Bolivianos','1')

INSERT INTO ORGANIZATION(ORGANIZATION_KEY,HIERARCHICAL_LEVEL_KEY,ID_PADRE,NAME,DESCRIPTION,CODE,START,END,STATUS,GESTION ) VALUES(1,1,0,'Gerencia General','de cargo unico','001','2017-01-01 18:47:52.690','2019-01-01 18:47:52.690','1',2017)

INSERT INTO Salary_Scale(Salary_Scale_Key,Currency_Key,Name,Number_Cases,Basic_Salary,Status,Start,End) VALUES(1,1,'GERENTE',1,10,'1','20170101','20200202')

INSERT INTO Position(Position_Key,Organizational_Hierarchy_Key,Name,Education,Status,Description) VALUES(1,1,'cargo 1 ','necesita saber todo','1','mi primer cargo')

INSERT INTO Item(Item_Key,Organization_Key,Type_Contract_Key,Item_Number,Position_Key,Salary_Scale_Key,Code,Status,City_Key) VALUES(1,1,1,'00345',1,1,'test','1',1)

INSERT INTO EMPLOYEE(EMPLOYEE_KEY,ADMISSION_DATE,BIRTH_DATE,EMPLOYEE_CODE,FIRST_NAME,GENDER,LAST_NAME,NATIONALITY,ORGANIZATION_KEY,PHOTO,REGISTRATION_DATE,STATUS) VALUES(1,'2017-01-01 18:47:52.690','2011-12-01 18:47:52.690','test','test','m','test','test',1,'', '2018-01-01 18:47:52.690','1')

INSERT INTO Accident_Type(Accident_Type_Key,Parent_Key,Name,Description,State,Have_Sub_Type) VALUES(1,0,'accidente electrico','accidente en la manipulacion de conexiones de energia electrica','1',0)

INSERT INTO ACCIDENT(ACCIDENT_KEY,ACCIDENT_TYPE_KEY,IS_ANONYMOUS,CLOSE_DATE,CODE,CREATED_REPORT_FROM_ADMIN,DATE_EVENT,DATE_REGISTER,DESCRIBE_ISSUE,EMPLOYEE_KEY,END_DATE,LEVEL_RISK_ID,IS_MANDATORY,RESPONSIBLE_EMPLOYEE_KEY,STATUS,STATUS_REPORT,SUGGESTION,TITLE,IS_VOLUNTARY) VALUES(1,1,0,'2017-01-01 18:47:52.690','test',0,'2017-01-01 18:47:52.690','2017-01-01 18:47:52.690','es una prueba sencilla',1,'9999-01-01 18:47:52.690',0,1,0,'1',1,'','errores de manipulacion',0)

INSERT INTO EQUIPMENT_TYPE(EQUIPMENT_TYPE_KEY,DESCRIPTION,NAME)VALUES(5,'cascos de seguridad','cascos')
INSERT INTO EQUIPMENT_TYPE(EQUIPMENT_TYPE_KEY,DESCRIPTION,NAME)VALUES(6,'guantes de seguridad','guantes')
INSERT INTO EQUIPMENT(EQUIPMENT_KEY,CODE,DESCRIPTION,EQUIPMENT_TYPE_KEY,NAME,STATUS)VALUES(1,'001','cascos para ingenieros',5,'casco de seguridad','1')
INSERT INTO EQUIPMENT(EQUIPMENT_KEY,CODE,DESCRIPTION,EQUIPMENT_TYPE_KEY,NAME,STATUS)VALUES(2,'002','Guantes de cuero',6,'guantes de cuero','1')
INSERT INTO EQUIPMENT(EQUIPMENT_KEY,CODE,DESCRIPTION,EQUIPMENT_TYPE_KEY,NAME,STATUS)VALUES(3,'003','Guantes de cuero',6,'guantes de ule','1')
INSERT INTO EQUIPMENT(EQUIPMENT_KEY,CODE,DESCRIPTION,EQUIPMENT_TYPE_KEY,NAME,STATUS)VALUES(4,'004','Guantes de cuero',6,'guantes de goma','1')

INSERT INTO ROL(ROL_KEY,DESCRIPTION,NAME)VALUES(2,'rol admin','admin')

INSERT INTO USER(USER_KEY,EMPLOYEE_KEY,PASSWORD,ROL_KEY,STATUS,USER_NAME)VALUES(1,1,'test',2,'1','juan.perez')

INSERT INTO EQUIPMENT_ASSIGNMENT(EQUIPMENT_ASSIGNMENT_KEY,CREATED_ON,UPDATED_ON,VERSION,DATE,DATE_REGISTRATION,EMPLOYEE_KEY,EQUIPMENT_KEY,OBSERVATIONS,STATUS,USER_KEY)VALUES(1,'2017-01-01 18:47:52.690',null,1,'2017-01-01 18:47:52.690','2017-01-01 18:47:52.690',1,1,'nuevo','1',1)

INSERT INTO PROVIDER(PROVIDER_KEY,ADDRESS,CONTACT,NAME,PHONE)VALUES(1,'jm carrasco','juan perez','mochilas',2323232)
INSERT INTO PROVIDER(PROVIDER_KEY,ADDRESS,CONTACT,NAME,PHONE)VALUES(2,'jm fred','pepito mendez','import',1213)
INSERT INTO PROVIDER(PROVIDER_KEY,ADDRESS,CONTACT,NAME,PHONE)VALUES(3,'jm fred','ruben mendez','import metal',1213233)
INSERT INTO PROVIDER(PROVIDER_KEY,ADDRESS,CONTACT,NAME,PHONE)VALUES(4,'jm fred','erio flores','trailer',1267613)

INSERT INTO PUBLIC.INVENTORY_INPUT(INVENTORY_INPUT_KEY,DATE,DATE_REGISTRATION,EQUIPMENT_KEY,PROVIDER_KEY,QUANTITY,UNIT_PRICE,USER_KEY)VALUES(1,'2018-01-01','2018-01-01',1,1,25,3.2,1)
INSERT INTO PUBLIC.INVENTORY_INPUT(INVENTORY_INPUT_KEY,DATE,DATE_REGISTRATION,EQUIPMENT_KEY,PROVIDER_KEY,QUANTITY,UNIT_PRICE,USER_KEY)VALUES(2,'2018-01-01','2018-01-01',2,2,35,2.2,1)
INSERT INTO PUBLIC.INVENTORY_INPUT(INVENTORY_INPUT_KEY,DATE,DATE_REGISTRATION,EQUIPMENT_KEY,PROVIDER_KEY,QUANTITY,UNIT_PRICE,USER_KEY)VALUES(3,'2018-01-01','2018-01-01',3,3,55,6.2,1)
INSERT INTO PUBLIC.INVENTORY_INPUT(INVENTORY_INPUT_KEY,DATE,DATE_REGISTRATION,EQUIPMENT_KEY,PROVIDER_KEY,QUANTITY,UNIT_PRICE,USER_KEY)VALUES(4,'2018-01-01','2018-01-01',4,4,65,5.2,1)

CREATE VIEW PUBLIC.inventory_VIEW AS select ii.inventory_input_key, et.name as type,e.Name, e.Code,e.Status,p.Name as provider, ii.date, ii.quantity, ii.unit_price from inventory_input ii 	inner join Equipment e  on(ii.equipment_key=e.Equipment_Key)	inner join equipment_type et on(e.Equipment_Type_Key=et.equipment_type_key)	inner join Provider p on(ii.provider_key=p.Provider_Key)