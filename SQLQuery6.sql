-- Step 1: Drop the existing foreign key constraint
ALTER TABLE dbo.[Order Details]
DROP CONSTRAINT FK_Order_Details_Orders;

-- Step 2: Add the foreign key constraint with ON DELETE CASCADE
-- This ensures that deleting a record in Orders will also delete related records in [Order Details]
ALTER TABLE dbo.[Order Details]
ADD CONSTRAINT FK_Order_Details_Orders
FOREIGN KEY (OrderID) REFERENCES dbo.Orders (OrderID) ON DELETE CASCADE;

-- Step 3: Delete orders placed before January 1, 1997
-- This will also delete related records in [Order Details] due to the ON DELETE CASCADE constraint
DELETE FROM dbo.Orders
WHERE OrderDate < '1997-01-01';