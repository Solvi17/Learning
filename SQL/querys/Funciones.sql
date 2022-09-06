--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
-- I- Funciones
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--


/* Funciones Creadas por SQL
   ------------------------- 
   
   Deterministas:
   Las funciones deterministas devuelven siempre el mismo resultado 
   cada vez que se invocan con un conjunto específico de valores de entrada 
   y cuando el estado de la base de datos es el mismo.
   
   Ej: Left, Count, Avg, Sum, Day, Month, etc.
   
   No Deterministas:
   Las funciones no deterministas pueden devolver resultados diferentes 
   cada vez que se llaman con un conjunto específico de valores de entrada 
   aunque el estado de la base de datos a la que tienen acceso 
   permanezca sin cambios.
   
   Ej: Getdate, Rand, etc.
*/   



-- FUNCIONES ESCALARES
-- Da un solo resultado por registro

USE AccesDatabase
GO



-- 01 Crear una Función que calcule el Total de una Factura

CREATE FUNCTION uf_CalcularFactura (@Num_fac CHAR(5)) 
RETURNS DECIMAL(10,2) 
AS
Begin
    RETURN (SELECT SUM(Pre_ven*Can_ven)
	        FROM Tb_Detalle_Factura
	        WHERE Num_fac=@Num_fac)
End
GO

-- Probando la Función
SELECT dbo.uf_CalcularFactura('FA007')
GO

SELECT Num_fac, fec_fac, dbo.uf_CalcularFactura(Num_fac) AS 'Total'
FROM Tb_Factura
GO

SELECT Num_fac, fec_fac, dbo.uf_CalcularFactura(Num_fac) AS 'Total'
FROM Tb_Factura
WHERE Num_fac='FA007'
GO





-- 02 Crear una Función que nos muestre el Nombre del Cliente y su RUC

CREATE FUNCTION uf_NombreCompleto
(@Cod_cli varchar(4)) 
RETURNS varchar(100) 
AS
Begin
	RETURN (SELECT Raz_soc_cli +' Ruc Nº: '+Ruc_cli
	        FROM dbo.Tb_Cliente
	        WHERE Cod_cli=@Cod_cli)
End
GO


-- Probando la Función
SELECT dbo.uf_NombreCompleto('C014')
GO

SELECT Num_fac, dbo.uf_NombreCompleto(Cod_cli) AS 'Cliente'
FROM Tb_Factura
GO

SELECT Num_fac, dbo.uf_NombreCompleto(Cod_cli) AS 'Cliente'
FROM Tb_Factura
WHERE Cod_cli='C014'
GO






--03  Función que calcule la deuda de un Cliente en base a sus
--    Facturas pendientes de Pago

CREATE FUNCTION CalcularDeuda(@Codcli CHAR(4))
RETURNS MONEY
AS

Begin
	DECLARE @Deuda MONEY

	SET @Deuda=(SELECT SUM(dbo.uf_CalcularFactura(Num_fac))
                FROM Tb_Factura
                WHERE Cod_cli=@Codcli AND Est_fac='1') -- 1 es No cancelada
                 
    IF @Deuda IS NULL
    SET @Deuda=0
   
RETURN @Deuda
END
GO


-- Probando la Función
SELECT Cod_cli, Raz_soc_cli, dbo.CalcularDeuda(Cod_cli) AS 'Deuda'
FROM Tb_Cliente
WHERE dbo.calcularDeuda(Cod_cli)>0
GO






--04 Una Función que halle el Mejor Precio de Abastecimiento

-- Por ejemplo, el producto P001 nos venden a 28 y a 27 soles.
SELECT Cod_pro, Pre_aba FROM Tb_Abastecimiento
WHERE Cod_pro='P001'
GO

-- De los dos, el mejor precio sería 27
SELECT TOP 1 Cod_pro, Pre_aba FROM Tb_Abastecimiento
WHERE Cod_pro='P001'
ORDER BY Pre_Aba ASC
GO

-- Creando la Función
CREATE FUNCTION uf_MejorPrecioAbas (@Cod_pro CHAR(4)) 
RETURNS MONEY
AS

Begin
	DECLARE @Aba MONEY
	
	SET @Aba=(SELECT TOP 1 Pre_Aba
              FROM Tb_Abastecimiento
              WHERE Cod_pro=@Cod_pro
              ORDER BY Pre_Aba ASC)
    
    IF @Aba is null 
	SET @Aba =0

RETURN @Aba
End
GO

