CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    JoinDate DATE
);
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Customers (Name, Email, JoinDate)
VALUES 
('John Doe', 'johndoe@example.com', '2023-01-15'),
('Jane Smith', 'janesmith@example.com', '2023-02-10'),
('Michael Brown', 'michaelbrown@example.com', '2023-03-05'),
('Nancy Davis', 'nancydavis@example.com', '2023-04-20');
INSERT INTO Products (ProductName, Category, Price)
VALUES 
('Laptop', 'Electronics', 800.00),
('Smartphone', 'Electronics', 600.00),
('Jeans', 'Clothing', 50.00),
('Sneakers', 'Clothing', 75.00),
('Watch', 'Accessories', 150.00);
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2023-05-01 14:30:00', 850.00),
(2, '2023-05-03 10:00:00', 650.00),
(3, '2023-05-05 16:45:00', 125.00),
(4, '2023-05-10 11:20:00', 800.00);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(1, 1, 1, 800.00),
(1, 5, 1, 50.00),
(2, 2, 1, 600.00),
(2, 3, 1, 50.00),
(3, 4, 1, 75.00),
(4, 1, 1, 800.00);

DESCRIBE Customers;
DESCRIBE Products;
DESCRIBE Orders;
DESCRIBE OrderDetails;

SELECT * FROM Customers LIMIT 5;
SELECT * FROM Products LIMIT 5;
SELECT * FROM Orders LIMIT 5;
SELECT * FROM OrderDetails LIMIT 5;
SELECT COUNT(*) AS TotalOrders FROM Orders;
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;
SELECT P.ProductName, COUNT(OD.OrderDetailID) AS NumberOfOrders

FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY NumberOfOrders DESC
LIMIT 5;

SELECT P.ProductName, SUM(OD.Quantity) AS TotalQuantitySold
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 5;

SELECT HOUR(OrderDate) AS OrderHour, COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY OrderHour
ORDER BY NumberOfOrders DESC;

SELECT COUNT(*) AS TotalCustomers FROM Customers;
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
SELECT AVG(TotalAmount) AS AvgRevenuePerCustomer

FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;
SELECT P.Category, SUM(OD.Quantity) AS TotalQuantitySold
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.Category;
