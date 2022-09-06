--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
-- I- Seguimos con los Stored Procedure
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--



CREATE DATABASE CLASEFINAL
GO



USE CLASEFINAL
GO
	

CREATE TABLE Distrito(
IDDistrito	CHAR(3) NOT NULL PRIMARY KEY,
Nombre		VARCHAR(30) NOT NULL
)
GO


INSERT Distrito
VALUES 
('D01', 'San Isidro'),
('D02', 'Ate'),
('D03', 'Barranco')
GO


SELECT * FROM Distrito
GO


--No acepta Nulos la Columna IDDistrito
INSERT Distrito
VALUES
(NULL, 'Los Olivos')
GO

--No acepta Nulos la Columna IDDistrito
INSERT Distrito
VALUES
('D04', NULL)
GO




-- 01 Crear un Stored Procedure que exija el ingreso de todos los campos
-- a la Tabla Distrito, de lo contrario no debe permitir la inserción
-- de un registro

CREATE PROCEDURE usp_Prueba
(@IDDistrito CHAR(3),
 @Nombre	 VARCHAR(30))
AS
BEGIN
	IF(@IDDistrito IS NULL OR @Nombre IS NULL)
		BEGIN
			PRINT 'Debe ingresar todos los parámetros'
			RETURN 1	
		END
	
    INSERT Distrito(IDDistrito, Nombre)
	VALUES(@IDDistrito, @Nombre)
	
RETURN 0 -- Éxito
END
GO


--Probando si ingreso uno de los parámetros como NULL
EXECUTE usp_Prueba NULL, 'Los Olivos'
GO

--Probando si no ingreso uno de los parámetros
EXECUTE usp_Prueba 'D04'
GO                            
                          -- Como ve, si no ingreso uno de los parámetros
                          -- exigidos por el Stored Procedure, éste no procede
                          -- a ejecutarse.
                          
-- Éxito
EXECUTE usp_Prueba 'D04', 'Los Olivos'
GO

--Comprobando
SELECT * FROM Distrito
GO 


-- 02 Mejorando el SP anterior
-- Stored Procedure "PruebaCompleta"

CREATE PROCEDURE usp_PruebaCompleta
(@IDDistrito CHAR(3)=NULL,           --Inicializo ambas variables como NULL
 @Nombre	 VARCHAR(30)=NULL)
AS
BEGIN
	IF(@IDDistrito IS NULL OR @Nombre IS NULL)
		BEGIN
			PRINT 'Debe ingresar todos los parámetros'
		END
	RETURN 1
		
    INSERT Distrito(IDDistrito, Nombre)
	VALUES(@IDDistrito, @Nombre)
	
RETURN 0 -- Éxito
END
GO



--Probando la nulidad de los parámetros
EXECUTE usp_PruebaCompleta NULL, 'Lince'
GO

EXECUTE usp_PruebaCompleta 'D05'
GO


-- Tenemos aún 4 distritos
SELECT * FROM Distrito
GO


--CASO:
  ----
  
--Insertamos Lince
INSERT Distrito
VALUES
('D05', 'Lince')
GO

-- Tenemos 5 distritos
SELECT * FROM Distrito
GO

--Insertemos nuevamente Lince en el SP
EXECUTE usp_PruebaCompleta 'D05', 'Lince'
GO

                   --¿Comandos Completados Correctamente?
                   --Pero si es PK...
                   --¿Aparecerá dos veces el registro D05 Lince?
                   
--Veamos
SELECT * FROM Distrito
GO

--En realidad no se insertó el registro repetido al ejecutar el último Procedure.
--Entonces, ¿por qué afirma que los comandos fueron realizados correctamente?
--¿Por qué no vemos la alerta de infración de retricción PRIMARY KEY?

--Lo que sucede es que nuestro SP termina con la instrucción Return 0
--Eso quiere decir que si llegamos a esa parte del código es porque
--se han cumplido todas las reglas anteriores (la única regla que dimos
--es que las columnas no admitan nulos), sin interesarle al SP si se están 
--transgrediendo reglas propias de la Tabla como los Constraints (PK, FK, CK, DF, U)
--y es por ello que no vemos la alerta de infración de la Restricción PRIMARY KEY 

--Si usted crea un SP sin RETURNs, puede ver las alertas normales de infracción.


--03 SP sin RETURNs

CREATE PROCEDURE usp_PruebaCompletaSinReturn
(@IDDistrito CHAR(3)=NULL,           --Inicializo ambas variables como NULL
 @Nombre	 VARCHAR(30)=NULL)
AS
BEGIN
	IF(@IDDistrito IS NULL OR @Nombre IS NULL)
		BEGIN
			PRINT 'Debe ingresar todos los parámetros'
		END
		
    INSERT Distrito(IDDistrito, Nombre)
	VALUES(@IDDistrito, @Nombre)
