SELECT Prod_Id, Prod_Descripcion, MAX(Ventas_Fecha)
FROM ventas_detalle 
	JOIN productos ON VD_ProdId = Prod_Id
	JOIN ventas ON VD_VentasId = Ventas_Id
	JOIN proveedores ON Prod_ProvId = Prov_Id
WHERE Prov_Nombre LIKE "%TELEMECANIQUE%" AND Prod_Status = 1
GROUP BY Prod_Id