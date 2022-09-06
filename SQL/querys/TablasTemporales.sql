-- CONOCIENDO TABLAS TEMPORALES SQL --

--1 Probando Char vs Varchar
CREATE TABLE #Tabla (
A VARCHAR(10), 
B CHAR(10)
)
GO

INSERT #Tabla 
VALUES ('Hola', 'Unac')
GO

SELECT  A+'*' AS 'Con Varchar', 
        B+'*' AS 'Con Char' 
FROM #Tabla
GO                              -- Note la diferencia



--2 Crear la sgte Tabla Temporal

CREATE TABLE #Venta(
ID INT IDENTITY,
Cliente VARCHAR(40),
Producto VARCHAR(40),
Fecha DATE,
Accesorio VARCHAR(40) 
)
GO


--Vemos el Idioma de nuestro Sql Server
Select @@Language
GO


--De no estar en Espa�ol
SET LANGUAGE Spanish
GO

--Al estar en Espa�ol ya podemos ingresar fechas en formato D�a/Mes/A�o


--Tambi�n se puede establecer el ingreso de fechas como D�a/Mes/A�o
SET DATEFORMAT DMY
GO


--Insertamos 7 ventas
INSERT #Venta
VALUES
('Carla', 'Dvd', '11/04/2017', 'Adaptador'),
('David', 'Equipo', '12/04/2017', 'Cd'),
('Sandra', 'Equipo', '12/04/2017', NULL),
('Jenny', 'Laptop', '12/04/2017', 'Cargador'),
('Alberto', 'Dvd', '13/04/2017', NULL),
('Carla', 'Impresora', '13/04/2017', NULL),
('Sandra', 'Web-cam', '14/04/2017', NULL)
GO

--Verificamos
SELECT * FROM #Venta
GO


-------------------------------------
--  B�squedas de Nulos y No Nulos
-------------------------------------

--3 Busquemos aquellos productos que no tienen accesorios.










--Tenga en cuenta que NULL no significa Vac�o

--  NULL es un estado
--  NULL significa que el valor de los datos de la columna no se conoce

--  Adem�s, un NULL es diferente a otro NULL
--  Por esa raz�n un NULL no se compara
--  No tendremos por ejemplo si Precio=Null



--Correcta b�squeda de valores Null

SELECT * FROM #Venta
WHERE Accesorio is null
go

-- Los Null nunca se comparan,
-- s�lo se pregunta si es Null o no es Null

--Correcta b�squeda de valores No Null


SELECT * FROM #Venta
WHERE Accesorio is not null
go


--------------------------------------
--     FUNCIONES DE CONVERSI�N      --
--------------------------------------

--------------------------
-- Funci�n CONVERT y CAST
--------------------------
     
--4 Insertando Fechas en cadenas de Texto
--  Uso de CONVERT y CAST

-- Intento

SELECT 'Fecha Venta: ' + Fecha
FROM #Venta
go
-- �xito

SELECT
'Fecha Venta: ' + CONVERT(CHAR(10), Fecha) As 'Usando Convert',
'Fecha Venta: ' + CAST(Fecha AS CHAR(10)) As 'Usando Cast'
FROM #Venta
go



--5 Usando Convert con el par�metro Style

--Fecha Actual

SELECT CONVERT(CHAR(10),GETDATE(),103)
GO
--Columna Fecha


SELECT CONVERT(CHAR(10),Fecha,103) AS 'Convert con Style 103'
FROM #Venta
GO


-- 103 es el valor del par�metro "Style" de la funci�n CONVERT

-- 103 para dd/mm/aaaa
-- 104 para dd.mm.aaaa
-- 105 para dd-mm-aaaa



--------------------------------
--     FUNCIONES DE FECHA     --
--------------------------------
 
---------------------
 -- Funci�n GETDATE
---------------------


--6 Devuelve la fecha actual

SELECT GETDATE()
GO

PRINT GETDATE()
GO

-----------------------------
-- Funci�n YEAR, MONTH, DAY
-----------------------------

