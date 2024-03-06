CREATE DATABASE practica2_BDITSE
USE practica2_BDITSE

-- Creación de tablas
CREATE TABLE DEPT(
DEPTNO INT PRIMARY KEY NOT NULL,
DNAME VARCHAR(14),
LOC VARCHAR(13))

CREATE TABLE EMP(
EMPNO INT PRIMARY KEY NOT NULL,
ENAME VARCHAR(10),
JOB VARCHAR(9),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT FOREIGN KEY REFERENCES DEPT(DEPTNO))

-- Borrar tablas
DROP TABLE DEPT
DROP TABLE EMP

-- Consultar tablas
SELECT * FROM DEPT
SELECT * FROM EMP

-- Insertar datos

INSERT INTO DEPT(DEPTNO,DNAME,LOC)
VALUES (10,'ACCOUNTING','NEW YORK')
INSERT INTO DEPT(DEPTNO,DNAME,LOC)
VALUES (20,'RESEARCH','DALLAS')
INSERT INTO DEPT(DEPTNO,DNAME,LOC)
VALUES (30,'SALES','CHICAGO')
INSERT INTO DEPT(DEPTNO,DNAME,LOC)
VALUES (40,'OPERATIONS','BOSTON')

INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7369,'SMITH','CLERK',7902,'1980/12/17',800,20)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7499,'ALLEN','SALESMAN',7698,'1981/02/20',1600,300,30)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7521,'WARD','SALESMAN',7698,'1981/02/22',1250,500,30)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7566,'JONES','MANAGER',7839,'1981/04/02',2975,20)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7654,'MARTIN','SALESMAN',7698,'1981/09/28',1250,1400,30)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7698,'BLAKE','MANAGER',7839,'1981/05/01',2850,30)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7782,'CLARK','MANAGER',7839,'1981/06/09',2450,10)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7788,'SCOTT','ANALYST',7566,'1982/12/09',3000,20)
INSERT INTO EMP(EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTNO)
VALUES(7839,'KING','PRESIDENT','1981/11/17',5000,10)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(7844,'TURNER','SALESMAN',7698,'1981/09/08',1500,0,30)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7876,'ADAMS','CLERK',7788,'1983/01/12',1100,20)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7900,'JAMES','CLERK',7698,'1981/12/03',950,30)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7902,'FORD','ANALYST',7566,'1981/12/03',3000,20)
INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES(7934,'MILLER','CLERK',7782,'1982/01/23',1300,10)

-- Consultas (Ejercicios)

-- 1. Obtener todos los datos de todos los empleados
SELECT * FROM DEPT

-- 2. Obtener todos los datos de todos los departamentos
SELECT * FROM EMP

-- 3. Obtener todos los datos de los administrativos ('CLERK')
SELECT * FROM EMP WHERE JOB LIKE 'CLERK'

-- 4. IDEM, pero ordenado por el nombre
SELECT * FROM EMP ORDER BY ENAME ASC

-- 5. Obtén el mismo resultado de la pregunta anterior pero
-- modificando la sentencia SQL.
SELECT * FROM EMP ORDER BY ENAME

-- 6. Obtén el número (código), nombre y salario de los empleados
SELECT MGR, ENAME, SAL FROM EMP

-- 7. Lista los nombres de todos los departamentos.
SELECT DNAME FROM DEPT

-- 8. ́Idem, pero orden ́andolos por nombre.
SELECT DNAME FROM DEPT ORDER BY DNAME

--9.  ́Idem, pero orden ́andolo por la ciudad
--(no se debe seleccionar la ciudad en el resultado).
SELECT DNAME FROM DEPT ORDER BY LOC 

--10.  ́Idem, pero el resultado debe mostrarse ordenado por la ciudad en orden inverso.
SELECT DNAME FROM DEPT ORDER BY LOC DESC

--11. Obtener el nombre y empleo de todos los empleados, ordenado por salario.
SELECT ENAME, JOB FROM EMP ORDER BY SAL

--12. Obtener el nombre y empleo de todos los empleados, ordenado primero por su trabajo y luego
-- por su salario.
SELECT ENAME, JOB FROM EMP ORDER BY JOB ASC, SAL ASC

