CREATE DATABASE amazon_fresh;
USE amazon_fresh;

CREATE TABLE Customers (
    CustomerID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(20),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    SignupDate DATE,
    PrimeMember VARCHAR(10)
);
CREATE TABLE Suppliers (
    SupplierID VARCHAR(50) PRIMARY KEY,
    SupplierName VARCHAR(150),
    ContactPerson VARCHAR(100),
    Phone VARCHAR(30),
    City VARCHAR(100),
    State VARCHAR(100)
);
CREATE TABLE Products (
    ProductID VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(150),
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    PricePerUnit DECIMAL(10,2),
    StockQuantity INT,
    SupplierID VARCHAR(50),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
CREATE TABLE Orders (
    OrderID VARCHAR(50) PRIMARY KEY,
    CustomerID VARCHAR(50),
    OrderDate DATE,
    OrderAmount DECIMAL(10,2),
    DeliveryFee DECIMAL(10,2),
    DiscountApplied DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Order_Details (
    OrderID VARCHAR(50),
    ProductID VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Reviews (
    ReviewID VARCHAR(50) PRIMARY KEY,
    ProductID VARCHAR(50),
    CustomerID VARCHAR(50),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


SHOW KEYS FROM Customers WHERE Key_name = 'PRIMARY';
SHOW KEYS FROM Orders WHERE Key_name = 'PRIMARY';
SHOW KEYS FROM Products WHERE Key_name = 'PRIMARY';
SHOW KEYS FROM Suppliers WHERE Key_name = 'PRIMARY';
SHOW KEYS FROM Reviews WHERE Key_name = 'PRIMARY';
SHOW KEYS FROM Order_Details WHERE Key_name = 'PRIMARY';



SELECT DISTINCT City FROM Customers;
SELECT *
FROM Customers
WHERE City = 'YourCityName';

SELECT DISTINCT Category FROM Products;
SELECT *
FROM Products
WHERE Category = 'Fruits';


DROP TABLE Customers_New;
CREATE TABLE Customers_New (
    CustomerID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT NOT NULL CHECK (Age >= 18),
    Gender VARCHAR(20),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    SignupDate DATE,
    PrimeMember VARCHAR(10) DEFAULT 'No'
);
INSERT INTO Customers_New
SELECT * FROM Customers;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE Customers;

RENAME TABLE Customers_New TO Customers;

SET FOREIGN_KEY_CHECKS = 1;



SELECT SupplierID FROM Suppliers LIMIT 1;
SELECT SupplierID, SupplierName 
FROM Suppliers;
INSERT INTO Products 
(ProductID, ProductName, Category, SubCategory, PricePerUnit, StockQuantity, SupplierID)
VALUES
('NEWP001', 'Organic Mango', 'Fruits', 'Tropical Fruits', 150.00, 100, '0626d237-4eb0-497c-9085-32379516e66e'),

('NEWP002', 'Greek Yogurt', 'Dairy', 'Milk Products', 80.00, 200, '0626d237-4eb0-497c-9085-32379516e66e'),

('NEWP003', 'Herbal Tea', 'Beverages', 'Tea', 120.00, 150, '0626d237-4eb0-497c-9085-32379516e66e');
SELECT ProductID, ProductName, SupplierID
FROM Products
WHERE ProductID LIKE 'NEWP%';


UPDATE Products
SET StockQuantity = 500
WHERE ProductID = 'NEWP001';
SELECT ProductID, StockQuantity
FROM Products
WHERE ProductID = 'NEWP001';





SET SQL_SAFE_UPDATES = 0;
DELETE FROM Products
WHERE SupplierID = '0d3f07e6-1f78-42a5-bd75-222b54081020';

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM Products
WHERE SupplierID = '0d3f07e6-1f78-42a5-bd75-222b54081020';

DELETE FROM Suppliers
WHERE SupplierID = '0d3f07e6-1f78-42a5-bd75-222b54081020';

SET FOREIGN_KEY_CHECKS = 1;



SELECT *
FROM Reviews
WHERE Rating < 1 OR Rating > 5 OR Rating IS NULL;
ALTER TABLE Reviews
ADD CONSTRAINT chk_rating
CHECK (Rating BETWEEN 1 AND 5);
SHOW CREATE TABLE Reviews;
SHOW CREATE TABLE Customers;



SELECT 
    SUM(od.Quantity * p.PricePerUnit) AS Total_Revenue
FROM Order_Details od
JOIN Products p 
    ON od.ProductID = p.ProductID;
    
    SELECT 
    p.ProductName,
    SUM(od.Quantity * p.PricePerUnit) AS Revenue
FROM Order_Details od
JOIN Products p 
    ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

SELECT 
    p.Category,
    SUM(od.Quantity * p.PricePerUnit) AS Revenue
FROM Order_Details od
JOIN Products p 
    ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

SELECT 
    c.Name,
    SUM(od.Quantity * p.PricePerUnit) AS Total_Spent
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
JOIN Order_Details od 
    ON o.OrderID = od.OrderID
JOIN Products p 
    ON od.ProductID = p.ProductID
GROUP BY c.Name
ORDER BY Total_Spent DESC
LIMIT 5;

SELECT 
    AVG(OrderTotal) AS Avg_Order_Value
FROM (
    SELECT 
        o.OrderID,
        SUM(od.Quantity * p.PricePerUnit) AS OrderTotal
    FROM Orders o
    JOIN Order_Details od 
        ON o.OrderID = od.OrderID
    JOIN Products p 
        ON od.ProductID = p.ProductID
    GROUP BY o.OrderID
) AS OrderSummary;


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
SELECT DISTINCT Category FROM Products;
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Fruits'),
(2, 'Vegetables'),
(3, 'Dairy'),
(4, 'Beverages'),
(5, 'Snacks');
ALTER TABLE Products
ADD CategoryID INT;
UPDATE Products
SET CategoryID = 1
WHERE Category = 'Fruits';

UPDATE Products
SET CategoryID = 2
WHERE Category = 'Vegetables';

UPDATE Products
SET CategoryID = 3
WHERE Category = 'Dairy';

UPDATE Products
SET CategoryID = 4
WHERE Category = 'Beverages';

UPDATE Products
SET CategoryID = 5
WHERE Category = 'Snacks';

ALTER TABLE Products
DROP COLUMN Category;

SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;