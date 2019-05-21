/* Practico 4 */

USE Ensenanza;

-- Ejercicio 2
-- i
SELECT D.codDoc, (SELECT COUNT (*) FROM GRUPO G WHERE G.codDoc = D.codDoc)
FROM DOCENTE D;

-- ii
SELECT D.codDoc, COUNT (G.codGrp) AS 'Cantidad de grupos'
FROM DOCENTE D
LEFT JOIN GRUPO G
ON D.codDoc = G.codDoc
GROUP BY D.codDoc


-- Ejercicio 8



-- Ejercicio 10
/* COUNT (*) CUENTA LA TUPLA SIN INPORTAR SI ES NULL */
SELECT E.codEst, COUNT (Ex.codExa) AS 'Cantidad de examenes', AVG(Ex.notaExa) AS 'Promedio'
FROM EXAMEN Ex
RIGHT JOIN ESTUDIANTE E
ON Ex.codEst = E.codEst
GROUP BY E.codEst


-- Ejercicio 14
SELECT * FROM ESTUDIANTE;
SELECT * FROM CURSO;
SELECT * FROM EXAMEN;
SELECT E.ciEst, E.nomEst, COUNT (Ex.codExa) AS 'Cantidad de examenes'
FROM EXAMEN Ex
RIGHT JOIN ESTUDIANTE E ON E.codEst = Ex.codEst AND YEAR (Ex.FchExa) = YEAR (GETDATE())-3 AND Ex.codCur = 2
GROUP BY E.ciEst, E.nomEst

-- Ejercicio 15: Devolver los cursos con menos cantidad de aprobaciones de examenes
SELECT Ex.codCur
FROM EXAMEN Ex
WHERE Ex.estExa='Aprobado'
/* AND YEAR (Ex.fchExa) = YEAR (GETDATE()) */
GROUP BY Ex.codCur
HAVING COUNT (*) <= ALL (
    SELECT COUNT (*)
    FROM EXAMEN Ex
    WHERE Ex.estExa = 'Aprobado'
    /* AND YEAR (Ex.fchExa) = YEAR (GETDATE()) */
    GROUP BY Ex.codCur
);

/* La misma condicion va en la consulta y en la sub consulta */


-- Ejercicio 16: Devolver los cursos con menos cantidad de aprobaciones de examenes en los ultimos 2 anios
SELECT Ex.codCur
FROM EXAMEN Ex
WHERE Ex.estExa='Aprobado'
AND YEAR (Ex.fchExa) >= YEAR (GETDATE()) -2
GROUP BY Ex.codCur
HAVING COUNT (*) <= ALL (
    SELECT COUNT (*)
    FROM EXAMEN Ex
    WHERE Ex.estExa = 'Aprobado'
    AND YEAR (Ex.fchExa) >= YEAR (GETDATE()) -2
    GROUP BY Ex.codCur
);

-- Ejercicio 17: Devolver los estudiantes que han salvado con maxima nota en el ultimo examen de BD2 realizado

SELECT E.codEst
FROM ESTUDIANTE E
JOIN (
    SELECT codEst
    FROM EXAMEN
    WHERE fchExa = (
        SELECT MAX(fchExa)
        FROM EXAMEN
        WHERE codCur = (
            SELECT codCur 
            FROM CURSO 
            WHERE nomCur = 'BD2'
            )
        )
    AND codCur = (
        SELECT codCur 
        FROM CURSO 
        WHERE nomCur = 'BD2'
        )
    AND notaExa = (
        SELECT MAX(notaExa) 
        FROM EXAMEN 
        WHERE codCur = (
            SELECT codCur 
            FROM CURSO 
            WHERE nomCur = 'BD2'
            )
        )
) Ex ON Ex.codEst = E.codEst;

SELECT Ex.codEst
FROM EXAMEN Ex
WHERE
    Ex.codCur = (SELECT codCur FROM CURSO WHERE nomCur = 'BD2')
    AND Ex.FchExa = (SELECT MAX (FchExa) FROM EXAMEN WHERE codCur = (SELECT codCur FROM CURSO WHERE nomCur = 'BD2'))
    AND Ex.estExa = 'Aprobado'
GROUP BY Ex.codEst
HAVING SUM (Ex.notaExa) >= ALL (
    SELECT SUM (Exx.notaExa)
    FROM EXAMEN Exx
    WHERE
        Exx.codCur = (SELECT codCur FROM CURSO WHERE nomCur = 'BD2')
        AND Exx.FchExa = (SELECT MAX (FchExa) FROM EXAMEN WHERE codCur = (SELECT codCur FROM CURSO WHERE nomCur = 'BD2'))
        AND Exx.estExa = 'Aprobado'
    GROUP BY Exx.codEst
);


-- Ejercicio 18
SELECT I.codCur
FROM CURSO C
INNER JOIN INSCRIPCION I ON C.codCur = I.codCur
WHERE
    C.frecCur = 'S'
    AND YEAR (I.fechaIns) = YEAR (GETDATE())
    AND (SELECT COUNT(*) FROM GRUPO G WHERE G.codCur = C.codCur AND YEAR (G.ffinCur) = YEAR (GETDATE())) > 5
GROUP BY I.codCur
HAVING COUNT (I.codIns) >= ALL (
    SELECT COUNT (I.codIns)
    FROM CURSO C
    INNER JOIN INSCRIPCION I ON C.codCur = I.codCur
    WHERE
        C.frecCur = 'S'
        AND YEAR (I.fechaIns) = YEAR (GETDATE())
        AND (SELECT COUNT(*) FROM GRUPO G WHERE G.codCur = C.codCur AND YEAR (G.ffinCur) = YEAR (GETDATE())) > 5
    GROUP BY I.codCur
);

