CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    Gender ENUM('Male', 'Female'),
    DateOfBirth DATE
);
INSERT INTO Employees (Name, DepartmentID, Salary, Gender, DateOfBirth)
VALUES 
('John Doe', 1, 12000.00, 'Male', '1970-02-15'),
('Jane Smith', 2, 9500.00, 'Female', '1980-07-22'),
('Mary Johnson', 1, 8500.00, 'Female', '1965-03-10'),
('Michael Brown', 3, 15000.00, 'Male', '1975-11-30'),
('Nancy Davis', 2, 10000.00, 'Female', '1969-05-25'),
('Joe Wilson', 3, 20000.00, 'Male', '1990-10-01'),
('Megan Miller', 1, 11000.00, 'Female', '1988-04-14'),
('George Lee', 2, 10500.00, 'Male', '1962-09-05'),
('Joe White', 3, 13000.00, 'Male', '1985-06-17'),
('Martha Green', 1, 9500.00, 'Female', '1960-12-12');

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

SELECT DepartmentID, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY DepartmentID;

SELECT CURDATE() AS CurrentDate;
SELECT CASE 
    WHEN STR_TO_DATE('2024-09-04', '%Y-%m-%d') IS NOT NULL THEN 'Valid Date'
    ELSE 'Invalid Date'
END AS DateCheck;

SELECT DISTINCT Name
FROM Employees
WHERE DateOfBirth BETWEEN '1960-01-01' AND '1975-12-31';

SELECT Gender, COUNT(*) AS NumberOfEmployees
FROM Employees
WHERE DateOfBirth BETWEEN '1960-01-01' AND '1975-12-31'
GROUP BY Gender;

SELECT Name, Salary
FROM Employees
WHERE Salary >= 10000;

SELECT Name
FROM Employees
WHERE Name LIKE 'M%';

SELECT *
FROM Employees
WHERE LOWER(Name) LIKE '%joe%';

SELECT Name, YEAR(DateOfBirth) AS BirthYear
FROM Employees;
