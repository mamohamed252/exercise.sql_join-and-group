USE classicmodels;
/*
Write a query to display each customer’s name (asCustomer Name) alongside the name of the employee who is responsible for that customer’s orders.
The employee name should be in a single Sales Rep column formatted as lastName, firstName. The output should be sorted alphabetically by customer name.
*/

SELECT c.customerName AS "Customer Name", CONCAT(e.lastName, ', ', e.firstName) AS "Sales Rep"
FROM customers c JOIN employees e 
ON c.salesRepEmployeeNumber=e.employeeNumber
ORDER BY c.customerName;

/*
Determine which products are most popular with our customers.
For each product, list the total quantity ordered along with the total sale generated (total quantity ordered * priceEach) for that product.
The column headers should be Product Name, Total # Ordered and Total Sale.
List the products by Total Sale descending.
*/

