--4. Create a new table to store customer reviews with appropriate data types. 
CREATE TABLE CustomerReviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID NVARCHAR(5) NOT NULL,
    ReviewDate DATETIME NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5)
);

--check the table 
SELECT *
FROM CustomerReviews;
--Insert sample data into this table.
INSERT INTO CustomerReviews (CustomerID, ReviewDate, Rating)
VALUES 
('ALFKI', '2024-01-01', 5),
('ANATR', '2024-01-02', 4),
('ANTON', '2024-01-03', 2),
('AROUT', '2024-01-04', 3),
('BERGS', '2024-01-05', 5),
('BLONP', '2024-01-06', 1);


SELECT *
FROM CustomerReviews;