-- Probando la Función
SELECT Cod_pro, Des_pro, Pre_pro AS 'Precio Venta', 
dbo.uf_MejorPrecioAbas(Cod_pro) AS 'Mejor Precio Abast.'
FROM Tb_Producto
GO


SELECT Cod_pro, Des_pro, Pre_pro AS 'Precio Venta', 
dbo.uf_MejorPrecioAbas(Cod_pro) AS 'Mejor Precio Abast.',
Pre_pro-dbo.uf_MejorPrecioAbas(Cod_pro) AS 'Ganancia'
FROM Tb_Producto
GO








--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
-- III- Procedimientos Almacenados
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--


/*
Un Procedimiento Almacenado (Stored Procedure) es un Programa 
(o Procedimiento) el cual es almacenado físicamente en una Base de Datos.

Los procedimientos almacenados no son mas que una sucesion ordenada de 
instrucciones T-SQL que pueden recibir y devolver parametros provistos 
por el usuario y se pueden guardar en el servidor con un nombre, para luego 
poder invocarlos y ejecutarlos. 


Algunas de las ventajas de usar procedimientos almacenados
----------------------------------------------------------

> Compilación: La primera vez que se invoca un procedimiento almacenado, 
el motor lo compila y a partir de ahí, se sigue usando la version compilada 
del mismo, hasta que se modifique o se reinicie el servicio de SQL. 
Esto hace que que tengan un mejor rendimiento que las consultas directas 
que usan cadenas con instrucciones T-SQL, que el motor compila cada vez que se invoca.

> Automatización: Si tenemos un conjunto de instrucciones T-SQL que queremos 
ejecutar en un orden, los stored procedures son el espacio ideal para hacerlo.

> Administración: Si hacemos buen uso de los procedimientos almacenados, 
muchas veces algún cambio en nuestra aplicación, solo implica modificar 
un stored procedure y no toda la aplicación. 
Si nuestra aplicación llama a los stored procedures, con solo cambiarlo 
en el servidor, ya tenemos todo funcionado sin la necesidad de actualizar 
la aplicación en todos los equipos cliente.

> Seguridad: Otra ventaja que tienen es que permiten aplicar un esquema 
de seguridad mas potente, haciendo que los usuarios que usen nuestra aplicación, 
sólo tengan permisos para ejecutar procedimientos almacenados y no a todos los 
objetos de la base. De esta forma si un hacker encuentra una vulnerabilidad 
(SQL Injection) en nuestra aplicación, no podra explotarla ejecutando comandos SQL 
directamente sobre la base, ya que el usuario con el cual se ejecuta la aplicación 
sólo tiene derecho a la ejecucion de los procedimientos almacenados en la 
base de datos.

> Programabilidad: Los procedimientos almacenados admiten el uso de variables 
y estructuras de control como IF, Bucles, Case, etc. Además de el manejo de 
transacciones, que permiten que los stored procedures sean aplicables para 
escribir logica del negocio en los mismos. 

Trafico de Red: Pueden reducir el trafico de la red, debido a que se trabaja 
sobre el motor (en el servidor), y si una operación incluye hacer un trabajo 
de lectura primero y en base a eso realizar algunas operaciones, esos datos 
que se obtienen no viajan por la red.

*/

use Northwind
go

--ver el listado de tablas
select * from sys.tables
go

--ver el listado de tablas
select *from Customers
go

--A)Crear un PA que liste los clientes de francia

Create procedure ClientesFrancia
as
Select companyname from  Customers
where Country = 'France'
go

--EJecutamos el PA ClientesFrancia
Execute ClientesFrancia
go

Exec ClientesFrancia
go

ClientesFrancia
go

--B) Crear un PA que liste los pedidos por mes y año
Create procedure Informe
@Mes Tinyint,
@Año Smallint
As
Select * from Orders
where MONTH(OrderDate) = @Mes and YEAR(OrderDate)=@Año
go

--EJecutamos el PA Informe
Execute Informe 7, 1996
go

Exec Informe 8, 1997
go

Create procedure Apellido
@Iniciales varchar(100)
as
select * from Employees
where LastName like @Iniciales + '%'
go

execute Apellido 'D'
go

execute Apellido 'Da'
go

execute Apellido 'Do'
go


Use AccesDatabase
go

-- 05 Elabore un Stored Procedure que permita saber el nombre de los Distritos 
--    que cubre determinado Vendedor.

