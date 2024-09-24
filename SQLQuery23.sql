--23. Write a query to find the top three products with the highest total sales amount each month.
WITH MonthlySales AS (
    SELECT  P.ProductID,P.ProductName,MONTH(O.OrderDate) AS OrderMonth,YEAR(O.OrderDate) AS OrderYear,SUM(OD.Quantity * OD.UnitPrice) AS TotalSales,
 ROW_NUMBER() OVER (PARTITION BY YEAR(O.OrderDate), MONTH(O.OrderDate) ORDER BY SUM(OD.Quantity * OD.UnitPrice) DESC) AS SalesRank
    FROM dbo.[Order Details] OD
    INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
    INNER JOIN dbo.Products P ON OD.ProductID = P.ProductID
    GROUP BY P.ProductID, P.ProductName, YEAR(O.OrderDate), MONTH(O.OrderDate)
)
SELECT  ProductID,ProductName, OrderMonth, OrderYear, TotalSales
FROM MonthlySales
WHERE SalesRank <= 3
ORDER BY OrderYear, OrderMonth, TotalSales DESC;