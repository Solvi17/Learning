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


--De no estar en Español
SET LANGUAGE Spanish
GO

--Al estar en Español ya podemos ingresar fechas en formato Día/Mes/Año


--También se puede establecer el ingreso de fechas como Día/Mes/Año
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
--  Búsquedas de Nulos y No Nulos
-------------------------------------

--3 Busquemos aquellos productos que no tienen accesorios.










--Tenga en cuenta que NULL no significa Vacío

--  NULL es un estado
--  NULL significa que el valor de los datos de la columna no se conoce

--  Además, un NULL es diferente a otro NULL
--  Por esa razón un NULL no se compara
--  No tendremos por ejemplo si Precio=Null



--Correcta básqueda de valores Null

SELECT * FROM #Venta
WHERE Accesorio is null
go

-- Los Null nunca se comparan,
-- sólo se pregunta si es Null o no es Null

--Correcta básqueda de valores No Null


SELECT * FROM #Venta
WHERE Accesorio is not null
go


--------------------------------------
--     FUNCIONES DE CONVERSIÓN      --
--------------------------------------

--------------------------
-- Función CONVERT y CAST
--------------------------
     
--4 Insertando Fechas en cadenas de Texto
--  Uso de CONVERT y CAST

-- Intento

SELECT 'Fecha Venta: ' + Fecha
FROM #Venta
go
-- Éxito

SELECT
'Fecha Venta: ' + CONVERT(CHAR(10), Fecha) As 'Usando Convert',
'Fecha Venta: ' + CAST(Fecha AS CHAR(10)) As 'Usando Cast'
FROM #Venta
go



--5 Usando Convert con el parámetro Style

--Fecha Actual

SELECT CONVERT(CHAR(10),GETDATE(),103)
GO
--Columna Fecha


SELECT CONVERT(CHAR(10),Fecha,103) AS 'Convert con Style 103'
FROM #Venta
GO


-- 103 es el valor del parámetro "Style" de la función CONVERT

-- 103 para dd/mm/aaaa
-- 104 para dd.mm.aaaa
-- 105 para dd-mm-aaaa



--------------------------------
--     FUNCIONES DE FECHA     --
--------------------------------
 
---------------------
 -- Función GETDATE
---------------------


--6 Devuelve la fecha actual

SELECT GETDATE()
GO

PRINT GETDATE()
GO

-----------------------------
-- Función YEAR, MONTH, DAY
-----------------------------

--7 Devuelve el Año actual

SELECT YEAR(GETDATE())
GO

PRINT YEAR(GETDATE())
GO


--8 Devuelve el Mes actual

SELECT MONTH(GETDATE())
GO

PRINT MONTH(GETDATE())
GO


--9 Devuelve el Día actual

SELECT DAY(GETDATE())
GO

PRINT DAY(GETDATE())
GO


--Ejecute su código de creación de Northwind nuevamente
--para anular cambios realizados con anterioridad

--Active Northwind
 USE Northwind
 GO
 

--10 Listar órdenes realizadas en el Año 1997

SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1997
GO


--11 Listado de órdenes realizadas en el mes de Agosto del año 1997
  
SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) =8
GO



--12 Listado de órdenes efectuadas en la Primera Quincena
--   del mes de Enero del año 1998 con excepción de los 
--   tres primeros días del mes

SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1998 AND MONTH(OrderDate) =1 
AND DAY(OrderDate) BETWEEN 4 AND 15
GO


--13 Veamos la lista de Idiomas de SQL Server
Sp_HelpLanguage
GO

-- Configuración Inglés:
-- Ingreso de Fechas MDY
-- Inicio de Días de Semana: Domingos=1, Lunes=2, ... Sábado=7

-- Configuración Español:
-- Ingreso de Fechas DMY
-- Inicio de Días de Semana: Lunes=1, Martes=2, ... Domingos=7



---------------------
-- Función DATEPART
---------------------

--14 Usar DATEPART

-- Día Actual
SELECT DATEPART(DAY,GETDATE())
GO

-- Mes Actual

SELECT DATEPART(MONTH,GETDATE())
GO

-- Año Actual

SELECT DATEPART(YEAR,GETDATE())
GO

-- Día de Semana Actual

SELECT DATEPART(WEEKDAY,GETDATE())
GO

-- Día del Año

SELECT DATEPART(DAYOFYEAR,GETDATE())
GO

-- Semana del Año

SELECT DATEPART(WEEK,GETDATE())
GO

-- Trimestre

SELECT DATEPART(QUARTER,GETDATE())
GO


--15 Seleccionar los pedidos del 3er trimestre de 1997
--   que fueron realizados un día Jueves


SELECT * FROM Orders
WHERE DATEPART(YEAR,OrderDate)=1997 AND DATEPART(QUARTER,OrderDate)=3 AND DATEPART(WEEKDAY,OrderDate) =4
GO


---------------------
-- Función DATENAME
---------------------

--16 Devuelve el nombre del Mes actual

SELECT DATENAME(MONTH,GETDATE())
GO