--13.  ́Idem, pero ordenando inversamente por empleo y normalmente por salario.
SELECT ENAME, JOB FROM EMP ORDER BY JOB DESC, SAL DESC

--14. Obtén los salarios y las comisiones de los empleados del departamento 30.
SELECT SAL, COMM FROM EMP WHERE DEPTNO = 30

--15.  ́Idem, pero ordenado por comisión.
SELECT SAL, COMM FROM EMP ORDER BY COMM

--16. (a) Obtén las comisiones de todos los empleados. (b) Obtén las comisiones de los empleados de
-- forma que no se repitan.
SELECT COMM FROM EMP
SELECT DISTINCT COMM FROM EMP 

--17. Obtén el nombre de empleado y su comisión SIN FILAS repetidas.
SELECT DISTINCT ENAME, COMM FROM EMP
SELECT DISTINCT ENAME FROM EMP
SELECT DISTINCT COMM FROM EMP

--18. Obtén los nombres de los empleados y sus salarios, de forma que no se repitan filas.
SELECT DISTINCT ENAME, SAL FROM EMP
SELECT DISTINCT ENAME FROM EMP
SELECT DISTINCT COMM FROM EMP

--19. Obtén las comisiones de los empleados y sus números de departamento, de forma que no se
-- repitan filas.
SELECT DISTINCT ENAME, DEPTNO FROM EMP
SELECT DISTINCT ENAME FROM EMP
SELECT DISTINCT DEPTNO FROM EMP

--20. Obtén los nuevos salarios de los empleados del departamento 30, que resultarían de sumar a su
-- salario una gratificación de 1000. Muestra también los nombres de los empleados.
SELECT ENAME, SAL, DEPTNO FROM EMP
UPDATE EMP SET SAL = SAL + 1000 WHERE DEPTNO = 30
SELECT ENAME, SAL, DEPTNO FROM EMP

--21. Lo mismo que la anterior, pero mostrando también su salario original, y haz que la columna que
-- almacena el nuevo salario se denomine NUEVO SALARIO.
SELECT SAL FROM EMP WHERE DEPTNO = 30
ALTER TABLE EMP ADD SALNUEVO INT
UPDATE EMP SET SALNUEVO = SAL + 1000 WHERE DEPTNO = 30
SELECT SAL,SALNUEVO FROM EMP WHERE DEPTNO = 30

--22. Halla los empleados que tienen una comisión superior a la mitad de su salario.
SELECT ENAME,JOB FROM EMP WHERE COMM >= SAL/2

-- 23. Halla los empleados que no tienen comisión, o que la tengan menor o igual que el 25 % de su
-- salario.
SELECT ENAME, JOB FROM EMP WHERE COMM IS NULL  OR (COMM <= (SAL*0.25))

-- 24. Obtén una lista de nombres de empleados y sus salarios, de forma que en la salida aparezca en
-- todas las filas “Nombre:” y “Salario:” antes del respectivo campo. Hazlo de forma que selecciones
-- exactamente tres expresiones.

SELECT ENAME as Nombre, SAL as Salario FROM EMP WHERE

SELECT 'Nombre: ' + ENAME AS Nombre, 'Salario: ' + CAST(SAL AS VARCHAR) AS Salario
FROM EMP

SELECT ENAME, SAL FROM EMP

-- 25. Hallar el código, salario y comisión de los empleados cuyo c ́odigo sea mayor que 7500.

SELECT EMPNO, SAL, COMM FROM EMP WHERE EMPNO > 7500

-- 26. Obtén todos los datos de los empleados que estén (considerando una ordenación ASCII por
-- nombre) a partir de la J, inclusive.
SELECT * FROM EMP ORDER BY ASCII(ENAME)

-- 27. Obtén el salario, comisión y salario total (salario+comisión) de los empleados con comisión,
-- ordenando el resultado por número de empleado.

ALTER TABLE EMP ADD SALTOTAL INT
UPDATE EMP SET SALTOTAL = SAL + COMM
SELECT SAL,COMM, SALTOTAL FROM EMP ORDER BY ASCII(EMPNO)

-- 28. Lista la misma informaci ́on, pero para los empleados que no tienen comisi ́on.

