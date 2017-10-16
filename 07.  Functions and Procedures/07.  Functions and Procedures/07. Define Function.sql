CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
    RETURNS BIT
             AS
          BEGIN
					DECLARE @LengthOfWord INT = LEN(@word)
					DECLARE @Counter INT = 1
					
					  WHILE(@Counter <= @LengthOfWord)
					  BEGIN
						DECLARE @CurrentChar CHAR(1) = SUBSTRING(@word, @Counter, 1)
					
						        IF (CHARINDEX(@CurrentChar, @setOfLetters) <= 0)
						     BEGIN
						   	         RETURN 0
						       END
					     SET @Counter += 1 
					     END

					  RETURN 1
            END
