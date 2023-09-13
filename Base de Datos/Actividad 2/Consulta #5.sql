/*
Devuelve el listado de clientes donde aparezca el nombre del cliente, 
el nombre y primer apellido de su representante de ventas y 
la ciudad donde está su oficina.
*/

SELECT cli.nombre_cliente, empl.nombre, empl.apellido1, ofic.ciudad
	FROM cliente AS cli
		JOIN empleado AS empl ON cli.codigo_empleado_rep_ventas = empl.codigo_empleado
		JOIN oficina AS ofic ON empl.codigo_oficina = ofic.codigo_oficina