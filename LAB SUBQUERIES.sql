USE sakila;

-- 1. Determinar el número de copias de la película "El Jorobado Imposible" que existen en el sistema de inventario.
SELECT f.title AS movie_title, COUNT(i.inventory_id) AS copies_available
FROM film AS f
LEFT JOIN inventory AS i ON f.film_id = i.film_id
WHERE f.title = 'Hunchback Impossible'
GROUP BY f.title;
-- 2. Enumere todas las películas cuya duración es mayor que la duración promedio de todas las películas en la base de datos de Sakila.
SELECT title AS movie_title, length AS movie_length
FROM film
WHERE length >(SELECT AVG(length) FROM film); -- Comparar la duracion de cada peli con el valor promedio de duracion AVG
-- 3. Utilice una subconsulta para mostrar todos los actores que aparecen en la película "Viaje solo".
SELECT a.actor_id, a.first_name, a.last_name
FROM actor AS a
WHERE actor_id IN (SELECT fa.actor_id FROM film
JOIN film_actor AS fa ON film.film_id = fa.film_id
WHERE film.title = 'Alone Trip');
-- 4. Las ventas han ido a la zaga entre las familias jóven es, y usted quiere apuntar a películas familiares para una promoción.
--  Identifique todas las películas categorizadas como películas familiares.
SELECT f.title AS movie_title, c.name AS category_name
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
WHERE c.name = 'Family';
-- 5. Recupere el nombre y el correo electrónico de los clientes de Canadá mediante subconsultas y uniones.
-- Para usar combinaciones, deberá identificar las tablas relevantes y sus claves principal y externa.
SELECT c.first_name, c.last_name, c.email
FROM customer AS c
JOIN address AS a On c.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';
-- 6. Determina qué películas fueron protagonizadas por el actor más prolífico en la base de datos de Sakila.
-- Un actor prolífico se define como el actor que ha actuado en el mayor número de películas. 
-- Primero, deberá encontrar al actor más prolífico y luego usar ese actor_id para encontrar las diferentes películas que protagonizó.
-- 7. Encuentre las películas alquiladas por el cliente más rentable en la base de datos de Sakila.
-- Puede utilizar las tablas de clientes y pagos para encontrar el cliente más rentable, es decir, el cliente que ha realizado la mayor suma de pagos.
-- 8. Recupere el client_id y el total_amount_spent de aquellos clientes que gastaron más que el promedio de los total_amount gastados por cada cliente.
-- Para ello, puede utilizar subconsultas.