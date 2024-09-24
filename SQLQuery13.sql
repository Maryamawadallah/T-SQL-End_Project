--13. List the top 3 employees with the highest total sales.
SELECT TOP 3 E.EmployeeID, E.FirstName, E.LastName, SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM dbo.[Order Details] OD
INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
INNER JOIN dbo.Employees E ON O.EmployeeID = E.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY TotalSales DESC;