END
GO


-- Insertemos nuevamente Lince en el SP

-- Nuestro SP no considera una alerta personalizada para la infracción de PK
-- por lo cual vemos la alerta propia de SQL Server
EXECUTE usp_PruebaCompletaSinReturn 'D05', 'Lince'
GO



-- Probemos el ingreso de Nulos con nuestro SP
EXECUTE usp_PruebaCompletaSinReturn NULL, 'Lince'
GO

-- Debido a que no se ingresaron todos los parámetros, vemos el mensaje 
-- configurado por nosotros "Debe ingresar todos los parámetros".

-- Al no tener RETURN 1 para el error con respecto a los nulos, vemos nuestro
-- mensaje personalizado, pero también vemos el Mensaje de Error de SQL Server
-- predeterminado para estos casos (Mensaje 515)





-- 04 SP que permita insertar un registro a la Tabla Distrito:

--01 Nulidad de los Parámetros
--02 Validar que el Código no se repita
--03 Validar que el Código no tenga más de 3 caracteres
--04 Validar que el Nombre no se repita


CREATE PROCEDURE usp_InsertarDistrito
(@IDDistrito CHAR(3)=NULL,
 @Nombre	 VARCHAR(30)=NULL)  -- Inicializo como Null
                                -- por si el usuario no ingresa datos a alguna
                                -- de estas dos variables.
                                -- Al tenerlas como null me permite ejecutar
                                -- la primera parte de mi Procedimiento Almacenado.
AS 
BEGIN

--01 Nulidad de los parámetros
	IF(@IDDistrito IS NULL OR @Nombre IS NULL)
		BEGIN
			PRINT 'Debe ingresar todos los parámetros'
			RETURN 1
		END

--02 Validar que el código no se repita
	IF EXISTS (SELECT IDDistrito FROM DISTRITO 
				WHERE IDDistrito=@IDDistrito)
				
		BEGIN
			PRINT 'El código del distrito ya existe'
			RETURN 2
		END
	
--03 Validar que el código tenga tres caracteres
	IF LEN(@IDDistrito)<>3
		BEGIN
			PRINT 'El código debe tener 3 caracteres'
			RETURN 3
		END

--04  Validar que el nombre no se repita
	IF EXISTS (SELECT Nombre FROM Distrito
				WHERE Nombre=@Nombre)
		BEGIN
			PRINT 'El nombre del distrito ya existe'
			RETURN 4
		END

	INSERT Distrito(IDDistrito, Nombre)
	VALUES(@IDDistrito, @Nombre)
	
RETURN 0 -- Éxito
END
GO



--01 Nulidad de los parámetros
EXECUTE usp_insertarDistrito NULL, 'Miraflores'
GO

EXECUTE usp_insertarDistrito 'D06'
GO

--02 Validar que el código no se repita
EXECUTE usp_insertarDistrito 'D01', 'Miraflores'
GO

--03 Validar que el código tenga 3 caracteres
EXECUTE usp_insertarDistrito 'D', 'Miraflores'
GO

EXECUTE usp_insertarDistrito 'D0', 'Miraflores'
GO

--04 Validar que el nombre del Distrito no se repita
EXECUTE usp_insertarDistrito 'D06', 'Ate'
GO

--Éxito
EXECUTE usp_insertarDistrito 'D06', 'Miraflores'
GO

--Comprobamos
SELECT * FROM Distrito
GO





--Crearemos la Tabla Cliente

CREATE TABLE Cliente(
IDCliente	CHAR(5) NOT NULL	PRIMARY KEY,
Nombre		VARCHAR(30) NOT NULL,
Direccion	VARCHAR(30) NOT NULL,
IDDistrito	CHAR(3) NOT NULL,
Credito		DECIMAL(8,2) NULL,
)
GO

ALTER TABLE Cliente
ADD CONSTRAINT FK_Distrito
FOREIGN KEY (IDDistrito)
REFERENCES Distrito(IDDistrito)
GO


INSERT Cliente (IDCliente, Nombre, Direccion, IDDistrito, Credito)
VALUES ('CLI01', 'Mirella Vega', 'Calle Encuesta N° 20', 'D03', '3000')
GO

SELECT * FROM CLIENTE
GO




-- 05 SP que permita insertar un registro a la Tabla Cliente

--01 Nulidad de los parámetros
--02 Validar que el código no se repita
--03 Validar que el código no tenga más de 5 caracteres
--04 Validar que el distrito exista
--05 El monto de crédito no debe ser mayor a 10000


CREATE PROCEDURE usp_insertarCliente
@IDCliente  CHAR(5)=NULL,
@Nombre		VARCHAR(30)=NULL,
@Direccion	VARCHAR(30)=NULL,
@IDDistrito	VARCHAR(3)=NULL,
@Credito	DECIMAL(8,2)=NULL

