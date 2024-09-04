/* 
Common Table Expression (CTE)
- WITH clause / subquery (is the nested query within a larger query) 
i.e. select (retrieved value that can be used in the main query) in select (main query) -> select in select
- CTE is defining variables to be used in that particular session
- An inner query is a function or query that is inside parentheses. It will run first within the parentheses, and then the outer query will run

Tips:  We write the formula inside the parentheses first to avoid confusion.
*/

select firstname, lastname 
from 
	(SELECT * from customers
where country = 'USA');


--SELECT Avg(milliseconds) from tracks

-- subquery (Example) apply with syntax above:
SELECT name from tracks
where milliseconds > (
  SELECT AVG(milliseconds) from tracks
  );
  
/*  If we don’t use a subquery in the syntax above, we need to perform multiple steps, such as calculating AVG(millisecond) first, 
to get the values to use in the syntax above 

- Using a CTE (Common Table Expression) or creating variables is equivalent to a subquery but written in a shorter format.
- WITH is used to declare a variable by name, which we can then use directly in the FROM clause.
i.e. variable 1: (select *______), variable 2: (select * ______)

*/

with 
	usa_customers AS 
    	(SELECT * from customers 
         where country = 'USA' and company is Not NULL),
    invoice_y2010 aS 
    (SELECT * from invoices 
     where invoicedate 
     between '2010-01-01' AND '2010-12-31')
     
 SELECT ROW_NUMBER() OVER() AS customerid,
 firstname, lastname, company
 from usa_customers;

/* 
- Using "window_function" for addingg "row number" to each row of data
- Things to remember:  window function is to create columns to provide information, such as inserting row numbers
- window function always come with "over()" 
*/


-- Assign a unique number (1, 2, 3, 4, 5) starting from 1, and group the countries based on their assigned numbers
-- The numbers should be sequential by country, grouped by country.

SELECT ROW_NUMBER() OVER(PARTITION BY country) AS customerid,
	country, firstname, lastname
from customers;

/*
- partition by:  Divides the result set into partitions to which the window function is applied
- The data retrieval will be for the whole dataset if we don't include a PARTITION BY clause
- "The ROW_NUMBER() function is a window function that assigns a unique integer to each row, starting at 1."
*/

