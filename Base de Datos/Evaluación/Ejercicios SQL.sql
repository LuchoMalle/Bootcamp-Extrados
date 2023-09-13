/*

Crear una tabla llamada genero con las siguientes características:
	· La tabla tendrá un idGenero como clave primaria autoincrementada.
	· También tendrá un campo nombre, que indica el nombre por el que se 
		conoce a dicho género (‘Drama’, ‘Acción’,…).

*/

CREATE TABLE genero(
	idGenero INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
	PRIMARY KEY(idGenero)
);

/*

Hacer que el campo Genero de la tabla pelicula sea una clave 
foránea de la tabla genero recién creada.

*/

ALTER TABLE pelicula
	ADD CONSTRAINT fk_pelicula_genero FOREIGN KEY (genero)
	REFERENCES genero (idGenero);
	
/*

Inserta tus datos en ‘actor’ e inclúyete entre el reparto 
de actores de la película ‘Mar Adentro’.

*/
	
INSERT INTO actor (Nombre,Fnacimiento,Lnacimiento,Nacionalidad)
	VALUES ('Luciano', '1999-05-17', 'Concordia', 'Argentino');
	
INSERT INTO participa (CodActor,CodPelicula)
	VALUES (36,6);

/*

Modifica el valor del campo Taquilla de las películas de Estados Unidos, 
de manera que se conviertan de dólares a euros, multiplicando su valor por 0.8.

*/

UPDATE pelicula
	SET taquilla = taquilla*0.8
	WHERE nacionalidad = 'Estados Unidos';

/*

¿Qué empresa es la distribuidora de la película ‘Casablanca’?

*/

SELECT distribuidora
	FROM pelicula
	WHERE titulo = 'casablanca';
	
/*

Muestra qué actores y actrices, nacidos en Suecia, han fallecido ya, 
según la información almacenada en nuestra base de datos

*/

SELECT nombre, nacionalidad, fmuerte
	FROM actor
	WHERE nacionalidad = 'Suecia';

/*

¿Cuál ha sido la recaudación total de las películas realizadas en España?

*/

SELECT nacionalidad, SUM(taquilla) AS Recaudacion
	FROM pelicula
	WHERE nacionalidad = 'España';

/*

Muestra el nombre y lugar de nacimiento de las actrices que actuaban en 
la película ‘Solas’.

*/

SELECT nombre, lnacimiento
	FROM actor AS act
		JOIN participa AS par ON act.CodActor = par.CodActor
		JOIN pelicula AS pel ON par.CodPelicula = pel.CodPelicula
	WHERE titulo = 'Solas';
	
/*

Mostrar un listado en el que aparezcan cuántas películas tenemos de 
cada nacionalidad.

*/

SELECT nacionalidad, COUNT(nacionalidad) AS Cantidad
	FROM pelicula
	GROUP BY nacionalidad;
	
/*

Saca un listado de las películas españolas, pero en el que en el mismo 
campo aparezca el título seguido del año entre paréntesis (p.e.: El Bola (2000))

*/

SELECT titulo, anyo AS Año, CONCAT(titulo, ' ','(',anyo,')') AS Junto, nacionalidad
	FROM pelicula
	WHERE nacionalidad = 'España';
	
/*

¿Quién es el actor que ha participado en más películas?

*/

SELECT nombre, nacionalidad, COUNT(CodPelicula) AS peliculas
	FROM participa AS par
		JOIN actor AS act ON par.CodActor = act.CodActor
	GROUP BY par.CodActor
	ORDER BY peliculas desc
	LIMIT 1;
	
/*

¿Qué director ha dirigido 2 películas de las que tenemos almacenadas?

*/

SELECT dir.CodDirector AS 'Director', dir.Nombre, dir.Nacionalidad, COUNT(pel.Director) AS peliculas
	FROM pelicula AS pel
		JOIN director AS dir ON pel.Director = dir.CodDirector
	GROUP BY pel.Director
	ORDER BY peliculas desc
	LIMIT 1;

/*

¿Qué directores (de los que tenemos almacenados) no han dirigido ninguna 
de las películas de la tabla `films`?.

*/

SELECT Nombre, Nacionalidad
	FROM director 
	WHERE CodDirector NOT IN (SELECT Director FROM pelicula);