--7 Devuelve el A�o actual

SELECT YEAR(GETDATE())
GO

PRINT YEAR(GETDATE())
GO


--8 Devuelve el Mes actual

SELECT MONTH(GETDATE())
GO

PRINT MONTH(GETDATE())
GO


--9 Devuelve el D�a actual

SELECT DAY(GETDATE())
GO

PRINT DAY(GETDATE())
GO


--Ejecute su c�digo de creaci�n de Northwind nuevamente
--para anular cambios realizados con anterioridad

--Active Northwind
 USE Northwind
 GO
 

--10 Listar �rdenes realizadas en el A�o 1997

SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1997
GO


--11 Listado de �rdenes realizadas en el mes de Agosto del a�o 1997
  
SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) =8
GO



--12 Listado de �rdenes efectuadas en la Primera Quincena
--   del mes de Enero del a�o 1998 con excepci�n de los 
--   tres primeros d�as del mes

SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1998 AND MONTH(OrderDate) =1 
AND DAY(OrderDate) BETWEEN 4 AND 15
GO


--13 Veamos la lista de Idiomas de SQL Server
Sp_HelpLanguage
GO

-- Configuraci�n Ingl�s:
-- Ingreso de Fechas MDY
-- Inicio de D�as de Semana: Domingos=1, Lunes=2, ... S�bado=7

-- Configuraci�n Espa�ol:
-- Ingreso de Fechas DMY
-- Inicio de D�as de Semana: Lunes=1, Martes=2, ... Domingos=7



---------------------
-- Funci�n DATEPART
---------------------

--14 Usar DATEPART

-- D�a Actual
SELECT DATEPART(DAY,GETDATE())
GO

-- Mes Actual

SELECT DATEPART(MONTH,GETDATE())
GO

-- A�o Actual

SELECT DATEPART(YEAR,GETDATE())
GO

-- D�a de Semana Actual

SELECT DATEPART(WEEKDAY,GETDATE())
GO

-- D�a del A�o

SELECT DATEPART(DAYOFYEAR,GETDATE())
GO

-- Semana del A�o

SELECT DATEPART(WEEK,GETDATE())
GO

-- Trimestre

SELECT DATEPART(QUARTER,GETDATE())
GO


--15 Seleccionar los pedidos del 3er trimestre de 1997
--   que fueron realizados un d�a Jueves


SELECT * FROM Orders
WHERE DATEPART(YEAR,OrderDate)=1997 AND DATEPART(QUARTER,OrderDate)=3 AND DATEPART(WEEKDAY,OrderDate) =4
GO


---------------------
-- Funci�n DATENAME
---------------------

--16 Devuelve el nombre del Mes actual

SELECT DATENAME(MONTH,GETDATE())
GO


--17 Listado de �rdenes emitidas un Martes 13 o un Domingo 7

SELECT * FROM Orders
WHERE (DATENAME(WEEKDAY,OrderDate)='Martes' and DATEPART(DAY,OrderDate)=13)
or (DATENAME(WEEKDAY,OrderDate)='Domingo' and DATEPART(DAY,OrderDate)=7)
GO

--Como no hay resultados para Domingo, cambie por Lunes

SELECT * FROM Orders
WHERE (DATENAME(WEEKDAY,OrderDate)='Martes' and DATEPART(DAY,OrderDate)=13)
or (DATENAME(WEEKDAY,OrderDate)='Lunes' and DATEPART(DAY,OrderDate)=7)
GO
 
---------------------
-- Funci�n DATEDIFF
---------------------

--18 Dadas dos fechas 
--   (Por ejemplo, 28 de Julio del 2017 y 31 de Diciembre del 2018)

-- Diferencia en D�as

SELECT DATEDIFF(DAY,'28/07/2017','31/12/2018')
GO

-- Diferencia en Meses

SELECT DATEDIFF(MONTH,'28/07/2017','31/12/2018')
GO

-- Diferencia en A�os

