

#How many distinct (different) actors' last names are there?
SELECT
COUNT(DISTINCT last_name) AS count_distinct_last_name
FROM actor;

#In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT 
COUNT(DISTINCT language_id) as count_original_language 
FROM film;

#How many movies were released with "PG-13" rating?
SELECT *
FROM film
WHERE rating = "PG-13";

#Get 10 the longest movies from 2006.
SELECT *
FROM film
WHERE release_year >= 2006
ORDER BY length DESC
LIMIT 10;

#How many days has been the company operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS difference
FROM rental;

#Show rental info with additional columns month and weekday. Get 20.
SELECT *
FROM rental;

SELECT
rental_id,
rental_date,
inventory_id,
customer_id,
return_date
staff_id,
last_update,
DATE_FORMAT(rental_date, '%W') AS week_days,
DATE_FORMAT(rental_date, '%M') AS months
FROM rental;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT
rental_id,
rental_date,
inventory_id,
customer_id,
return_date,
staff_id,
last_update,
DATE_FORMAT(rental_date, '%W') AS week_days,
DATE_FORMAT(rental_date, '%M') AS months,
CASE
WHEN DATE_FORMAT(rental_date, '%W') IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') THEN 'workday'
WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday', 'Sunday') THEN 'weekend'
END AS day_type
FROM rental;

#How many rentals were in the last month of activity?
SELECT COUNT(*) AS nb_rentals
FROM rental
WHERE MONTH(rental_date) = (SELECT MAX(MONTH(rental_date)) FROM rental)
AND YEAR(rental_date) = (SELECT MAX(YEAR(rental_date)) FROM rental);