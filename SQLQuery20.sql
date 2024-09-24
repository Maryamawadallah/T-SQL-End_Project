--20. Write a query to find the average time (in days) between orders for each customer.
WITH OrderIntervals AS (
    SELECT CustomerID,OrderDate,LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrderDate
    FROM dbo.Orders
)
SELECT CustomerID, AVG(DATEDIFF(DAY, OrderDate, NextOrderDate)) AS AvgDaysBetweenOrders
FROM OrderIntervals
WHERE NextOrderDate IS NOT NULL
GROUP BY CustomerID;
