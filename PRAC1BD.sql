-- # Creación de Base de datos
CREATE DATABASE PRAC1BD
USE PRAC1BD

-- # Creación de tablas
CREATE TABLE Departamento(
depto_no INT PRIMARY KEY not null,
nombre_depto VARCHAR(30) not null,
localizacion VARCHAR(50))

CREATE TABLE Empleado(
codigo_c VARCHAR(30) PRIMARY KEY not null,
nombre VARCHAR (70) not null,
edad INT,
oficio VARCHAR(40),
dir VARCHAR(70),
fecha_alt DATE,
salario FLOAT,
comision FLOAT,
depto_no INT FOREIGN KEY REFERENCES Departamento (depto_no)
)

-- # Insertar datos
INSERT INTO Departamento
VALUES (10,'Desarrollo Software','El coyolar')
INSERT INTO Departamento
VALUES(20,'Analisis Sistema','Guadalupe')
INSERT INTO Departamento
VALUES (30,'Contabilidad','Subtiava')
INSERT INTO Departamento
VALUES(40,'Ventas','San Felipe')
INSERT INTO Empleado
VALUES ('281-160483-0005F','Rocha vargas
Hector',27,'Vendedor','Leon','1983/05/12',12000,0,40)
INSERT INTO Empleado
VALUES ('281-040483-0056P','Lopez Hernandez
Julio',27,'Analista','Chinandenga','1982/07/14',13000,1500,20)
INSERT INTO Empleado
VALUES ('081-130678-0004S','Esquivel
Jose',31,'Director','Juigalpa','1981/06/05',16700,1200,30)
INSERT INTO Empleado
VALUES ('281-160473-0009Q','Delgado
Carmen',37,'Vendedor','Leon','1983/03/02',13400,0,40)
INSERT INTO Empleado
VALUES ('281-160493-0005F','Castillo Montes
Luis',17,'Vendedor','Masaya','1982/08/12',16309,1000,40)
INSERT INTO Empleado
VALUES ('281-240784-0004Y','Esquivel Leonel
Alfonso',26,'Presidente','Nagarote','1981/09/12',15000,0,30)
INSERT INTO Empleado
VALUES ('281-161277-0008R','Perez
Luis',32,'Empleado','Managua','1980/03/02',16890,0,10)

-- # Consultas

-- 1: 
SELECT * FROM EMPLEADO ORDER BY nombre

-- 2: Seleccionar el nombre, el oficio y la localidad de los
-- departamentos donde trabajan los Vendedores.
SELECT nombre, oficio, localizacion FROM EMPLEADO,DEPARTAMENTO
WHERE oficio ='Vendedor' AND EMPLEADO.depto_no = DEPARTAMENTO.depto_no

-- 3: Listar los nombres de los empleados cuyo nombre termine con la
-- letra ‘o’.
SELECT nombre FROM EMPLEADO WHERE nombre LIKE '%o'

-- 4: Seleccionar el nombre, el oficio y salario de los empleados que
-- trabajan en León.
SELECT nombre, oficio, salario FROM Empleado WHERE dir = 'Leon'

-- Seleccionar el nombre, el oficio y el salario de los empleados que trabajan
-- en el Coyolar
SELECT nombre, oficio, salario FROM EMPLEADO, DEPARTAMENTO
WHERE EMPLEADO.depto_no = DEPARTAMENTO.depto_no AND localizacion = 'El Coyolar'

-- 5: Seleccionar el nombre, salario y localidad donde trabajan de
-- los empleados que tengan un salario entre 10000 y 13000.
SELECT nombre, salario, localizacion FROM EMPLEADO, DEPARTAMENTO
WHERE EMPLEADO.depto_no=DEPARTAMENTO.depto_no AND (salario >= 10000 AND salario <= 13000)

-- Otra solución
SELECT nombre, salario, localizacion FROM EMPLEADO,DEPARTAMENTO
WHERE EMPLEADO.depto_no=DEPARTAMENTO.depto_no AND salario BETWEEN 10000 AND 13000

SELECT * FROM Empleado

SELECT * FROM DEPARTAMENTO

SELECT nombre,salario,nombre_depto FROM Empleado, Departamento WHERE Empleado.depto_no = Departamento.depto_no
AND oficio = (SELECT oficio FROM Cliente WHERE nombre = 'Leonel Alfonso Esquive')