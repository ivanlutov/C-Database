    SELECT TOP 1 WITH TIES
           c.Name AS CountryName, 
           AVG(f.Rate) AS FeedbackRate
      FROM Countries AS c
INNER JOIN Customers AS cu
        ON cu.CountryId = c.Id
INNER JOIN Feedbacks AS f
        ON f.CustomerId = cu.Id
  GROUP BY c.Name
  ORDER BY AVG(f.Rate) DESC