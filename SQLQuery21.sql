--21. Create a view that shows the total quantity of each product sold per year.
CREATE VIEW YearlyProductSales AS
SELECT  P.ProductID,P.ProductName,YEAR(O.OrderDate) AS SalesYear,  SUM(OD.Quantity) AS TotalQuantitySold
FROM dbo.[Order Details] OD
INNER JOIN dbo.Products P ON OD.ProductID = P.ProductID
INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
GROUP BY P.ProductID, P.ProductName, YEAR(O.OrderDate);

