PROGRAM XPrint(INPUT, OUTPUT);  
VAR
  Ch: CHAR;

PROCEDURE PrintSymbole(VAR Ch: CHAR);
CONST
  Min = 1;
  Max = 25;
VAR
  Symbole: SET OF Min..Max;
  I: INTEGER;
BEGIN
  Symbole := [];  
  CASE Ch OF
    'A': Symbole := [3, 7, 9, 12, 13, 14, 16, 20, 21, 25]; 
    'B': Symbole := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];
    'C': Symbole := [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
    'D': Symbole := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': Symbole := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 16, 21, 22, 23, 24, 25];
    'F': Symbole := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 16, 21];
    'G': Symbole := [1, 2, 3, 4, 5, 6, 11, 14, 15, 16, 20, 21, 22, 23, 24, 25];
    'H': Symbole := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': Symbole := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22, 23, 24, 25];
    'J': Symbole := [1, 2, 3, 4, 5, 8, 13, 16, 18, 21, 22, 23];
    'K': Symbole := [1, 5, 6, 9, 11, 12, 16, 19, 21, 25];
    'L': Symbole := [1, 6, 11, 16, 21, 22, 23, 24, 25];   
    'M': Symbole := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': Symbole := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': Symbole := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
    'P': Symbole := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 21];
    'Q': Symbole := [2, 3, 4, 6, 10, 11, 15, 17, 18, 19, 24, 25];
    'R': Symbole := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 16, 19, 21, 25];
    'S': Symbole := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
    'T': Symbole := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': Symbole := [1, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
    'V': Symbole := [1, 5, 6, 10, 11, 15, 17, 19, 23];
    'W': Symbole := [1, 5, 6, 10, 11, 13, 15, 16, 17, 19, 20, 21, 25];
    'X': Symbole := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': Symbole := [1, 5, 7, 9, 13, 18, 23];
    'Z': Symbole := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
  END;
  FOR I := Min TO Max
  DO
    BEGIN
      IF I IN Symbole  
      THEN
        BEGIN 
          IF I MOD 5 = 0
          THEN
            WRITELN('X')
          ELSE
            WRITE('X')
        END    
      ELSE
        BEGIN 
          IF I MOD 5 = 0
          THEN
            WRITELN(' ')
          ELSE
            WRITE(' ')
        END 
    END             
END;

BEGIN
  WRITE('������� ����� ���������� ��������� �����: ');
  READ(Ch);
  PrintSymbole(Ch)
END.  