
-- Usaremos la BD Ventas
-- Importamos la BD Ventas
USE Ventas
GO

-- Conozcamos algunas de sus Tablas
SELECT * FROM Tb_Cliente
GO

SELECT * FROM Tb_Vendedor
GO

SELECT * FROM Tb_Producto
GO

SELECT * FROM Tb_Factura
GO

SELECT * FROM Tb_Detalle_Factura
GO



-- 1 Seleccionar Código, Descuento, Precio y Stock Actual de productos.
--   Ordenar Descendente por Precio y Descendente por Stock.

SELECT Cod_pro, Des_pro, Pre_pro, Stk_act
FROM Tb_Producto
ORDER BY Pre_pro DESC, Stk_act DESC
GO



-- 2 Vemos que las columnas fec_fac y fec_can son de Tipo Datetime
SELECT fec_fac, fec_can
FROM Tb_Factura
GO

-- Podemos convertir ambas columnas en DATE
ALTER TABLE Tb_Factura
ALTER COLUMN Fec_fac DATE
GO    

ALTER TABLE Tb_Factura
ALTER COLUMN Fec_can DATE
GO  

SELECT fec_fac AS 'F. Fact',
fec_can AS 'F. Canc'
FROM Tb_Factura
GO

-- Y si queremos ver con estilo día/mes/año
SELECT 
CONVERT(VARCHAR(10), Fec_fac, 103) AS 'F. Fact',
CONVERT(VARCHAR(10), Fec_can, 103) AS 'F. Canc'
FROM Tb_Factura
GO



-- 3 Facturas emitidas un Sábado del Primer Semestre del 2010

SET LANGUAGE Spanish
GO

SELECT * FROM Tb_Factura
WHERE YEAR(Fec_fac)=2010 AND
      MONTH(Fec_fac)<=6 AND
      DATENAME(WEEKDAY,Fec_fac) ='Sábado'
GO



-- 4 Vendedores que ingresaron a la empresa un Lunes o un Viernes

-- Opción 1
SELECT * FROM Tb_Vendedor
WHERE DATENAME(WEEKDAY, Fec_ing) = 'Lunes'
OR DATENAME(WEEKDAY, Fec_ing) = 'Viernes'
GO


-- Opción 2
SELECT * FROM Tb_Vendedor
WHERE DATENAME(WEEKDAY, Fec_ing) 
IN ('Lunes','Viernes')
GO



-- 5 Cantidad de días transcurridos para la cancelación de una factura

--Versión 30, 70, 50, ...
SELECT Num_fac, Fec_fac, Fec_Can, 
DATEDIFF(DAY,Fec_Fac,Fec_can) AS 'Tiempo Transcurrido'
FROM TB_Factura
GO

--Versión 30 días, 50 días, 70 días, ...
SELECT Num_fac, Fec_fac, Fec_Can, 
CAST(DATEDIFF(DAY,Fec_Fac,Fec_can) AS VARCHAR(3)) +' días' AS 'Tiempo Transcurrido'
FROM TB_Factura
GO



-- 6 Crear una tabla llamada "Vend" con los datos de 
--   la Tabla Vendedor


-- Viendo el contenido de la Tabla Vendedor
SELECT * FROM Tb_Vendedor
GO

-- Traslado de datos
SELECT * INTO Vend FROM Tb_Vendedor
GO

-- Viendo los datos de la Tabla Vend
SELECT * FROM Vend
GO

-- Revisando la estructura de la Tabla Vend
sp_help Vend
GO



-- 7 Crear una Tabla llamada ClientesEspeciales
--   para los clientes de los distritos D04, D05 y D26

-- Viendo el contenido de la Tabla Vendedor
SELECT * FROM Tb_Cliente
GO

-- Traslado de datos
SELECT * INTO ClientesEspeciales FROM Tb_Cliente
WHERE Cod_dis IN ('D04','D05','D26')
GO

-- Viendo los datos de la Tabla ClientesEspeciales
SELECT * FROM ClientesEspeciales
GO

