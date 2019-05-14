/* Stored Procedures & Functions */

USE Ensenanza;
GO

DROP PROCEDURE SP_ESTUDIANTES;
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE SP_ESTUDIANTES
    @codEst INT,
    @ciEst CHARACTER (11),
    @nomEst VARCHAR(50), 
    @mailEst VARCHAR(50), 
    @telEst VARCHAR(255)
AS
    BEGIN
        SET NOCOUNT ON;
        DECLARE @message VARCHAR (255) = 'Verifique que los datos ingresados sean correctos';
        BEGIN TRY
            IF @codEst IS NOT NULL AND EXISTS (SELECT codEst FROM ESTUDIANTE WHERE codEst = @codEst)
            BEGIN
                UPDATE ESTUDIANTE SET
                    ciEst = @ciEst,
                    nomEst = @nomEst,
                    mailEst = @mailEst,
                    telEst = @telEst
                WHERE codEst = @codEst;
                SET @message = 'Se han actualizado los datos del estudiante';
            END
            ELSE
            BEGIN
                DECLARE @data VARCHAR;
                SELECT COLUMNPROPERTY(OBJECT_ID('ESTUDIANTE'), 'ESTUDIANTE', 'IsIdentity')
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE 
                    TABLE_NAME = 'ESTUDIANTE' AND 
                    COLUMN_NAME = 'codEst';
                PRINT @data;
                -- INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES (@ciEst, @nomEst, @mailEst, @telEst);
                SET @message = 'Se ha creado el estudiante';
            END
        END TRY
        BEGIN CATCH  
            SELECT  
                ERROR_NUMBER() AS ErrorNumber  
                ,ERROR_SEVERITY() AS ErrorSeverity  
                ,ERROR_STATE() AS ErrorState  
                ,ERROR_PROCEDURE() AS ErrorProcedure  
                ,ERROR_LINE() AS ErrorLine  
                ,ERROR_MESSAGE() AS ErrorMessage;  
        END CATCH; 
        PRINT @message;
    END
GO

-- example to execute the stored procedure we just created
EXECUTE SP_ESTUDIANTES 7, '1.123.456-7', 'PEPE', 'pepe@pepe.com', '29125578';
GO

SELECT * FROM ESTUDIANTE;

select o.name, c.name
from sys.objects o inner join sys.columns c on o.object_id = c.object_id
where c.is_identity = 1 and o.name = 'ESTUDIANTE';

----------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE SP_MIN_CANT_EST;
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE SP_MIN_CANT_EST
    @cant_min_est INT OUTPUT,
    @cant_cursos INT OUTPUT
AS
    SELECT COUNT (GE.codEst)
    FROM GRUPO G INNER JOIN Grupo_Est GE ON G.codGrp = GE.codGrp
    WHERE G.ffinCur IS NULL
    GROUP BY G.codCur
    ORDER BY COUNT (GE.codEst) DESC
GO

