    SELECT 
	       f.ProductId,
		   f.Rate, 
		   f.Description, 
		   c.Id AS CustomerId, 
		   c.Age, 
		   c.Gender 
      FROM Feedbacks AS f
INNER JOIN Customers AS c
        ON f.CustomerId = c.Id
     WHERE f.Rate < 5
  ORDER BY f.ProductId DESC, f.Rate