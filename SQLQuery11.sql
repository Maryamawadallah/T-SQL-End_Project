--11. Create a Common Table Expression (CTE) that lists the top 5 products by sales amount.
WITH ProductSales AS (
    SELECT P.ProductID, P.ProductName,SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
    FROM dbo.Products P
    INNER JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
    GROUP BY P.ProductID, P.ProductName
)
SELECT TOP 5 ProductID, ProductName,TotalSales
FROM ProductSales
ORDER BY TotalSales DESC;
