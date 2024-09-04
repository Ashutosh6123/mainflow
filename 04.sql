CREATE TABLE Customers (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15),
    DateOfBirth DATE,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Orders (
    OrderID INT NOT NULL AUTO_INCREMENT,
    OrderDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    CustomerID INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, DateOfBirth)
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '1990-05-15'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '1985-07-20'),
('Alice', 'Brown', 'alice.brown@example.com', '345-678-9012', '2000-12-30');
INSERT INTO Orders (OrderDate, CustomerID, TotalAmount)
VALUES 
('2024-09-01', 1, 150.75),
('2024-09-02', 2, 200.50),
('2024-09-03', 3, 300.00);
SELECT * FROM Customers;
SELECT * FROM Orders;
