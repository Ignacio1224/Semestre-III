USE Ensenanza;
GO

-- Ejercicio 1 : Mostrar el nombre y mail de los estudiantes ordenados por nombre de curso en forma descendente.
SELECT nomEst, mailEst FROM ESTUDIANTE ORDER BY (nomEst) DESC;


-- Ejercicio 2: Mostrar los datos de las inscripciones del año actual.
SELECT * FROM INSCRIPCION WHERE YEAR (fechaIns) = YEAR (GETDATE());


-- Ejercicio 3: Mostrar los datos de la última inscripción sin usar subconsultas.
SELECT TOP 1 * FROM INSCRIPCION ORDER BY (codIns) DESC;


-- Ejercicio 4: Mostrar la cantidad de estudiantes inscriptos al curso de código 9.
SELECT COUNT(codEst) AS 'Cantidad de Estudiantes'
FROM INSCRIPCION
WHERE codCur = (SELECT codCur FROM CURSO WHERE nomCur = 'Proyecto Final');


-- Ejercicio 5: Mostrar cantidad de cursos distintos que tuvieron inscripciones en el 2016.
SELECT COUNT (DISTINCT codCur) AS 'Cantidad de cursos' FROM INSCRIPCION WHERE YEAR (fechaIns) = 2016


-- Ejercicio 6: Mostrar el mayor sueldo, el menor sueldo, y promedio de sueldo de docentes.
SELECT MAX(sueldoDoc) AS 'Máximo sueldo', MIN(sueldoDoc) AS 'Mínimo sueldo', AVG(sueldoDoc) AS 'Promedio sueldo'
FROM DOCENTE;



-- Ejercicio 7: Mostrar los datos de los docentes con máximo sueldo.
SELECT * FROM DOCENTE WHERE sueldoDoc = (SELECT MAX(sueldoDoc) FROM DOCENTE);


-- Ejercicio 8: Determinar cuántos docentes tienen sueldos menores a 18000 y que tienen por lo menos un inscripto a alguno de sus cursos.
-- Opción 1.
SELECT DISTINCT COUNT (*) AS 'Cantidad de docentes' FROM DOCENTE
WHERE sueldoDoc < 18000
AND codDoc IN (SELECT codDoc FROM GRUPO AS G JOIN INSCRIPCION AS I ON G.codCur = I.codCur);

-- Opción 2.
SELECT DISTINCT COUNT (*) AS 'Cantidad de docentes' FROM DOCENTE AS D
WHERE sueldoDoc < 18000
AND (SELECT COUNT(I.codIns) FROM GRUPO AS G JOIN INSCRIPCION AS I ON G.codCur = I.codCur WHERE G.codDoc = D.codDoc) >= 1;

-- Opción 3.
SELECT DISTINCT COUNT (*) AS 'Cantidad de docentes' FROM DOCENTE AS D
WHERE sueldoDoc < 18000
AND EXISTS (SELECT * FROM GRUPO AS G JOIN INSCRIPCION AS I ON G.codCur = I.codCur WHERE G.codDoc = D.codDoc);


-- Ejercicio 9: Aumentar en un 10% los sueldos de docentes del punto anterior.
UPDATE DOCENTE SET sueldoDoc = sueldoDoc * 0.10 + sueldoDoc WHERE codDoc IN 
(
	SELECT DISTINCT codDoc FROM DOCENTE
	WHERE sueldoDoc < 18000
	AND codDoc IN (SELECT codDoc FROM GRUPO AS G JOIN INSCRIPCION AS I ON G.codCur = I.codCur)
);


-- Ejercicio 10: Actualizar los nombres de los Estudiantes de la tabla de Estudiantes de tal forma de que todos estén en mayúscula.
UPDATE ESTUDIANTE SET nomEst = UPPER(nomEst);
SELECT * FROM ESTUDIANTE; -- Verificación del resultado de la consulta.


-- Ejercicio 11: Actualizar el estado de los Exámenes del año actual para que indiquen “aprobado” si la nota es mayor o igual a 70.
UPDATE EXAMEN SET estExa = 'APROBADO' WHERE codExa IN 
( SELECT codExa FROM EXAMEN WHERE notaExa >= 70 AND YEAR (FchExa) = YEAR (GETDATE())
);
SELECT * FROM EXAMEN; -- Verificación del resultado de la consulta.

-- Ejercicio 12: Indique cual es resultado esperado de la siguiente consulta
	/*
	UPDATE Cursos SET cantHrs = (
		Select AVG(C.cantHrs)
		From Cursos C
		Where C.FrecCur = 'S')
	WHERE FrecCur = ‘S’
	*/

	-- El resultado esperado es que se actualizen los valores de la cantidad de horas de los cursos cuya frecuencia es 'S'
	-- a el promedio de la cantidad de horas de los cursos de frecuencia 'S'.

