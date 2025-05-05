-- Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Salary DECIMAL(10,2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert Sample Data into Department
INSERT INTO Department (DeptID, DeptName) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert Sample Data into Employee (20 Employees)
INSERT INTO Employee (EmpID, Name, Age, Salary, DeptID) VALUES
(101, 'Alice', 30, 60000.00, 1),
(102, 'Bob', 28, 75000.00, 3),
(103, 'Charlie', 35, 82000.00, 3),
(104, 'David', 40, 90000.00, 2),
(105, 'Eva', 25, 55000.00, 4),
(106, 'Frank', 33, 62000.00, 1),
(107, 'Grace', 27, 72000.00, 5),
(108, 'Helen', 29, 71000.00, 4),
(109, 'Ivy', 32, 87000.00, 2),
(110, 'Jack', 45, 98000.00, 3),
(111, 'Kevin', 26, 59000.00, 1),
(112, 'Lily', 31, 76000.00, 5),
(113, 'Mike', 38, 84000.00, 3),
(114, 'Nina', 34, 68000.00, 2),
(115, 'Oscar', 29, 62000.00, 4),
(116, 'Paul', 37, 91000.00, 3),
(117, 'Queen', 28, 64000.00, 5),
(118, 'Ryan', 30, 80000.00, 2),
(119, 'Sophia', 24, 56000.00, 1),
(120, 'Tom', 36, 95000.00, 3);

-- Query 1: Retrieve all employees
SELECT * FROM Employee;

-- Query 2: Employees in Engineering department
SELECT E.Name
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID
WHERE D.DeptName = 'Engineering';

-- Query 3: Average salary per department
SELECT D.DeptName, AVG(E.Salary) AS AverageSalary
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID
GROUP BY D.DeptName;

-- Query 4: Number of employees per department
SELECT D.DeptName, COUNT(E.EmpID) AS EmployeeCount
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID
GROUP BY D.DeptName;

-- Query 5: Employees with salary > 70000
SELECT * FROM Employee
WHERE Salary > 70000;

-- Query 6: List employees aged between 25 and 35
SELECT * FROM Employee
WHERE Age BETWEEN 25 AND 35;

-- Query 7: Highest paid employee in each department
SELECT D.DeptName, E.Name, MAX(E.Salary) AS MaxSalary
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID
GROUP BY D.DeptName;

-- Query 8: Total salary cost per department
SELECT D.DeptName, SUM(E.Salary) AS TotalSalaries
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID
GROUP BY D.DeptName;

-- Query 9: Employees sorted by salary (descending)
SELECT * FROM Employee
ORDER BY Salary DESC;

-- Query 10: Count employees older than 30
SELECT COUNT(*) AS OlderThan30
FROM Employee
WHERE Age > 30;
