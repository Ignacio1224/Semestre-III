
CREATE TABLE PERSONA (
	id INT IDETITY(1, 1) NOT NULL,
	ci CHARACTER (8) NOT NULL,
	NomPersona VARCHAR (50) NOT NULL,
	Rol VARCHAR (14) NOT NULL,
	
	ADD CONSTANT pk_PERSONA PRIMARY KEY (id),
	ADD CONSTANT ck_Rol_PERSONA CHECK (Rol IN ('Administrativo', 'Docente', 'Estudiante')
);

CREATE TABLE MATERIA (
	CodMateria INT IDENTITY (1, 1) NOT NULL,
	NomMateria VARCHAR (60) NOT NULL,
	Duracion INT NOT NULL,
	
	ADD CONSTANT pk_MATERIA PRIMARY KEY (CodMateria),
	ADD CONSTANT uk_NomMateria UNIQUE (NomMateria)
);

CREATE TABLE EVALUACION (
	CodMateria INT NOT NULL,
	Fecha DATETIME NOT NULL,
	
	ADD CONSTRAINT pk_EVALUACION PRIMARY KEY (CodMateria, Fecha),
	ADD CONSTRAINT fk_CodMateria_EVALUACION FOREIGN KEY (CodMateria) REFERENCES MATERIA (CodMateria)
);

CREATE TABLE EvalEst (
	CodMateria INT NOT NULL,
	Fecha DATETIME NOT NULL,
	IdPersona INT NOT NULL,
	Nota INT NOT NULL,
	
	ADD CONSTRAINT pk_EvalEst PRIMARY KEY (CodMateria, Fecha, IdPersona),
	ADD CONSTRAINT fk_CodMateria_Fecha_EvalEst FOREIGN KEY (CodMateria, Fecha) REFERENCES EVALUACION (CodMateria, Fecha),
	ADD CONSTRAINT fk_IdPersona_EvalEst FOREIGN KEY (IdPersona) REFERENCES PERSONA (id),
	ADD CONSTRAINT ck_Nota_EvalEst CHECK (Nota >= 0 AND NOTA <= 100)
);

CREATE TABLE ASIGNADO (
	CodMateria INT NOT NULL,
	Fecha DATETIME NOT  NULL,
	IdPersona INT NOT NULL,
	CantHoras DECIMAL (2, 2) NOT NULL,
	
	ADD CONSTRAINT pk_ASIGNADO PRIMARY KEY (CodMateria, Fecha, IdPersona),
	ADD CONSTRAINT fk_CodMateria_Fecha_ASIGNADO FOREIGN KEY (CodMateria, Fecha) REFERENCES EVALUACION (CodMateria, Fecha),
	ADD CONSTRAINT fk_IdPersona_ASIGNADO FOREIGN KEY (IdPersona) REFERENCES PERSONA (id),
);


/* Indices */
-- CREATE INDEX in_Fecha_EVALUACION ON EVALUACION (Fecha);
-- CREATE INDEX in_CodMateria_EVALUACION ON EVALUACION (CodMateria);

-- CREATE INDEX in_CodMateria_Fecha_EvalEst ON EvalEst (CodMateria, Fecha);
CREATE INDEX in_IdPersona_EvalEst ON EvalEst (IdPersona);

-- CREATE INDEX in_CodMateria_Fecha_ASIGNADO ON ASIGNADO (CodMateria, Fecha);
CREATE INDEX in_IdPersona_ASIGNADO ON ASIGNADO (IdPersona);


/* Eliminar docentes que no hayan sido asigandos a evaluaciones */
DELETE FROM PERSONA 
WHERE 
	IdPersona NOT IN (
		SELECT IdPersona 
		FROM ASIGNADO
	)
AND
	Rol = 'Docente';
	

/* Consultas */
/* A */
SELECT PA.ci, PA.NomPersona, PA.CodMateria, M.NomMateria, PA.Fecha
FROM MATERIA RIGHT JOIN (
	SELECT P.ci, P.NomPersona, A.CodMateria, A.Fecha 
	FROM PERSONA AS P LEFT JOIN ASIGNADO AS A ON P.id = A.IdPersona
) AS PA ON Pa.IdMateria = M.IdMateria

/* B */
SELECT P.ci, P.NomPersona
FROM PERSONA AS P INNER JOIN (
	SELECT EF.IdPersona
	FROM MATERIA AS M INNER JOIN (
		SELECT EE.IdPersona, EE.CodMateria
		FROM EvalEst AS EE
		WHERE Nota > 90
	) AS EF ON M.IdMateria = EF.IdMateria
	WHERE M.Duracion < 6
) AS EMF ON P.IdPersona = EMF.IdPersona

/* C */
SELECT E.ci, E.NomPersona
FROM PERSONA AS E INNER JOIN (
	SELECT EE.IdPersona
	FROM EvalEst AS EE
	GROUP BY (EE.IdPersona)
	HAVING
			EE.IdMateria = 3
		AND
			COUNT (EE.IdMateria) > 2
		AND (
			COUNT (EE.Fecha) < 8
			EE.Nota < 70
			)
		AND	
			AVG (EE.Nota) > 80
) AS EF ON E.IdPersona = EF.IdPersona

	
/* D */
SELECT MIN (Ev.Fecha) AS 'Fecha primer evaluacion', COUNT (DISTINCT Ev.IdEstudiante) AS 'Cantidad de estudiantes', SUM (Ev.Nota) AS 'Total de notas'
FROM EvalEst AS Ev
WHERE (
	Ev.IdMateria = 10
OR
	Ev.IdMateria = 20
	)
AND 
	Ev.Fecha = (
		SELECT MIN (E.Fecha) 
		FROM EvalEst AS E
	)

/* E */
SELECT E.IdMateria 
FROM EVALUACION AS E
WHERE 
	E.Fecha = (
		SELECT MIN(Ev.Fecha)
		FROM EVALUACION AS Ev
	)
AND 
	E.IdMateria IN (
		SELECT M.IdMateria FROM
		MATERIA AS M
		WHERE 
			M.NomMateria LIKE ('A%')
		AND 
			M.Duracion > 10
	);

/* Ingreso de un estudiante en la tabla PERSONA */
INSERT INTO PERSONA (ci, NomPersonam, Rol) VALUES ('49274397', 'Ignacio Cabrera', 'Estudiante');