-- Revisando la estructura de la Tabla ClientesEspeciales
sp_help ClientesEspeciales
GO



-- 8 El código del cliente es del tipo C001, teniendo 4 caracteres en total.
-- Hacer la secuencia con 10 caracteres
-- C001 -> C000000001

SELECT 'C'+REPLICATE('0', 6)+RIGHT(Cod_cli,3) AS 'Nuevo Código'
FROM Tb_Cliente
GO



-- 9 Encontrar la 1ra y 2da vez que se repita la letra A
--   en los Apellidos de los Vendedores

SELECT ape_ven AS 'Apellidos',
CHARINDEX('A',Ape_ven,1) AS 'Primera Busqueda',
CHARINDEX('A',Ape_ven,CHARINDEX('A',Ape_ven,1)+1) AS 'Segunda Búsqueda'
FROM Tb_Vendedor
WHERE ape_ven LIKE '%A%'
GO



-- 10 Separar el Contacto (Tabla Cliente) en Nombre y Apellido
SELECT Contacto FROM TB_CLIENTE
GO

-- 10a. Nombre
SELECT LEFT(Contacto, CHARINDEX(' ',Contacto)-1) AS 'Nombre'
FROM Tb_Cliente
GO

-- 10b. Apellido
SELECT RIGHT(Contacto, LEN(Contacto)-CHARINDEX(' ', Contacto)) AS 'Apellido'
FROM Tb_Cliente
GO



/* 
Notas:
- Es más fácil juntar que separar
  Por eso tenga un nombre completo separado en columnas
- Y si lo debe tener todo junto, use un separador único, una coma, espacio, etc
  dependiendo de cuantos elementos se tengan para separar
*/



/* 
FUNCIONES DE AGREGACIÓN
------------------------

SUM 
COUNT 
MAX 
MIN 
AVG 


*/


----------------------------
--     Función SUM
----------------------------

--11 Hallar el pago total (mensual) que se debe hacer a nuestros vendedores

SELECT * FROM Tb_Vendedor
GO

SELECT SUM(sue_ven) AS 'Pago Total Mensual a Vendedores'
FROM Tb_Vendedor
GO



----------------------------
--     Función MAX, MIN
----------------------------

-- 12 Liste el producto más barato y el producto más caro

SELECT * FROM Tb_Producto
GO

SELECT 
MIN(Pre_pro) AS 'Precio Mínimo', 
MAX(Pre_pro) AS 'Precio Máximo'
FROM Tb_Producto
GO



-- 13 Con respecto a los Vendedores de Tipo '1' 
--    listar el sueldo mínimo y el sueldo máximo

SELECT * FROM Tb_Vendedor
GO

SELECT
MIN(sue_ven) AS 'Sueldo Mínimo', 
MAX(sue_ven) AS 'Sueldo Máximo'
FROM Tb_Vendedor
WHERE tip_ven='1'
GO



----------------------------
--     Función AVG
----------------------------


-- 14 Sueldo Promedio de los Vendedores
SELECT * FROM Tb_Vendedor
GO

SELECT AVG(sue_ven) AS 'Sueldo Promedio'
FROM Tb_Vendedor
GO



-- 15 Liste el Promedio de Antigüedad de los clientes.
SELECT * FROM Tb_Cliente
GO

-- Hallando el promedio
SELECT AVG(FLOOR(DATEDIFF(DAY, fec_reg, GETDATE())/365.25)) AS 'Promedio Antigüedad'
FROM Tb_Cliente               -- Rpta: 15.15
GO 

-- Debemos redondear hacia abajo dicho resultado
SELECT FLOOR(AVG(FLOOR(DATEDIFF(DAY, fec_reg, GETDATE())/365.25))) 
AS 'Promedio Antigüedad'
FROM Tb_Cliente               -- Rpta: 15
GO 



----------------------------
--     Función COUNT
----------------------------

--16 Cantidad de Clientes

