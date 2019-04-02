-- Autor: Ignacio Cabrera - 236296

USE Ensenanza;

-- Ejercicio 1
INSERT INTO DOCENTE (nomDoc, telDoc, mailDoc, sueldoDoc) VALUES ('Jose Gomez','29367842','jgomez@adinet.com.uy','15360');
INSERT INTO DOCENTE (nomDoc, telDoc, mailDoc, sueldoDoc) VALUES ('Mario Martinez','42589621','mmartinez@hotmail.com.uy','17000');
INSERT INTO DOCENTE (nomDoc, telDoc, mailDoc, sueldoDoc) VALUES ('Antonio Bander','8964752','abander@gmail.com','22000');
INSERT INTO DOCENTE (nomDoc, telDoc, mailDoc, sueldoDoc) VALUES ('Berndardo Calleja','99867523','bcalleja@gmail.com','19500');

-- Ejercicio 2
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('1.123.456-7','Juan Rodriguez','rrod@adinet.com.uy','29125578');
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('1.258.138-2','Maria Quesad','mariaq@adinet.com.uy','27015896');
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('2.356.187-4','Pedro Alvarez','palvarez@gmail.uy','98756321');
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('3.558.138-5','Ana Lopez','alopez@gmail.uy','96785124');
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('4.912.187-9','Richard Gomez','rgomez@gmail.uy','94763896');
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('4.927.439-7','Nacho Gomez','nacho@gmail.uy','76356896'); -- Agregado para realizar pruebas
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('5.321.489-9','Rigoberta Melchu','rmelchu@gmail.uy','489651351'); -- Agregado para realizar pruebas
-- Ejercicio 3
INSERT INTO ESTUDIANTE (ciEst, nomEst, mailEst, telEst) VALUES ('3.558.138-5','Andres Gonzalez','agonz@gmail.uy','99688988'); -- Ya existe una ciEst con este valor, se viola la restrición de PK

-- Ejercicio 4
-- Debido al error de la constraint visto en clase, la doy de baja y creo una nueva chequeando sólo que sean letras en mayúsculas.
ALTER TABLE CURSO NOCHECK CONSTRAINT upperCase_tipCur_CURSO;
ALTER TABLE CURSO ADD CONSTRAINT onlyUpperCase_tipCur_CURSO CHECK (tipCur LIKE '[A-Z][A-Z][A-Z]');

INSERT INTO CURSO (codCur, nomCur, frecCur, tipCur, cantHrs)
VALUES
	(1, 'Matematica', 'A', 'MAT', 180),
	(2, 'BD1', 'S', 'INF', 60),
	(3, 'BD2', 'S', 'INF', 60),
	(4, 'P1', 'S', 'INF', 50),
	(5, 'P2', 'S', 'INF', 50),
	(6, 'Ingles', 'A', 'GRL', 40),
	(7, 'Introduccion a la Informatica', 'S', 'INF', 45),
	(8, 'Logica', 'S', 'INF', 55),
	(9, 'Proyecto Final', 'O', 'OTR', 100),
	(10, 'Gestion BDts', 'O', 'EMP', 90)
;


-- Ejercicio 5
	-- Parte A
INSERT INTO PREVIATURA (codCur, codCurPrevio) VALUES (3, 2);
INSERT INTO PREVIATURA (codCur, codCurPrevio) VALUES (5, 4);
INSERT INTO PREVIATURA (codCur, codCurPrevio) VALUES (2, 7);
INSERT INTO PREVIATURA (codCur, codCurPrevio) VALUES (3, 7);

	-- Parte B
INSERT INTO PREVIATURA (codCur, codCurPrevio) VALUES (6, 6);
	-- No se puede realizar el insert ya que se viola la constraint "check_codCur_codCurPrevio_PREVIATURA"

-- Ejercicio 6
UPDATE CURSO SET frecCur = 'A' WHERE codCur = '10';
UPDATE DOCENTE SET sueldoDoc = sueldoDoc + sueldoDoc * 0.20 WHERE sueldoDoc < 20000;

-- Ejercicio 7
(SELECT MAX(codEst) FROM ESTUDIANTE)
SELECT TOP 1 * FROM ESTUDIANTE ORDER BY codEst DESC;
DELETE FROM ESTUDIANTE WHERE codEst = (SELECT MAX(codEst) FROM ESTUDIANTE); DBCC CHECKIDENT (ESTUDIANTE, NORESEED); -- Como codCur es AUTO-INCREMENTAL puedo eliminar el máximo siendo el último regustro

-- Ejercicio 8
	-- A
ALTER TABLE CURSO ALTER COLUMN nomCur VARCHAR(5); -- No se puede modificar porque varios objetos acceden a la columna de la tabla

	-- B
ALTER TABLE CURSO ALTER COLUMN finCur VARCHAR(15); -- No existe el campo en la tabla

