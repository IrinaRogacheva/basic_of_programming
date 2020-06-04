PROGRAM XPrint(INPUT, OUTPUT); 
CONST
  Min = 1;
  Max = 25;
  First = 'A';
  Last = 'Z';
  MaxLength = 10;
  NumberOfXColumns = 5; 
TYPE
  Letters = First..Last;
  MatrixSet = SET OF Min .. Max;
  LettersArray = ARRAY [1 .. MaxLength] OF Letters;
  MatrixesArray = ARRAY ['A' .. 'Z'] OF MatrixSet;   
VAR
  UserSet: SET OF Letters;
  Length: 1 .. MaxLength;
  MatrixesFile: TEXT;
  EnteredSymbols: LettersArray;
  Matrixes: MatrixesArray;
  
FUNCTION EnteredString: LettersArray;
VAR
  UserString: LettersArray;
  I: INTEGER;
  Ch: CHAR;
BEGIN
  UserSet := []; 
  I := 1;
  WHILE NOT EOLN AND (Length <= 10)
  DO
    BEGIN
      READ(Ch);
      UserString[I] := Ch;
      UserSet := UserSet + [Ch];
      Length := I;
      I := I + 1       
    END;
  EnteredString := UserString; 
END;     
  
FUNCTION MatrixesFromFile(VAR MatrixesFile: TEXT; EnteredString: LettersArray): MatrixesArray;
VAR
  Letter: Letters; 
  Matrix: MatrixSet;
  Digit: INTEGER;
  Matrixes: MatrixesArray;
BEGIN   
  RESET(MatrixesFile);   
  FOR Letter := First TO Last
  DO
    BEGIN
      IF Letter IN UserSet
      THEN
        BEGIN 
          Matrix := []; 
          WHILE NOT EOLN(MatrixesFile)
          DO
            BEGIN
              READ(MatrixesFile, Digit); 
              Matrix := Matrix + [Digit];     
            END;
          Matrixes[Letter] := Matrix;              
        END;
      READLN(MatrixesFile)      
    END;
  MatrixesFromFile := Matrixes  
END;

PROCEDURE XPrintString(EnteredString: LettersArray; Matrixes: MatrixesArray);
VAR
  I, J, NumberOfLetter, Count: INTEGER;
  Letter: Letters; 
BEGIN    
  NumberOfLetter := 1;
  Count := 0;
  FOR I := 1 TO (Length * NumberOfXColumns)
  DO
    BEGIN
      Letter := EnteredString[NumberOfLetter];
      FOR J := 1 TO 5
      DO
        BEGIN
          Count := Count + 1;              
          IF Count IN Matrixes[Letter]
          THEN
            WRITE('X')
          ELSE
            WRITE(' ');               
        END;
      WRITE(' ');
      Count := Count - NumberOfXColumns;
      NumberOfLetter := NumberOfLetter + 1;
      IF ((I MOD Length) = 0)
      THEN
        BEGIN
          WRITELN;
          Count := Count + NumberOfXColumns;
          NumberOfLetter := 1;
        END  
    END
END;
  
BEGIN
  ASSIGN(MatrixesFile, 'MATRIXES.TXT');
  WRITE('¬ведите английские заглавные буквы: ');
  EnteredSymbols := EnteredString;
  Matrixes := MatrixesFromFile(MatrixesFile, EnteredSymbols);
  XPrintString(EnteredSymbols, Matrixes)                 
END.  
