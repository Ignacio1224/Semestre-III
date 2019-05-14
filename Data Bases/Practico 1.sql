-- Autor: Ignacio Cabrera - 236296

-- Practico I
-- Ejercicio 1

DROP DATABASE Ensenanza;
GO
CREATE DATABASE Ensenanza;
GO
USE Ensenanza;
GO

CREATE TABLE DOCENTE (
    codDoc INT IDENTITY(1,1),
    nomDoc VARCHAR(50) NOT NULL,
    telDoc VARCHAR(9) NOT NULL,
    mailDoc VARCHAR(50) NOT NULL,
    CONSTRAINT pk_DOCENTE PRIMARY KEY (codDoc),
    CONSTRAINT unique_mailDoc_DOCENTE UNIQUE (mailDoc)
);

CREATE TABLE ESTUDIANTE (
    codEst INT IDENTITY(1,1),
    ciEst CHAR(11)NOT NULL,
    nomEst VARCHAR(50) NOT NULL,
    mailEst VARCHAR(50) NOT NULL,
    CONSTRAINT pk_ESTUDIANTE PRIMARY KEY (codEst),
    CONSTRAINT unique_ciEst_ESTUDIANTE UNIQUE (ciEst)
);

CREATE TABLE CURSO (
    codCur INT,
    nomCur VARCHAR(50) NOT NULL,
    frecCur CHAR(1) NOT NULL,
    tipCur CHAR(3) NOT NULL,
    CONSTRAINT pk_CURSO PRIMARY KEY (codCur),
    CONSTRAINT unique_nomCur_CURSO UNIQUE (nomCur),
    CONSTRAINT check_frecCur_CURSO CHECK (frecCur in ('A', 'S', 'O')),
    CONSTRAINT upperCase_tipCur_CURSO CHECK (tipCur LIKE '[A-Z][A-Z][A-Z]')
);

CREATE TABLE PREVIATURA (
    codCur INT NOT NULL,
    codCurPrevio INT NOT NULL,
    CONSTRAINT pk_PREVIATURA PRIMARY KEY (codCur, codCurPrevio),
    CONSTRAINT fk_codCur_PREVIATURA FOREIGN KEY (codCur) REFERENCES CURSO (codCur),
    CONSTRAINT fk_codCurPrevio_PREVIATURA FOREIGN KEY (codCurPrevio) REFERENCES CURSO (codCur),
    CONSTRAINT check_codCur_codCurPrevio_PREVIATURA CHECK (codCur != codCurPrevio)
);
-- RNE: No puede haber circularidad entre codCur y codCurPrevio

CREATE TABLE INSCRIPCION (
    codIns INT IDENTITY (2000, 1),
    codEst INT NOT NULL,
    codCur INT NOT NULL,
    fechaIns DATE,
    estadoIns VARCHAR(50),
    CONSTRAINT pk_INSCRIPCION PRIMARY KEY (codIns),
    CONSTRAINT fk_codEst_INSCRIPCION FOREIGN KEY (codEst) REFERENCES ESTUDIANTE (codEst),
    CONSTRAINT fk_codCur_INSCRIPCION FOREIGN KEY (codCur) REFERENCES CURSO (codCur),
    CONSTRAINT check_estadoIns_INSCRIPCION CHECK (estadoIns = 'Solicitada' OR estadoIns = 'Admitida' or estadoIns = 'Rechazada')
);

