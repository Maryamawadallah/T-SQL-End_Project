-- 10. List products that have never been ordered.
SELECT P.ProductID, P.ProductName
FROM dbo.Products P
LEFT JOIN dbo.[Order Details] OD ON P.ProductID = OD.ProductID
WHERE OD.ProductID IS NULL;

