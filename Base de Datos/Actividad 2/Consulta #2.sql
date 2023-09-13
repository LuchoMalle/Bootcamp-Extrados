/*
Devuelve un listado con los nombres de los clientes y el total pagado por 
cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han 
realizado ningún pago.
*/

SELECT c.nombre_cliente, SUM(p.total)
	FROM cliente AS c
		LEFT JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre_cliente

-- SELECT * FROM pago WHERE codigo_cliente = 1