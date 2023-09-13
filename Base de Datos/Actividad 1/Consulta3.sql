SELECT Ventas_NroFactura, 
Ventas_Fecha, 
Cli_RazonSocial,
Prod_Id,
VD_Cantidad, 
(VD_Precio -  VD_Costo) AS Ganancia
FROM ventas_detalle 
	JOIN productos ON VD_ProdId = Prod_Id
	JOIN ventas ON VD_VentasId = Ventas_Id
	JOIN clientes ON Ventas_CliId = Cli_Id
WHERE Prod_Descripcion LIKE "%BIPOLAR PARALELO%"