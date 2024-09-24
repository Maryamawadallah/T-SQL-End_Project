-- 1.Retrieve the list of all products with their respective categories and suppliers.
SELECT productid , productname , S.Companyname , C.Categoryname
FROM dbo.Products AS P JOIN  dbo.Suppliers AS S 
ON P.Supplierid = S.Supplierid
JOIN  dbo.Categories AS C
ON  P.Categoryid = C.Categoryid