CREATE PROCEDURE USP_DISTRITOS_CUBRE_VENDEDOR (@Vendedor CHAR(3))
AS
Begin
	SELECT Nom_dis FROM dbo.Tb_Distrito
	WHERE @Vendedor=Cod_ven
End
GO


-- Probando el Stored Procedure
EXEC USP_DISTRITOS_CUBRE_VENDEDOR 'V04'
GO




--  06 Elabore un Procedimiento que determine el Número de Facturas 
--     vencidas de un Cliente.


CREATE PROCEDURE USP_FACTURAS_VENCIDAS
(@Codcli CHAR(4)
)
AS
Begin
	SELECT COUNT(Num_fac) FROM dbo.Tb_Factura
	WHERE Est_fac='1' AND Cod_cli=@Codcli
End
GO

-- Probando el Stored Procedure
EXEC USP_FACTURAS_VENCIDAS @Codcli='C019'
GO

-- ¿El ejercicio anterior, quedaría como Procedimiento o Función?







--07 Cree un Procedimiento que permita visualizar los números de factura, 
--   fecha de facturación y cancelación, así como el total de las facturas 
--   generadas por un determinado clientes.

CREATE PROCEDURE USP_VISUALIZAR (@Codcli CHAR(4))
AS

Begin
	SELECT Num_Fac, Fec_fac, Fec_can,
	dbo.uf_CalcularFactura(Num_Fac) AS 'Total'
	FROM Tb_Factura
	WHERE Cod_cli=@CodCli
End
GO


-- Probando el Stored Procedure
EXEC USP_VISUALIZAR @Codcli='C001'
GO

EXEC USP_VISUALIZAR @Codcli='C019'
GO


-- Manejando el que no haya cancelado aún

ALTER PROCEDURE USP_VISUALIZAR (@Codcli CHAR(4))
AS

Begin
	SELECT Num_Fac, Fec_fac, 
	IsNull(CAST(Fec_can AS VARCHAR(30)), 'No canceló aún'),
	dbo.uf_CalcularFactura(Num_Fac) AS 'Total'
	FROM Tb_Factura
	WHERE Cod_cli=@CodCli
End
GO

-- Probando el Stored Procedure
EXEC USP_VISUALIZAR @Codcli='C001'
GO

EXEC USP_VISUALIZAR @Codcli='C019'
GO



-- ¿Podría hacer que las que son fechas se vean como fechas y los null
-- con el correspondiente mensaje?



---------------------------------
      --/SQL VARIANT/--
---------------------------------

CREATE TABLE Variedad(
Id SMALLINT,
Dato SQL_VARIANT)
Go

-- Si es un número que va a ser usado en operaciones matemáticas,
-- colocarlo sin comillas.

Insert Variedad (Id, Dato)
Values 
('1', 'HOLA')
GO

Insert Variedad (Id, Dato)
Values 
('2', 2000)
GO

Insert Variedad (Id, Dato)
Values 
('3', '1/12/2000')
GO

Insert Variedad (Id, Dato)
Values 
('4', 50000)
GO

SELECT * FROM Variedad
GO


--Al sumar
SELECT SUM(Dato) FROM Variedad
GO

--Al contar
SELECT COUNT(Dato) FROM Variedad
GO

--En el caso de LIKE, sql_variant no soporta LIKE
SELECT Dato FROM Variedad
WHERE Dato LIKE 'H%'
GO

--Sobre la Suma
SELECT SUM(CAST(Dato AS DECIMAL(10, 2)))
FROM Variedad 
WHERE Sql_Variant_Property(Dato, 'Basetype') 
      IN ('Int', 'Smallint', 'Tinyint', 'Bigint', 'Decimal', 'Numeric', 'Float')
GO      



-- Resolviendo lo solicitado

ALTER PROCEDURE USP_VISUALIZAR (@Codcli nvarchar(4))
AS

Begin
	SELECT Num_Fac, Fec_fac, 
	CASE
		WHEN Fec_can IS NULL 
			 THEN IsNull(CAST(Fec_can AS SQL_VARIANT), 'No canceló aún')
		ELSE Fec_can
	END AS 'Cancelación',
	dbo.uf_CalcularFactura(Num_Fac) AS 'Total'
	FROM Tb_Factura
	WHERE Cod_cli=@CodCli
End
GO

-- Probando el Stored Procedure
EXEC USP_VISUALIZAR @Codcli='C001'
GO

EXEC USP_VISUALIZAR @Codcli='C019'
GO







-- 08  Elabore un Store Procedure que elimine un determinado Cliente 
--     si éste no ha generado Factura alguna.
 
