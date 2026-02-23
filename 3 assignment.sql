use sakila;

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(payment_id) > 5
);

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(film_id) > 10
);

SELECT *
FROM customer
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM payment
);

SELECT title, rental_rate
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
);

SELECT title
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT film_id
    FROM inventory
    WHERE inventory_id IN (
        SELECT inventory_id
        FROM rental
    )
);

SELECT DISTINCT customer_id
FROM rental
WHERE MONTH(rental_date) IN (
    SELECT DISTINCT MONTH(rental_date)
    FROM rental
    WHERE customer_id = 5
)
AND customer_id <> 5;

SELECT DISTINCT staff_id
FROM payment
WHERE amount > (
    SELECT AVG(amount)
    FROM payment
);

SELECT title, rental_duration
FROM film
WHERE rental_duration > (
    SELECT AVG(rental_duration)
    FROM film
);

SELECT *
FROM customer
WHERE address_id = (
    SELECT address_id
    FROM customer
    WHERE customer_id = 1
)
AND customer_id <> 1;

SELECT *
FROM payment
WHERE amount > (
    SELECT AVG(amount)
    FROM payment
);

