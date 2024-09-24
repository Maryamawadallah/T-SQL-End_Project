--27. Write a query to find the percentage increase in total sales for each category from the previous year.
WITH SalesData AS (
    SELECT C.CategoryName,YEAR(O.OrderDate) AS SalesYear,SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
    FROM dbo.[Order Details] OD
    INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
    INNER JOIN dbo.Products P ON OD.ProductID = P.ProductID
    INNER JOIN dbo.Categories C ON P.CategoryID = C.CategoryID
    GROUP BY C.CategoryName, YEAR(O.OrderDate)
),
YearlySales AS (
    SELECT CategoryName,SalesYear,TotalSales,LAG(TotalSales) OVER (PARTITION BY CategoryName ORDER BY SalesYear) AS PreviousYearSales
    FROM SalesData
)
SELECT  CategoryName,SalesYear,TotalSales, PreviousYearSales,
    CASE 
        WHEN PreviousYearSales IS NULL THEN NULL
        ELSE (TotalSales - PreviousYearSales) * 100.0 / PreviousYearSales
    END AS PercentageIncrease
FROM YearlySales
ORDER BY CategoryName, SalesYear;