SELECT DATEDIFF(YEAR,'28/07/2017','31/12/2018')
GO

-- Diferencia en Semanas

SELECT DATEDIFF(WEEK,'28/07/2017','31/12/2018')
GO

-- Diferencia en Trimestres


SELECT DATEDIFF(QUARTER,'28/07/2017','31/12/2018')
GO

-- Crear la siguiente Tabla Temporal
CREATE TABLE #ABC(
Nombre VARCHAR(50),
Apellido VARCHAR (50),
Fecha DATE
)
GO

INSERT #ABC
VALUES
('Juan', 'L�pez', '08/08/2008'),
('Jos�', 'Acevedo', '05/05/2005'),
('Mar�a', 'Sosa', '23/09/1999'),
('Jes�s', 'Montes', '31/07/2007'),
('Karla', 'Rosasco', '24/11/2004')
GO

SELECT * FROM #ABC
GO



--19
-- Liste Nombres y Apellidos indicando su Antig�edad

--Jes�s aparece con 13 a�os, pero a�n no cumple los 10 a�os

SELECT Nombre,Apellido, Fecha,
DATEDIFF(YEAR,Fecha,GETDATE()) As 'Antiguedad'
FROM #ABC 
GO

-- Para hacerlo exacto tome en cuenta los d�as

SELECT Nombre,Apellido, Fecha,
DATEDIFF(YEAR,Fecha,GETDATE()) As 'Antiguedad',
FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) As 'Antiguedad_Dias'
FROM #ABC 
GO

--A�o Solar:
-- Tiempo que tarda la Tierra en hacer un giro completo alrededor del Sol 
-- referido al tiempo entre dos equinoccios. 
-- Dura 365 d�as, 5 horas 48 minutos y 45.6 segundos.



--20
-- Modifique la consulta anterior para seleccionar usuarios 
-- cuya antig�edad sea mayor a 14 a�os

SELECT Nombre,Apellido, Fecha,
FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) As 'Antiguedad'
FROM #ABC 
WHERE FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) > 14
GO

--21 Mostrar Nombre, Apellido, Fecha y Antig�edad de
--   usuarios registrados en la segunda quincena de cualquier mes
--   del segundo semestre (excepto Agosto) del Siglo XXI

SELECT Nombre,Apellido, Fecha,
FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) As 'Antiguedad'
FROM #ABC 
WHERE (MONTH(Fecha)>=7 AND MONTH(Fecha)<> 8) AND
YEAR(Fecha)>2001
GO

---------------------
-- Funci�n DATEADD
---------------------

--22 Obtener el d�a resultante si adiciono 
--	15 d�as a la Fecha Actual

SELECT DATEADD(DAY, 15, GETDATE())
GO

-- Obtener s�lo la parte del d�a de dicha fecha

SELECT DATEPART(DAY,DATEADD(DAY,15,GETDATE()))
GO

-- Obtener el nombre del d�a de la semana de dicha fecha

SELECT DATENAME(WEEKDAY,DATEADD(DAY,15,GETDATE()))
GO


-- Obtener qu� n�mero de d�a del a�o ser� dicha fecha
-- Seg�n la secuencia 1 - 365/366

SELECT DATEPART(DAYOFYEAR,DATEADD(DAY,15,GETDATE()))
GO

-----------------------------------
-- Trabajando con la Fecha Actual
-----------------------------------


--23 �Qu� d�a es hoy?
--   Mostrar en cuatro columnas separadas: D�a de Semana, D�a, Mes y A�o

SELECT  DATENAME(WEEKDAY, GETDATE()),
		DAY(GETDATE()),
		DATENAME(MONTH, GETDATE()),
		YEAR(GETDATE())
GO


--24 �Qu� d�a es hoy? [Versi�n Mejorada]
--   Modelo del resultado: Hoy es Mi�rcoles 3 de Mayo de 2017