AS BEGIN

--01 Nulidad de los parámetros
IF(@IDCliente IS NULL OR @Nombre IS NULL OR @Direccion IS NULL 
   OR @IDDistrito IS NULL OR @Credito IS NULL)
	BEGIN
		PRINT 'Debe ingresar todos los parámetros'
		RETURN 1
	END


--02 Validar que el código no se repita
IF EXISTS (SELECT IDCliente FROM Cliente 
			WHERE IDCliente=@IDCliente)
			
	BEGIN
		PRINT 'El Código del Cliente ya existe'
		RETURN 2
	END
	

--03 Validar que el código tenga 5 caracteres
IF(LEN(@IDCliente)<>5)
	BEGIN
		PRINT 'El Código del Cliente debe tener 5 caracteres'
		RETURN 3
	END


--04 Validar que el distrito exista
IF NOT EXISTS (SELECT IDDistrito FROM Distrito WHERE IDDistrito=@IDDistrito)

BEGIN
	PRINT 'El Distrito no existe'
	RETURN 4
END

--05 Validar que el monto no sea mayor a 10000
IF @Credito>10000
BEGIN
		PRINT 'El Crédito no puede ser mayor que 10000'
		RETURN 5
	END

INSERT Cliente(IDCliente, Nombre, Direccion, IDDistrito, Credito)
VALUES(@IDCliente, @Nombre, @Direccion, @IDDistrito, @Credito)

RETURN 0 -- Éxito
END
GO


--01 Nulidad de los parámetros
EXECUTE usp_insertarCliente 
'Ingrid Díaz'
GO

--02 Validar que el código del Cliente no se repita
EXECUTE usp_insertarCliente  
'CLI01', 'Ingrid Díaz', 'Calle BuenaVida 123', 'D04', '5000'
GO

--03 Validar que el código tenga 5 caracteres
EXECUTE usp_insertarCliente 
'CL2', 'Ingrid Díaz', 'Calle BuenaVida 123', 'D04', '5000'
GO

EXECUTE usp_insertarCliente 
'CL02', 'Ingrid Díaz', 'Calle BuenaVida 123', 'D04', '5000'
GO

--04 Validar que el distrito exista
EXECUTE usp_insertarCliente 
'CLI02', 'Janeth Vela', 'Calle BuenaVida 456', 'D07', '7000'
GO

--05 Validar que el crédito no sea mayor a 10000
EXECUTE usp_insertarCliente 
'CLI02', 'Janeth Vela', 'Calle BuenaVida 456', 'D02', '70000'
GO

--Éxito
EXECUTE usp_insertarCliente 
'CLI02', 'Janeth Vela', 'Calle BuenaVida 456', 'D02', '7000'
GO

-- Comprobamos
SELECT * FROM Cliente
GO



-- Usar Edutec


USE Edutec
GO


--
SELECT * FROM Alumno
SELECT * FROM Curso
SELECT * FROM CursoProgramado
SELECT * FROM Matricula
GO



-- 06 crear un SP que permita registrar una Matrícula.

-- 01 Nulidad de los parametros
-- 02 Validar que el alumno exista
-- 03 Validar que exista el cursoProgramado
-- 04 Validar que el alumno no se matricule en el mismo Curso Programado.
-- 05 Validar que el Curso Programado esté activado
-- 06 Que exista vacantes
-- 07 Actualizar el numero de vacantes y matriculados.

CREATE PROCEDURE usp_insertarMatricula

--Parámetros de entrada y salida
@IdCursoProg  INT=NULL,
@IdAlumno     CHAR(5) = NULL, 
@FecMatricula DATE= NULL

AS

BEGIN

-- Declaración de variables locales
DECLARE @Vacantes INT
DECLARE @Activo  INT
DECLARE @Matriculados INT


--01 Nulidad de los parametros
IF(@IdCursoProg IS NULL OR @IdAlumno IS NULL 
       OR @FecMatricula IS NULL)
	BEGIN
		PRINT 'Debe ingresar todos los datos'
		RETURN 1
	END


--02 Validar que exista el Curso Programado
IF NOT EXISTS(SELECT IdCursoProg FROM CursoProgramado
              WHERE IdCursoProg=@IdCursoProg)
	BEGIN
		PRINT 'El Curso Programado no existe'
		RETURN 2
	END


--03 validar que el Alumno exista
IF NOT EXISTS(SELECT IdAlumno FROM Alumno
              WHERE IdAlumno=@IdAlumno)
	BEGIN
		PRINT 'El Alumno no existe'
		RETURN 3
	END


--04 Validar que el Alumno no se matricule en el mismo Curso Programado.

