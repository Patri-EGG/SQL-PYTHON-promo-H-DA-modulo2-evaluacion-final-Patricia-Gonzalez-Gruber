# promo-Hedy-DA-modulo2-evaluacion-final-Patricia-Gonzalez-Patri-EGG(GitHub)
Descripción del Proyecto:
Este repositorio contiene mi trabajo para la evaluación final del Módulo 2, centrado en SQL, del curso de Análisis de Datos de Adalab. En este módulo, utilizamos la base de datos Sakila para desarrollar y demostrar nuestras habilidades en la ejecución de consultas SQL, manejo de datos y análisis de resultados.

Objetivos:
Demostrar la competencia en el uso de consultas SQL básicas y avanzadas.
Aplicar técnicas de análisis de datos para resolver problemas complejos utilizando la base de datos Sakila.
Prepararse para una revisión técnica similar a una entrevista de trabajo, donde defenderé y explicaré las decisiones tomadas en las consultas y análisis realizados.
Ejercicios Realizados:
Los siguientes son algunos de los ejercicios incluidos en este repositorio:

Consulta de Películas Únicas: Seleccionar todos los nombres de películas sin duplicados.
Películas por Clasificación: Muestra los nombres de películas con clasificación "PG-13".
Actores y Duraciones Específicas: Encuentra actores con el apellido "Gibson" y películas con duración mayor a 120 minutos.

Herramientas y Tecnologías Usadas:
MySQLworkbench: Para todas las consultas y manipulaciones de datos. 
GitHub: Para el versionado y gestión del código.

Notas: He usado la herramienta format+'Beautify Query' para hacer las consultas más leíbles.La mayoría de las consultas toman en cuenta el inventario. Lo que devolverá consultas solo sobre titulos disponibles, lo cuál es más realista (en mi opinión).


-------------------------------------------------------------------------------------------
Ejercicio Final Módulo 2
- Antes de empezar, hay que crear un nuevo repositorio en GitHub.
- Esta evaluación consta de una serie de preguntas que evalúan tu comprensión y habilidades en
relación con SQL.
- Puedes usar recursos externos, incluyendo internet y materiales de referencia o tus propias notas.
- Completa los ejercicios en un archivo sql. Ejercicios
Base de Datos Sakila:
Para este ejerccio utilizaremos la BBDD Sakila que hemos estado utilizando durante el repaso de SQL. Es una base de datos de ejemplo que simula una tienda de alquiler de películas. Contiene tablas como film (películas), actor (actores), customer (clientes), rental (alquileres), category (categorías), entre otras. Estas tablas contienen información sobre películas, actores, clientes, alquileres y más, y se utilizan para realizar consultas y análisis de datos en el contexto de una tienda de alquiler de películas.
1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
5. Recupera los nombres de todos los actores.
6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
   
 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
BONUS
24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.
Normas
Este ejercicio está pensado para que lo realices de forma individual en clase, pero podrás consultar tus dudas con la profesora y tus compañeras si lo consideras necesario. Ellas no te darán directamente la solución de tu duda, pero sí pistas para poder solucionarla. Aún facilitando la comunicación entre compañeras, durante la prueba no debes copiar código de otra persona ni acceder a su portátil. Confiamos en tu responsabilidad.
La evaluación es una buena oportunidad para conocer cómo estás progresando, saber qué temas debes reforzar durante las siguientes semanas y cuáles dominas. Te recomendamos que te sientas cómoda con el ejercicio que entregues y no envíes cosas copiadas que no entiendas.
Si detectamos que has entregado código que no es tuyo, no entiendes y no lo puedes defender, pasarás directamente a la re-evaluación del módulo. Tu objetivo no debería ser pasar la evaluación sino convertirte en analisat de datos, y esto debes tenerlo claro en todo momento.
Una vez entregado el ejercicio realizarás una revisión del mismo con la profesora (20 minutos), que se asemenjará a una entrevista técnica: te pedirá que expliques las decisiones tomadas para realizarlo.
Es una oportunidad para practicar la dinámica de una entrevista técnica donde te van a proponer cambios sobre tu código que no conoces a priori. Si evitas que otras compañeras te den pistas sobre la

dinámica de feedback, podrás aprovecharlo como una práctica y pasar los nervios con la profesora en lugar de en tu primera entrevista de trabajo.
Al final tendrás un feedback sobre aspectos a destacar y a mejorar en tu ejercicio, y sabrás qué objetivos de aprendizaje has supera
Criterios de evaluación
Vamos a listar los criterios de evaluación de este ejercicio. Si no superas al menos el 80% de estos criterios o no has superado algún criterio clave (marcados con *) te pediremos que realices una re- evaluación con el fin de que termines el curso mejor preparada y enfrentes tu primera experiencia profesional con más seguridad. En caso contrario, estás aprendiendo al ritmo que hemos pautado para poder afrontar los conocimientos del siguiente módulo.
Extracción de datos
- Entender que es una API y para qué son útiles.*
- Manejarlos resultados de un json para su limpieza y extracción de datos.*
- Saber extraer datos con Beautiful Soup y Selenium
SQL
- Dominar las queries básicas: SELECT; UPDATE; DELETE; INSERT *
- Dominar las funciones groupby, where y `having``. *
- Dominar el uso de joins (incluyendo union y `union all``)*
- Dominar el uso de subconsultas. *
- Dominar el uso de las subconsultas correlacionadas
- CTE’s
Otros criterios a tener en cuenta
- Usar inglés para nombres de variables, funciones, clases, mensajes de commit, nombres de ficheros.
- El repositorio de GitHub debe tener README explicando muy brevemente cómo arrancar el proyecto.

 