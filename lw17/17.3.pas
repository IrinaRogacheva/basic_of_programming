PROGRAM Stat(INPUT, OUTPUT);
VAR
  N1, N2, Min, Max, Sum, Q, Average, FractPart: INTEGER;
  Overflow: BOOLEAN;
PROCEDURE ReadDigit(VAR FileFrom: TEXT; VAR Digit: INTEGER);
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
    END  
END;  
  
PROCEDURE ReadNumber(VAR FileFrom: TEXT; VAR Number: INTEGER);
VAR
  Digit: INTEGER;
BEGIN
  Number := 0;  
  ReadDigit(FileFrom, Digit);
  WHILE (Digit <> -1) AND (Number <> -1)
  DO
    BEGIN   
      IF ((MAXINT DIV 10) > Number) OR (((MAXINT DIV 10) = Number) AND ((MAXINT MOD 10) >= Digit))
      THEN
        BEGIN
          Number := Number*10 + Digit;
          ReadDigit(FileFrom, Digit)
        END  
      ELSE
        Number := -1 
    END;    
END;   
BEGIN  
  ReadNumber(INPUT, N1);
  IF N1 <> -1
  THEN
    BEGIN  
      Sum := N1;
      Q := 1;
      Min := N1;
      Max := N1;
      ReadNumber(INPUT, N2);
      IF (MAXINT >= N1 + N2) AND (N2 <> -1) 
      THEN
        BEGIN
          Sum := Sum + N2;
          Q := Q + 1;
          IF N1 < N2
          THEN
            BEGIN
              Min := N1;
              Max := N2
            END  
          ELSE
            BEGIN
              Min := N2;
              Max := N1
            END; 
          Overflow := FALSE;          
          WHILE NOT EOLN(INPUT) AND (NOT Overflow)
          DO
            BEGIN
              ReadNumber(INPUT, N1);
              IF (Sum + N1 <= MAXINT) AND (N1 <> -1)
              THEN
                BEGIN
                  Q := Q + 1;   
                  Sum := Sum + N1;
                  IF N1 < Min
                  THEN
                    Min := N1;
                  IF N1 > Max
                  THEN
                    Max := N1;
                END
              ELSE
                Overflow := TRUE  
            END
        END
    END;            
  Average := Sum DIV Q;
  FractPart := (Sum MOD Q) * 100 DIV Q;
  WRITELN('Min is ', Min);
  WRITELN('Max is ', Max);
  WRITELN('Average is ', Average, '.', FractPart);
END.       
              