SELECT  
'Hoy es ' + DATENAME(WEEKDAY, GETDATE()) + ' ' +
CAST(DAY(GETDATE()) AS  varchar(2))+ ' de ' +
DATENAME(MONTH, GETDATE()) + ' de ' +
CAST(YEAR(GETDATE()) AS CHAR(4))
GO



--25 Cambie la consulta anterior para su Fecha de Nacimiento
--   Por ejemplo, usar� como fecha 17/04/1998
--   Modelo del resultado: Naciste un d�a Jueves 9 de Septiembre de 1999

SELECT  
'Naciste un dia ' + DATENAME(WEEKDAY, '17/04/1998') + ' ' +
CAST(DAY('17/04/1998') AS  varchar(2))+ ' de ' +
DATENAME(MONTH, '17/04/1998') + ' de ' +
CAST(YEAR('17/04/1998') AS CHAR(4))
GO



--------------------------------
--     FUNCIONES DE CADENA    --
--------------------------------
  
---------------------
-- Funci�n LEN
---------------------

--26 Mostrar la Longitud de cada Nombre

SELECT Nombre, LEN(Nombre) AS 'LONGITUD'
FROM #ABC
GO	


--27 Mostrar los Apellidos con m�s de 5 letras


SELECT Nombre,Apellido AS 'LONGITUD'
FROM #ABC
WHERE LEN(Apellido) >5
GO	


---------------------
-- Funci�n LEFT
---------------------

--28 La Inicial del Nombre con el Apellido 
--   Modelo del resultado: J. L�pez, M. Sosa, etc.


SELECT LEFT(Nombre,1) + '. '+Apellido AS 'USUARIO'
FROM #ABC
GO


--29 Modificar la consulta anterior
--   para Usuarios cuya 1ra letra del Nombre empiece con J


SELECT Nombre
FROM #ABC
WHERE LEFT(Nombre,1)='J'
GO


---------------------
-- Funci�n RIGHT
---------------------

--30 Dos �ltimas letras de los Apellidos


SELECT Nombre, Apellido,RIGHT(Apellido,2) AS 'ULTIMOS APELLIDOS'
FROM #ABC
GO


--31 Nombres que NO empiecen con K y Apellidos que terminen en A, O , S


SELECT Nombre, Apellido AS 'ULTIMOS APELLIDOS'
FROM #ABC
WHERE LEFT(Nombre,1)<>'K' and RIGHT(Apellido,1) IN ('A', 'O', 'S')
GO



---------------------
-- Funci�n SUBSTRING
---------------------

 /*
 
 Extrae una porci�n de texto indicando la posici�n inicial 
 y el n�mero de caracteres a extraer.
 
 Sintaxis: 
 SUBSTRING(Texto a trabajar, Posici�n Inicial , Nro. Caracteres a extraer)
 
 
 */
 
--32 Listar los Apellidos cuyo 3er y 4to
--   caracter tengan la cadena 'EV'

SELECT APELLIDO, SUBSTRING(Apellido,3,2) As CARACTER
FROM #ABC
where SUBSTRING(Apellido,3,2)='EV'
GO


--33 Apellidos en cuyo 4to, 5to y 6to
--   caracter figure la cadena 'TES'

SELECT APELLIDO
FROM #ABC
where SUBSTRING(Apellido,4,3)='TES'
GO


--34 Seleccione los clientes en cuyo Nombre o Apellido 
--   el 2do y 3er caracter coincidan con
--   la cadena 'OS'


SELECT Nombre,Apellido
FROM #ABC
where SUBSTRING(Nombre,2,2)='OS' or SUBSTRING(Apellido,2,2)='OS'
GO


---------------------
-- Funci�n LOWER
-- Funci�n UPPER
---------------------

--35
-- Nombre en min�sculas y Apellido en may�sculas

SELECT LOWER(Nombre) AS MINUSCULA, UPPER(Apellido) As MAYUSCULA
FROM #ABC
GO


---------------------
-- Autogenerado
---------------------

