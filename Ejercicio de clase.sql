create database PRAC1BD
use PRAC1BD
create table Departamento(
depto_no int primary key not null,
nombre_depto varchar(30) not null,
localizacion varchar(50))
create table Empleado(
codigo_c varchar(30) primary key not null,
nombre varchar (70) not null,
edad int,
oficio varchar(40),
dir varchar(70),
fecha_alt date,
salario float,
comision float,
depto_no int foreign key references Departamento (depto_no)
)
insert into Departamento
values (10,'Desarrollo Software','El coyolar')
insert into Departamento
values(20,'Analisis Sistema','Guadalupe')
insert into Departamento
values (30,'Contabilidad','Subtiava')
insert into Departamento
values(40,'Ventas','San Felipe')
insert into Empleado
values ('281-160483-0005F','Rocha vargas
Hector',27,'Vendedor','Leon','1983/05/12',12000,0,40)
insert into Empleado
values ('281-040483-0056P','Lopez Hernandez
Julio',27,'Analista','Chinandenga','1982/07/14',13000,1500,20)
insert into Empleado
values ('081-130678-0004S','Esquivel
Jose',31,'Director','Juigalpa','1981/06/05',16700,1200,30)
insert into Empleado
values ('281-160473-0009Q','Delgado
Carmen',37,'Vendedor','Leon','1983/03/02',13400,0,40)
insert into Empleado
values ('281-160493-0005F','Castillo Montes
Luis',17,'Vendedor','Masaya','1982/08/12',16309,1000,40)
insert into Empleado
values ('281-240784-0004Y','Esquivel Leonel
Alfonso',26,'Presidente','Nagarote','1981/09/12',15000,0,30)
insert into Empleado
values ('281-161277-0008R','Perez
Luis',32,'Empleado','Managua','1980/03/02',16890,0,10)

SELECT * FROM Empleado

SELECT * FROM Departamento


INSERT INTO EMPLEADO(codigo_c,nombre,edad,oficio,dir,fecha_alt,salario,comision,
depto_no) values('220678-0008U', 'Pérez Luis
Carlos',32,'Analista','Matagalpa','22-06-2001',15600,null,20)

insert into DEPARTAMENTO values(50,'General','Laborio')
--- 
insert into DEPARTAMENTO(depto_no,nombre_depto)
values(60,'Prueba')

--- Esto nos ayuda a duplicar el salario de los empleados, 'SET' es para saber donde se va a hacer la actualización
UPDATE EMPLEADO SET salario = salario*2 WHERE depto_no=30

--- Cambia todos los empleados del departamento 20 hacia el departamento 30, esto tambien elimina el departamento 20
UPDATE EMPLEADO SET depto_no = 20 WHERE depto_no = 30

--- Aumenta el salario de los empleados en un 10%
UPDATE EMPLEADO SET salario= salario * 1.1 WHERE depto_no=10

--- Cambia la localidad del departamente número 10 a 'Zaragoza'

UPDATE Departamento SET localizacion  = 'Zaragoza' WHERE depto_no = 10

--- Esto iguala el salario de 'Esquivel Jose' al salario de 'Esquivel Leonel Alfonso' de la tabla Prueba

UPDATE Empleado SET salario = (SELECT salario FROM Prueba WHERE nombre = 'Esquivel Leonel Alfonso' ) WHERE nombre = 'Esquivel Jose'

--- Esto no se puede borrar porque los datos estan relacionados con 
delete from DEPARTAMENTO where depto_no = 40

--- Esto elimina todos los empleados que pertenezcan al departamento 20 y que sean analistas por el comando booleano
delete from EMPLEADO where depto_no = 20 and oficio='Analista'

--- Esto elimina a los empleados que no tienen comisión
delete from EMPLEADO where comision = 0

create table Prueba(
codigo_c varchar(30) primary key not null,
nombre varchar (70) not null,
edad int,
oficio varchar(40),
dir varchar(70),
fecha_alt date,
salario float,
comision float,
depto_no int foreign key references Departamento (depto_no)
)

insert into Prueba
values ('281-160483-0005F','Rocha vargas
Hector',27,'Vendedor','Leon','1983/05/12',12000,0,40)
insert into Prueba
values ('281-040483-0056P','Lopez Hernandez
Julio',27,'Analista','Chinandenga','1982/07/14',13000,1500,20)
insert into Prueba
values ('081-130678-0004S','Esquivel
Jose',31,'Director','Juigalpa','1981/06/05',16700,1200,30)
insert into Prueba
values ('281-160473-0009Q','Delgado
Carmen',37,'Vendedor','Leon','1983/03/02',13400,0,40)
insert into Prueba
values ('281-160493-0005F','Castillo Montes
Luis',17,'Vendedor','Masaya','1982/08/12',16309,1000,40)
insert into Prueba
values ('281-240784-0004Y','Esquivel Leonel
Alfonso',26,'Presidente','Nagarote','1981/09/12',15000,0,30)
insert into Prueba
values ('281-161277-0008R','Perez
Luis',32,'Empleado','Managua','1980/03/02',16890,0,10)