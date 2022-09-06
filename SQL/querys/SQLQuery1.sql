--Creando la base de datos Restaurant
-----------------------------------------
create database Restaurant 
go

--Usando la base de datos restaurant
use Restaurant
go

--Creacion de las tablas USUARIO, ORDEN, LUGAR,PLATO_ORDEN, COMIDA, CATEGORIA_PLATO, INGREDIENTE_PLATO

create table USUARIO(
ID int identity(1,1) primary key,
Correo varchar(45),
Contraseña varchar(45),
Nombre varchar(45),
Apellido varchar(45),
Telefono varchar(12),
edad int,
foto varchar(45),
id_lugar int
)
go

--Creacion de UNIQUE ala tabla USUARIO 
alter table USUARIO
add constraint UC_USUARIO
unique (Correo)
go

--Creacion de CHECK ala tabla USUARIO columna EDAD
alter table USUARIO
add constraint CE_USUARIO
check (edad >=18)
go

create table ORDEN(
ID int identity(1,1) primary key,
id_user int ,
id_lugar int,
Fecha_entrega Date,
Cantidad int
)
go

--Creacion de CHECK ala tabla ORDEN columna CANTIDAD
alter table ORDEN
add constraint CC_ORDEN
check (cantidad <=50)
go

create table LUGAR(
ID int identity(1,1) primary key,
Nombre varchar(45),
direccion varchar(45),
ubicacion varchar(45),
telefono varchar(12),
email varchar(45),
website varchar(45)
)
go

--UNIQUE a la tabla LUGAR columna NOMBRE
alter table LUGAR 
add constraint UN_LUGAR
unique (Nombre)
go

--UNIQUE a la tabla LUGAR columna direccion
alter table LUGAR 
add constraint UD_LUGAR
unique (direccion)
go

--DEFAULT a la tabla LUGAR columna ubicacion
alter table LUGAR
add constraint DU_LUGAR
default 'Lima' for ubicacion
go

--DEFAULT a la tabla LUGAR columna telefono
alter table LUGAR
add constraint DT_LUGAR
default '999999999' for telefono
go

--DEFAULT a la tabla LUGAR columna WEBSITE
alter table LUGAR
add constraint DE_LUGAR
default 'food.comid@gmail.com' for email
go

--DEFAULT a la tabla LUGAR columna WEBSITE
alter table LUGAR
add constraint DW_LUGAR
default 'www.food.com/comid' for website
go


create table PLATO_ORDEN(
ID int identity(1,1) primary key,
id_orden int,
id_comida int,
unidades int,
cantidad int,
estado int
)
go

--Creacion de CHECK ala PLATO_ORDEN columna UNIDADES
alter table PLATO_ORDEN
add constraint CU_PLATO_ORDEN
check (unidades <=5)
go

--Creacion de CHECK ala PLATO_ORDEN columna ESTADO
alter table PLATO_ORDEN
add constraint CE_PLATO_ORDEN
check (estado >=0 and estado <=1)
go

create table COMIDA(
ID int identity(1,1) primary key,
id_categoria varchar(45),
Nombre varchar(45),
precio float,
descripcion varchar(45),
foto varchar(45)
)
go

--CHECK a la tabla COMIDA columna PRECIO
alter table COMIDA 
add constraint CP_COMIDA
check (precio<=50.00)
go

--UNIQUE a la tabla COMIDA columna NOMBRE
alter table COMIDA 
add constraint UN_COMIDA
unique (Nombre)
go

create table CATEGORIA_PLATO(
nombre varchar(45) primary key,
)
go


create table INGREDIENTE_PLATO(
ID int identity(1,1) primary key,
id_comida int,
id_ingredient int
)
go

create table INGREDIENTE(
ID int identity(1,1) primary key,
nombre varchar(45)
)
go


--[FOREIGN KEYS]

-- FOREIGN KEY  de la tabla USUARIO - LUGAR
alter table USUARIO
add constraint FK_USUARIOLUGAR
foreign key (id_lugar) references LUGAR(ID)
go

