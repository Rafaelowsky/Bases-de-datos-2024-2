-- #Creación de base de datos
create database prueba1
use prueba1

-- #Creación de tablas
create table Empleo(
Puesto_id char(20)  primary key,
Puesto char(20),
Sueldo int,
Comision float)

create table Personas(
P_id char (20) primary key,
Nombre char(20),
Apellidos char(30),
Direccion char(40),
Ciudad char(10),
Puesto_id char (20) foreign key references Empleo (Puesto_id))

-- # Insertar datos
insert into Empleo (Puesto_id,Puesto,Sueldo,Comision)
VALUES ('10','Gerente',10,5)
insert into Empleo
VALUES ('20','Vendedor',5,5)
insert into Empleo
VALUES ('30','Capturista',4,1)

INSERT INTO Personas
VALUES ('1','Marco Antonio','Trejo Lemus','Calle E 822','Tampico','10')
INSERT INTO Personas
VALUES ('2','Martha Beatriz','Trejo Lemus','Calle E 822','Tampico','20')
INSERT INTO Personas
VALUES ('3','Juana Elvira','Trejo Lemus','Calle E 822','Tampico','30')
INSERT INTO Personas
VALUES ('4','Nora Zulma','Trejo Lemus','Calle E 822','Tampico','20')
INSERT INTO Personas
VALUES ('5','Laura Lucero','Sobrevilla Lemus','Calle E 822','Tampico','20')
INSERT INTO Personas
VALUES ('6','Maria de la luz','Trejo Campos','Calle E 822','Tampico','30')
INSERT INTO Personas
VALUES ('7','Trinidad','Trejo Bautista','Calle E 822','Tampico','30')
INSERT INTO Personas
VALUES ('8','Marcel Abisag','Sobrevilla Campos','Calle E 822','Tampico','20')
INSERT INTO Personas
VALUES ('9','Jose Abraham','Sobrevilla Campos','Calle E 822','Tampico','30')
INSERT INTO Personas
VALUES ('10','Samuel Salomon','Olmeda Trejo','Calle E 822','Tampico','20')

-- # Borrar tablas
drop table Empleo
drop table Personas

-- # Ejercicios

-- Despliega todos los datos de la tabla empleo
SELECT * FROM Empleo

-- Muestra columnas Puesto_id y Puesto de la tabla Empleo
Select Puesto_id,Puesto from Empleo

-- Seleccionar todos los datos de la tabla personas
SELECT*FROM Personas

-- Seleccionar ciertas columnas de tabla personas
SELECT Nombre,Apellidos,Ciudad FROM Personas

-- Seleccionar ciertas columnas y cambiar el nombre de Ciudad a City
SELECT Nombre,Apellidos,Ciudad as City FROM Personas

-- Seleccionar los datos distintos (que no se repitan) de la columna Apellidos
SELECT DISTINCT Apellidos FROM Personas

-- Seleccionar los datos disntitos (que no se repitan) de la columna ciudad
SELECT DISTINCT Ciudad FROM Personas

-- Seleccionar los datos de la tabla personas que sean iguales a 'Trejo Lemus'
SELECT * FROM Personas WHERE Apellidos='Trejo Lemus'

-- Esta sentencia es incorrecta ya que lucero se detecta como lenguaje sql no como string
SELECT * FROM Personas WHERE Nombre = Lucero
-- La correcta es esta
SELECT * FROM Personas WHERE Nombre = 'Lucero'

-- Aquí esta correcta la sentencia ya que no estamos buscando un string, estamos buscando un valor int
SELECT * FROM Personas WHERE P_id = 9
-- Aquí es erroneo ya que estamos declarando como string
SELECT * FROM Personas WHERE P_id = '9'

-- Se pueden hacer selecciones con ayuda de operadore booleanos como AND, OR o NOT
SELECT * FROM Personas WHERE Apellidos = 'Sobrevilla Campos' AND (Nombre = 'Marcel Abisag' OR Nombre = 'Jose Abraham')

-- Esta sentencia despliega los datos si el nombre es igual a 'Martha Beatriz' o 'Juana Elvira'
SELECT * FROM Personas WHERE Nombre='Martha Beatriz' OR Nombre='Juana Elvira'

-- Ordena los datos de manera ascendente por default
SELECT * FROM Personas ORDER BY Nombre
-- Para que sea de manera descendente se añade al final un DESC
SELECT * FROM Personas ORDER BY Nombre DESC

-- Insertar datos dentro de la tabla personas
INSERT INTO Personas VALUES ('11','Martha', 'Lemus Hurtado', 'Canoga Park', 'L.A.','20')

-- Actuliza los datos que tenemos ya registrados, 
UPDATE Personas SET Direccion='Canoga Park', Ciudad='L.A.' WHERE Nombre='Marco Antonio' AND
Apellidos ='Trejo Lemus'

-- Eliminamos el registro de 'Marco Antonio Trejo Lemus'
DELETE FROM Personas WHERE Nombre='Marco Antonio' AND Apellidos='Trejo Lemus'

-- Borra todos los registros de la tabla personas
DELETE * FROM PERSONAS 

-- Selecciona los primeros dos registros de la tabla Personas
SELECT TOP 2 * FROM Personas

-- Selecciona el primer 50 por ciento de la tabla personas
SELECT TOP 50 PERCENT * FROM Personas

-- Selecciona los valores de la tabla personas donde en Ciudad tengan como inicio Ta...
SELECT * FROM Personas WHERE Ciudad LIKE 'Ta%'

-- Selecciona los valores de la tabla Personas donde en Ciudad no contengan '...tamp...'
-- Cabe recalcar que los % son comodines
SELECT * FROM Personas WHERE Ciudad NOT LIKE '%tamp%'

SELECT * FROM Personas