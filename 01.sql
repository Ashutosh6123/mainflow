-- create
CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  dept TEXT NOT NULL
);

-- Create new tables
CREATE TABLE IF NOT EXISTS Employees (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(40) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    DepartmentID INT,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Departments (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

-- Insert data into the tables
INSERT INTO Departments (Name)
VALUES ('Engineering'), ('Marketing'), ('Sales');

INSERT INTO Employees (Name, Position, Salary, DepartmentID)
VALUES ('John Doe', 'Software Engineer', 70000.00, 1),
       ('Jane Smith', 'Project Manager', 85000.00, 1),
       ('Mike Johnson', 'Database Administrator', 75000.00, 1),
       ('Emily Davis', 'Sales Representative', 65000.00, 3),
       ('Anna Williams', 'Marketing Specialist', 60000.00, 2);

-- Select data
SELECT * FROM Employees;

-- Update data
UPDATE Employees
SET Salary = 80000.00
WHERE Name = 'John Doe';

-- Delete data
DELETE FROM Employees
WHERE Name = 'Mike Johnson';

-- Join tables
SELECT Employees.Name, Employees.Position, Departments.Name AS Department
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.ID;

-- Group by
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;

-- Order by
SELECT * FROM Employees
ORDER BY Salary DESC;

-- Like (search)
SELECT * FROM Employees
WHERE Name LIKE 'J%';
