create database Comercializadora
go

use Comercializadora
go

create table PRODUCTO(
IdProducto char(4) not null,
nombre varchar(40),
precio money	
)
go

alter table PRODUCTO
add constraint pk_producto_Idproducto
primary key (IdProducto)
go

--Insertamos 4 produdctos
insert PRODUCTO
values
('P001', 'Dvd', 200),
('P002', 'Tv', 1500),
('P003', 'Laptop', 3000),
('P004', 'Blu-Ray', 500)
go

select * from PRODUCTO
go

--Creamos la tabla pedido

create table PEDIDO(
IdPedido char(4) not null,
fecha date
)

--PK para pedido
alter table PEDIDO
add constraint PK_pedido
primary key (IdPedido)
go

insert PEDIDO
values
('PX01', GETDATE()-5),
('PX02', GETDATE()-4),
('PX03', GETDATE()-3),
('PX04', GETDATE()-2),
('PX05', GETDATE()-1)
go

Create table Detalle_Pedido(
IdPedido char(4) not null,
IdProducto char(4) not null,
precio money,
cantidad int
)
go

alter table Detalle_Pedido
add constraint pk_detalle_pedido_IdPedido_IdProducto
primary key (IdPedido, IdProducto)
go

sp_helpconstraint Detalle_Pedido
go

insert Detalle_Pedido
values
('PX01','P001',200,1),
('PX01','P004',500,2)
go

select * from Detalle_Pedido
go

--creo el fk a IDPedido para 
--Ingresar solo pedidos existentes en la Tabla Pedido

alter table Detalle_Pedido
add constraint FK_Detalle_Pedido_IdPedido
foreign key (IdPedido)
references Pedido (IdPedido)
go

sp_helpconstraint Detalle_Pedido
go

alter table Detalle_Pedido
add constraint FK_Detalle_Pedido_IdProducto
foreign key (IdProducto)
references Producto (IdProducto)
on UPDATE cascade
go

sp_helpconstraint Detalle_Pedido
go

update PRODUCTO
set IdProducto='P005'
where IdProducto='P004'
go

select * from PRODUCTO
go

select * from Detalle_Pedido
go