CREATE TABLE GRUPO (
	codGrp CHAR(6),
	codDoc INT,
	codCur INT NOT NULL,
	turnoCur VARCHAR(50) NOT NULL,
	finiCur DATE NOT NULL,
	ffinCur DATE NOT NULL,
	CONSTRAINT pk_GRUPO PRIMARY KEY (codGrp),
	CONSTRAINT fk_codDoc_GRUPO FOREIGN KEY (codDoc) REFERENCES DOCENTE (codDoc),
	CONSTRAINT fk_codCur_GRUPO FOREIGN KEY (codCur) REFERENCES CURSO (codCur),
	CONSTRAINT check_codGrp_GRUPO CHECK (codGrp LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'),
	CONSTRAINT check_finiCur_ffinCur CHECK (finiCur < ffinCur)
	/* RNE: Los grupos se arman en base a inscripciones. */
);

CREATE TABLE EXAMEN(
	codExa INT IDENTITY (1,1),
	codCur INT NOT NULL,
	codEst INT NOT NULL,
	codGrp CHAR(6) NOT NULL,
	FchExa DATE NOT NULL,
	notaExa INT NOT NULL,
	estExa VARCHAR(50) NOT NULL,
	CONSTRAINT pk_EXAMEN PRIMARY KEY (codExa),
	CONSTRAINT fk_codCur_EXAMEN FOREIGN KEY (codCur) REFERENCES CURSO (codCur),
    CONSTRAINT fk_codEst_EXAMEN FOREIGN KEY (codEst) REFERENCES ESTUDIANTE (codEst),
    CONSTRAINT fk_codGrp_EXAMEN FOREIGN KEY (codGrp) REFERENCES GRUPO (codGrp),
	CONSTRAINT check_notaExa_EXAMEN CHECK (notaExa >= 0 AND notaExa <= 100),
	CONSTRAINT check_estExa_EXAMEN CHECK (estExa = 'Aprobado' OR estExa = 'Perdido' OR estExa = 'Exhonerado' OR estExa = 'NoSePresento' OR estExa = 'Otro')
	/* RNE: El estudiante debe estar en la tabla Grupos_Est. */
	/* RNE: Si la nota es < 70, el no puede ser 'Aprobado'. */
	/* RNE: Si la nota es >= 70, el no puede ser 'Perdido'. */
);

CREATE TABLE Grupo_Est(
	codGrp CHAR(6),
	codEst INT NOT NULL,
	CONSTRAINT pk_Grupo_Est PRIMARY KEY (codGrp, codEst),
    CONSTRAINT fk_codGrp_Grupo_Est FOREIGN KEY (codGrp) REFERENCES GRUPO (codGrp),
    CONSTRAINT fk_codEst_Grupo_Est FOREIGN KEY (codEst) REFERENCES ESTUDIANTE (codEst)
	/* RNE: Debe de existir una inscripci�n del estudiante en el curso. */
);

-- Ejercicio 2
ALTER TABLE ESTUDIANTE ADD telEst VARCHAR(20);
ALTER TABLE INSCRIPCION ALTER COLUMN fechaIns DATETIME;
ALTER TABLE DOCENTE ALTER COLUMN nomDoc VARCHAR(125);
ALTER TABLE ESTUDIANTE ALTER COLUMN nomEst VARCHAR(125);
ALTER TABLE DOCENTE ADD sueldoDoc DECIMAL;
ALTER TABLE CURSO ADD cantHrs DECIMAL;
ALTER TABLE CURSO ADD CONSTRAINT check_cantHrs_CURSO CHECK (cantHrs >= 20);

-- Ejercicio 3
-- CREATE INDEX index_codCur_PREVIATURA ON PREVIATURA (codCur); No lo creo porque es PK y tiene uno ya definido.
CREATE INDEX index_codCurPrevio_PREVIATURA ON PREVIATURA (codCurPrevio);
CREATE INDEX index_codEst_INSCRIPCION ON INSCRIPCION (codEst);
CREATE INDEX index_codCur_INSCRIPCION ON INSCRIPCION (codCur);
CREATE INDEX index_codDoc_GRUPO ON GRUPO (codDoc);
CREATE INDEX index_codCur_GRUPO ON GRUPO (codCur);
CREATE INDEX index_codCur_EXAMEN ON EXAMEN (codCur);
CREATE INDEX index_codEst_EXAMEN ON EXAMEN (codEst);
CREATE INDEX index_codGrp_EXAMEN ON EXAMEN (codGrp);
-- CREATE INDEX index_codGrp_Grupo_Est ON Grupo_Est (codGrp); No lo creo porque es PK y tiene uno ya definido.
CREATE INDEX index_codEst_Grupo_Est ON Grupo_Est (codEst);

-- Ejercicio 5
DROP INDEX Grupo_Est.index_codEst_Grupo_Est;

-- Ejercicio 6
DROP TABLE INSCRIPCION;
