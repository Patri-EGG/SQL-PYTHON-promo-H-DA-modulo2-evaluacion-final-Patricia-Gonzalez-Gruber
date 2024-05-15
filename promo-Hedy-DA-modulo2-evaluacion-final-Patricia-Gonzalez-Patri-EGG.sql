USE sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT
    (f.title)
FROM
    film AS f								    -- JOIN es lo mismo que "INNER JOIN"
JOIN inventory as i ON f.film_id = i.film_id;   -- Usamos la tabla inventory para seleccionar sólo los títulos existentes actualmente. Lo cuál nos trae una lista con 958 titulos, en lugar de 1000.

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT DISTINCT
    (f.title), f.rating -- seleccionamos'f.rating' para verificar resultados
FROM
    film AS f
        JOIN
    inventory AS i ON f.film_id = i.film_id
WHERE
    f.rating = 'PG-13';
    
-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT DISTINCT
    (f.film_id), f.title, t.description
FROM
    film_text AS t
        JOIN
    film AS f ON f.film_id = t.film_id
        JOIN
    inventory AS i ON f.film_id = i.film_id
WHERE
    t.description LIKE '%amazing%'
        OR t.description LIKE 'amazing%' -- Debe funcionar con sólo LIKE '%amazing%', pero verifico con LIKE 'amazing%' ya que todos los resultados de la consulta aparece la palabra en la misma posición.
ORDER BY f.title;-- Ordenamos por titulo para ver la información de forma más organizada.

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT DISTINCT
	(f.title), f.length   -- seleccionamos 'f.length' para verificar resultados.
FROM
    film AS f
        JOIN
    inventory AS i ON f.film_id = i.film_id
WHERE
    f.length > 120;


-- 5. Recupera los nombres de todos los actores.
SELECT 
    CONCAT(first_name, ' ', last_name) AS Nombre, actor_id
FROM
    actor
ORDER BY actor_id; -- Me aseguro que no se repitan ids en caso de que dos o más actores tengan el mismo nombre completo.


-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS Nombre
FROM
    actor AS a
WHERE
    a.last_name LIKE '%gibson%'; -- Usamos LIKE '%gibson%' en caso de que pueda tener dos apellidos o cualquier otra variante.

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS Nombre, a.actor_id
FROM
    actor AS a
WHERE
    a.actor_id BETWEEN 10 AND 20;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT f.title, f.rating
FROM film as f
WHERE f.rating NOT LIKE 'R' AND f.rating NOT LIKE 'PG-13'
ORDER BY f.rating;  -- Ordenamos para comprobar resultados más facilmente.

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y 
-- muestra la clasificación junto con el recuento.

SELECT 
    COUNT(DISTINCT f.film_id) AS num_titulos, f.rating -- contamos id_film solo una vez 'DISTINCT',incluso si hay múltiples entradas para el mismo film_id en la tabla inventory.
FROM
    film AS f
        JOIN
    inventory AS i ON f.film_id = i.film_id -- sólo resultados que existan actualmente en el inventario (Opcional)
GROUP BY f.rating
ORDER BY f.rating; -- Odernamos por rating para la consulta este más organizada. (opcional)

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, 
-- su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT 
    COUNT(r.rental_id) AS total_peliculas_alquiladas, -- cuenta las filas de la tabla "rental" por cada 'rental_id' que es único, por lo que no hay necesidad de eliminar duplicados utilizando DISTINCT.
    CONCAT(c.first_name, ' ', c.last_name) AS Nombre_cliente,
    c.customer_id
FROM
    customer AS c
        JOIN
    rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- 11. Encuentra la cantidad total de películas alquiladas por categoría 
-- y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT 
    COUNT(r.rental_id) AS total_peliculas_alquiladas,
    c.name AS nombre_categoria
FROM
    category AS c
        JOIN
    film_category AS fc ON fc.category_id = c.category_id
        JOIN
    film AS f ON fc.film_id = f.film_id
        JOIN
    inventory AS i ON f.film_id = i.film_id
        JOIN
    rental AS r ON i.inventory_id = r.inventory_id
GROUP BY c.name ;

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film 
-- y muestra la clasificación junto con el promedio de duración.

SELECT 
    AVG(f.length) AS duracion_promedio,
    f.rating AS clasificacion
FROM
    film AS f
        JOIN
    inventory AS i ON i.film_id = f.film_id -- De nuevo, seleccionamos titulos existentes en el inventario. (Opcional)
GROUP BY f.rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT DISTINCT --  Uso 'DISTINCT' para asegurarme de que los actores no aparezcan duplicados en los resultados. Esto elimina las repeticiones causadas por múltiples entradas del mismo actor en la tabla inventory.
    CONCAT(a.first_name, ' ', a.last_name) AS Actor,
    f.title AS pelicula
FROM
    actor AS a
        JOIN
    film_actor AS fa ON fa.actor_id = a.actor_id
        JOIN
    film AS f ON f.film_id = fa.film_id
        JOIN
    inventory AS i ON i.film_id = f.film_id -- De nuevo, seleccionamos titulos existentes en el inventario. (Opcional)
WHERE
    f.title = 'Indian Love';
    
-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
    
SELECT DISTINCT
    f.title AS titulo_dog_cat, f.description -- Seleciono f.description para comprobar resultados.
FROM
    inventory AS i
        JOIN
    film AS f ON f.film_id = i.film_id
WHERE
    f.description LIKE '%dog%' OR f.description LIKE '%cat%';
    
-- 15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.
    
SELECT 
    a.actor_id
