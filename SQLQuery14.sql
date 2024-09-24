-- 14. Create a pivot table that shows the total sales amount for each category per year.
SELECT *
FROM (
    SELECT C.CategoryName, YEAR(O.OrderDate) AS OrderYear, SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
    FROM dbo.[Order Details] OD
    INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
    INNER JOIN dbo.Products P ON OD.ProductID = P.ProductID
    INNER JOIN dbo.Categories C ON P.CategoryID = C.CategoryID
    GROUP BY C.CategoryName, YEAR(O.OrderDate)
) AS SourceTable
PIVOT (
    SUM(TotalSales)
    FOR OrderYear IN ([1996], [1997], [1998])
) AS PivotTable;