SELECT COUNT(*) FROM Tb_Cliente  --Total Clientes: 20
GO



--17 Cantidad de Clientes con Teléfono 
--  (Tel_cli es una columna con nulos)

SELECT COUNT(Tel_cli) 
FROM Tb_Cliente     --Total Clientes con Teléfono: 17
GO


-- Nota: 
-- Count (y cualquier función de agregación) omite nulos cuando especificas alguna columna
-- Con  SELECT COUNT(*) FROM Tb_Cliente         --Total Clientes: 20
-- Pero SELECT COUNT(Tel_cli) FROM Tb_Cliente   --Total Clientes: 17

-- Count(*) nos da el número de filas que retorna una consulta, sin importar nulos o no nulos.
-- Pero si se especifica una columna COUNT(columna), entonces count retorna 
-- el número de filas en la cual la expresión no es null. 



--18 Cantidad de Clientes sin Teléfono
--   (Los clientes sin teléfono están como Null)

-- Primer intento
SELECT COUNT(Tel_cli) FROM Tb_Cliente
WHERE Tel_cli IS NULL  --0 filas (?)
GO

-- ¿Por qué sale error?
-- Sencillo: COUNT omite nulos. Al realizar COUNT(Tel_cli)
-- sólo estaría considerando 17 registros (los cuales son No Nulos)
-- y sobre ellos no tiene sentido realizar un WHERE preguntando
-- quienes son nulos porque ya sabemos que ninguno de ellos lo es.


-- Solución 1
SELECT COUNT(*)-COUNT(Tel_cli) 
FROM Tb_Cliente
GO

-- Solución 2
SELECT COUNT(*) FROM Tb_Cliente
WHERE Tel_cli IS NULL  --Rpta: 3
                       --Al utilizar COUNT(*) me refiero al total de registros



-- 19 Cantidad de Vendedores que han emitido una Factura

SELECT * FROM Tb_Factura
GO

SELECT COUNT(Cod_ven)           -- 20 ¿Será la respuesta correcta? No.
FROM Tb_Factura
GO                             

SELECT COUNT(DISTINCT Cod_ven)  -- 10 es la respuesta correcta
FROM Tb_Factura
GO                             



-- 20 Cantidad de Facturas pendientes (Estado=1)
--    que no hayan sido atendidas por el vendedor V08

SELECT * FROM Tb_Factura
GO

SELECT COUNT(*) AS 'Facturas Pendientes'
FROM Tb_Factura
WHERE est_fac='1' AND Cod_ven<>'V08'
GO



CREATE TABLE #Abc(
Vendedor VARCHAR(50),
Sueldo SMALLMONEY,
Bono SMALLMONEY
)
GO


INSERT #Abc
VALUES
('Juan', '2000', '200'),
('Kathy', '1500', NULL),
('Sonia', '3000', '300')
GO



-- 21 Calcular el Nuevo Sueldo (Sueldo + Bono)
SELECT Vendedor, Sueldo, Bono,
Sueldo + Bono AS 'Nuevo Sueldo' 
FROM #Abc 
GO              -- Para Kathy la Suma da Null



----------------------------
--     Función ISNULL
----------------------------

--Reemplazamos los NULL con valores 0 con la Función ISNULL

SELECT Vendedor, Sueldo, Bono,
Sueldo + ISNULL(Bono,0) AS 'Nuevo Sueldo' 
FROM #Abc
GO              -- Respuesta correcta, ningún registro de 'Nuevo Sueldo' es Null



-- 22 Con respecto a la columna Bono Tabla #Abc
--    SUM, AVG, MAX, MIN, COUNT (Nulos y no Nulos)

SELECT SUM(Bono) FROM #Abc
SELECT AVG(Bono) FROM #Abc
SELECT MAX(Bono) FROM #Abc
SELECT MIN(Bono) FROM #Abc
SELECT COUNT(Bono) FROM #Abc
SELECT COUNT(*) FROM #Abc WHERE Bono IS NULL
GO



