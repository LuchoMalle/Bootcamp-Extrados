/*
Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos 
empleados que no sean representante de ventas de ningún cliente.
*/

SELECT empl.nombre, empl.apellido1, empl.apellido2, empl.puesto, ofic.telefono
	FROM empleado AS empl
		JOIN oficina AS ofic ON empl.codigo_oficina = ofic.codigo_oficina
WHERE empl.codigo_empleado NOT IN (SELECT cli.codigo_empleado_rep_ventas
													FROM cliente AS cli)