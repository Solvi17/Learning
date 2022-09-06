----------------------------------------------------------
-- BD001 (Form 1)
----------------------------------------------------------

--Borramos la BD Empresa, sólo si ya existe
DROP DATABASE EMPRESA
GO


--Creamos la BD Empresa
CREATE DATABASE Empresa
GO

--Activamos la BD Empresa
USE Empresa
GO

--Establecemos el formato de fechas a Día/Mes/Año
SET DATEFORMAT DMY
GO

--Creamos la Tabla Cliente
CREATE TABLE CLIENTE(
IdCliente INT PRIMARY KEY IDENTITY,
Nombre VARCHAR(50),
Deuda MONEY,
ACuenta MONEY,
Vencimiento DATE
)
GO

--Agregamos 5 registros
INSERT Cliente 
VALUES
('Juan Vega', 5000, 3000, '03/03/2013'),
('Sol Ramos', 6000, 500, '04/04/2014'),
('Diana Rojas', 1500, 300, '05/05/2015'),
('Luis Carrasco', 8300, 6000, '06/06/2016'),
('Miguel Lagos', 4000, 1600, '07/07/2017')
GO 

--Visualizamos la Tabla Cliente
SELECT * FROM Cliente
GO

--Deuda Total de todos los Clientes S/.
Select SUM(Deuda) From Cliente
GO

--Total Pagado A Cuenta de todos los Clientes S/.
Select SUM(ACuenta) From Cliente
GO

--Número de Clientes
Select COUNT(*) From Cliente
GO



----------------------------------------------------------
-- BD001 (Form 2)
----------------------------------------------------------

USE EMPRESA
GO

--Ejemplos de consultas con tope de tiempo

--Deuda Total de todos los Clientes hasta 7 Julio 2017
Select SUM(Deuda) From Cliente Where Vencimiento<='07/07/2017'
GO

--Total Pagado A Cuenta de todos los Clientes hasta 7 Julio 2017
Select Sum(ACuenta) From Cliente Where Vencimiento<='07/07/2017'
GO

--Número de Clientes hasta 7 Julio 2017
Select Count(*) From Cliente Where Vencimiento<='07/07/2017'
GO



