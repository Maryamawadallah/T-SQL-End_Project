--3. List the total number of orders for each customer, sorted by the number of orders in descending order. Include only customers with more than 10 orders.
SELECT C.CustomerID,C.CompanyName,COUNT(O.OrderID) AS OrderCount
FROM dbo.Orders O
INNER JOIN dbo.Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CompanyName
HAVING COUNT(O.OrderID) > 10
ORDER BY OrderCount DESC;
