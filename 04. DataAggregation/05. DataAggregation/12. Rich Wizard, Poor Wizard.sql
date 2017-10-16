SELECT SUM(WizzardDep.[Difference]) AS [Difference]
  FROM (SELECT 
          DepositAmount ,
          DepositAmount - LEAD(DepositAmount) OVER (ORDER BY Id) AS [Difference]
          FROM WizzardDeposits) AS WizzardDep