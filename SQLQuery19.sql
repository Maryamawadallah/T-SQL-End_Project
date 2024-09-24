--19. Write a query to find all customers who have placed more than five orders in the last year.
SELECT C.CustomerID, C.CompanyName,COUNT(O.OrderID) AS OrderCount
FROM dbo.Orders O
INNER JOIN dbo.Customers C ON O.CustomerID = C.CustomerID
WHERE O.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY C.CustomerID, C.CompanyName
HAVING COUNT(O.OrderID) > 5;