IF EXISTS (SELECT IdCursoProg 
           FROM Matricula
           WHERE 
           IdCursoProg=@IdCursoProg AND
           IdAlumno=@IdAlumno)
	BEGIN
		PRINT 'El alumno ya se matriculó en el Curso Programado'
		RETURN 4
	END

--05 Validar que el curso esté activado
--06 Validar que existan vacantes

SELECT @Vacantes=Vacantes,
       @Activo=Activo,
       @Matriculados=Matriculados
FROM Cursoprogramado
WHERE IdCursoProg=@IdCursoProg

IF(@Activo=0)
	BEGIN
		PRINT 'El Curso Programado no está activado'
		RETURN 5
	END

IF(@Vacantes=0)
	BEGIN
		PRINT 'No hay vacantes'
		RETURN 6
	END

--07 Actualizar el número de Vacantes y Matriculados.
--   Iniciar una transaccion

BEGIN TRANSACTION
	UPDATE CursoProgramado
		   SET Vacantes=@Vacantes-1,
			   Matriculados=@Matriculados+1
	WHERE IDCursoProg=@IDCursoProg

	INSERT Matricula(IdCursoProg, IdAlumno, FecMatricula)
	VALUES(@IdCursoProg, @IdAlumno, @FecMatricula)
	
	IF(@@ERROR<> 0)
		BEGIN
			PRINT 'Error en la Base de Datos'
			ROLLBACK TRANSACTION
			RETURN 7
		END 
COMMIT TRANSACTION

RETURN 0
END
GO


-- Vemos que para insertar una Matrícula necesitamos
-- IdCursoProg, IdAlumno y FecMatricula
SELECT * FROM Matricula
GO

--01 Nulidad de los parametros
EXEC usp_insertarMatricula '1'
GO

--02 Validar que exista el Curso Programado
EXEC usp_insertarMatricula '100', 'A0001', '01/11/2013'
GO

--03 Validar que el Alumno exista
EXEC usp_insertarMatricula '1', 'A9000', '01/11/2013'
GO

--04 Validar que el Alumno no se matricule en el mismo Curso Programado.
EXEC usp_insertarMatricula '1', 'A0001', '01/11/2013'
GO

--05 Validar que el Curso Programado esté activo
EXEC usp_insertarMatricula '14', 'A0001', '01/11/2013'
GO

--06 Validar que exista vacantes
-- Fíjese en el Curso Programado 44
SELECT * FROM CursoProgramado     
WHERE IdCursoProg='44'
GO

UPDATE CursoProgramado
SET Vacantes='0', Matriculados='20'
WHERE IdCursoProg='44'
GO

SELECT * FROM CursoProgramado     
WHERE IdCursoProg='44'
GO

EXEC usp_insertarMatricula '44', 'A0001', '01/11/2013'
GO

-- Regresemos a la normalidad el Curso Programado 44
UPDATE CursoProgramado
SET Vacantes='20', Matriculados='0'
WHERE IdCursoProg='44'
GO

SELECT * FROM CursoProgramado     
WHERE IdCursoProg='44'
GO

--07 Actualizar el número de Vacantes y Matriculados
--   después de matricular a un Alumno

-- El Curso Programado 1 tiene 10 alumnos matriculados (de 20 posibles)
-- Quedan 10 vacantes
SELECT * FROM Matricula
WHERE IdCursoProg='1'
GO

-- Ingresaremos el undécimo alumno, el A0011
EXEC usp_insertarMatricula '1', 'A0011', '01/02/2012'
GO

-- Se hizo la Matrícula con éxito
SELECT * FROM Matricula
WHERE IdCursoProg='1'
GO

-- Las Matrículas subieron a 11 y las vacantes disminuyeron a 9
SELECT * FROM CursoProgramado
WHERE IdCursoProg='1'
GO








--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
-- II- Triggers
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--

/*

Los desencadenadores DML constituyen un tipo especial de procedimiento almacenado 
que se inicia automáticamente cuando tiene lugar un evento de lenguaje de manipulación 
de datos (DML) que afecta a la tabla o la vista definida en el desencadenador.

TRIGGERS DML
AFTER:
     - AFTER INSERT
     - AFTER DELETE
     - AFTER UPDATE
          
Estos Triggers pueden proteger contra operaciones INSERT, UPDATE y DELETE 
incorrectas o malintencionadas, y exigir otras restricciones que sean más 
complejas que las definidas con restricciones CHECK.

A diferencia de las Restricciones CHECK, los desencadenadores DML pueden hacer 
referencia a columnas de otras tablas. Por ejemplo, un desencadenador puede 
utilizar una instrucción SELECT de otra tabla para comparar con los datos insertados 
o actualizados y para realizar acciones adicionales, como modificar los datos 
o mostrar un mensaje de error definido por el usuario.

Los Triggers pueden evaluar el estado de una tabla antes y después de realizar 
una modificación de datos y actuar en función de esa diferencia.

Las restricciones solo pueden comunicar la existencia de errores mediante 
mensajes de error estándar del sistema. Si la aplicación necesita o puede aprovechar 
mensajes personalizados y un control de errores más complejo, deberá usar un Trigger.
     
*/     


