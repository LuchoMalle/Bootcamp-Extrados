/*
Devuelve un listado indicando todas las ciudades donde hay oficinas y 
el número de empleados que tiene
*/

SELECT ofic.ciudad, COUNT(empl.codigo_empleado)
	FROM oficina AS ofic
		JOIN empleado AS empl ON ofic.codigo_oficina = empl.codigo_oficina
GROUP BY ofic.ciudad

-- SELECT * FROM empleado WHERE codigo_oficina = "BCN-ES"