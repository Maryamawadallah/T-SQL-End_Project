--8. Format the order date to 'DD-MM-YYYY' format for all orders.
SELECT OrderID,CONVERT(VARCHAR, OrderDate, 103) AS FormattedOrderDate
FROM dbo.Orders;