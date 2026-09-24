/**************************************
DATE: 2026.09.17
NAMES: Jacob, Christian 
Chapter 3 assignment
GitHub URL: https://github.com/jacobczapla/MySQL_Chapter3
**************************************/

/****************************************************************************************************
Jacob
Query 1: Write a query that reports the following:]
 inactive customers
 sorted by name (NOTE: if not stated, all order by clauses are the default ascending)
 Note: to thoroughly test the query, temporarily change the WHERE clause to report active customers
******************************************************************************************************/
Select customer_id,
 CONCAT(last_name, ', ', first_name) as cust_name,
 email, 
 active
From customer
Where active = 0
ORDER BY last_name, first_name;

/****************************************************************************************************
Christian
Query 2: Write a query that reports the following:]
•	All customers with INVALID email addresses. A valid email address is the first name, a period, 
	the last name, and @sakilacustomer.org. Example: debbie.johnson@sakilacustomer.org
•	Note: to thoroughly test this query, temporarily change the WHERE clause to report VALID emails
******************************************************************************************************/
SELECT customer_id, first_name, last_name, email, active, create_date
FROM customer
WHERE email != CONCAT(first_name, '.', last_name, '@sakilacustomer.org');

/****************************************************************************************************
Jacob
Query 3: Write a query that reports the following:
 the current rental rate, what a 30% increase would be, and the new rental rate
 only report the ones that have a rental rate that increased by over $0.50
 order the report by amount increased descending
 round all calculated values to 2 decimal positions
 Note: to fully test this query, temporarily comment out the WHERE clause
******************************************************************************************************/

select title, rental_rate, 
	round(rental_rate * 0.30, 2) AS amount_increased, 
    	round(rental_rate * 1.30, 2) AS new_rental_rate
from film
where round(rental_rate * 0.30, 2) >= 0.50
Order By amount_increased DESC;

/****************************************************************************************************
Christian
Query 4: Write a query that reports the following:
•	payment amount and date (MM-DD-YYYY) DATE FORMAT
•	filter by payment date greater than 01-01-2006 inclusively and payment amount greater than 1.00 ORDER BY
•	sort the query by payment amount ORDER BY
•	Note: to thoroughly test the query comment out the WHERE clause to verify the filter is working correctly
******************************************************************************************************/
SELECT  amount,
	DATE_FORMAT(payment_date, "%m-%d-%Y") AS payment_date
FROM payment
WHERE payment_date >= "2006-01-01" AND amount > 1.00
ORDER BY amount;

/****************************************************************************************************
Jacob
Query 5: Write a query that reports the following:
 displaying only the first 50 characters of the description; followed by …
 filter to only report rental durations between 3 and 6 (using the BETWEEN operator)
 sort by the rental duration descending
 Note: to thoroughly test, temporarily comment out the WHERE clause
******************************************************************************************************/
SELECT 
    title, description AS info, rental_duration
FROM
    film
WHERE
    description < 50
        AND rental_duration BETWEEN 3 AND 6
ORDER BY rental_duration DESC;

/****************************************************************************************************
Christian
Query 6: Write a query that reports the following:
•	films that have (trailers OR behind the scenes) special features but NOT commentaries
(keep in mind films that have both trailers and behind the scenes special features might also have other features)
•	sort by title
•	Note: to thoroughly test, temporarily commend out the WHERE clause
******************************************************************************************************/
SELECT title, release_year, rating, special_features
FROM film
WHERE (special_features LIKE "%Trailers%" OR special_features LIKE "%Behind the Scenes%") AND special_features NOT LIKE "%Commentaries%"
ORDER BY title;

/****************************************************************************************************
Jacob
Query 7: Write a query that reports the following:
 films that are rated G, PG, and PG-13 (note: please use the IN phrase for this filter)
 sort by rating and title
 Note: to thoroughly test this query, temporarily comment out the WHERE clause
******************************************************************************************************/
SELECT title, rental_rate, rating
From film 
where rating in ("G", "PG", "PG-13")
order by  rating, title;

/****************************************************************************************************
Christian
Query 8: Write a query that reports the following:
•	films that have the words robot and squirrel in the description
•	sort by title
•	Note: to thoroughly test this query, temporarily comment out the WHERE clause
******************************************************************************************************/
SELECT title, description, rating
FROM film
WHERE description LIKE "%robot%" and description LIKE "%squirrel%"
ORDER BY title

/****************************************************************************************************
Jacob
Query 9: Write a query that reports the following:
 unique customers who have NOT returned their rental
 sort by customer id
 Note: to thoroughly test this query, temporarily change the WHERE clause to report rentals that have been
returned
******************************************************************************************************/
select distinct customer_id, return_date
from rental 
where return_date is NULL
order by customer_id;

/****************************************************************************************************
Christian
Query 10: Write a query that reports the following:
•	unique districts
•	sort by district
•	limit the rows returned to start at the 2nd row and returning a total of 25 rows
•	Note: to thoroughly test this query, temporarily remove the limit clause
*******************************************************************************************************/

SELECT distinct district
FROM address
ORDER BY district
LIMIT 2, 25;