-- Del libro
-- (Ejercicio 141)

CREATE DATABASE Test
GO

USE TEST
GO


-- Creando la Tabla Factura
CREATE TABLE Factura(
	IdFactura int PRIMARY KEY,
	FecFactura datetime default Getdate(),
	Cliente varchar(30)not null,
	MontoFactura money null)
GO

-- Creando la Tabla DetalleFactura
CREATE TABLE DetalleFactura(
	IdFactura int not null,
	IdProducto integer not null,
	PrecioUnitario money not null,
	Cantidad int not null)
GO

-- PK en DetalleFactura
ALTER TABLE DetalleFactura
	ADD CONSTRAINT PK_DetalleFactura
	PRIMARY KEY(IdFactura,IdProducto)
GO

-- FK del IDFactura de DetalleFactura con Factura
ALTER TABLE DetalleFactura
	ADD CONSTRAINT FK_DetalleFactura_Factura
	FOREIGN KEY(IdFactura)
	REFERENCES Factura
GO

-- Establecemos el Formato de Fechas a Día/Mes/Año
SET DATEFORMAT DMY
GO

-- Insertamos 2 Facturas
INSERT Factura
VALUES
(1, '31/10/2013', 'Comercial Gómez', NULL),
(2, '02/11/2013', 'Juan López Cordero', NULL)
GO

-- Insertamos sus Detalles
INSERT DetalleFactura 
VALUES
(1,101,12.5,100),
(1,127,15,50),
(1,107,10,50),
(2,132,15.5,100),
(2,107,10,250)
GO

-- Vemos que las 2 Facturas no llevan el Monto
SELECT * FROM Factura
GO

-- Actualizaremos los Montos
UPDATE Factura
SET MontoFactura= CASE IdFactura
                      WHEN '1' THEN '2500'
		              WHEN '2' THEN '4050'
                  END
WHERE IdFactura IN ('1', '2')
GO

-- Comprobamos
SELECT * FROM Factura
GO



--------------------------------
-- TRIGGER AFTER INSERT
--------------------------------


-- 08 Crearemos un Trigger que calcule el Monto en la Tabla Factura
--    luego de insertar sus detalles en la Tabla DetalleFactura
--    (Ejercicio 142)

CREATE TRIGGER TR_Insert_DetalleFactura
ON DetalleFactura AFTER INSERT
AS

DECLARE @Factura INT
DECLARE @Suma MONEY

SET @Factura=(SELECT IdFactura FROM INSERTED)

SET @Suma= (SELECT SUM(PrecioUnitario * Cantidad)
			FROM DetalleFactura
			WHERE DetalleFactura.IdFactura=@Factura)
	
UPDATE Factura
SET MontoFactura=@Suma
WHERE IdFactura=@Factura
GO



-- Registrando la Factura 3
INSERT Factura
VALUES(3, '02/11/2013', 'Rep.Asunción', NULL)
GO

-- Probando el desencadenante
INSERT DetalleFactura VALUES (3,101,12.5,100)
INSERT DetalleFactura VALUES (3,127,15,100)
INSERT DetalleFactura VALUES (3,107,10,100)
GO

-- Verificando la Data
SELECT * FROM DetalleFactura
GO

-- Vemos que el Monto (3750) ha sido calculado automáticamente
SELECT * FROM Factura
GO



--------------------------------
-- TRIGGER AFTER DELETE
--------------------------------

-- 09 Crearemos un Trigger que recalcule el Monto en la Tabla DetalleFactura
--    luego de borrar alguno de sus detalles en la Tabla DetalleFactura
--    (Ejercicio 143)

CREATE TRIGGER TG_Delete_DetalleFactura
ON DetalleFactura AFTER DELETE
AS

DECLARE @Factura INT
DECLARE @Suma MONEY

SET @Factura=(SELECT IdFactura from DELETED)

SET @Suma=(SELECT SUM(PrecioUnitario * Cantidad)
		   FROM DetalleFactura
		   WHERE DetalleFactura.IdFactura=@Factura)
		   
UPDATE Factura
SET MontoFactura=@Suma
WHERE IdFactura=@Factura
GO

-- Probando el Desencadenante
DELETE FROM DetalleFactura
WHERE IdFactura=1 AND IdProducto=101
GO

-- Se borró el primer detalle de la Factura 1 en DetalleFactura
SELECT * FROM DetalleFactura
GO

