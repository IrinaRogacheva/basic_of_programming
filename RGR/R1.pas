PROGRAM CountWords(INPUT, OUTPUT);
USES
  WordModule, Container;
VAR
  FileIn, FileOut: TEXT;  
PROCEDURE GetStatistics(VAR FileIn: TEXT; VAR FileOut: TEXT);
VAR
  Found: BOOLEAN;
  NewWord: WordType;
  Root: Tree;
BEGIN {GetStatistics}
  RESET(FileIn);
  Root := NIL;
  WHILE NOT EOF(FileIn)
  DO
    BEGIN
      WHILE NOT EOLN(FileIn)
      DO
        BEGIN
          GetWord(FileIn, NewWord, Found);
          IF Found
          THEN
            AddWordInContainer(Root, NewWord);
        END;
      READLN(FileIn)      
    END;
  REWRITE(FileOut);  
  CopyContainer(FileOut, Root);
  ClearContainer(Root); 
  CLOSE(FileIn);
  CLOSE(FileOut);  
END; {GetStatistics} 
  
BEGIN {CountWords}
  ASSIGN(FileIn, 'FileInForStatistics.txt');
  ASSIGN(FileOut, 'FileOutForStatistics.txt');
  GetStatistics(FileIn, FileOut); 
  WRITELN(FileOut)
END. {CountWords}  
