--
-- I -	Programación
--

/* Parte 1 :
-------------
 Manejo de variables Locales
 --------------------------
 Normalmente las varibles se utilizan en lotes y scripts:
	
		>Como contadores, para contar el numero de veces que se realiza
		un bucle o controlar cuántas veces debe ejecutarse.

		> Para contener	un valor de datos que desea probar mediante
		una instrucción de control de flujo.

		> Para guardar el valor de un dato que se va  a devolver en un
		codigo de retorno de un procedimiento almacenado o un valor 
		devuelto en una función.

*/
--1 Escribir un programa que permita calcular el 
--promedio de dos notas enteras

--Declarar las variables

Declare @Nota1 INT
Declare @Nota2 INT
Declare @Prom DECIMAL(4,2)

-- Asignar valores a las variables 
Set @Nota1 = 17
Set @Nota2 = 14

-- Proceso para calcular el promedio
Set @Prom =(@Nota1 +@Nota2)/2

--Salida de resultados
PRINT 'Fecha de evaluacion: '+Cast(getdate() as varchar(20))
PRINT 'El promedio es: ' + Cast(@Prom as varchar(5))
go

--2 Escribir un programa que permita calcular el
-- monto a pagar al comprar Ewuipos de computo.
--Se debe proporcionar :
-- >el precio
-- >La cantidad a comprar .
-- Salida :
		-- Fecha
		-- Subtotal
		-- IGV
		-- Total
		
-- Declarar las variables
Declare @Precio Decimal(7,2)
Declare @Cantidad INT
Declare @Igv Decimal(7,2)
Declare @Subtotal Decimal(7,2)
Declare @Total Decimal(7,2)

--Asignar valores a las variables
Set	@Precio = 500
Set @Cantidad = 30

-- Proceso
Set @Subtotal = (@Precio*@Cantidad)
Set @Igv = (@Subtotal*0.18)
Set @Total = (@Subtotal + @Igv)

--Salida de resultados
PRINT 'Fecha de compra: ' + CAST(GETDATE() as varchar(20))
PRINT 'El subtotal es: ' + CAST(@Subtotal as varchar(10))
PRINT 'El igv del 18% es: ' + CAST(@Igv as varchar(10))
PRINT 'El total es: ' + CAST(@Total as varchar(10))
go

--Parte 2: Usando IF
--------------------

--3 Escribir 

-- Mostrar el mensae 'Aprobado' si el promedio es mayor o igual
-- En caso contrario mostrar 'Desaprobado'.

--Declarar las variables 
Declare @Nota1 INT
Declare @Nota2 INT
Declare @Prom Decimal(7,2)
Declare @Msj VARCHAR(20)

--Asignar valores a las variables
Set @Nota1 = 16
Set @Nota2 = 5

--Proceso  para calcular el promedio y establecer el mensaje.
Set @Prom= (@Nota1+@Nota2)/2

If(@Prom > =11)
	Begin
		set @Msj = 'Aprobado'
	End
Else
	Begin
		set @Msj = 'Desaprobado'
	End

-- Salida de resultados 
Print 'Fecha de evaluación :' + Cast(getdate() as varchar(20))
Print 'Fecha de evaluación :' + Cast(@Prom as varchar(5))
Print 'Condicion: ' + @Msj
Go


Use AccesDatabase
go

-- 4 Contar Distritos
Select COUNT(*) From Tb_Distrito
go

--
Declare @NumDis Int	
Set @NumDis = (Select COUNT(*) from Tb_Distrito)
Print 'Tenemos ' + Convert(Varchar(2), @NumDis) + ' distritos'
go

-- 5 Contar Clientes
Select COUNT(*) from Tb_Cliente
go

--
Declare @NumCli Int
Set @NumCli = (Select COUNT(*) from Tb_Cliente)
Print 'Tenemos ' + Convert(varchar(10),@NumCli) + ' Cliente'
go

-- 6 Hallar el monto total de todas las facturas

-- Delcaración de Variables
Declare @SumaMontoFacturas INT

--Asignando un valor a la variable
Set @SumaMontoFacturas = (Select Sum(can_ven*Pre_ven)
						from Tb_Detalle_Factura)

--Salida de resultados
Print 'El monto total facturado es: ' + convert(varchar(10),@SumaMontoFacturas)

go

-- 7 Guarde en una variable la cantidad de ordenes de compras
-- Atendidas (Estado= 1) por un determinado Proveedor.

--Declaración de variables
Declare @OC INT
Declare @Codprv Char(4)

--Asignando un valor a las variables
Set @Codprv ='V009'
Set @OC =(Select COUNT(*)
			from Tb_Orden_Compra
			where Cod_prv = @Codprv and Est_oco='1')

--Salida de Resultados
Print 'La cantidad de Ordenes de compra atendidas por el proveedor '
	+ Cast(@Codprv as char(4)) + ' es: '+ Cast(@Oc as varchar(2))
go

-- 8 Guarde en una variable la deuda de un cliente
-- (almacene el código del cliente en una variable también)
-- por concepto de facturas pendientes.
-- pruebe con el cliente c014 y luego con el c015.

--Declaración de variables
Declare @Deuda Smallmoney
Declare @Codcli Char(4)

--Asignamos valores
Set @Codcli = 'C015'
Set @Deuda = (Select SUM(DF.Can_ven*DF.Pre_ven)
			From Tb_Factura F
			inner join Tb_Detalle_Factura DF
			on DF.Num_fac = F.Num_fac
			where F.Cod_cli = @Codcli and F.Est_fac = '1')

--Imprimir deuda
Print 'La deuda del cliente: ' + @Codcli + ' es: ' + Convert(varchar(10),@Deuda)
go
--Nota los deudores son los clientes C014, C015 y C019
-- Si probamos con otros clientes, al no tener deudas,
--no se muestra ningun tipo de resultado.

-- 9

--A

















--12 Imprimetu nombre 50 veces

Declare @Contador SMALLINT
SET @Contador = 1

While @Contador <= 50
	Begin
		PRINT 'Yolvi'
		SET @Contador = @Contador +1
	End
go