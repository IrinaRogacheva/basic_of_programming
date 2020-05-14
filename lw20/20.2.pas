PROGRAM XPrint(INPUT, OUTPUT); 
CONST
  Min = 1;
  Max = 25;
  First = 'A';
  Last = 'Z'; 
TYPE
  Letters = First..Last;   
VAR
  Ch: CHAR;
  Letter: Letters; 
  UserSet: SET OF Letters;
  Symbole: SET OF Min..Max;
  I, Digit: INTEGER;
  MatrixesFile: TEXT;
BEGIN
  UserSet := [];  
  ASSIGN(MatrixesFile, 'MATRIXES.TXT'); 
  RESET(MatrixesFile);
  WRITE('¬ведите английские заглавные буквы: ');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch); 
      UserSet := UserSet + [Ch];
    END;  
  FOR Letter := First TO Last
  DO
    BEGIN
      Symbole := [];
      IF Letter IN UserSet
      THEN
        BEGIN   
          WHILE NOT EOLN(MatrixesFile)
          DO
            BEGIN
              READ(MatrixesFile, Digit);          
              Symbole := Symbole + [Digit]
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
            END;
          WRITELN    
        END;  
      READLN(MatrixesFile)           
    END    
END.  
