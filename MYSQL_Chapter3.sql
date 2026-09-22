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

