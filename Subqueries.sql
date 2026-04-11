USE testDB;
CREATE TABLE IF NOT EXISTS Employees(
     EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) ,
    HireDate DATE,
    Salary DECIMAL(10,2)
);
INSERT INTO Employees (FirstName, LastName, Department, HireDate, Salary) 
VALUES
('John','Kamau','IT','2019-03-15',75000),
('Mary','Wanjiku','HR','2020-06-10',60000),
('David','Otieno','Finance','2018-01-20',82000),
('Alice','Akinyi','IT','2021-09-05',70000),
('Brian','Mutiso','Marketing','2017-11-11',65000),
('Cynthia','Naliaka','Finance','2016-02-18',90000),
('Kevin','Mwangi','IT','2022-04-01',72000),
('Faith','Chebet','HR','2019-07-23',58000),
('James','Kiptoo','Marketing','2015-12-30',67000),
('Lilian','Atieno','Finance','2021-05-14',75000),
('Peter','Njoroge','IT','2020-08-19',78000),
('Grace','Wairimu','HR','2018-03-25',62000),
('Samuel','Omondi','Marketing','2019-10-10',64000),
('Esther','Chepkemoi','Finance','2017-06-06',87000),
('Daniel','Musyoka','IT','2023-01-12',71000);
SELECT*FROM employees;

SELECT 
FirstName, Salary
FROM employees
WHERE Salary=(
    SELECT MAX(Salary) FROM Employees
);
USE testDB;
SELECT FirstName, Department,Salary 
FROM Employees
WHERE Salary>(
    SELECT AVG(Salary) FROM Employees
);
USE testDB;
SELECT FirstName, Department,Salary
FROM Employees
WHERE Salary<(
    SELECT MIN(Salary) FROM Employees
);

SELECT FirstName,Department,Salary
FROM Employees
WHERE Salary=(
    SELECT AVG(Salary) FROM Employees
);

CREATE VIEW high_paid_employee AS
SELECT FirstName,Salary
FROM Employees
WHERE Salary>50000;
SELECT*FROM high_paid_employee;

CREATE VIEW Top_Paid_Employee AS
SELECT FirstName,Salary
FROM Employees
WHERE Salary=(
    SELECT MAX(Salary) FROM Employees
);
SELECT*FROM Top_Paid_Employee;
USE testDB;
CREATE INDEX idx_salary
 ON Employees(Salary);