-- El monto de la Factura 1 era 2500. Al borrarse uno de sus detalles
-- disminuyó a 1250
SELECT * FROM Factura
GO



--------------------------------
-- TRIGGER AFTER UPDATE
--------------------------------

-- 10 Crearemos un Trigger que recalcule el Monto en la Tabla DetalleFactura
--    luego de actualizar alguno de sus detalles en la Tabla DetalleFactura
--    (Ejercicio 144)

CREATE TRIGGER TG_Update_DetalleFactura
ON DetalleFactura AFTER UPDATE
AS

IF UPDATE (PrecioUnitario) OR UPDATE(Cantidad)
	BEGIN
		DECLARE @Factura INT
		DECLARE @Suma MONEY
		
		SET @Factura=(SELECT IdFactura FROM INSERTED)
		SET @Suma=(SELECT SUM(PrecioUnitario * Cantidad)
				   FROM DetalleFactura
				   WHERE DetalleFactura.IdFactura=@Factura)
				   
		UPDATE Factura
		SET MontoFactura=@Suma
		WHERE IdFactura=@Factura
	END
GO


-- Probando Desencadenante. Actualizamos el primer Detalle de la Factura 3
UPDATE DetalleFactura
SET Cantidad='200'
WHERE IdFactura='3' AND IdProducto='101'
GO


-- Verificando la actualización del primer detalle de la Factura 3
SELECT * FROM DetalleFactura
GO

-- Vemos que en la Factura 3 el Monto ha sido actualizado a 5000 
SELECT * FROM Factura
GO





/*

TRIGGERS DDL
------------

Los desencadenadores DDL se inician en respuesta a una variedad de eventos 
de lenguaje de definición de datos (DDL). 

Estos eventos corresponden principalmente a las instrucciones de Transact-SQL 
que comienzan por las palabras clave CREATE, ALTER, DROP, GRANT, DENY, REVOKE 
o UPDATE STATISTICS.

*/


-- 11 Crearemos un Trigger que no dejará Borrar o Modificar una Tabla
--    (Ejercicio 146)

CREATE TRIGGER Tg_Seguridad
ON DATABASE FOR DROP_TABLE, ALTER_TABLE
AS
	PRINT 'Debe deshabilitarse el Trigger Tg_Seguridad para eliminar 
	       o modificar una Tabla' 
	ROLLBACK
GO

--Probamos el desencadenante
DROP TABLE Factura
GO




--------------------------------
-- TRIGGERS CON LA BD EDUTEC
--------------------------------


USE Edutec
GO

-- 12 Crear un Trigger que matricule a un alumno en la Tabla Matrícula
--    si es que existen Vacantes.
--    De existir las vacantes, actualizar en la Tabla CursoProgramado
--    el número de Vacantes y el número de Matriculados en dicho Curso Programado.

CREATE TRIGGER Tr_Insert_Matricula
ON Matricula
AFTER INSERT
AS

DECLARE @Vacantes INT

SELECT @Vacantes=CP.Vacantes
FROM CursoProgramado CP, Inserted I
WHERE CP.IdCursoProg=I.IdCursoProg

IF(@Vacantes=0) 
	Begin 
		PRINT 'No hay vacantes' 
		ROLLBACK TRANSACTION
	End 
Else 
	Begin
		UPDATE CursoProgramado
		SET Vacantes=Vacantes-1, Matriculados=Matriculados+1 
		FROM Inserted I
		WHERE CursoProgramado.IdCursoProg=i.IdCursoProg  -- Se uso un UPDATE FROM
		                                                 -- con WHERE entre Tablas
		                                                 -- (pudo usarse Join)
		
		PRINT 'Base de Datos actualizada'
	End 
GO



-- Probando el Trigger

-- El Curso Programado 1 tiene 11 alumnos matriculados (de 20 posibles)
-- Quedan 9 vacantes
SELECT COUNT(*) FROM Matricula
WHERE IdCursoProg='1'
GO

-- Ingresaremos el duodécimo alumno, el A0012
INSERT Matricula(IdCursoProg, IdAlumno, FecMatricula) 
VALUES('1', 'A0012', '01/11/2013')
GO

-- Se hizo la Matrícula con éxito
SELECT * FROM Matricula
WHERE IdCursoProg='1'
GO

-- Las Matrículas subieron a 12 y las vacantes disminuyeron a 8
SELECT * FROM CursoProgramado
WHERE IdCursoProg='1'
GO





----------------------------------
-- TRIGGERS CON LA BD MARKETPERU
----------------------------------

USE MarketPERU 
GO


-- Veamos una lista de todos los Productos con sus respectivos Stocks Actuales
SELECT IdProducto, Nombre, StockActual FROM PRODUCTO
COMPUTE COUNT(IdProducto)
GO

