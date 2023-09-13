/* Devuelve el listado de clientes indicando el nombre del cliente y 
 cuántos pedidos ha realizado. 
 Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
*/

SELECT c.nombre_cliente, COUNT(p.codigo_pedido) AS cant_pedidos
	FROM cliente AS c
		LEFT JOIN pedido AS p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre_cliente

-- SELECT * FROM cliente WHERE nombre_cliente = "GoldFish Garden"

-- SELECT * FROM pedido WHERE codigo_cliente = 1