CREATE PROCEDURE USP_ELIMINA_CLIENTE (@CODCLI CHAR(4))
AS 

IF EXISTS (SELECT COD_CLI 
			FROM TB_CLIENTE WHERE COD_CLI=@CODCLI)
	BEGIN  
		   IF EXISTS (SELECT COD_CLI FROM TB_FACTURA WHERE COD_CLI=@CODCLI)
				  PRINT 'CLIENTE TIENE FACTURAS, NO SERA ELIMINADO'
		   ELSE
			   BEGIN
				  PRINT 'EL CLIENTE SERA DADO DE BAJA'
				  DELETE FROM TB_CLIENTE 
				  WHERE COD_CLI=@CODCLI
			   END
	END  
ELSE   
	   PRINT 'CLIENTE NO EXISTE'
GO


--Insertando un Cliente sin facturas
INSERT Tb_Cliente
VALUES
('C050', 'Nestle', 'Av Sol', NULL, '20', 'D01', '2010', '1', 'Liz')
GO

SELECT * FROM TB_CLIENTE
GO

-- Probando el Procedimiento Almacenado
EXEC USP_ELIMINA_CLIENTE 'C001'
GO

EXEC USP_ELIMINA_CLIENTE 'C050'
GO

SELECT * FROM TB_CLIENTE
GO







-- 09 Incremente el Precio de Artículos Importados en un 10% 
--    y en un 7% el Precio de los Nacionales que abastezca
--    un determinado Proveedor.

--    Importado=1, Nacional=0

CREATE PROCEDURE USP_INCREMENTA_PRECIO (@CODPRV CHAR(4))
AS
Begin
	UPDATE TB_PRODUCTO 
	SET PRE_PRO =PRE_PRO * 1.1
	WHERE COD_PRO IN (SELECT COD_PRO 
					  FROM TB_ABASTECIMIENTO 
					  WHERE COD_PRV=@CODPRV) AND IMPORTADO=1

	UPDATE TB_PRODUCTO SET PRE_PRO =PRE_PRO * 1.07
	WHERE COD_PRO IN (SELECT COD_PRO 
					  FROM TB_ABASTECIMIENTO 
					  WHERE COD_PRV=@CODPRV) AND IMPORTADO=0
End
GO


-- Proveedor V009 abastece al
-- producto P002, cuyo precio de venta es 35 y es Nacional (0)
-- producto P014, cuyo precio de venta es 20 y es Importado (1)
SELECT * FROM Tb_Abastecimiento
GO

SELECT * FROM Tb_Producto
WHERE Cod_pro='P002' OR Cod_pro='P014'
GO

-- Probando el Stored Procedure
EXEC USP_INCREMENTA_PRECIO 'V009'
GO

SELECT * FROM Tb_Producto
WHERE Cod_pro='P002' OR Cod_pro='P014'
GO


-- Update Múltiple
UPDATE Tb_Producto
SET Pre_pro= CASE cod_pro
           WHEN 'P002' THEN '35'
		   WHEN 'P014' THEN '20'
END
WHERE Cod_pro in ('P002', 'P014')
GO

--
SELECT * FROM Tb_Producto
WHERE Cod_pro='P002' OR Cod_pro='P014'
GO






-- 10 Construya un Stored Procedure que devuelva la razón social, 
--    dirección, teléfono de los proveedores que abastecen un determinado 
--    producto, así como el nombre y precio de abastecimiento de dicho producto.


CREATE PROCEDURE USP_PROVEEDORES_PRODUCTO (@COD_PRO CHAR (4))
AS
SELECT RAZ_SOC_PRV AS 'Proveedor',     --Tabla Proveedor
       DIR_PRV     AS 'Dirección',     --Tabla Proveedor
       TEL_PRV     AS 'Teléfono',      --Tabla Proveedor
       Des_pro     AS 'Producto',      --Tabla Producto
       Pre_Aba     AS 'Precio Abast.'  --Tabla Producto
FROM TB_ABASTECIMIENTO A
        INNER JOIN Tb_Proveedor P ON A.COD_PRV = P.Cod_prv
        INNER JOIN Tb_Producto X ON A.COD_PRO = X.Cod_pro
   WHERE X.Cod_pro=@COD_PRO
GO  


-- Probando el Stored Procedure
EXEC USP_PROVEEDORES_PRODUCTO 'P002'
GO







------------------------------------

USE Data
GO


