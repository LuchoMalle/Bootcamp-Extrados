/*
Devuelve el nombre del cliente, el nombre y primer apellido de su representante 
de ventas y el número de teléfono de la oficina del representante de ventas, 
de aquellos clientes que no hayan realizado ningún pago
*/

SELECT DISTINCT cli.nombre_cliente, empl.nombre, empl.apellido1, empl.apellido2, ofic.telefono
	FROM cliente AS cli
		JOIN empleado AS empl ON cli.codigo_empleado_rep_ventas = empl.codigo_empleado
		JOIN oficina AS ofic ON empl.codigo_oficina = ofic.codigo_oficina
WHERE cli.codigo_cliente NOT IN (SELECT p.codigo_cliente
												FROM pago AS p)
												
-- SELECT codigo_cliente FROM pago