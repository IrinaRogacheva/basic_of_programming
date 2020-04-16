PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Overflow: BOOLEAN;
  StudentNameFile: TEXT;
PROCEDURE Copy(VAR FileFrom, FileIn: TEXT);
VAR 
  Ch: CHAR;
BEGIN   
  WHILE Ch <> ' '
  DO
    BEGIN
      READ(FileFrom, Ch);
      WRITE(FileIn, Ch)
    END;  
END;
         
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;  
  WHILE Student <= ClassSize
  DO 
    BEGIN
      REWRITE(StudentNameFile);
      Copy(INPUT, StudentNameFile);
      TotalScore := 0;
      WhichScore := 1;      
      WHILE WhichScore <= NumberOfScores 
      DO
        BEGIN
          READ(NextScore);
          Overflow := (NextScore > 100) OR (NextScore < 0);
          IF (NOT Overflow)
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1;
            END
          ELSE
            WRITELN('Неверные данные. Введите оценки студента еще раз')    
        END;
      READLN;
      RESET(StudentNameFile);
      Copy(StudentNameFile, OUTPUT);
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