-----------------------------------------
-- Agrupando con la Cláusula GROUP BY
-----------------------------------------

-- 23 Cuántas facturas tiene cada cliente

SELECT * FROM Tb_Factura
GO

SELECT Cod_cli, COUNT(Num_Fac) AS 'Número de Facturas' 
FROM Tb_Factura 
GROUP BY Cod_cli
GO



-- 24 La consulta anterior ordénela de manera descendente
SELECT * FROM Tb_Factura
GO

SELECT Cod_cli, COUNT(Num_Fac) AS 'Número de Facturas' 
FROM Tb_Factura 
GROUP BY Cod_cli
ORDER BY COUNT(Num_Fac) DESC
GO


SELECT Cod_cli, COUNT(Num_Fac) AS 'Número de Facturas' 
FROM Tb_Factura 
GROUP BY Cod_cli
ORDER BY 2 DESC   -- Funciona, pero es mala práctica ya que no es explícito.
GO



-- 25 Modifique la consulta anterior
--    Mostrando los 2 clientes que generaron más facturas
--    Especifique empates si es necesario


SELECT TOP 2 WITH TIES Cod_cli, COUNT(Num_Fac) AS 'Número de Facturas' 
FROM Tb_Factura 
GROUP BY Cod_cli
ORDER BY COUNT(Num_Fac) DESC
GO
                     
-- Nota: WITH TIES siempre debe ir con un ORDER BY



-- 26 Ojo con los Empates

-- Top 5 sin empates
SELECT TOP 5 Cod_cli, COUNT(Num_Fac) AS 'Número de Facturas' 
FROM Tb_Factura 
GROUP BY Cod_cli
ORDER BY COUNT(Num_Fac) DESC
GO

-- Top 5 con empates
SELECT TOP 5 WITH TIES Cod_cli, COUNT(Num_Fac) AS 'Número de Facturas' 
FROM Tb_Factura 
GROUP BY Cod_cli
ORDER BY COUNT(Num_Fac) DESC
GO

-- Moraleja: El With Ties (los empates) es SÓLO para el último valor de la lista



-- Analizando WITH TIES
CREATE TABLE #XYZ(
Venta Tinyint
)
GO

INSERT #xyz
VALUES
('1'),
('1'),
('2'),
('2'),
('3')
GO

SELECT * FROM #XYZ          
GO

SELECT TOP 1 * FROM #XYZ             -- 1
GO 

SELECT TOP 1 WITH TIES * FROM #XYZ   -- 1, 1
ORDER BY VENTA
GO

SELECT TOP 2 * FROM #XYZ             -- 1, 1
GO   

SELECT TOP 2 WITH TIES * FROM #XYZ   -- 1, 1
ORDER BY VENTA

SELECT TOP 3 * FROM #XYZ             -- 1, 1, 2
GO

SELECT TOP 3 WITH TIES * FROM #XYZ   -- 1, 1, 2, 2
ORDER BY VENTA
GO

SELECT TOP 4 * FROM #XYZ             -- 1, 1, 2, 2
GO

SELECT TOP 4 WITH TIES * FROM #XYZ   -- 1, 1, 2, 2
ORDER BY VENTA

SELECT TOP 5 * FROM #XYZ             -- 1, 1, 2, 2, 3
GO

SELECT TOP 5 WITH TIES * FROM #XYZ   -- 1, 1, 2, 2, 3
ORDER BY VENTA
GO



-- 27 Cantidad de clientes por distrito
--    para los distritos D05, D10, D17 y D20

SELECT * FROM Tb_Cliente
GO

SELECT Cod_dis, COUNT(Cod_dis)
FROM Tb_Cliente
WHERE Cod_dis IN('D05', 'D10', 'D17', 'D20')
GROUP BY Cod_Dis
GO



-- 28 Cantidad de clientes por distrito
--    del distrito D05 en adelante

SELECT Cod_dis, COUNT(Cod_dis)
FROM Tb_Cliente
WHERE Cod_dis >='D05'
GROUP BY Cod_Dis
GO


