   SELECT PeakName, RiverName, 
          CONCAT(LOWER(PeakName), LOWER(SUBSTRING(RiverName,2,LEN(RiverName)))) AS Mix
     FROM Peaks, Rivers
    WHERE SUBSTRING(PeakName,(LEN(PeakName)), 1) = SUBSTRING(RiverName,1,1)
 ORDER BY Mix