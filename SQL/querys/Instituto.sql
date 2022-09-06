create database instituto
go

use instituto
go

create table matricula(
idcursopro char(4) not null,
idalumno char(5) not null,
fecha date not null,
precio money not null,
numcuotas tinyint not null,
notacurso decimal(4,2)
)
go

select * from matricula
go

alter table matricula
add constraint pk_matricula_idcursopro_idalumno
primary key(idcursopro, idalumno)
go

sp_helpconstraint matricula
go

create table pago(
idcursopro char(4) not null,
idalumno char(5) not null,
cuotanum tinyint not null,
fecha date not null,
importe smallmoney not null
)
go

select * from pago
go

alter table pago
add constraint pk_pago_idcursopro_idalumno_cuotanum
primary key(idcursopro,idalumno,cuotanum)
go

sp_helpconstraint pago
go

alter table pago
add constraint fk_pago_matricula
foreign key (idcursopro,idalumno)
references matricula
on delete cascade
go

insert matricula (idcursopro,idalumno,fecha,precio,numcuotas,notacurso)
values
('c001','AL001',getdate()-10,'500','1',null),
('c002','AL003',getdate()-8,'600','1',null),
('c002','AL005',getdate()-5,'700','3',null)
go

insert pago (idcursopro, idalumno, cuotanum, fecha, importe)
values
('c001','AL001',1,getdate()-10,'500'),
('c001','AL003',1,getdate()-8,'700'),
('c002','AL005',1,getdate()-5,'400'),
('c002','AL005',1,getdate()-4,'200'),
('c002','AL005',1,getdate()-3,'100')
go 

select*from pago
go

delete from matricula
where idcursopro='C002' and idalumno='AL005'
go

select*from matricula
go

select * from pago
go