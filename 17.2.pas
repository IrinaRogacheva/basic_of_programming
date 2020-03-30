PROGRAM ReadN(INPUT, OUTPUT);
VAR
  N: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{—читывает текущий символ из файла, если он - цифра, возвращает его 
преобразу€ в значение типа INTEGER. ≈сли считанный символ не цифра
возвращает -1}
VAR    
  Ch: CHAR;
  TempFile: TEXT;
BEGIN
  D := -1;
  REWRITE(TempFile);
  IF NOT EOLN(F)
  THEN
  BEGIN
    READ(F, Ch);
    IF (Ch >= '0') AND (Ch <= '9') 
    THEN
      BEGIN
        WRITELN(TempFile, Ch);
        RESET(TempFile);
        READ(TempFile, D);
      END 
  END;
END;  
  
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  D: INTEGER;
BEGIN
  N := 0;  
  ReadDigit(F, D);
  WHILE (D <> -1) AND (N <> -1)
  DO
    BEGIN   
      IF ((MAXINT DIV 10) > N) OR (((MAXINT DIV 10) = N) AND ((MAXINT MOD 10) >= D))
      THEN
        BEGIN
          N := N*10 + D;
          ReadDigit(F, D)
        END  
      ELSE
        N := -1 
    END;    
  END;
BEGIN
  ReadNumber(INPUT, N);
  WRITELN(N) 
END.       