-- Si quisiera del distrito D05 hasta el distrito D20
SELECT Cod_dis, COUNT(Cod_dis)
FROM Tb_Cliente
WHERE Cod_dis BETWEEN 'D05' and 'D20'
GROUP BY Cod_Dis
GO



-- 29 Como regla general es mejor evitar búsquedas con Strings
--    En una BD siempre es más rápido buscar números que caracteres.

SELECT ape_ven FROM Tb_Vendedor
WHERE ape_ven BETWEEN 'L' AND 'Q'  -- Tenemos apellidos que empiezan con P
GO                                 -- como Palacios y Pariona

SELECT ape_ven FROM Tb_Vendedor
WHERE ape_ven BETWEEN 'L' AND 'P'  -- No aparecen apellidos que empiecen con P
GO                                 -- Debido a que BETWEEN 'L' AND 'P'
                                   -- es equivalente a >=L AND <=P
                                   
                                   -- Recuerde que cuando usamos BETWEEN con números
                                   -- por ejemplo BETWEEN 15 AND 177
                                   -- puede mostrar 177, pero no muestra 177.00001

SELECT ape_ven FROM Tb_Vendedor
WHERE ape_ven BETWEEN 'L' AND 'Pz' -- Sí aparecen los apellidos que empiezan con P
GO

SELECT ape_ven FROM Tb_Vendedor
WHERE ape_ven BETWEEN 'L' AND 'Sa'  -- 8 registros.
GO                                  -- No aparece ninguno empieza de los que
                                    -- empieza con Sa como Salas o Salazar.

SELECT ape_ven FROM Tb_Vendedor
WHERE ape_ven BETWEEN 'L' AND 'Sz' -- 10  registros. Tenemos Salas, Salazar
GO



---------------------------------------------------------------
-- >> Nota:
-- Recuerde: un Group By muestra una fila por grupo,
-- mostrando el resultado de una función de agregación.
-- NO muestra el contenido del grupo.
---------------------------------------------------------------



-- 30 Cantidad de productos cuyo Precio sea 20, 35 ó 45, agrupar.

SELECT * FROM Tb_Producto
GO

SELECT Pre_pro AS Precio, COUNT(*) AS 'Cantidad' 
FROM Tb_Producto
WHERE Pre_pro IN (20, 35, 45)
GROUP BY Pre_pro
GO



-- 31 Cantidad de productos cuyo Precio no esté entre 20 y 40, agrupar.

SELECT Pre_pro AS Precio, COUNT(*) AS 'Cantidad' 
FROM Tb_Producto
WHERE Pre_pro NOT BETWEEN 20 AND 40
GROUP BY Pre_pro
GO



-- 32 Cantidad de Productos que empiecen con las letras A, B ó C. Agrupar.

SELECT LEFT(Des_pro,1), COUNT(*) 
FROM Tb_Producto
WHERE LEFT(Des_pro,1) IN ('A','B','C')
GROUP BY LEFT(Des_pro,1)
GO




--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--   Ordenando Nombres de Días de la Semana y Nombres de Meses
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--


USE Ventas
GO

SET LANGUAGE SPANISH
GO

-- 33- Mostrar los meses del año 2010 en lo cuales se realizaron órdenes de compras.
--    Ordenar por Mes en secuencia (Enero, Febrero, ... Diciembre) y mostrar al lado
--    los números de Orden de Compra que pertenecen a dicho Mes.

SELECT * FROM Tb_Orden_Compra
GO

SELECT DATENAME(MONTH, fec_oco) AS 'Mes', Num_oco 
FROM Tb_Orden_Compra
WHERE YEAR(fec_oco)='2010' 
ORDER BY MONTH(fec_oco)
GO



-- 34- Modificar la consulta anterior para los Días de la Semana.
--    La secuencia debe ser (Lunes, Martes, ... Domingo).

SELECT DATENAME(WEEKDAY, fec_oco) AS 'Día de Semana', Num_oco 
FROM Tb_Orden_Compra
WHERE YEAR(fec_oco)='2010'  
ORDER BY DATEPART(WEEKDAY, fec_oco)  -- Si lo ordeno con DATENAME, 
GO                                   -- sería un orden alfabético. 
                                     -- Es por eso que lo ordeno con DATEPART.



-- Regla de Funciones de Agregación:
   --------------------------------
   
-- Cualquier campo mencionado en un SELECT que no esté contenido en una
-- Función de Agregación (COUNT, SUM, AVG, MAX, MIN) debe ser indicado
-- en la cláusula GROUP BY


-- 35- Cantidad de Órdenes de Compra por Mes, durante el Año 2010

SELECT DATENAME(MONTH, fec_oco) AS 'Mes', COUNT(*) AS 'Cantidad'
FROM Tb_Orden_Compra
WHERE YEAR(fec_oco)='2010' 
GROUP BY DATENAME(MONTH, fec_oco), MONTH(fec_oco)
GO                                    
                                      -- Pongo DATENAME en el GROUP BY por regla 
                                      -- de Funciones de Agregación.
                                      -- Para ordenarlo en secuencia, uso MONTH (Numérico).


-- > Lo mismo, pero con la Tabla Factura
SELECT * FROM Tb_Factura
GO

SELECT DATENAME(MONTH, fec_fac) AS 'Mes', COUNT(*) AS 'Cantidad'
FROM Tb_Factura
WHERE YEAR(fec_fac)='2010'
GROUP BY DATENAME(MONTH, fec_fac), MONTH(fec_fac)
GO



-- 36- Cantidad de Órdenes de Compra por Día de la Semana a nivel Anual (2010)
--    Días como nombres y en secuencia (Lunes, Martes... Domingo)

SELECT DATENAME(WEEKDAY, Fec_oco) AS 'Día de Semana', 
COUNT(*) AS 'Cantidad'
FROM Tb_Orden_Compra
WHERE YEAR(Fec_oco)='2010'
GROUP BY DATENAME(WEEKDAY, Fec_oco), DATEPART(WEEKDAY, Fec_oco)
GO
                                      -- Coloco DATENAME en el GROUP BY por regla 
                                      -- de Funciones de Agregación.
                                      -- Para ordenarlo en secuencia, uso WEEKDAY (numérico).


-- > Lo mismo, pero con la Tabla Factura
SELECT DATENAME(WEEKDAY, Fec_fac) AS 'Día de Semana', 
COUNT(*) AS 'Cantidad'
FROM Tb_Factura
WHERE YEAR(Fec_fac)='2010'
GROUP BY DATENAME(WEEKDAY, Fec_fac), DATEPART(WEEKDAY, Fec_fac)
GO



-- 37- Listar el número de facturas canceladas.
--    Agrupar por año y mes.

SELECT
YEAR(fec_can) AS 'Año',
DATENAME(MONTH, fec_can) AS 'Mes', 
COUNT(*) AS 'Nro. de Facturas Canceladas'
FROM Tb_Factura
WHERE Fec_can IS NOT NULL
GROUP BY 
YEAR(fec_can), 
DATENAME(MONTH, fec_can), MONTH(fec_can)
ORDER BY 
DATEPART(YEAR, fec_can), MONTH(fec_can)
GO                      
                        -- Order By es necesario porque hay varias columnas
                        -- en el Select además del conteo y deseamos un orden
                        -- en particular con todas ellas.
                        
                        -- En los ejercicios anteriores, sólo teníamos 
                        -- una columna en el SELECT además
                        -- del conteo y por ello no necesitaba un ORDER BY
                        -- para obtener el orden que necesito en cada columna.



-- 38- Listar el número de facturas canceladas (Como en la consulta 5)
--    Agrupar por año, mes y día de semana.

