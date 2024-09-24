-- 5. Update the unit price of all products in the 'Beverages' category by 10%.
UPDATE dbo.Products
SET UnitPrice = UnitPrice * 1.10 --increasing it by 10%
WHERE CategoryID = (SELECT CategoryID FROM dbo.Categories 
WHERE CategoryName = 'Beverages');