/*
Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados 
alfabéticamente de menor a mayor.
*/

SELECT c.nombre_cliente, p.fecha_pedido
	FROM cliente AS c
		JOIN pedido AS p ON c.codigo_cliente = p.codigo_pedido
WHERE p.fecha_pedido BETWEEN '2008-01-01' AND '2008-12-31'
ORDER BY c.nombre_cliente asc