--36 
/*  Ejercicio
    Generar el c�digo para cada usuario

	Regla:
	UNAC
	GUION
	2 PRIMERAS LETRAS NOMBRE
	2 ULTIMOS DIGITOS A�O
	3RA LETRA APELLIDO
	TODO EN MAYUSCULAS

*/

SELECT 
UPPER('UNAC'+ '-' + LEFT(Nombre,2) + RIGHT(YEAR(Fecha),2) + SUBSTRING(Apellido,3,1))
FROM #ABC
GO


  
-----------------------
-- Funci�n CHARINDEX
-----------------------

 /*
 
 Retorna la posici�n inicial de una cadena de caracteres.
 
 Sintaxis: 
 CHARINDEX(Cadena_b�squeda, Texto_origen ,Inicio)
 
 Si el tercer argumento no se coloca, la b�squeda se da desde el inicio del texto. 
 Si no encuentra la cadena indicada, retorna 0. 
 
 */
 

--37 Funci�n CHARINDEX

--Buscar or empezando del inicio del texto

SELECT CHARINDEX('OR','Jorge Luis Borges')	--	Retorna 2
GO
--Buscar or empezando desde el 4to caracter del texto

SELECT CHARINDEX('OR','Jorge Luis Borges',3)	--Retorna 13
GO

---------------------
-- Funci�n REPLACE
---------------------

/*
Reemplaza una porci�n de texto por otra.

Sintaxis:
REPLACE(Texto_origen, Texto Antiguo, Texto Nuevo)

*/

--38 Funci�n Replace
SELECT REPLACE('Per� campe�n','Per�','Vamos bien')  --Vamos bien campe�n
GO


SELECT REPLACE('sql asp c# asp','asp','php')        --sql php c# php
GO



---------------------    
-- Funci�n STUFF
---------------------

/* 
 Elimina una longitud espec�fica de caracteres de un texto
 e inserta otra cadena de caracteres especificando la posici�n de inicio.

 Sintaxis: 
 STUFF (Texto_Original , Inicio , Longitud_Reemplazo , Cadena)
 
 */


--39 Funci�n Stuff
SELECT STUFF('abcdefg',3,2,'1234')       -- Se obtiene ab1234efg
GO                                        
  

SELECT STUFF('UNIVERSO',5,4,'UNAC2017')  --Se obtiene UNIVUNAC2017
GO                                       --Note que ERSO fue eliminado
                                         --Esto no hubiera sucedido con REPLACE



-----------------------------
-- Funciones LTRIM y RTRIM
-----------------------------


--40 Funci�n LTRIM 
--    (Quita espacios en blanco por la izquierda)

SELECT LTRIM('     Tuve 5 espacios en blanco al inicio')
GO



--41 Funci�n RTRIM 
--    (Quita espacios en blanco por la derecha)

SELECT RTRIM('Tuve 5 espacios en blanco al final     ')
GO



--42 Retire los espacios en blanco al inicio y al final del siguiente texto
SELECT '  TEXTO     '
GO

SELECT LTRIM(RTRIM('  TEXTO     '))
GO

--Cuenta la cantidad de caracteres para verificar s�lo tenga cinco
SELECT LEN(LTRIM(RTRIM('  TEXTO     ')))
GO



-----------------------
-- Funci�n SPACE
-----------------------

--43 Funci�n Space
SELECT 'Lima'+ SPACE(15) +'est� nublada'
GO



---------------------
-- Funci�n REVERSE
---------------------

--44 Funci�n REVERSE
SELECT REVERSE('canu')     
GO

SELECT REVERSE('reconocer') --Pal�ndromo
GO



-----------------------
-- Funci�n REPLICATE
-----------------------

--45 Funci�n Replicate
SELECT REPLICATE('UNAC',3)
GO

SELECT REPLICATE('=',40)
GO



----------------------------------
-- Funciones ASCII y CHARACTER
----------------------------------

--46 Funci�n ASCII
SELECT ASCII('@'), ASCII('\'), ASCII('n')
GO


--47 Funci�n CHAR
SELECT CHAR(64), CHAR(92), CHAR(110)
GO