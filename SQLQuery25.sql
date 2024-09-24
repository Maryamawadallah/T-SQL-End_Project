--25. Write a query to find all orders where the total order amount exceeds the average order amount.
WITH OrderTotals AS (
    SELECT OrderID, SUM(Quantity * UnitPrice) AS TotalAmount
    FROM dbo.[Order Details]
    GROUP BY OrderID
),
AverageOrderAmount AS (
    SELECT AVG(TotalAmount) AS AvgAmount
    FROM OrderTotals
)
SELECT  OT.OrderID, OT.TotalAmount
FROM OrderTotals OT
CROSS JOIN AverageOrderAmount AOA
WHERE OT.TotalAmount > AOA.AvgAmount;


