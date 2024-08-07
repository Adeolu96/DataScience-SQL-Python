Given Data for the Practice Qoestions.
-- Sample data for the Wine table
 -- Columns (numW, category, year_, degree)
    (1, 'Red', 2018, 13.5),
    (2, 'White', 2020, 11.8),
    (3, 'Rosé', 2019, 12.2);

-- Sample data for the Producer table
--  Columns (numP, first_name, last_name, region)
    (101, 'John', 'Smith', 'Bordeaux'),
    (102, 'Maria', 'Garcia', 'Sousse'),
    (103, 'Alex', 'Lee', 'Champagne');

-- Sample data for the Harvest table
-- Columns Harvest (numW, numP, quantity)
    (1, 101, 500),  
    (2, 102, 300),  
    (3, 103, 700);  

--Sample data for producer table
-- columns Producer (numP, first_name, last_name, region)

    (104, 'Emily', 'Johnson', 'Burgundy'),
    (105, 'Daniel', 'Martinez', 'Sousse'),
    (106, 'Sophia', 'Kim', 'Champagne'),
    (107, 'Oliver', 'Brown', 'Bordeaux'),
    (108, 'Emma', 'Nguyen', 'Alsace'),
    (109, 'Liam', 'Rodriguez', 'Sousse'),
	(110, 'Sophie', 'Brown', 'Bordeaux'),
    (111, 'William', 'Nguyen', 'Alsace'),
    (112, 'Emma', 'Rodriguez', 'Sousse'),
    (113, 'James', 'Kim', 'Champagne'),
    (114, 'Olivia', 'Martinez', 'Burgundy'),
    (115, 'Noah', 'Johnson', 'Bordeaux'),
    (116, 'Ava', 'Garcia', 'Sousse'),
    (117, 'Liam', 'Lee', 'Champagne'),
    (118, 'Isabella', 'Smith', 'Burgundy'),
    (119, 'Ethan', 'Jones', 'Alsace'),
    (120, 'Mia', 'Davis', 'Bordeaux');

--Sample data for wine table
-- Columns (numW, category, year_, degree)
    (4, 'Red', 2017, 14.0),
    (5, 'White', 2019, 10.5),
    (6, 'Rosé', 2021, 11.7),
    (7, 'Red', 2022, 13.3),
    (8, 'White', 2023, 11.0),
    (9, 'Rosé', 2022, 12.5),
	(10, 'Red', 2023, 13.2),
    (11, 'White', 2022, 11.5),
    (12, 'Rosé', 2021, 12.8),
    (13, 'Red', 2020, 14.3),
    (14, 'White', 2019, 10.7),
    (15, 'Rosé', 2022, 11.9),
    (16, 'Red', 2018, 13.6),
    (17, 'White', 2021, 11.2),
    (18, 'Rosé', 2020, 12.1),
    (19, 'Red', 2019, 14.5),
    (20, 'White', 2023, 10.9);

--Sample data for harvest table
-- columns Harvest (numW, numP, quantity)
    (4, 104, 600),   
    (5, 105, 400),  
    (6, 106, 550),   
    (7, 107, 480),  
    (8, 108, 620),  
    (9, 109, 520),
    (10, 110, 550),  
    (11, 111, 420),  
    (12, 112, 680), 
    (13, 113, 590),  
    (14, 114, 380),  
    (15, 115, 520),  
    (16, 116, 610),  
    (17, 117, 450), 
    (18, 118, 700),  
    (19, 119, 560),  
    (20, 120, 400);  



Question 1
Convert the given entity-relationship diagram into a relational model.
Tables and Columns
Wine Table
numW (Primary Key)
category
year_
degree

Producer Table
numP (Primary Key)
first_name
last_name
region

Harvest Table
numW (Foreign Key referencing Wine.numW)
numP (Foreign Key referencing Producer.numP)
quantity



Question 2
Implement the relational model using SQL
-- Create Wine table
CREATE TABLE Wine (
    numW INT PRIMARY KEY,
    category VARCHAR(50),
    year_ INT,
    degree DECIMAL(3,1)
);

-- Create Producer table
CREATE TABLE Producer (
    numP INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    region VARCHAR(50)
);

-- Create Harvest table
CREATE TABLE Harvest (
    numW INT,
    numP INT,
    quantity INT,
    PRIMARY KEY (numW, numP),
    FOREIGN KEY (numW) REFERENCES Wine(numW),
    FOREIGN KEY (numP) REFERENCES Producer(numP)
);



