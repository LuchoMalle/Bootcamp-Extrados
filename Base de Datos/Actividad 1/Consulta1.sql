SELECT Ventas_Fecha, Ventas_NroFactura, Ventas_Total, Cli_RazonSocial
FROM ventas JOIN clientes ON Ventas_CliId = Cli_Id
WHERE Cli_RazonSocial LIKE "%RENITEZ DANIEL%"