--17 Listado de órdenes emitidas un Martes 13 o un Domingo 7

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
-- Función DATEDIFF
---------------------

--18 Dadas dos fechas 
--   (Por ejemplo, 28 de Julio del 2017 y 31 de Diciembre del 2018)

-- Diferencia en Días

SELECT DATEDIFF(DAY,'28/07/2017','31/12/2018')
GO

-- Diferencia en Meses

SELECT DATEDIFF(MONTH,'28/07/2017','31/12/2018')
GO

-- Diferencia en Años

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
('Juan', 'López', '08/08/2008'),
('José', 'Acevedo', '05/05/2005'),
('María', 'Sosa', '23/09/1999'),
('Jesús', 'Montes', '31/07/2007'),
('Karla', 'Rosasco', '24/11/2004')
GO

SELECT * FROM #ABC
GO



--19
-- Liste Nombres y Apellidos indicando su Antigüedad

--Jesús aparece con 13 años, pero aún no cumple los 10 años

SELECT Nombre,Apellido, Fecha,
DATEDIFF(YEAR,Fecha,GETDATE()) As 'Antiguedad'
FROM #ABC 
GO

-- Para hacerlo exacto tome en cuenta los días

SELECT Nombre,Apellido, Fecha,
DATEDIFF(YEAR,Fecha,GETDATE()) As 'Antiguedad',
FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) As 'Antiguedad_Dias'
FROM #ABC 
GO

--Año Solar:
-- Tiempo que tarda la Tierra en hacer un giro completo alrededor del Sol 
-- referido al tiempo entre dos equinoccios. 
-- Dura 365 días, 5 horas 48 minutos y 45.6 segundos.



--20
-- Modifique la consulta anterior para seleccionar usuarios 
-- cuya antigüedad sea mayor a 14 años

SELECT Nombre,Apellido, Fecha,
FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) As 'Antiguedad'
FROM #ABC 
WHERE FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) > 14
GO

--21 Mostrar Nombre, Apellido, Fecha y Antigüedad de
--   usuarios registrados en la segunda quincena de cualquier mes
--   del segundo semestre (excepto Agosto) del Siglo XXI

SELECT Nombre,Apellido, Fecha,
FLOOR(DATEDIFF(DAY,Fecha,GETDATE())/365.25) As 'Antiguedad'
FROM #ABC 
WHERE (MONTH(Fecha)>=7 AND MONTH(Fecha)<> 8) AND
YEAR(Fecha)>2001
GO

---------------------
-- Función DATEADD
---------------------

--22 Obtener el día resultante si adiciono 
--	15 días a la Fecha Actual

SELECT DATEADD(DAY, 15, GETDATE())
GO

-- Obtener sólo la parte del día de dicha fecha

SELECT DATEPART(DAY,DATEADD(DAY,15,GETDATE()))
GO

-- Obtener el nombre del día de la semana de dicha fecha

SELECT DATENAME(WEEKDAY,DATEADD(DAY,15,GETDATE()))
GO


-- Obtener qué número de día del año será dicha fecha
-- Según la secuencia 1 - 365/366

SELECT DATEPART(DAYOFYEAR,DATEADD(DAY,15,GETDATE()))
GO

-----------------------------------
-- Trabajando con la Fecha Actual
-----------------------------------


--23 ¿Qué día es hoy?
--   Mostrar en cuatro columnas separadas: Día de Semana, Día, Mes y Año

SELECT  DATENAME(WEEKDAY, GETDATE()),
		DAY(GETDATE()),
		DATENAME(MONTH, GETDATE()),
		YEAR(GETDATE())
GO


--24 ¿Qué día es hoy? [Versión Mejorada]
--   Modelo del resultado: Hoy es Miércoles 3 de Mayo de 2017

SELECT  
'Hoy es ' + DATENAME(WEEKDAY, GETDATE()) + ' ' +
CAST(DAY(GETDATE()) AS  varchar(2))+ ' de ' +
DATENAME(MONTH, GETDATE()) + ' de ' +
CAST(YEAR(GETDATE()) AS CHAR(4))
GO



--25 Cambie la consulta anterior para su Fecha de Nacimiento
--   Por ejemplo, usaré como fecha 17/04/1998
--   Modelo del resultado: Naciste un día Jueves 9 de Septiembre de 1999

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
-- Función LEN
---------------------

--26 Mostrar la Longitud de cada Nombre

SELECT Nombre, LEN(Nombre) AS 'LONGITUD'
FROM #ABC
GO	


--27 Mostrar los Apellidos con más de 5 letras


SELECT Nombre,Apellido AS 'LONGITUD'
FROM #ABC
WHERE LEN(Apellido) >5
GO	


---------------------
-- Función LEFT
---------------------

--28 La Inicial del Nombre con el Apellido 
--   Modelo del resultado: J. López, M. Sosa, etc.


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
-- Función RIGHT
---------------------

--30 Dos últimas letras de los Apellidos


