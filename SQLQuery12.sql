-- 12. Combine the list of customers and suppliers into a single list of companies.
SELECT ContactName,Address, CompanyName
FROM dbo.Customers
UNION
SELECT ContactName,Address,CompanyName
FROM dbo.Suppliers;