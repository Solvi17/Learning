--------------------------------------
--		Clave Primaria Recursiva	--
--------------------------------------

Create database Hospital_Bueno
go

Use Hospital_Bueno
go

--creamos la tabla MEDICO
create table MEDICO(
IdMedico char(3) not null,
Nombre  varchar(50) not null,
jefe char(3) 
)
go

select * from MEDICO
go

alter table MEDICO
add constraint pk_Medico_IdMedico
primary key (IdMedico)
go

sp_helpconstraint Medico
go

--FK hara referencia al pk de la misma tabla  
alter table MEDICO
add constraint fk_Medico_jefe
foreign key (Jefe)
references MEDICO (IdMedico)
go

--Vemos los pk y fk  de la tabla MEDICO
sp_helpconstraint Medico
go

Insert MEDICO
values
('M01', 'Juan',null)
go

--Éxito: Inserto al Médico MO2 con jefe M01
Insert MEDICO
values 
('M02','Rosa', 'M01')
go

select * from MEDICO
go 