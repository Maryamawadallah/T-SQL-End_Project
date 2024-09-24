--24. Create a function that returns the total sales amount for a given product.
CREATE FUNCTION GetTotalSalesAmount(@ProductID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalSales DECIMAL(18, 2);

    SELECT 
        @TotalSales = SUM(OD.Quantity * OD.UnitPrice)
    FROM dbo.[Order Details] OD
    WHERE OD.ProductID = @ProductID;

    RETURN @TotalSales;
END;
