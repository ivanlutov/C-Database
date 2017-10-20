    SELECT 
           ProductId,
	   CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
	   f.Description AS FeedbackDescription
      FROM Feedbacks AS f
INNER JOIN Customers AS c
        ON c.Id = f.CustomerId
     WHERE f.CustomerId IN (SELECT f.CustomerId 
                              FROM Customers AS c
                        INNER JOIN Feedbacks AS f
                                ON f.CustomerId = c.Id
                          GROUP BY f.CustomerId
                            HAVING COUNT(f.CustomerId) >= 3)
  ORDER BY f.ProductId, CustomerName, f.Id
