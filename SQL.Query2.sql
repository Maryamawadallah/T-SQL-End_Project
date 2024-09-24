-- Task 2 
SELECT O.OrderID , O.OrderDate , C.CustomerID , E.EmployeeID ,C.CompanyName ,C.ContactName AS CustomerName,E.FirstName +' ' + E.LastName AS EmployeeName 
FROM dbo.Orders O 
INNER JOIN dbo.Customers C
ON C.CustomerID = O.CustomerID
inner join dbo.Employees E
on E.EmployeeID = O.EmployeeID