FROM
    actor AS a
        LEFT JOIN   -- LEFT JOIN para combinar la tabla 'actor' con 'film_actor' aunque no hayan coincidencias. 'JOIN' solo devolveria filas cuando hay una coincidencia en ambas tablas. 
    film_actor AS fa ON fa.actor_id = a.actor_id
WHERE					 -- Uso de  'IS NULL' porque buscamos ids que no aparezcan en la tabla film_actor
    fa.actor_id IS NULL; -- Esta consulta devuelve '0 Filas', lo que significa que todos los actores en la tabla 'actor' aparecen en la tabla 'film_actor'.
    
-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT DISTINCT   -- Uso 'DISTINCT' para asegurarme de que los titulos no aparezcan duplicados en los resultados. Esto elimina las repeticiones causadas por la union de la tabla inventory donde se repiten film_id's.
    f.title, f.release_year
FROM
    film AS f
        JOIN
    inventory AS i ON i.film_id = f.film_id
WHERE
    f.release_year BETWEEN 2005 AND 2010
ORDER BY f.release_year;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT DISTINCT -- Selecciono 'c.name' para verificar resultados y  DISTINCT para que no se repitan nombres al comparar con la tabla inventary.
    f.title AS titulos_family, c.name
FROM
    film AS f
        JOIN
    film_category AS fc ON fc.film_id = f.film_id
        JOIN
    category AS c ON fc.category_id = c.category_id
        JOIN
    inventory AS i ON i.film_id = f.film_id -- Verificamos inventario, de los contrario nos traería 69 filas en véz de 67.
WHERE
    c.name = 'Family';

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS titulo, COUNT(fa.actor_id) as num_peliculas
FROM
    actor AS a
        JOIN
    film_actor AS fa ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name -- No uso alias 'titulo' porque algunos editores SQL no permiten usar un alias definido en el SELECT dentro de un GROUP BY. (Opcional).
HAVING COUNT(fa.actor_id) > 10;    -- Lo mismo de la línea de arriba referente al alias en esta línea.

-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

SELECT 
    title, rating, length
FROM
    film
WHERE
    rating = 'R' AND length > 120;

-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos 
-- y muestra el nombre de la categoría junto con el promedio de duración.

SELECT 
    AVG(f.length) AS avg_duracion, c.name AS categoria
FROM
    category AS c
        JOIN
    film_category AS fc ON fc.category_id = c.category_id
        JOIN
    film AS f ON f.film_id = fc.film_id
        JOIN
    inventory AS i ON i.film_id = f.film_id  -- Opcional
GROUP BY c.name
HAVING AVG(f.length) > 120;

-- 21. Encuentra los actores que han actuado en al menos 5 películas 
-- y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.

SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS nombre,
    COUNT(fa.actor_id) AS num_peliculas
FROM
    actor AS a
        JOIN
    film_actor AS fa ON fa.actor_id = a.actor_id
		JOIN
	inventory as i ON i.film_id = fa.film_id -- Opcional. En este caso devuelve el mismo número de resultados.
GROUP BY CONCAT(a.first_name, ' ', a.last_name)
HAVING COUNT(fa.actor_id) >= 5
ORDER BY num_peliculas DESC;  -- Ordenamos para ver los actores que aparecen en más peliculas primero.

-- 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta 
-- para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.

SELECT     
    f.title,
    MIN(DATEDIFF(r.return_date, r.rental_date)) AS minimo_alquiler -- Añadimos columna 'minimo_alquiler' para comprobar resultados mostrando el minimo de dias que un titulo fue alquilado.(Opcional)
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id -- Usamos tabla 'inventory como puente para conectar tabla 'rental' con tabla 'film' para conseguir nombre de los titulos. 
        JOIN
    rental r ON i.inventory_id = r.inventory_id
WHERE
    r.rental_id IN (SELECT   -- Uso de 'IN' para incluir solo los 'rental_id' que devuelve la subconsulta.
            r2.rental_id
        FROM
            rental r2
        WHERE
            DATEDIFF(r2.return_date, r2.rental_date) > 5)-- Función MySQL 'DATEDIFF' devuelve la diferencia en días entre dos fechas.
GROUP BY f.title; -- Al agrupar por f.title no se repiten titulos.

-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
-- Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos 
-- de la lista de actores.

SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name) as nombre_actor
FROM actor as a
WHERE a.actor_id NOT IN ( SELECT fa.actor_id
						FROM film_actor as fa
						JOIN film_category as fc ON fc.film_id = fa.film_id
						JOIN category as c ON c.category_id = fc.category_id
						WHERE c.name = 'Horror' );
                        
-- 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos 
-- en la tabla film.
SELECT 
    f.title, f.length, c.name -- seleccionamos f.length y c.name para verificar resultados
FROM
    film AS f
        JOIN
    film_category AS fc ON fc.film_id = f.film_id
        JOIN
    category AS c ON c.category_id = fc.category_id
WHERE
    c.name = 'Comedy' AND f.length > 180;
    
-- 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. 
-- La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.

SELECT 
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor1,
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor2,
    COUNT(DISTINCT fa1.film_id) AS num_peliculas
FROM
    film_actor fa1
        JOIN
    film_actor fa2 ON fa1.film_id = fa2.film_id   -- Hacemos 'SELF JOIN' de la misma tabla para usa dos actor_id diferentes.
        AND fa1.actor_id <> fa2.actor_id
        JOIN
    actor a1 ON fa1.actor_id = a1.actor_id
        JOIN
    actor a2 ON fa2.actor_id = a2.actor_id
GROUP BY actor1 , actor2
HAVING num_peliculas > 0 -- Aseguramos que los actores han coincidido en la misma pelicula por lo menos unas vez.
ORDER BY num_peliculas DESC; -- ordenamos para mostrar las parejas que han coincidido más veces primero.


