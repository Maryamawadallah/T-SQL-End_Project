-- 7. Calculate the average unit price of products in each category.
SELECT  C.CategoryName,AVG(P.UnitPrice) AS AveragePrice
FROM dbo.Products P
INNER JOIN dbo.Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

