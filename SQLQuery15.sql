-- 15. Write a stored procedure to retrieve the sales report for a given date range.
CREATE PROCEDURE GetSalesReport 
    @StartDate DATE, @EndDate DATE
AS
BEGIN
    SELECT O.OrderID,O.OrderDate,C.CompanyName AS Customer, E.FirstName,E.LastName,SUM(OD.Quantity * OD.UnitPrice) AS TotalSales
    FROM dbo.[Order Details] OD
    INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
    INNER JOIN dbo.Customers C ON O.CustomerID = C.CustomerID
    INNER JOIN dbo.Employees E ON O.EmployeeID = E.EmployeeID
    WHERE O.OrderDate BETWEEN @StartDate AND @EndDate
    GROUP BY O.OrderID, O.OrderDate, C.CompanyName, E.FirstName, E.LastName
    ORDER BY O.OrderDate;
END;