-- Veamos cómo se insertan los registros en la Tabla Guia_Detalle
SELECT IdGuia, IdProducto, PrecioVenta, Cantidad
FROM Guia_Detalle
GO


-- 13 Crear un Trigger que descuente el Stock Actual de los Productos
--    cada vez que se especifique la cantidad de un producto en la Tabla Guia_Detalle

CREATE TRIGGER DescuentaStock
ON Guia_Detalle  
AFTER INSERT 
AS

DECLARE @Cantidad INT,
        @Unidades INT

-- Asignamos a la variable el contenido del campo
SELECT @Cantidad=GD.Cantidad
FROM GUIA_DETALLE GD 
     INNER JOIN Inserted I 
     ON GD.IdGuia=I.IdGuia

-- Asignamos a la variable el contenido del campo
SELECT @Unidades=P.StockActual 
FROM PRODUCTO P 
     INNER JOIN Inserted I
     ON P.IdProducto=I.IdProducto
     
BEGIN TRANSACTION
-- Verificamos la cantidad pedida

IF @Cantidad<= @Unidades
	Begin
		UPDATE PRODUCTO
		SET StockActual=@Unidades-@Cantidad
		FROM PRODUCTO P 
		     INNER JOIN Inserted I 
		     ON P.IdProducto=I.IdProducto
		
		COMMIT TRANSACTION
		PRINT 'Stock Actualizado'
	End

ELSE
	Begin
		PRINT 'No existen suficientes Productos para satisfacer el Pedido'
		ROLLBACK TRANSACTION
	End
GO



-- Probando el Trigger

SELECT * FROM GUIA

INSERT GUIA 
VALUES(108, 2, '11/11/2013', 'VELASQUEZ ORTIZ, FRANCISCO')
GO
 
SELECT * FROM GUIA
WHERE IdGuia='108'
GO

-- Con el Producto 2, el Stock Actual es 300
SELECT IdProducto, Nombre, StockActual 
FROM PRODUCTO 
WHERE IdProducto='2'
GO
 
INSERT GUIA_DETALLE 
VALUES(108, 2, 1.50, 50)
GO

-- Pido 50 del Producto 2 en la Guía 108 
SELECT * FROM GUIA_DETALLE 
WHERE IdGuia='108'
GO

-- En la Tabla Producto, el Stock Actual del Producto 2 ya no es 200,
-- disminuyó a 250
SELECT IdProducto, Nombre, StockActual 
FROM PRODUCTO 
WHERE IdProducto='2'
GO



--------------------------------
-- TRIGGERS CON LA BD VENTAS
--------------------------------


USE Ventas
GO


-- 14 HACER UN TRIGGER PARA EVITAR QUE SE INGRESE UN CLIENTE 
--    CUYO RUC TERMINE EN 150

CREATE TRIGGER ruc_I on TB_Cliente for insert as
Begin tran
 if exists(select Ruc_cli from inserted
	where Ruc_cli like '%150')
 begin
	print 'Cliente no deseado'
   rollback tran
 end
 else
 begin
   commit tran
   print 'Se insertó cliente'
 end	

-- Probando el Trigger
INSERT TB_CLIENTE
VALUES
('C021', 'Procter y Gamble', 'Av El Sol 111', '5551010',
'12345150', 'd17', GETDATE(), '1', 'Mateo H.')
GO





-- 15 No vender un producto del cual no tengo Stock

CREATE TRIGGER TG_DET_FAC_I 
ON TB_DETALLE_FACTURA 
FOR INSERT 
AS

BEGIN

DECLARE @SA INT
DECLARE @CAN_VEN INT

SET @SA=(SELECT Stk_act 
         FROM Tb_Producto
         WHERE Cod_pro=(SELECT Cod_pro FROM INSERTED))
         
SET @CAN_VEN =(SELECT CAN_VEN FROM INSERTED)

BEGIN TRAN
	IF (@SA>=@CAN_VEN)
	  BEGIN
		PRINT 'SI VENDIO'
		
		UPDATE Tb_Producto 
		SET Stk_act= @SA-@CAN_VEN
		WHERE Cod_pro=(SELECT Cod_pro FROM INSERTED)
		
		COMMIT TRAN
	  END
    ELSE
      BEGIN
        ROLLBACK TRANSACTION
        PRINT 'NO HAY STOCK'
      END
END        
GO

                         
-- Probando el Trigger

-- El producto P009 sólo tiene 100 como Stock Actual
SELECT * FROM TB_PRODUCTO
WHERE Cod_pro='P009'
GO

-- Tenemos de la FA001 a la FA020
SELECT DISTINCT Num_fac FROM TB_DETALLE_FACTURA                                 
GO

-- Vendo 5 (Stock de 100 baja a 95)
INSERT Tb_Detalle_Factura
VALUES ('FA017', 'P009', '5', '10')
GO