-- FOREIGN KEY  de la tabla ORDEN - USUARIO
alter table ORDEN
add constraint FK_ORDENUSUARIO
foreign key (id_user) references USUARIO(ID)
go

-- FOREIGN KEY  de la tabla ORDEN - LUGAR
alter table ORDEN
add constraint FK_ORDENLUGAR
foreign key (id_lugar) references LUGAR(ID)
go

-- FOREIGN KEY  de la tabla PLATO_ORDEN - ORDEN
alter table PLATO_ORDEN
add constraint FK_PLATO_ORDENORDEN
foreign key (id_orden) references ORDEN(ID) 
go

-- FOREIGN KEY  de la tabla PLATO_ORDEN - COMIDA
alter table PLATO_ORDEN
add constraint FK_PLATO_ORDENCOMIDA
foreign key (id_comida) references COMIDA(ID) 
go

-- FOREIGN KEY  de la tabla PLATO_ORDEN - CATEGORIA_PLATO
alter table COMIDA
add constraint FK_PLATO_ORDENCATEGORIA_PLATO
foreign key (id_categoria) references CATEGORIA_PLATO(nombre) 
go

-- FOREIGN KEY  de la tabla INGREDIENTE_PLATO - PLATO_COMIDA
alter table INGREDIENTE_PLATO
add constraint FK_INGREDIENTE_PLATO_COMIDA
foreign key (id_comida) references COMIDA(ID) 
go

-- FOREIGN KEY  de la tabla INGREDIENTE_PLATO - INGREDIENTE
alter table INGREDIENTE_PLATO
add constraint FK_INGREDIENTE_PLATO_INGREDIENTE
foreign key (id_ingredient) references INGREDIENTE(ID) 
go


--[INSERCCION DE DATOS]
---------------------------
--INSERCCION DE DATOS A LA TABLA LUGAR
----------------------------
insert into LUGAR (Nombre,direccion)values ('EL CHAPO','Los Rosales')
insert into LUGAR (Nombre,direccion)values ('EL COROCO','Los jasmmines')
insert into LUGAR (Nombre,direccion)values ('EL GALLO MAS GALLO','Los Rosales manzanilla')
insert into LUGAR (Nombre,direccion)values ('EL CARACOLES','Santa Elvira')
insert into LUGAR (Nombre,direccion)values ('EL DRAGON DORADO','El agustino')
go


---------------------------
--INSERCCION DE DATOS A LA TABLA USUARIO
----------------------------
insert into USUARIO (Correo,Contraseña,Nombre,Apellido,Telefono, edad, foto,id_lugar)
values ('yolvi.rosasmorneo@gmail.com','123_456', 'yolvi Saul','Rosas Moreno',999999999, 22,'foto_perfil',1)
insert into USUARIO (Correo,Contraseña,Nombre,Apellido,Telefono, edad, foto,id_lugar)
values ('eljuandito@gmail.com','123456789', 'Juan','Rosas Alvarez',999999999, 22,'foto_perfil',2)
insert into USUARIO (Correo,Contraseña,Nombre,Apellido,Telefono, edad, foto,id_lugar)
values ('ellll@gmail.com','123_756', 'kevin','Alvarez Rosales',999999999, 22,'foto_perfil',4)
insert into USUARIO (Correo,Contraseña,Nombre,Apellido,Telefono, edad, foto,id_lugar)
values ('amarillo@gmail.com','129_756', 'Juan','Rosas Alvarez',999999999, 22,'foto_perfil',5)
insert into USUARIO (Correo,Contraseña,Nombre,Apellido,Telefono, edad, foto,id_lugar)
values ('kisisu@gmail.com','1623.756', 'docky','Wilber Velazquez',999999999, 20,'foto_perfil',3)
go

----------------------------------------
--INSERCCION DE DATOS A LA TABLA ORDEN
----------------------------------------

