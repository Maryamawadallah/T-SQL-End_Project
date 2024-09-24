--18. Retrieve the details of the five most recent orders, including order date and customer details.
SELECT TOP 5 O.OrderID, O.OrderDate,C.CompanyName AS CustomerName
FROM dbo.Orders O
INNER JOIN dbo.Customers C ON O.CustomerID = C.CustomerID
ORDER BY O.OrderDate DESC;
