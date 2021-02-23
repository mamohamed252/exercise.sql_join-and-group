USE classicmodels;
/*
Write a query to display each customer’s name (asCustomer Name) alongside the name of the employee who is responsible for that customer’s orders.
The employee name should be in a single Sales Rep column formatted as lastName, firstName. The output should be sorted alphabetically by customer name.
*/

SELECT c.customerName AS "Customer Name", CONCAT(e.lastName, ', ', e.firstName) AS "Sales Rep"
FROM customers c JOIN employees e ON c.salesRepEmployeeNumber=e.employeeNumber
ORDER BY c.customerName;

/*
Determine which products are most popular with our customers.
For each product, list the total quantity ordered along with the total sale generated (total quantity ordered * priceEach) for that product.
The column headers should be Product Name, Total # Ordered and Total Sale.
List the products by Total Sale descending.
*/

SELECT productName AS 'Product Name',
orderdetails.quantityOrdered AS 'Total Number Orders', (orderdetails.quantityOrdered * orderdetails.priceEach) AS 'Total Sale'
FROM products, orderdetails
ORDER BY (orderdetails.quantityOrdered * orderdetails.priceEach) DESC;

/*
Write a query which lists order status and the # of orders with that status.
Column headers should be `Order Status` and `# Orders`.
Sort alphabetically by `status`.
*/ 

SELECT quantityOrdered AS '# Orders', STATUS AS 'Orders Status'
 FROM orderdetails, orders
 ORDER BY STATUS ASC;
 
 /*
Write a query to list, for each product line, the total # of products sold from that product line.
The first column should be `Product Line` and the second should be `# Sold`.
Order by the second column descending.
 */

SELECT productLine AS 'Product Line', quantityOrdered AS '# Sold' FROM products, orderdetails
WHERE products.productCode = orderdetails.productCode
ORDER BY quantityOrdered DESC;

/*
For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale amount of those orders.
The employee name should be output as a single column named `Sales Rep` formatted as `lastName, firstName`.
The second column should be titled `# Orders` and the third should be `Total Sales`.
Sort the output by `Total Sales` descending.
 Only (and all) employees with the job title `Sales Rep` should be included in the output, and if the employee made no sales the `Total Sales` should display as `0.00`.
*/

SELECT concat(employees.lastName, ' ', employees.firstName) AS 'Sales Rep', orderdetails.quantityOrdered AS '# Order', payments.amount AS 'Total Sales'
FROM employees, orderdetails, payments, customers, orders
WHERE customers.salesRepEmployeeNumber = employees.employeeNumber 
AND customers.customerNumber = payments.customerNumber  
AND orderdetails.orderNumber = orders.orderNumber 
ORDER BY payments.amount DESC;

/*
Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception.
Write a query to output the month (January, February, etc.), 4-digit year, and total sales for that month.
The first column should be labeled `Month`, the second `Year`, and the third should be `Payments Received`.
Values in the third column should be formatted as numbers with two decimals – for example: `694,292.68`.
*/

SELECT YEAR(paymentDate) AS Year, MONTH(paymentDate) AS Month, SUM(amount) AS 'Payment Received'
FROM payments
GROUP BY YEAR(paymentDate), MONTH(paymentDate);

