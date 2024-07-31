CREATE DATABASE SUCCESS_SUPERMART;
GO
USE SUCCESS_SUPERMART;
GO
CREATE TABLE Customers (
Customer_id INT PRIMARY KEY,
CustomerName VARCHAR(255) NOT NULL,
Address VARCHAR(255) NOT NULL,
);

CREATE TABLE Products (
Product_id INT PRIMARY KEY,
productName VARCHAR(255) NOT NULL,
Price DECIMAL CHECK(Price > 0) NOT NULL
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
(1, 'Oshifeko Adeolu', '96,Olurunkemi Street'),
(2, 'Keir Stamer', '543 Robert St.'),
(3, 'Rishi Sunak', '321 Market St.'),
(4, 'Donald Trump', '34 Church St.'),
(5, 'Bola Tinubu', '256 Ladlak St.'),
(6, 'Peter Obi', '98 Almond St.'),
(7, 'Goodluck John', '765 University Rd.'),
(8, 'Babajide Sanwo-Olu', '984 Craig St.'),
(9, 'David Adeleke', '423 Bariga St.'),
(10,'Peter Cech', '10 Craig Street');


INSERT INTO Products (Product_id, ProductName, Price) VALUES
(1, 'Smartphone', 85000),
(2, 'Coffee-maker', 30000),
(3, 'Sunglasses', 5000),
(4, 'Backpack', 10000),
(5, 'Running Shoes', 7500),
(6, 'Air Purifier', 20000),
(7, 'Lipstick', 3000),
(8, 'Bluetooth Speaker', 75000),
(9, 'Yoga Mat', 15000),
(10, 'Kitchen Knife Set', 8000);


INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 10, 5, 10, '2024-01-01'),
(2, 9, 4, 20, '2024-02-01'),
(3, 8, 3, 30, '2024-03-01'),
(4, 7, 2, 40, '2024-04-01'),
(5, 6, 1, 50, '2024-05-01'),
(6, 5, 10, 60, '2024-06-01'),
(7, 4, 9, 70, '2024-07-01'),
(8, 3, 8, 80, '2024-08-01'),
(9, 2, 7, 90, '2024-09-01'),
(10, 1, 6, 100, '2024-10-01');

INSERT INTO Products VALUES
(11, 'Cookies', 1000),
(12, 'Candy', 5200);

INSERT INTO Customers VALUES
(11, 'Ahmed', 'Tunisia'),
(12, 'Coulibaly', 'Senegal'),
(13, 'Hassan', 'Egypt');

INSERT INTO Orders VALUES
(11, 2, 8, 3,  '2023-01-22'),
(12, 1, 3, 10, '2023-04-14')
;

UPDATE Customers
SET CustomerName = 'Gabriel', Address = 'Nigeria'
WHERE Customer_id = 1;

UPDATE Products
SET ProductName = 'Sneakers', Price = 10000
WHERE Product_id = 5;

DELETE FROM Customers WHERE CustomerName = 'Bola Tinubu';

