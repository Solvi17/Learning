--------------------------------------
--	CREANDO E INSERTANDO BD HIRAOKA	--
--------------------------------------

create database HIRAOKA
go

Use HIRAOKA
go

create table CATEGORIA(
IdCategoria char(3) not null,
NOMBRE varchar(40)	not null,
IdSubCategoria char(3)
)
go

alter table CATEGORIA
add constraint pk_CATEGORIA_IdCategoria
primary key (IdCategoria)
go

--FK de IdSubCategoria para referencia al PK de IdCategoria
alter table CATEGORIA
add constraint fk_CATEGORIA_IdSubCategoria
foreign key (IdSubCategoria)
references CATEGORIA (IdCategoria)
go

sp_helpconstraint CATEGORIA
go

Insert CATEGORIA
values
('C01', 'TV Y AUDIO',null),
('C02', 'COMPUTO Y TECNOLOGIA',null),
('C03', 'LINEA BLANCA',null),
('C04', 'ELECTRODOMÉSTICOS',null),
('C05', 'VIDEOJUEGOS',null)
go

Insert CATEGORIA
values
('CA1','Televisores','C01'),
('CA2','Cine en casa','C01'),
('CA3','Accesorios','C01'),
('CA4','Audio','C01')
go

Insert CATEGORIA
values
('CB1','Computadoras','C02'),
('CB2','Impresoras y tintas','C02'),
('CB3','Telefonia','C02'),
('CB4','Fotografia','C02'),
('CB5','Accesorios computo','C02'),
('CB6','Accesorios fotografia','C02'),
('CB7','Calculadoras','C02'),
('CB8','Conectividad y seguridad','C02')
go


Insert CATEGORIA
values
('CC1','Refrigeracion','C03'),
('CC2','Cocina','C03'),
('CC3','Hornos','C03'),
('CC4','Lavado','C03'),
('CC5','Climatizacion','C03'),
('CC6','Campanas Extractoras','C03')
go

Insert CATEGORIA
values
('CD1','Electrodomesticos','C04'),
('CD2','Menaje','C04'),
('CD3','Limpieza','C04'),
('CD4','Herramientas','C04'),
('CD5','Accesorios electrodomesticos','C04'),
('CD6','Maquinas de coser','C04')
go

Insert CATEGORIA
values
('CE1','Consolas','C05'),
('CE2','Videojuegos','C05'),
('CE3','Accesorios','C05')
go


select * from CATEGORIA
go

