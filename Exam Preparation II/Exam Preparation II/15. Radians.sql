CREATE FUNCTION udf_GetRadians (@Degree FLOAT)
RETURNS FLOAT
AS
BEGIN
	  DECLARE @Result FLOAT = (@Degree * PI()) / 180

	  RETURN @Result
END