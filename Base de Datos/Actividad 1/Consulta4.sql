SELECT Cli_RazonSocial, SUM(Ventas_Total) AS total
FROM ventas JOIN clientes ON Ventas_CliId = Cli_Id
WHERE Cli_RazonSocial NOT LIKE "%CONSUMIDOR FINAL%"
GROUP BY Cli_RazonSocial
ORDER BY total DESC
LIMIT 10
