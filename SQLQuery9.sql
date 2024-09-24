--9. Find the total sales amount (Quantity * Unit Price) for each employee, grouped by employee.
SELECT E.EmployeeID,E.FirstName, E.LastName,SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM dbo.[Order Details] OD
INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
INNER JOIN dbo.Employees E ON O.EmployeeID = E.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName;