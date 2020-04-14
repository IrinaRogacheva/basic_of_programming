PROGRAM SumDigits(INPUT, OUTPUT);
VAR
  Digit, Sum: INTEGER;
PROCEDURE ReadDigit(VAR FileFrom: TEXT; VAR Digit: INTEGER);
{—читывает текущий символ из файла, если он - цифра, возвращает его 
преобразу€ в значение типа INTEGER. ≈сли считанный символ не цифра
возвращает -1}
VAR    
  Ch: CHAR;
BEGIN
  Digit := -1;
  IF NOT EOLN(FileFrom)
  THEN
    BEGIN
      READ(FileFrom, Ch);
      IF (Ch = '0') THEN Digit := 0 ELSE
      IF (Ch = '1') THEN Digit := 1 ELSE
      IF (Ch = '2') THEN Digit := 2 ELSE
      IF (Ch = '3') THEN Digit := 3 ELSE
      IF (Ch = '4') THEN Digit := 4 ELSE
      IF (Ch = '5') THEN Digit := 5 ELSE
      IF (Ch = '6') THEN Digit := 6 ELSE
      IF (Ch = '7') THEN Digit := 7 ELSE
      IF (Ch = '8') THEN Digit := 8 ELSE
      IF (Ch = '9') THEN Digit := 9 ELSE
      Digit := -1
    END  
END;  
BEGIN  
  Digit := 0;
  Sum := 0;
  WHILE Digit <> -1
  DO
    BEGIN     
      ReadDigit(INPUT, Digit);
      IF (Digit <> -1)
      THEN
        Sum := Sum + Digit;
    END; 
  IF Sum <> -1
  THEN
    WRITELN(Sum)      
END.          
