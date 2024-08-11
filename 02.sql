-- Create a table named Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10, 2)
);

-- Insert some data into the Employees table
INSERT INTO Employees (EmployeeID, Name, Salary) VALUES (1, 'Alice', 50000.00);
INSERT INTO Employees (EmployeeID, Name, Salary) VALUES (2, 'Bob', 60000.00);
INSERT INTO Employees (EmployeeID, Name, Salary) VALUES (3, 'Charlie', 55000.00);
INSERT INTO Employees (EmployeeID, Name, Salary) VALUES (4, 'David', 70000.00);
INSERT INTO Employees (EmployeeID, Name, Salary) VALUES (5, 'Eve', 65000.00);

-- Select maximum salary
SELECT MAX(Salary) AS MaxSalary
FROM Employees;

-- Select minimum salary
SELECT MIN(Salary) AS MinSalary
FROM Employees;

-- Select average salary
SELECT AVG(Salary) AS AvgSalary
FROM Employees;

-- Count the number of employees
SELECT COUNT(*) AS EmployeeCount
FROM Employees;