-- Ejercicio 9
INSERT INTO DOCENTE (nomDoc, telDoc, mailDoc, sueldoDoc) VALUES
	('CarmenDominguez', '98641257',	'cdominguez@adinet.com.uy', 23000),
	('DanielaEstev', '94812578', 'destev@adinet.com.uy', 25000),
	('EduardoFernandez', '96635587', 'efernandez@gmail.com', 24500),
	('FedericaGonzalez', '93123478', 'fgonzalez@hotmail.com.uy', 27800),
	('GabrielaHernandez', '96987785', 'ghe	rnandez@adinet.com.uy', 29000)
;

SET DATEFORMAT 'ymd';
alter table grupo add constraint R_1 check(codGrp like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'); -- Editado por la docente
INSERT INTO GRUPO(codGrp, codDoc, codCur, turnoCur, finiCur, ffinCur) VALUES
('BDT102', 10, 2, 'VESPERTINO', '2014-03-15', '2014-08-15'),
('BDT110', 4, 2,	'MATUTINO', '2015-03-10', '2015-07-30'),
('PRG220', 12, 5, 'VESPERTINO', '2014-08-10', '2014-12-20'),
('MAT100', 1, 1, 'MATUTINO',	'2015-03-01', '2015-11-15'),
('PRG118', 9, 4, 'MATUTINO', '2015-03-10', '2015-07-30'),
('PRG210', 12, 5, 'VESPERTINO', '2015-07-25', '2015-11-30'),
('PRG126', 11, 4, 'MATUTINO',	'2016-03-28', '2016-07-28'),
('ING500', 2, 6, 'MATUTINO',	'2016-03-15', '2016-11-10'),
('BDT130', 4, 2, 'MATUTINO',	'2016-03-05', '2016-08-05'),
('BDT210', 4, 3, 'VESPERTINO', '2016-07-20', '2016-12-01'),
('GBD106', 9, 10, 'VESPERTINO', '2016-03-13', '2016-05-13'),
('ING060', 2, 6, 'MATUTINO',	'2017-03-10', '2017-11-27'),
('LOG158', 1, 9, 'MATUTINO',	'2017-04-01', '2017-08-01'),
('LOG257', 3, 8, 'VESPERTINO', '2017-04-15', '2017-08-15'),
('BDT147', 9, 2, 'MATUTINO',	'2017-04-10', '2017-09-10'),
('BDT228', 13, 3, 'VESPERTINO', '2017-08-01', '2017-12-11'),
('PRG135', 11, 4, 'MATUTINO',	'2017-03-10', '2017-08-10'),
('PRG236', 12, 5,	'VESPERTINO', '2017-08-02', '2017-12-02'),
('INT122', 2, 7, 'VESPERTINO', '2017-03-01', '2017-06-30')
;

INSERT INTO Grupo_Est(codGrp, codEst) VALUES
('MAT100',	2),
('BDT102',	4),
('ING500',	4),
('BDT130',	1),
('BDT130',	2),
('BDT130',	3),
('BDT130',	4),
('PRG126',	1),
('PRG126',	4),
('GBD106', 	3),
('ING060',	3),
('LOG158',	2),
('BDT147',	3),
('PRG135',	2),	
('PRG135',	3),
('PRG236',	1),
('PRG236',	2),
('PRG236',	3),
('PRG236',	4),
('BDT228',	1),
('BDT228',	3),
('BDT228',	2)
;

INSERT INTO EXAMEN(codCur, codEst, codGrp, fchExa, notaExa, estExa) VALUES
(6, 2, 'ING500', '2016-11-11', 80, 'Aprobado'),
(6, 4, 'ING500', '2016-11-11', 83, 'Aprobado'),
(6, 3, 'ING500', '2016-11-11', 0, 'NoSePresento'),
(2, 1, 'BDT130', '2016-08-10', 53, 'Perdido'),
(2, 2, 'BDT130', '2016-08-10', 94, 'Aprobado'),
(2, 4, 'BDT130', '2016-08-10', 79, 'Aprobado'),
(2, 3, 'BDT130', '2016-08-10', 73, 'Aprobado'),
(4, 1, 'PRG236', '2016-07-30', 87, 'Aprobado'),
(4, 2, 'PRG236', '2016-07-30', 78, 'Aprobado')
;

-- Ejercicio 10
	-- A
SELECT * FROM EXAMEN WHERE notaExa >= 90;

	-- B
SELECT AVG(CAST(notaExa AS DECIMAL)) AS' Promedio' FROM EXAMEN WHERE YEAR(FchExa) = 2016; -- AVG toma en cuenta el tipo de dato de origen

	-- C
SELECT COUNT(codEst) AS 'Cantidad de estudiantes aprobados con nota >= a 80' FROM EXAMEN WHERE notaExa >= 80;

	-- D
SELECT codEst FROM EXAMEN WHERE codCur = 6 AND estExa = 'Aprobado'; -- En vez de utilizar el curso 'BD2' se utiliza el curso 'Ingles'

	-- E
SELECT * FROM ESTUDIANTE WHERE codEst NOT IN (SELECT codEst FROM EXAMEN);

	-- F
SELECT fchExa FROM EXAMEN JOIN ESTUDIANTE ON ESTUDIANTE.codEst = EXAMEN.codEst WHERE ESTUDIANTE.ciEst = '3.558.138-5';	