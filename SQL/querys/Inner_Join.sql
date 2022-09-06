use AccesDatabase
go

--1 Inner join

--Sin alias
Select Raz_soc_cli, Dir_cli, Nom_dis
from tb_Cliente
inner join tb_distrito
on tb_cliente.Cod_dis=Tb_Distrito.cod_dis
go

--Con alias
Select Raz_soc_cli, Dir_cli, Nom_dis
from tb_Cliente C
inner join tb_distrito D
on C.Cod_dis=D.cod_dis
go


--2	Seleccionar
-- Numero de factura 


select num_fac, fec_fac, raz_soc_cli, nom_ven
from tb_factura F
	inner join tb_cliente C on F.cod_cli = C.cod_cli
	inner join tb_vendedor V on F.cod_ven = V.cod_ven
go

--3 Mostrar una lista de productos 
--con sus respectivos proveedores

select * from Tb_Producto
select * from Tb_Abastecimiento
select * from Tb_Proveedor
go

--Noten que producto y proovedor  no tienen relacion 
--relacion directa estan conectados a través de abastecimiento

select Des_pro, Raz_soc_prv
from Tb_Abastecimiento A
	inner join Tb_Producto P on  A.Cod_pro=P.Cod_pro
	inner join Tb_Proveedor PV on A.Cod_prv=PV.Cod_prv
order by Des_pro
go

--4 liste el numero de facura
--Nombre del cliente y el total  facturado
--por cada factura

select F.Num_fac, Raz_soc_cli,
	Sum(can_ven*Pre_ven) As 'Total'
from Tb_Factura F
	inner join Tb_Detalle_Factura D on  F.Num_fac=D.Num_fac
	inner join Tb_Cliente C on F.Cod_cli=C.Cod_cli
group by F.Num_fac, Raz_soc_cli
order by F.Num_fac
go