-- Vendo 95 (Stock de 95 baja a 0)
INSERT Tb_Detalle_Factura
VALUES ('FA018', 'P009', '95', '10')
GO

-- Quiero vender 50, pero tengo 0 en Stock para dicho producto
-- El trigger no debe dejar realizar la Venta
INSERT Tb_Detalle_Factura
VALUES ('FA019', 'P009', '50', '10')
GO
GO





-- 16 No eliminar a un vendedor que tenga Facturas generadas  
                                                           
CREATE TRIGGER TG_ELIMINA ON TB_VENDEDOR 
FOR DELETE AS
IF EXISTS (SELECT NUM_FAC FROM TB_FACTURA 
           WHERE COD_VEN = (SELECT COD_VEN 
							FROM DELETED))
   BEGIN
     PRINT 'NO SE PUEDE ELIMINAR A ESTE VENDEDOR, TIENE FACTURAS GENERADAS'
     ROLLBACK TRAN
   END
ELSE
   BEGIN
     UPDATE TB_DISTRITO SET COD_VEN = NULL 
     WHERE COD_VEN = (SELECT COD_VEN FROM DELETED)
     COMMIT TRAN
   END
GO


-- Probando el Trigger
-- Trataremos de eliminar al Vendedor V01
DELETE FROM Tb_Vendedor
WHERE Cod_ven='V01'
GO


-- 17 No dar crédito a Clientes Tipo 2

CREATE TRIGGER TG_CLIENTE ON TB_FACTURA 
AFTER INSERT 
AS        

IF (SELECT EST_FAC FROM INSERTED) = '1'
	BEGIN TRAN
		IF (SELECT TIP_CLI 
			FROM TB_CLIENTE C, INSERTED I
			WHERE C.COD_CLI = I.COD_CLI) = '2'
				BEGIN
				  PRINT 'NO SE PUEDE DAR CREDITO A ESTE CLIENTE'
				  ROLLBACK TRANSACTION
				END
		ELSE
    COMMIT TRANSACTION
GO
      
-- Una factura de Estado 1 significa que es una factura sin fecha de cancelación, 
-- por lo tanto, significa que está siendo dada a crédito.
-- Es por eso que igualo que en la factura a insertar su estado sea igual a 1.

SELECT * FROM Tb_Cliente
WHERE Tip_cli='2'
GO

-- Probando el Trigger
SELECT * FROM Tb_Factura
GO

INSERT Tb_Factura(Num_fac, Fec_fac, Cod_cli, Fec_can, Est_fac, Cod_ven, Por_Igv)
VALUES('FA021', GETDATE(), 'C002', NULL, '1', 'V05', '0.19')
GO



-- 18 No dar crédito a clientes que tienen alguna Factura pendiente (Est_fac=1)

CREATE TRIGGER TR_VALIDA_CLIENTE 
ON TB_FACTURA 
AFTER INSERT
AS

DECLARE @PENDIENTES INT
DECLARE @CLIENTE CHAR(4)

SET @CLIENTE =(SELECT COD_CLI FROM INSERTED)
SET @PENDIENTES=(SELECT COUNT(*) FROM TB_FACTURA 
                 WHERE COD_CLI=@CLIENTE AND EST_FAC='1')

BEGIN TRANSACTION                 
IF @PENDIENTES>=1
	BEGIN
		PRINT 'CLIENTE TIENE FACTURAS PENDIENTES'
		ROLLBACK TRANSACTION
	END
ELSE
	BEGIN
		PRINT ' SE GENERO LA FACTURA'
		COMMIT TRANSACTION
	 END
GO


-- Probando el Trigger

-- Vemos que los Clientes con Facturas pendientes son los Clientes C014, C015 y C019
SELECT * FROM Tb_Factura
WHERE Est_fac='1'
GO

INSERT Tb_Factura(Num_fac, Fec_fac, Cod_cli, Fec_can, Est_fac, Cod_ven, Por_Igv)
VALUES('FA021', GETDATE(), 'C015', NULL, '1', 'V05', '0.19')
GO

SELECT * FROM Tb_Factura
GO






/*
                                                               .---.
                                                              /  .  \
                                                             |\_/|   |
                                                             |   |  /|
  .----------------------------------------------------------------' |
 /  .-.                                                              |
|  /   \                                                             |
| |\_.  |       Hasta la próxima clase                               |
|\|  | /|                                                            |
| `---' |       Atte.                                                |
|       |       Ing. F. Erick Tamayo                                 | 
|       |       Email: f.erick.tamayo@gmail.com                      | 
|       |                                         Junio 2017         | 
|       |                                                           /
|       |----------------------------------------------------------'
\       |
 \     /
  `---'



*/

