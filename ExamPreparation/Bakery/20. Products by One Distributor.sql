    SELECT p.Name AS ProductName,
           AVG(f.Rate) AS ProductAverageRate,
           d.Name AS DistributorName,
           c.Name AS DistributorCountry
      FROM Products AS p
INNER JOIN ProductsIngredients AS pri
        ON pri.ProductId = p.Id
INNER JOIN Ingredients AS i
        ON i.Id = pri.IngredientId
INNER JOIN Distributors AS d
        ON d.Id = i.DistributorId
INNER JOIN Feedbacks AS f
        ON f.ProductId = p.Id
INNER JOIN Countries AS c
        ON c.Id = d.CountryId
  GROUP BY p.Name, d.Name, c.Name, p.Id
    HAVING p.Name IN 
                    (SELECT a.ProductName 
					   FROM 
                        (SELECT p.Name AS ProductName,
                                AVG(f.Rate) AS ProductAverageRate,
                                d.Name AS DistributorName,
                                c.Name AS DistributorCountry
                           FROM Products AS p
                     INNER JOIN ProductsIngredients AS pri
                             ON pri.ProductId = p.Id
                     INNER JOIN Ingredients AS i
                             ON i.Id = pri.IngredientId
                     INNER JOIN Distributors AS d
                             ON d.Id = i.DistributorId
                     INNER JOIN Feedbacks AS f
                             ON f.ProductId = p.Id
                     INNER JOIN Countries AS c
                             ON c.Id = d.CountryId
                       GROUP BY p.Name, d.Name, c.Name, p.Id) AS a
                       GROUP BY a.ProductName
                         HAVING COUNT(a.ProductName) = 1)
ORDER BY p.Id