-- 11 Crear un store procedure que seleccione el código, nombres y apellidos 
--    de alumnos que pertenecen a una determinada escala y como parámetro de salida 
--    indique cuantos son.

SELECT * FROM TB_Alumno
GO


CREATE PROCEDURE USP_ALUMNOS
(
@Escala CHAR(1), 
@TotalAlumnos INT OUTPUT
)
AS
Begin
	SELECT Cod_Alumno, 
	Nombre+', '+Ape_Pater+' '+Ape_Mater AS 'Nombres y Apellidos'
	FROM TB_Alumno 
	WHERE Cod_escala=@Escala

	SET @TotalAlumnos=(SELECT COUNT(Cod_Alumno) 
					   FROM TB_Alumno 
					   WHERE Cod_escala=@Escala)
	                   
	PRINT 'La cantidad de alumnos es: '+ CONVERT(VARCHAR(2), @TotalAlumnos)
End 
GO

-- Probando el Stored Procedure
EXEC USP_ALUMNOS 'A', 0
GO


--12 Construya un Stored Procedure que permita saber como Parámetro de Salida 
--   cuántos alumnos han aprobado y desaprobado un determinado Curso.

SELECT * FROM Tb_Detalle_Alumno
GO


CREATE PROCEDURE USP_APROBADOS_DESAPROBADOS
(
@Curso VARCHAR(3),
@Aprobados INT OUTPUT,
@Desaprobados INT OUTPUT
)

AS
Begin
	SET @Aprobados=(SELECT COUNT (Cod_Curso) FROM TB_Detalle_Alumno
	WHERE Cod_Curso=@Curso AND (Parcial+Final)/2.00>=11)

	SET @Desaprobados=(SELECT COUNT (Cod_Curso) FROM TB_Detalle_Alumno
	WHERE Cod_Curso=@Curso AND (Parcial+Final)/2.00<11)

	PRINT 'La cantidad de alumnos aprobados es: '+CONVERT(VARCHAR(2), @Aprobados) 
	PRINT 'La cantidad de alumnos desaprobados es: '+CONVERT(VARCHAR(2), @Desaprobados)
End 
GO


-- Probando el Stored Procedure
EXEC USP_APROBADOS_DESAPROBADOS 'C04', 0, 0
GO





--  13 Elabore un Stored Procedure que permita insertar un nuevo Curso. 
--     Si el código del Curso ya existe enviar el mensaje respectivo 
--     y no agregar el Curso.

SELECT * FROM TB_Curso
GO


CREATE PROCEDURE USP_INSERTAR_CURSO
(
@Cod_Curso CHAR(3),
@Nom_curso varchar(30), 
@Num_Creditos smallint
)
AS
Begin
	IF @Cod_Curso = (SELECT Cod_Curso 
					 FROM TB_Curso 
					 WHERE @Cod_Curso=Cod_curso)
	                 
		PRINT 'Curso ya Existe!'
		
	ELSE
		INSERT Tb_Curso(Cod_Curso,Nom_Curso,Num_creditos)
		VALUES (@Cod_curso, @Nom_curso, @Num_Creditos)
End
GO     



-- Probando el Stored Procedure
EXEC USP_INSERTAR_CURSO 'C19', 'Diseño Web', 5
GO

EXEC USP_INSERTAR_CURSO 'C26', 'Diseño Web', 5
GO

SELECT * FROM TB_Curso
GO

SELECT * FROM TB_Curso
ORDER BY Cod_Curso
GO





-- 14 Elabore un store procedure que dado un código de título, 
-- devuelva cuantos libros disponibles y no disponibles existen de dicho titulo.

SELECT * FROM Tb_Titulo --Nombre abstracto
GO

SELECT * FROM TB_Libro  --Libro físico
GO



CREATE PROCEDURE USP_TITULO_LIBROS_DISPONIBLES_Y_NO
(
@Cod_Titulo varchar(3),
@Disponibles INT OUTPUT,
@NoDisponibles INT OUTPUT
)
AS

--Disponible=0 significa No disponible
--Disponible=1 significa Disponible
Begin
	SET @NoDisponibles=(SELECT COUNT(Cod_Libro) FROM TB_Libro
						WHERE Cod_Titulo=@Cod_Titulo AND Disponible=0)
	PRINT 'El título '+@Cod_Titulo+' tiene '
	+CONVERT(VARCHAR(2), @NoDisponibles)+' libros No Disponibles'

	SET @Disponibles=(SELECT COUNT(Cod_Libro) FROM TB_Libro
					  WHERE Cod_Titulo=@Cod_Titulo AND Disponible=1)
	PRINT 'El título '+@Cod_Titulo+' tiene '
	+CONVERT(VARCHAR(2), @Disponibles)+' libros Disponibles'
