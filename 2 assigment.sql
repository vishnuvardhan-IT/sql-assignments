use sakila;

SELECT first_name,
       last_name,
       email,
       COUNT(*) AS duplicate_count
FROM customer
GROUP BY first_name, last_name, email
HAVING COUNT(*) > 1;

SELECT SUM(
       LENGTH(description) -
       LENGTH(REPLACE(LOWER(description), 'a', ''))
       ) AS total_a_count
FROM film;

SELECT 
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'a', ''))) AS total_a,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'e', ''))) AS total_e,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'i', ''))) AS total_i,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'o', ''))) AS total_o,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'u', ''))) AS total_u
FROM film;

SELECT customer_id,
       YEAR(payment_date) AS year,
       MONTH(payment_date) AS month,
       SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id, YEAR(payment_date), MONTH(payment_date)
ORDER BY customer_id, year, month;

SELECT customer_id,
       YEAR(payment_date) AS year,
       SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id, YEAR(payment_date)
ORDER BY customer_id, year;

SELECT customer_id,
       YEAR(payment_date) AS year,
       SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id, YEAR(payment_date)
ORDER BY customer_id, year;

SELECT customer_id,
       YEAR(payment_date) AS year,
       WEEK(payment_date) AS week_number,
       SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id, YEAR(payment_date), WEEK(payment_date)
ORDER BY customer_id, year, week_number;

SELECT 
CASE 
    WHEN (2024 % 400 = 0) 
         OR (2024 % 4 = 0 AND 2024 % 100 <> 0)
    THEN 'Leap Year'
    ELSE 'Not a Leap Year'
END AS leap_year_status;

SELECT 
DATEDIFF(
    MAKEDATE(YEAR(CURDATE()), 365 + 
        IF(
           (YEAR(CURDATE()) % 400 = 0) 
           OR (YEAR(CURDATE()) % 4 = 0 AND YEAR(CURDATE()) % 100 <> 0),
           1, 0)
    ),
    CURDATE()
) AS days_remaining;

SELECT payment_id,
       payment_date,
       CONCAT('Q', QUARTER(payment_date)) AS quarter
FROM payment;

SELECT 
CONCAT(
TIMESTAMPDIFF(YEAR, '2003-10-10', CURDATE()), ' years, ',
TIMESTAMPDIFF(MONTH, '2003-10-10', CURDATE()) % 12, ' months, ',
DATEDIFF(
    CURDATE(),
    DATE_ADD(
        DATE_ADD('2003-10-10',
        INTERVAL TIMESTAMPDIFF(YEAR, '2003-10-10', CURDATE()) YEAR),
    INTERVAL TIMESTAMPDIFF(MONTH, '2003-10-10', CURDATE()) % 12 MONTH)
) , ' days'
) AS age;