SELECT
YEAR(fec_can) AS 'Año',
DATENAME(MONTH, fec_can) AS 'Mes', 
DATENAME(WEEKDAY, fec_can) AS 'Día de Semana',
COUNT(*) AS 'Nro. de Facturas Canceladas'
FROM Tb_Factura
WHERE Fec_can IS NOT NULL
GROUP BY 
YEAR(fec_can), 
DATENAME(MONTH, fec_can), MONTH(fec_can), 
DATENAME(WEEKDAY, fec_can), DATEPART(WEEKDAY, fec_can)
ORDER BY 
YEAR(fec_can), MONTH(fec_can), DATEPART(WEEKDAY, fec_can)
GO




--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--  GROUP BY CON ROLLUP
--                   ROLLUP: Genera Subtotales y Totales.
--                           Aspecto Jerárquico. 
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--

-- 39 Hallar la Suma de Sueldos por cada Tipo de Vendedor.
--   Utilizar el operador ROLLUP

SELECT * FROM Tb_Vendedor
GO

SELECT tip_ven AS 'Tipo de Vendedor',
SUM(sue_ven) AS 'Total por Tipo'
FROM Tb_Vendedor
GROUP BY tip_ven
WITH ROLLUP          -- Si no incluyera el Operador ROLLUP
GO                   -- No tendría el Total 19950




-- 40 Hallar la Suma de Sueldos de Vendedores clasificada
--   por Año y dentro de cada Año separada por Tipo de Vendedor
--   Utilizar el operador ROLLUP

SELECT YEAR(fec_ing) AS 'Año', 
tip_ven AS 'Tipo de Vendedor',
SUM(sue_ven) AS 'Sueldos Totales'
FROM Tb_Vendedor
GROUP BY YEAR(fec_ing), tip_ven
WITH ROLLUP
GO                  -- Con el operador ROLLUP obtuve los subtotales por
                    -- cada año (note el año 2004 y 2005) y un Total General
                    -- con la suma de todos los años, 19950




--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--  GROUP BY CON CUBE
--                    CUBE: Aspecto dimensional.
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--

-- 41 Hallar la Suma de Sueldos por cada Tipo de Vendedor.
--   Utilizar el Operador CUBE

SELECT tip_ven AS 'Tipo de Vendedor',
SUM(sue_ven) AS 'Total por Tipo'
FROM Tb_Vendedor
GROUP BY tip_ven
WITH CUBE                -- Con pocos argumentos, obtenemos algo similar
GO                       -- al operador ROLLUP.




-- 42 Hallar la Suma de Sueldos de Vendedores clasificada
--    por Año y dentro de cada Año separada por Tipo de Vendedor
--    Utilizar el Operador CUBE

SELECT YEAR(fec_ing) AS Año, 
tip_ven AS 'Tipo Vendedor',
SUM(sue_ven) AS 'Sueldos Totales'
FROM Tb_Vendedor
GROUP BY YEAR(fec_ing), tip_ven
WITH CUBE                -- Obtuvimos:
GO                       -- Total Vendedor Tipo 1 por Año
                         -- Total Vendedor Tipo 1 para todos los Años.
                         -- Total Vendedor Tipo 2 por Año
                         -- Total Vendedor Tipo 2 para todos los Años.
                         -- Totales por cada Año considerando ambos Tipos de Vendedor.


-- Nota:
-- Mientras el Operador WITH ROLLUP muestra un resultado de Aspecto Jerárquico,
-- el Operador WITH CUBE muestra un resultado de Aspecto Dimensional, 




--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--  CLÁUSULA COMPUTE ... BY
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--

-- NOTA: COMPUTE BY ha sido descontinuada a partir de SQL 2012 =/


--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--  CASE
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--


-- 43 Los productos con un precio mayor a 20 estarán 'En Promoción'.
--    Los demás 'Sin Promoción'.


SELECT Pre_pro,

      CASE
		WHEN Pre_pro>20 THEN 'En Promoción'
		ELSE 'Sin promoción'
	  END  Estatus
	  
FROM Tb_Producto
GO