Question 3
Insert data into the database tables

INSERT INTO Wine (numW, category, year_, degree) VALUES
(1, 'Red', 2018, 13.5),
(2, 'White', 2020, 11.8),
(3, 'Rosé', 2019, 12.2),
(4, 'Red', 2017, 14.0),
(5, 'White', 2019, 10.5),
(6, 'Rosé', 2021, 11.7),
(7, 'Red', 2022, 13.3),
(8, 'White', 2023, 11.0),
(9, 'Rosé', 2022, 12.5),
(10, 'Red', 2023, 13.2),
(11, 'White', 2022, 11.5),
(12, 'Rosé', 2021, 12.8),
(13, 'Red', 2020, 14.3),
(14, 'White', 2019, 10.7),
(15, 'Rosé', 2022, 11.9),
(16, 'Red', 2018, 13.6),
(17, 'White', 2021, 11.2),
(18, 'Rosé', 2020, 12.1),
(19, 'Red', 2019, 14.5),
(20, 'White', 2023, 10.9);

INSERT INTO Producer (numP, first_name, last_name, region) VALUES
(101, 'John', 'Smith', 'Bordeaux'),
(102, 'Maria', 'Garcia', 'Sousse'),
(103, 'Alex', 'Lee', 'Champagne'),
(104, 'Emily', 'Johnson', 'Burgundy'),
(105, 'Daniel', 'Martinez', 'Sousse'),
(106, 'Sophia', 'Kim', 'Champagne'),
(107, 'Oliver', 'Brown', 'Bordeaux'),
(108, 'Emma', 'Nguyen', 'Alsace'),
(109, 'Liam', 'Rodriguez', 'Sousse'),
(110, 'Sophie', 'Brown', 'Bordeaux'),
(111, 'William', 'Nguyen', 'Alsace'),
(112, 'Emma', 'Rodriguez', 'Sousse'),
(113, 'James', 'Kim', 'Champagne'),
(114, 'Olivia', 'Martinez', 'Burgundy'),
(115, 'Noah', 'Johnson', 'Bordeaux'),
(116, 'Ava', 'Garcia', 'Sousse'),
(117, 'Liam', 'Lee', 'Champagne'),
(118, 'Isabella', 'Smith', 'Burgundy'),
(119, 'Ethan', 'Jones', 'Alsace'),
(120, 'Mia', 'Davis', 'Bordeaux');

INSERT INTO Harvest (numW, numP, quantity) VALUES
(1, 101, 500),
(2, 102, 300),
(3, 103, 700),
(4, 104, 600),
(5, 105, 400),
(6, 106, 550),
(7, 107, 480),
(8, 108, 620),
(9, 109, 520),
(10, 110, 550),
(11, 111, 420),
(12, 112, 680),
(13, 113, 590),
(14, 114, 380),
(15, 115, 520),
(16, 116, 610),
(17, 117, 450),
(18, 118, 700),
(19, 119, 560),
(20, 120, 400);

Question 4
Give the list the producers.

SELECT *
FROM Producer;


Question 5
Give the list of producers sorted by name.

SELECT * 
FROM Producer
Order by first_name;

SELECT * 
FROM Producer
Order by first_name DESC;


Question 6
Give the list the producers of Sousse

SELECT Nump, First_name, Last_name
FROM Producer
WHERE Region = 'Sousse';


Question 7
Calculate the total quantity of wine produced having the number 12.

SELECT Sum(quantity)
FROM Harvest
WHERE NumW = 12;


Question 8
Calculate the quantity of wine produced by category.

SELECT numP AS category, SUM(quantity) AS total_quantity
FROM Harvest
GROUP BY numP;


Question 9
Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? 
We want the names and first names of the producers, sorted in alphabetical order.

SELECT p.first_name, p.last_name
FROM Producer p
JOIN Harvest h ON p.numP = h.numP
WHERE p.region = 'Sousse' AND h.quantity > 300
GROUP BY p.numP, p.first_name, p.last_name
ORDER BY p.last_name, p.first_name;


Question 10
List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24

SELECT w.numW
FROM Wine w
JOIN Harvest h ON w.numW = h.numW
WHERE w.degree > 12 AND h.numP = 24;


