use sakila;

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY c.customer_id;

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

SELECT f.title,
       c.name AS category_name
FROM film f
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
ORDER BY f.title;

SELECT c.email AS email, 'Customer' AS source
FROM customer c

UNION

SELECT s.email AS email, 'Staff' AS source
FROM staff s;

SELECT a.first_name,
       a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';

SELECT s.store_id,
       COUNT(st.staff_id) AS total_staff
FROM store s
LEFT JOIN staff st ON s.store_id = st.store_id
GROUP BY s.store_id;

SELECT c.first_name,
       c.last_name,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 5
ORDER BY total_rentals DESC;