-- 44 Muestre la Descripcion de Productos y una Observación:
--    Si el Stock Actual es menor que el Stock Minimo, 
--    la observacion debera indicar 'Abastecer Urgente'.
--    En caso contrario, la observacion indicará 'Producto con Stock Suficiente'

SELECT Des_pro,

CASE
	WHEN Stk_act<Stk_min THEN 'Abastecer Urgente'	
	ELSE 'Producto con Stock Suficiente'
	END Estado
	
FROM Tb_Producto
GO


-- 45 Muestre el Código de Cliente y una condición ("Deudor" o "Sin Deudas")
--    de acuerdo a si tiene facturas pendientes o no.
--    est_fac: 1 -> Pendiente

SELECT Cod_cli AS Cliente, 

      CASE 
		WHEN Cod_cli IN 
                   (SELECT DISTINCT Cod_cli 
                    FROM Tb_factura WHERE Est_fac='1')
		THEN 'Deudor'
		ELSE 'Sin Deudas'
      END Condición
      
FROM Tb_cliente
GO

-- 46 Muestre la relación de Facturas de acuerdo al estado cada una de ellas.
--    est_fac: 1-> Pendiente, 2-> Cancelada , 3-> Anulada

SELECT Num_fac AS 'Número de Factura', 

      CASE
		WHEN Est_fac ='1' THEN 'Pendiente' 
		WHEN Est_fac ='2' THEN 'Cancelada'
		WHEN Est_fac ='3' THEN 'Anulada'
      END Estado
      
FROM Tb_Factura
GO


-- 47 Mostrar un descuento dependiendo de la Línea del Producto. 
--    Si es de la Línea 1 se le otorga el 5%, 
--    si es de la Línea 2 se le da el 7% y 
--    si es de la Línea 3 se le otorga el 10% . 
--    Los Porcentajes de Descuento son con respecto al Precio del Producto.


SELECT * FROM Tb_Producto
GO

SELECT Des_pro, Lin_pro, Pre_pro,

		CASE
			WHEN Lin_pro='1' THEN (Pre_pro*0.05)
			WHEN Lin_pro='2' THEN (Pre_pro*0.07)
			WHEN Lin_pro='3' THEN (Pre_pro*0.1)
		END Descuento

FROM Tb_Producto
GO



--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
--  Orden Personalizado
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--


CREATE TABLE XYZ(
Venta Int,
Producto Varchar(30),
Zona Varchar(10)
)
GO

INSERT XYZ
VALUES
('1', 'Dvd', 'Norte'),
('2', 'Blu-Ray', 'Oeste'),
('3', 'Laptop', 'Sur'),
('4', 'PC', 'Sur'),
('5', 'Servidor', 'Norte'),
('6', 'Ipod', 'Este'),
('7', 'Laptop', 'Este'),
('8', 'Blu-Ray', 'Norte'),
('9', 'Dvd', 'Oeste'),
('10', 'PC', 'Sur'),
('11', 'PC', 'Norte'),
('12', 'Servidor', 'Oeste'),
('13', 'Dvd', 'Oeste'),
('14', 'Ipod', 'Este'),
('15', 'Ipod', 'Sur')
GO

SELECT * FROM XYZ
GO



-- 48
-- Ordenar por Zona: Norte, Sur, Este, Oeste.

SELECT *
FROM XYZ
ORDER BY 
CASE ZONA
	WHEN 'Norte' THEN 1 
	WHEN 'Sur'   THEN 2 
	WHEN 'Este'  THEN 3 
	WHEN 'Oeste' THEN 4
END
GO



-- 49	
-- Ordenar por Producto: PC, Laptop, Servidor.

SELECT *
FROM XYZ
WHERE Producto IN ('PC', 'Laptop', 'Servidor')
ORDER BY 
CASE Producto
	WHEN 'PC'	THEN 1 
	WHEN 'Laptop'   THEN 2 
	WHEN 'Servidor' THEN 3 
END
GO