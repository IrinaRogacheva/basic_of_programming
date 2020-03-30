PROGRAM SumDigits(INPUT, OUTPUT);
VAR
  D, Sum: INTEGER;
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
BEGIN  
  ReadDigit(INPUT, D);
  Sum := D;
  WHILE (NOT EOLN) AND (D <> -1)
  DO
    BEGIN     
      ReadDigit(INPUT, D);
      IF (D <> -1)
      THEN
        Sum := Sum + D;
    END; 
  IF Sum <> -1
  THEN
    WRITELN(Sum)      
END.          
