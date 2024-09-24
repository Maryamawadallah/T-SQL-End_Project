--22. Write a query to find the employees who have handled orders totaling more than $100,000 in sales.
SELECT E.EmployeeID, E.FirstName, E.LastName, SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM dbo.[Order Details] OD
INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
INNER JOIN dbo.Employees E ON O.EmployeeID = E.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
HAVING SUM(OD.Quantity * OD.UnitPrice) > 100000;