insert into ORDEN (id_user,id_lugar,Fecha_entrega,Cantidad) values (1,2,'2020-05-29',32)
insert into ORDEN (id_user,id_lugar,Fecha_entrega,Cantidad) values (2,4,'2020-05-28',42)
insert into ORDEN (id_user,id_lugar,Fecha_entrega,Cantidad) values (5,2,'2020-05-27',31)
insert into ORDEN (id_user,id_lugar,Fecha_entrega,Cantidad) values (3,3,'2020-05-30',49)
insert into ORDEN (id_user,id_lugar,Fecha_entrega,Cantidad) values (4,1,'2020-06-01',39)
insert into ORDEN (id_user,id_lugar,Fecha_entrega,Cantidad) values (3,1,'2020-05-29',39)
insert into ORDEN (id_user,id_lugar,Fecha_entrega,Cantidad) values (1,5,'2020-06-02',39)
go



------------------------------------------
--INSERCCION DE DATOS A LA TABLA COMIDA
-----------------------------------------	

insert into COMIDA(id_categoria,Nombre,precio,descripcion,foto) 
values('Menu Marino','Ceviche',30.00,'Un plato bandera del peru','foto de frejoles')
insert into COMIDA(id_categoria,Nombre,precio,descripcion,foto) 
values('Menu Criollo','Lentejas con lomo saltado',35.00,'Para probar en estos dias de cuarentena','foto de lentejas')
insert into COMIDA(id_categoria,Nombre,precio,descripcion,foto) 
values('Menu Marino','Parihuela',35.00,'Una exquisitez para disgustar','foto de parihuela')
insert into COMIDA(id_categoria,Nombre,precio,descripcion,foto) 
values('Menu Marino','Chilcano',35.00,'Un jugoso plato','foto de chilcano')
insert into COMIDA(id_categoria,Nombre,precio,descripcion,foto) 
values('Menu Criollo','Tallarin verde',35.00,'Para probar en estos dias de cuarentena','foto de tallarinverde')

go


------------------------------------------------
--INSERCCION DE DATOS A LA TABLA CATEGORIA_PLATO
-------------------------------------------------
insert into CATEGORIA_PLATO(nombre) values ('Menu Marino')
insert into CATEGORIA_PLATO(nombre) values ('Menu Criollo')
go


-------------------------------------------
--INSERCCION DE DATOS A LA TABLA PLATO_ORDEN
-------------------------------------------
insert into PLATO_ORDEN(id_orden,id_comida,unidades,cantidad,estado) values (1,6,4,120,0)
insert into PLATO_ORDEN(id_orden,id_comida,unidades,cantidad,estado) values (2,8,2,120,0)
insert into PLATO_ORDEN(id_orden,id_comida,unidades,cantidad,estado) values (3,7,1,50,1)
insert into PLATO_ORDEN(id_orden,id_comida,unidades,cantidad,estado) values (5,10,4,60,1)
go

-------------------------------------------
--INSERCCION DE DATOS A LA TABLA INGREDIENTE_PLATO
-------------------------------------------

insert into INGREDIENTE_PLATO(id_comida,id_ingredient) values (6,1)
insert into INGREDIENTE_PLATO(id_comida,id_ingredient) values (7,5)
insert into INGREDIENTE_PLATO(id_comida,id_ingredient) values (8,3)
insert into INGREDIENTE_PLATO(id_comida,id_ingredient) values (9,4)
insert into INGREDIENTE_PLATO(id_comida,id_ingredient) values (10,2)
go




-------------------------------------------
--INSERCCION DE DATOS A LA TABLA INGREDIENTE
-------------------------------------------
insert into INGREDIENTE(nombre) values('Pescado,Cebolla,Papas')
insert into INGREDIENTE(nombre) values('Tallarin,Espinaca,Albaca')
insert into INGREDIENTE(nombre) values('Pescado,Tomate,Cebolla')
insert into INGREDIENTE(nombre) values('Cabeza de Pescado,Cebolla')
insert into INGREDIENTE(nombre) values('Lenteja,Carne,Papas')
go


