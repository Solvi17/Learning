-- JOINS --

CREATE DATABASE Joins
GO

USE Joins
GO

CREATE TABLE Clientes(
Id Tinyint,
Nombre Varchar(20),
Apellido Varchar(20),
Dirección Varchar(50),
Ciudad Varchar (30)
)
GO

INSERT Clientes
VALUES
('1', 'Julián',	'Castillo',	'Av. Sol 123',	'Lima'),
('2', 'Melissa', 'Saucedo',	'Jr. Luna 99',	'Lima'),
('3', 'Laura',	'Paz',	'Calle Astral 77',	'Callao'),
('4', 'Helen', 'Deza', 'Psje. Universo 444', 'Lima')
GO

SELECT * FROM Clientes
GO

CREATE TABLE Pedidos(
Id Tinyint,
Producto Varchar(30),
IdCli Tinyint,
)
GO

INSERT Pedidos
VALUES
('1', 'PC',	'3'),
('2', 'Laptop',	'3'),
('3', 'TV',	'1'),
('4', 'Equipo',	'1'),
('5', 'Blu-Ray', '7')
GO


SELECT * FROM Pedidos
GO

--  05 INNER JOIN
-- Combina las filas que están relacionadas
-- de un conjunto de tablas especificadas.

select Clientes.Apellido, Clientes.Nombre, Pedidos.Id
from Clientes
INNER JOIN Pedidos
ON Clientes.Id =Pedidos.IdCli
ORDER BY Clientes.Apellido
go

-- 06 LEFT JOIN
-- Devuelve todas las  filas que están relacionadas
-- y además las filas no relacionadas de la tabla izquierda

-- (Se considera 'Tabla Izquierda' a la primera tabla mencionada
-- En este caso seria la tabla Clientes)

select Clientes.Apellido, Clientes.Nombre, Pedidos.Id
from Clientes
LEFT JOIN Pedidos
ON Clientes.Id =Pedidos.IdCli
ORDER BY Clientes.Apellido
go


-- 07 RIGHT JOIN
-- Devuelve todas las  filas que están relacionadas
-- y además las filas no relacionadas de la tabla Derecha

-- (Se considera 'Tabla Derecha' a la segunda tabla mencionada
-- En este caso seria la tabla Pedidos)

select Clientes.Apellido, Clientes.Nombre, Pedidos.Id
from Clientes
RIGHT JOIN Pedidos
ON Clientes.Id =Pedidos.IdCli
ORDER BY Clientes.Apellido
go



-- 08 FULL JOIN
-- Devuelve todas las  filas que están relacionadas
-- y además las filas no relacionadas de ambas tablas.

select Clientes.Apellido, Clientes.Nombre, Pedidos.Id
from Clientes
FULL JOIN Pedidos
ON Clientes.Id =Pedidos.IdCli
ORDER BY Clientes.Apellido
go

Use AccesDatabase
go

--09 Productos que se vendieron  en cada factura.
--Mostrar códgio y Nombre del Producto,
--así como la cantidad vendida.

select P.cod_pro, P.Des_pro, DF.Can_ven
FROM Tb_detalle_factura DF
	INNER JOIN Tb_Producto P on DF.Cod_pro=P.Cod_pro
order by P.Cod_pro
go

--Totalizar cant. vendida por producto
select P.cod_pro, P.Des_pro, 
				Sum(DF.Can_ven) As 'Items Vendidos'
FROM Tb_detalle_factura DF
	INNER JOIN Tb_Producto P on DF.Cod_pro=P.Cod_pro
group by P.cod_pro, P.Des_pro
order by P.Cod_pro
go


--10 y ¿que  pasa si uso SELECT * en un JOIN?

select *
FROM Tb_detalle_factura DF
	INNER JOIN Tb_Producto P on DF.Cod_pro=P.Cod_pro
go

-- Muestra ambas tablas del join, comparadas una
-- al lado de la otra.


--11 Productos que NO se vendieron en alguna factura
--	Use LEFT JOIN

select *
FROM Tb_Producto P
	LEFT JOIN Tb_Detalle_Factura DF 
	ON DF.Cod_pro=P.Cod_pro
WHERE DF.Num_fac is null
go

--11 Productos que NO se vendieron en alguna factura
--	Use RIGHT JOIN

select *
FROM Tb_Detalle_Factura DF
	RIGHT JOIN Tb_Producto P
	ON DF.Cod_pro=P.Cod_pro
WHERE DF.Num_fac is null
go

-- Simplemente se cambió el orden de las tablas
-- para poder usar el RIGTH JOIN


--13 Otra forma: con el NOT IN
-- Subconsulta.

select * from Tb_Producto
WHERE Cod_pro not in (
						SELECT DISTINCT Cod_pro
						FROM Tb_Detalle_Factura)
go

--14 Quiero saber facturas de clientes
-- que residen en San borja o Lince.

-- > Primero tengo que saber qué se vendió en dichos

select * from Tb_Factura TF
			Inner join Tb_Cliente C
			ON C.Cod_cli =TF.Cod_cli
Where C.Cod_dis in (select Cod_dis from tb_distrito
					where Nom_dis ='San borja' or Nom_dis = 'Lince')
order by TF.Num_fac
go

--Luego la negacion
-- Las que no sean

select * from Tb_Factura TF
			Inner join Tb_Cliente C
			ON C.Cod_cli =TF.Cod_cli
Where C.Cod_dis not in (select Cod_dis from tb_distrito
					where Nom_dis ='San borja' or Nom_dis = 'Lince')
order by TF.Num_fac
go

--15 La consulta anterior pero que solo muestre:
-- Numero de factura, Nombre del cliente, Distrito del cliente.

--16 Listar los nombres de los productos 
-- que no se vendieron a clientes de  San Borja o Lince

select Des_pro From Tb_Producto
where Cod_pro not in (
		Select Distinct DF.Cod_pro
		From Tb_Factura F
			INNER JOIN tb_Detalle_Factura DF on F.Num_fac=DF.Num_fac
			INNER JOIN Tb_cliente C on C.cod_cli = F.Cod_cli
		Where C.Cod_dis in (
							Select Cod_dis From Tb_Distrito
							Where Nom_dis='San Borja' or Nom_dis='Lince'
							)
						)
go

--Utilizando LEFT JOIN / Is Null

select Des_pro From Tb_Producto P
LEFT JOIN (
			Select Distinct DF.Cod_pro
			From Tb_Factura F
				INNER JOIN tb_Detalle_Factura DF on F.Num_fac=DF.Num_fac
				INNER JOIN Tb_cliente C on C.cod_cli = F.Cod_cli
			Where C.Cod_dis in (
							Select Cod_dis From Tb_Distrito
							Where Nom_dis='San Borja' or Nom_dis='Lince'
							)
			) PX on PX.Cod_pro =P.Cod_pro
where PX.Cod_pro is null
go