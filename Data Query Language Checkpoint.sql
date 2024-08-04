CREATE DATABASE EXCLUSIVE_MART;
GO
USE EXCLUSIVE_MART;

CREATE TABLE Customers (
Customer_id INT PRIMARY KEY,
CustomerName VARCHAR (255) NOT NULL,
Address VARCHAR (255) NOT NULL,
);

CREATE TABLE Products (
Product_id INT PRIMARY KEY,
ProductName VARCHAR (255) NOT NULL,
Price DECIMAL CHECK (Price > 0) NOT NULL,
);

CREATE TABLE Orders (
Order_id INT PRIMARY KEY NOT NULL,
Customer_id INT NOT NULL,
Product_id INT NOT NULL,
Quantity INT NOT NULL,
Order_date DATE NOT NULL,
FOREIGN KEY(Customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO Customers (Customer_id, CustomerName, Address) VALUES
(1, 'Adeolu', 'Lagos'),
(2, 'Grace', 'London'),
(3, 'Esther', 'Toronto'),
(4, 'Clement', 'New York'),
(5, 'Eunice', 'Ottawa'),
(6, 'Timothy', 'Manchester'),
(7, 'Gabriel', 'Hatfield'),
(8, 'Elizabeth', 'Barcelona'),
(9, 'Micheal', 'Miami'),
(10, 'Daniel', 'Memphis');


INSERT INTO Products (Product_id, ProductName, Price) VALUES
(1, 'Widget', 8500),
(2, 'Gadget', 3000),
(3, 'Gadget', 5000),
(4, 'Backpack', 1000),
(5, 'Sneakers', 7500),
(6, 'Air Purifier', 2000),
(7, 'Lipstick', 3000),
(8, 'Bluetooth Speaker', 7500),
(9, 'Yoga Mat', 1500),
(10, 'Widget', 8000);


INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 10, 5, 1, '2024-01-01'),
(2, 9, 4, 2, '2024-02-01'),
(3, 8, 3, 3, '2024-03-01'),
(4, 7, 2, 4, '2024-04-01'),
(5, 6, 1, 5, '2024-05-01'),
(6, 5, 10, 6, '2024-06-01'),
(7, 4, 9, 7, '2024-07-01'),
(8, 3, 8, 8, '2024-08-01'),
(9, 2, 7, 9, '2024-09-01'),
(10, 1, 6, 10, '2024-10-01');


----Data Query Language Checkpoint

Question 1
Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget 
and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer. 
The cost of each item should be calculated by multiplying the quantity by the price of the product.

SELECT c.CustomerName, SUM(o.quantity * p.price) AS total_cost
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Products p ON o.Product_id = p.Product_id
WHERE p.ProductName IN ('widget', 'gadget')
GROUP BY c.CustomerName
HAVING COUNT(DISTINCT p.ProductName) = 2;


Question 2
Write a query to retrieve the names of the customers who have placed an order for at least one widget, 
along with the total cost of the widgets ordered by each customer.

SELECT c.CustomerName, SUM(o.quantity * p.price) AS total_cost
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Products p ON o.Product_id = p.Product_id
WHERE p.ProductName = 'widget'
GROUP BY c.CustomerName;


Question 3
Write a query to retrieve the names of the customers who have placed an order for at least one gadget, 
along with the total cost of the gadgets ordered by each customer

SELECT c.CustomerName, SUM(o.quantity * p.price) AS total_cost
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Products p ON o.Product_id = p.Product_id
WHERE p.Productname = 'gadget'
GROUP BY c.CustomerName;


Question 4
Write a query to retrieve the names of the customers who have placed an order for at least one sneakers, 
along with the total cost of the sneakers ordered by each customer.

SELECT c.CustomerName, SUM(o.quantity * p.price) AS total_cost
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Products p ON o.Product_id = p.Product_id
WHERE p.ProductName = 'Sneakers'
GROUP BY c.CustomerName;


Question 5
Write a query to retrieve the total number of widgets and gadgets ordered by each customer, 
along with the total cost of the orders.

SELECT c.CustomerName,
    SUM(CASE WHEN p.ProductName = 'widget' THEN o.quantity ELSE 0 END) AS total_widgets,
    SUM(CASE WHEN p.ProductName = 'gadget' THEN o.quantity ELSE 0 END) AS total_gadgets,
    SUM(o.quantity * p.price) AS total_cost
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Products p ON o.Product_id = p.Product_id
WHERE p.ProductName IN ('widget', 'gadget')
GROUP BY c.CustomerName;


Question 6
Write a query to retrieve the names of the products that have been ordered by at least one customer, 
along with the total quantity of each product ordered.

SELECT p.ProductName, SUM(o.quantity) AS total_quantity
FROM Products p
JOIN Orders o ON p.Product_id = o.Product_id
GROUP BY p.ProductName;


Question 7
Write a query to retrieve the names of the customers who have placed the most orders, 
along with the total number of orders placed by each customer.

SELECT c.CustomerName, COUNT(o.Order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.CustomerName
HAVING COUNT(o.Order_id) = (
SELECT MAX(total_orders)
FROM (SELECT COUNT(Order_id) AS total_orders
FROM Orders
GROUP BY Customer_id) AS subquery
);


Question 8
Write a query to retrieve the names of the products that have been ordered the most, 
along with the total quantity of each product ordered.

SELECT p.ProductName, SUM(o.quantity) AS total_quantity
FROM Products p
JOIN Orders o ON p.Product_id = o.Product_id
GROUP BY p.ProductName
ORDER BY total_quantity DESC;


Question 9
Write a query to retrieve the names of the customers who have placed an order on every day of the week, 
along with the total number of orders placed by each customer.

SELECT c.CustomerName, COUNT(o.Order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.CustomerName
HAVING COUNT(DISTINCT DATEPART(weekday, o.Order_date)) = 7;


