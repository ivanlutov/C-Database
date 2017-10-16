 SELECT RT.DepartmentID, RT.Salary AS ThirdHighestSalary 
   FROM
          (SELECT DepartmentID,
                MAX(Salary) AS Salary,
       	     DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY MAX(Salary) DESC) AS [Rank] 
           FROM Employees
       GROUP BY DepartmentID, Salary) AS RT
  WHERE RT.[Rank] = 3