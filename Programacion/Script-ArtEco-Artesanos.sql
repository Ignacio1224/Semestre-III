USE master
GO
CREATE DATABASE ArtEco
GO

USE ArtEco
CREATE TABLE Artesano
(
	 Cedula int PRIMARY KEY NOT NULL
	,Nombre NVARCHAR(50)
	,Apellido NVARCHAR(50)
)
GO
 
USE ArtEco
GO
Insert into Artesano 
VALUES  (1234,'Ana','L�pez')
	,(9999,'Luis','Caribe')
	,(3456,'Ana','L�pez')
	,(2345,'Pedro','P�ramo');
		
GO		

SELECT * FROM Artesano