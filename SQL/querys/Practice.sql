use AccesDatabase
go

select Des_pro,Pre_pro
from Tb_Producto
where Pre_pro>=(select AVG(Pre_pro) from Tb_Producto)
go

select * from Tb_Distrito
go

select * from Tb_Factura
where Cod_ven='v02'
go

select COUNT(*) as 'numero de facturas'
from Tb_Factura
where Cod_ven=
(select Cod_ven from Tb_Distrito where Cod_dis='D09')
go

select Cod_ven,Sue_ven,
'diferencia'=Sue_ven-(select AVG(Sue_ven)from Tb_Vendedor)
FROM Tb_Vendedor
GO

select Cod_ven, sue_ven,
'porcentaje'=Sue_ven/(select sum(Sue_ven)From Tb_Vendedor)
from Tb_Vendedor
go

select * from Tb_Detalle_Factura
where Num_fac='FA003'
GO

select * from Tb_Producto
where cod_pro in ('P002','P011','P017','P019')
GO

select des_pro as 'nombre'
from Tb_Producto
where Cod_pro in (select Cod_pro
                  from Tb_Detalle_Factura
				  where Num_fac='FA003')
GO

select nom_ven, ape_ven
from Tb_Vendedor
where cod_ven not in (select distinct cod_ven 
                      from Tb_Factura)
go

select cod_cli, raz_soc_cli,
(select MIN(Fec_fac) 
FROM Tb_Factura
where Tb_Factura.Cod_cli=Tb_Cliente.Cod_cli)
as 'fecha 1ra factura'
from Tb_Cliente
go

select cod_cli, raz_soc_cli,
(select count(*) 
FROM Tb_Factura
where Tb_Cliente.Cod_cli=Tb_Factura.Cod_cli)
as 'Nro. de facturas'
from Tb_Cliente
where(select count(*) 
FROM Tb_Factura
where Tb_Cliente.Cod_cli=Tb_Factura.Cod_cli)>0
go

select cod_pro, des_pro
from Tb_Producto
where exists (select *
              from Tb_Detalle_Factura
			  where 
			  Tb_Detalle_Factura.Cod_pro=
			  Tb_Producto.Cod_pro)
			  go

select cod_pro, des_pro
from Tb_Producto
where not exists (select *
              from Tb_Detalle_Factura
			  where 
			  Tb_Detalle_Factura.Cod_pro=
			  Tb_Producto.Cod_pro)
			  go

select Cod_ven,Sue_ven,
when Sue_ven-(select AVG(Sue_ven)from Tb_Vendedor)<0
then 
GO