End
GO



-- Probando el Stored Procedure
EXEC USP_TITULO_LIBROS_DISPONIBLES_Y_NO 'T03',0,0
GO

EXEC USP_TITULO_LIBROS_DISPONIBLES_Y_NO 'T04',0,0
GO




-- 15 Construya un Stored Procedure que devuelva el promedio de un alumno 
-- en un determinado curso. Si el curso no ha sido llevado por el alumno 
-- que se envié un mensaje que así lo indique.

SELECT * FROM TB_Detalle_Alumno
GO


CREATE PROCEDURE USP_PROMEDIO_ALUMNO_CURSO
(
@Alumno varchar(4),
@Curso varchar(3)
)
AS
Begin
	IF @Curso NOT IN(SELECT Cod_Curso 
					 FROM TB_Detalle_Alumno 
					 WHERE Cod_Curso=@Curso AND Cod_Alumno=@Alumno)
		PRINT 'Curso no ha sido llevado aún por el alumno '+CONVERT(VARCHAR(4), @Alumno)
	ELSE
		SELECT Cod_Alumno, Cod_Curso, (Parcial+Final)/2.00 AS Promedio 
		FROM TB_Detalle_Alumno
		WHERE @Alumno=Cod_Alumno AND @Curso=Cod_Curso
End
GO


-- Probando el Stored Procedure
EXEC USP_PROMEDIO_ALUMNO_CURSO 'A001', 'C03'
GO

EXEC USP_PROMEDIO_ALUMNO_CURSO 'A001', 'C04'
GO




-- 16 Crear un Stored Procedure que permita visualizar los números de boletas, 
--    el código del libro y el nombre del titulo alquilado en las boletas de
--    un determinado alumno.

SELECT * FROM TB_Boleta  --De aquí necesito Nro_Boleta
GO

SELECT * FROM TB_Libro --De aquí necesito Cod_libro
GO

SELECT * FROM TB_Titulo  --De aquí necesito Nom_Titulo
GO



CREATE PROCEDURE USP_BOLETAS_ALUMNOS (@Alumno varchar(4))
AS
Begin
	SELECT Nro_Boleta, B.Cod_Libro AS 'Libro Físico', Nom_Titulo AS 'Título'
	FROM TB_Boleta B
		INNER JOIN Tb_Libro L ON B.Cod_Libro=L.Cod_Libro
		INNER JOIN TB_Titulo T ON L.Cod_Titulo=T.Cod_Titulo
	WHERE Cod_Alumno=@Alumno
	ORDER BY Nro_Boleta
End
GO


-- Probando el Stored Procedure
EXEC USP_BOLETAS_ALUMNOS 'A001'
GO




-- 17  Elabore un Stored Procedure que permita seleccionar los nombres de titulos, 
--     nombre y apellido del autor de títulos y cantidad de libros existentes 
--     de un determinado tema.

SELECT * FROM TB_Autor
GO

SELECT * FROM TB_Titulo
GO


CREATE PROCEDURE USP_LIBROS_TEMA
(@Tema CHAR(5), 
 @Cantidad INT OUTPUT)
AS
Begin
	SELECT Cod_Tema, Nom_Autor+' '+ Ape_Autor AS 'Autor', Nom_Titulo AS 'Título'
	FROM TB_Autor A, TB_Titulo T
	WHERE A.Cod_Autor=T.Cod_Autor AND Cod_Tema=@Tema
	ORDER BY Autor

	SET @Cantidad=(SELECT COUNT(Cod_Tema) FROM TB_Titulo WHERE @Tema=Cod_Tema)
	PRINT 'La cantidad de libros del tema '+@Tema+' es '+CONVERT(VARCHAR(2), @Cantidad)
End
GO 


-- Probando el Stored Procedure
EXEC USP_LIBROS_TEMA 'M05',0
GO

EXEC USP_LIBROS_TEMA 'M02',0
GO

-- Nota: En lugar de INNER JOIN (ANSI SQL 92 Standard), 
--       usé simplemente un WHERE con el símbolo Igual (ANSI SQL 89 Standard), 
--       lo cual aún se puede usar, pero es mejor hacerlo con JOIN
--       para que los Where sólo sean dedicados a los filtros y la lectura
--       del código sea más legible.
                              
