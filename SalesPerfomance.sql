CREATE DATABASE IF NOT EXISTS SalesPerfomance_DB;
USE SalesPerfomance_DB;
CREATE TABLE IF NOT EXISTS Employe(
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) ,
    HireDate DATE,
    Salary DECIMAL(10,2)
);
INSERT INTO Employe (FirstName, LastName, Department, HireDate, Salary) 
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
SELECT*FROM employe;

CREATE TABLE IF NOT EXISTS Custom(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(60) NOT NULL,
    City VARCHAR(50),
    Country VARCHAR(50)
);
INSERT INTO Custom (CustomerName, City, Country) VALUES
('Tech Solutions','Nairobi','Kenya'),
('Smart Traders','Mombasa','Kenya'),
('Elite Supplies','Kisumu','Kenya'),
('Global Ventures','Nakuru','Kenya'),
('Prime Retailers','Eldoret','Kenya'),
('Blue Sky Ltd','Thika','Kenya'),
('Urban Mart','Nairobi','Kenya'),
('Mega Stores','Mombasa','Kenya'),
('Quick Buy','Kisumu','Kenya'),
('Fresh Market','Nakuru','Kenya'),
('Green Grocers','Eldoret','Kenya'),
('City Hub','Nairobi','Kenya'),
('Fast Lane','Thika','Kenya'),
('Metro Supplies','Nairobi','Kenya'),
('Peak Traders','Kisumu','Kenya');
SELECT*FROM custom;

CREATE TABLE IF NOT EXISTS Orders(
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY(CustomerID) REFERENCES Custom(CustomerID),
    FOREIGN KEY(EmployeeID) REFERENCES Employe(EmployeeID)
);
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, Amount) VALUES
(1,1,'2023-01-10',15000),
(2,3,'2023-01-12',22000),
(3,2,'2023-02-05',18000),
(4,5,'2023-02-20',25000),
(5,4,'2023-03-01',30000),
(6,6,'2023-03-15',27000),
(7,7,'2023-04-10',32000),
(8,8,'2023-04-25',21000),
(9,9,'2023-05-05',19500),
(10,10,'2023-05-20',28000),
(11,11,'2023-06-01',35000),
(12,12,'2023-06-18',23000),
(13,13,'2023-07-02',26000),
(14,14,'2023-07-15',31000),
(15,15,'2023-08-01',40000),
(1,2,'2024-01-10',20000),
(2,4,'2024-01-18',27000),
(3,6,'2024-02-11',15000),
(4,8,'2024-02-25',34000),
(5,10,'2024-03-05',36000),
(6,12,'2024-03-20',29000),
(7,14,'2024-04-02',41000),
(8,1,'2024-04-18',22000),
(9,3,'2024-05-10',18000),
(10,5,'2024-05-25',26000),
(11,7,'2024-06-01',30000),
(12,9,'2024-06-15',28000),
(13,11,'2024-07-01',35000),
(14,13,'2024-07-20',39000),
(15,15,'2024-08-05',42000);
SELECT*FROM employe;
SELECT*FROM custom;
SELECT*FROM orders;

SELECT 
O.OrderID,
O.OrderDate,
O.Amount,
C.CustomerName,
C.City,
C.Country,
E.FirstName,
E.Department,
E.HireDate,
E.Salary
FROM ((orders O
JOIN employe E
ON E.EmployeeID=O.EmployeeID)
JOIN Custom C
ON C.CustomerID=O.CustomerID);

SELECT SUM(Amount) AS TotalRevenue 
FROM orders;

SELECT COUNT(*) AS TotalOrders 
FROM orders;

SELECT AVG(Amount) AS AverageOrderValue 
FROM orders;
--Total Revenue per Year
SELECT 
YEAR(OrderDate) AS Year,
SUM(Amount) AS RevenuePerYear
FROM orders
GROUP BY Year;
--Total Sales Made by each employee
SELECT 
E.FirstName,
SUM(O.Amount) AS TotalSales
FROM Orders O 
JOIN employe E 
ON E.EmployeeID=O.EmployeeID
GROUP BY E.FirstName;
--Total Sales Per City
SELECT 
C.City,
SUM(O.Amount) AS TotalSalesPerCity
FROM Orders O
JOIN custom C 
ON C.CustomerID=O.CustomerID
GROUP BY C.City;