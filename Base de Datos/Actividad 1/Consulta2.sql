SELECT YEAR(Ventas_Fecha) AS año, MONTH(Ventas_Fecha) AS mes, Ventas_NroFactura, Ventas_Total, Cli_RazonSocial
FROM ventas JOIN clientes ON Ventas_CliId = Cli_Id
WHERE YEAR(Ventas_Fecha) = 2018 AND MONTH(Ventas_Fecha) = 5