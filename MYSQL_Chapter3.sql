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
SELECT  amount, payment_date,
	DATE_FORMAT(payment_date, "%m-%d-%Y") AS payment_date
FROM payment
WHERE payment_date >= "2006-01-01" AND amount > 1.00
ORDER BY amount;
