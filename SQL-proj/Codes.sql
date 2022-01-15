Q1:

SELECT BillingCountry, SUM(il.Quantity * il.UnitPrice) Amount_spent_usd
FROM Invoice i
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
GROUP BY 1
ORDER BY 2 DESC;

-----------------------------------------------------

Q2:

SELECT c.CustomerId ,c.FirstName, c.LastName , sum(i.Total) Money_spent
FROM Invoice i
JOIN Customer c
ON c.CustomerId = i.CustomerId
GROUP BY 1
ORDER BY 4 DESC;

--------------------------------------------------------

Q3:

SELECT a.ArtistId, a.Name, SUM(il.Quantity * il.UnitPrice) Amount_of_money_earned
FROM Artist a
JOIN Album al
ON a.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN Genre g
ON g.GenreId = t.GenreId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
Group by 1
ORDER BY 3 DESC
LIMIT 10;

-------------------------------------------------------------

Q4:

SELECT g.name, COUNT(i.InvoiceId) Number_of_purchases
FROM Invoice i
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Genre g
ON g.GenreId = t.GenreId
GROUP BY 1
ORDER BY 2 DESC;
