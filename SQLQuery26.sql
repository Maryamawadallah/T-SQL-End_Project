--26. Create an index to optimize the query performance for retrieving order details based on order date.
CREATE INDEX idx_OrderDate
ON dbo.Orders (OrderDate);

