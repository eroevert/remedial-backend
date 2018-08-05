USE SysSecurity;
PRINT 'Creating the AUDITORY table....';
IF (OBJECT_ID('[dbo].[AUDITORY]')) IS NOT NULL
	PRINT 'AUDITORY table already exists into the database SysSecurity';
ELSE
BEGIN
	CREATE TABLE AUDITORY
	(
		AUDITORY_KEY INT IDENTITY (1,1) PRIMARY KEY,
		ID INT,
		PERFOMED_ACTION VARCHAR(50),
		MODIFIED_BY INT,
		TABLE_NAME VARCHAR (50),
		MODIFIED_DATE DATETIME
	)
	PRINT 'Table AUDITORY created!';
END

SELECT *
FROM AUDITORY
 

