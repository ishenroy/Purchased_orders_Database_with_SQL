#Retrieve all orders with their total amounts converted to US dollars.
SELECT orderId, date, currency, 
       CASE 
         WHEN currency = '£' THEN total * 1.36  -- Assuming 1 GBP = 1.36 USD
         ELSE total 
       END AS total_in_usd,
       customerId
FROM orders;

# List customers who have placed orders in GBP (£) and their respective total amounts.
SELECT c.firstName, c.lastName, o.total, o.currency
FROM customers c
JOIN orders o ON c.customerId = o.customerId
WHERE o.currency = '£';

#Find the total number of orders placed by each customer.
SELECT c.firstName, c.lastName, COUNT(o.orderId) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customerId = o.customerId
GROUP BY c.customerId;

#Calculate the average order total for each country.
SELECT c.country, AVG(o.total) AS avg_order_total
FROM customers c
JOIN orders o ON c.customerId = o.customerId
GROUP BY c.country;

#Retrieve customers who have not placed any orders.
SELECT c.firstName, c.lastName
FROM customers c
LEFT JOIN orders o ON c.customerId = o.customerId
WHERE o.orderId IS NULL;

#Identify customers who have placed orders more than once.
SELECT c.firstName, c.lastName, COUNT(o.orderId) AS total_orders
FROM customers c
JOIN orders o ON c.customerId = o.customerId
GROUP BY c.customerId
HAVING COUNT(o.orderId) > 1;

#Get the latest order date for each customer.
SELECT c.firstName, c.lastName, MAX(o.date) AS latest_order_date
FROM customers c
JOIN orders o ON c.customerId = o.customerId
GROUP BY c.customerId;

#Calculate the total revenue generated from orders in USD.
SELECT SUM(CASE WHEN currency = '£' THEN total * 1.36 ELSE total END) AS total_revenue_usd
FROM orders;

#Find customers who have spent more than $500 in total.
SELECT c.firstName, c.lastName, SUM(o.total) AS total_spent
FROM customers c
JOIN orders o ON c.customerId = o.customerId
GROUP BY c.customerId
HAVING SUM(o.total) > 500;

#List customers and their corresponding orders, ordered by order date.
SELECT c.firstName, c.lastName, o.orderId, o.date
FROM customers c
JOIN orders o ON c.customerId = o.customerId
ORDER BY o.date;

#Create a trigger to update a customer's last order date when a new order is inserted.
DELIMITER //
CREATE TRIGGER update_last_order_date
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE customers
    SET last_order_date = NEW.date
    WHERE customerId = NEW.customerId;
END;
//
DELIMITER ;
--This trigger will update the last_order_date column of the customers table with the date of the most recent order whenever a new order is inserted into the orders table.
