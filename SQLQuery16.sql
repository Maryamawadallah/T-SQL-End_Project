-- Create a new table to store the monthly sales report
CREATE TABLE MonthlySalesReport (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    SalesYear INT NOT NULL,
    SalesMonth INT NOT NULL,
    TotalSales DECIMAL(18, 2) NOT NULL
);

-- Insert monthly sales data into the new table
INSERT INTO MonthlySalesReport (SalesYear, SalesMonth, TotalSales)
SELECT YEAR(O.OrderDate) AS SalesYear,MONTH(O.OrderDate) AS SalesMonth,SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
FROM dbo.Orders O
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY YEAR(O.OrderDate), MONTH(O.OrderDate);


SELECT *
FROM MonthlySalesReport;