SELECT Nombre, Apellido,RIGHT(Apellido,2) AS 'ULTIMOS APELLIDOS'
FROM #ABC
GO


--31 Nombres que NO empiecen con K y Apellidos que terminen en A, O , S


SELECT Nombre, Apellido AS 'ULTIMOS APELLIDOS'
FROM #ABC
WHERE LEFT(Nombre,1)<>'K' and RIGHT(Apellido,1) IN ('A', 'O', 'S')
GO



---------------------
-- Función SUBSTRING
---------------------

 /*
 
 Extrae una porción de texto indicando la posición inicial 
 y el número de caracteres a extraer.
 
 Sintaxis: 
 SUBSTRING(Texto a trabajar, Posición Inicial , Nro. Caracteres a extraer)
 
 
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
-- Función LOWER
-- Función UPPER
---------------------

--35
-- Nombre en minúsculas y Apellido en mayúsculas

SELECT LOWER(Nombre) AS MINUSCULA, UPPER(Apellido) As MAYUSCULA
FROM #ABC
GO


---------------------
-- Autogenerado
---------------------

--36 
/*  Ejercicio
    Generar el código para cada usuario

	Regla:
	UNAC
	GUION
	2 PRIMERAS LETRAS NOMBRE
	2 ULTIMOS DIGITOS AÑO
	3RA LETRA APELLIDO
	TODO EN MAYUSCULAS

*/

SELECT 
UPPER('UNAC'+ '-' + LEFT(Nombre,2) + RIGHT(YEAR(Fecha),2) + SUBSTRING(Apellido,3,1))
FROM #ABC
GO


  
-----------------------
-- Función CHARINDEX
-----------------------

 /*
 
 Retorna la posición inicial de una cadena de caracteres.
 
 Sintaxis: 
 CHARINDEX(Cadena_búsqueda, Texto_origen ,Inicio)
 
 Si el tercer argumento no se coloca, la búsqueda se da desde el inicio del texto. 
 Si no encuentra la cadena indicada, retorna 0. 
 
 */
 

--37 Función CHARINDEX

--Buscar or empezando del inicio del texto

SELECT CHARINDEX('OR','Jorge Luis Borges')	--	Retorna 2
GO
--Buscar or empezando desde el 4to caracter del texto

SELECT CHARINDEX('OR','Jorge Luis Borges',3)	--Retorna 13
GO

---------------------
-- Función REPLACE
---------------------

/*
Reemplaza una porción de texto por otra.

Sintaxis:
REPLACE(Texto_origen, Texto Antiguo, Texto Nuevo)

*/

--38 Función Replace
SELECT REPLACE('Perú campeón','Perú','Vamos bien')  --Vamos bien campeón
GO


SELECT REPLACE('sql asp c# asp','asp','php')        --sql php c# php
GO



---------------------    
-- Función STUFF
---------------------

/* 
 Elimina una longitud específica de caracteres de un texto
 e inserta otra cadena de caracteres especificando la posición de inicio.

 Sintaxis: 
 STUFF (Texto_Original , Inicio , Longitud_Reemplazo , Cadena)
 
 */


--39 Función Stuff
SELECT STUFF('abcdefg',3,2,'1234')       -- Se obtiene ab1234efg
GO                                        
  

SELECT STUFF('UNIVERSO',5,4,'UNAC2017')  --Se obtiene UNIVUNAC2017
GO                                       --Note que ERSO fue eliminado
                                         --Esto no hubiera sucedido con REPLACE



-----------------------------
-- Funciones LTRIM y RTRIM
-----------------------------


--40 Función LTRIM 
--    (Quita espacios en blanco por la izquierda)

SELECT LTRIM('     Tuve 5 espacios en blanco al inicio')
GO



--41 Función RTRIM 
--    (Quita espacios en blanco por la derecha)

SELECT RTRIM('Tuve 5 espacios en blanco al final     ')
GO



--42 Retire los espacios en blanco al inicio y al final del siguiente texto
SELECT '  TEXTO     '
GO

SELECT LTRIM(RTRIM('  TEXTO     '))
GO

--Cuenta la cantidad de caracteres para verificar sólo tenga cinco
SELECT LEN(LTRIM(RTRIM('  TEXTO     ')))
GO



-----------------------
-- Función SPACE
-----------------------

--43 Función Space
SELECT 'Lima'+ SPACE(15) +'está nublada'
GO



---------------------
-- Función REVERSE
---------------------

--44 Función REVERSE
SELECT REVERSE('canu')     
GO

SELECT REVERSE('reconocer') --Palíndromo
GO



-----------------------
-- Función REPLICATE
-----------------------

--45 Función Replicate
SELECT REPLICATE('UNAC',3)
GO

SELECT REPLICATE('=',40)
GO



----------------------------------
-- Funciones ASCII y CHARACTER
----------------------------------

--46 Función ASCII
SELECT ASCII('@'), ASCII('\'), ASCII('n')
GO


--47 Función CHAR
SELECT CHAR(64), CHAR(92), CHAR(110)
GO