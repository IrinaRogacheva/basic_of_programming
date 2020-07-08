UNIT Container;
INTERFACE
  CONST
    MaxLengthOfWord = 50;
  TYPE 
    Tree = ^NodeType;
    WordType = STRING[MaxLengthOfWord];
    NodeType = RECORD
                 NewWord: WordType;
                 WordCount: INTEGER;
                 LLink, RLink: Tree
               END;
  PROCEDURE AddWordInContainer(VAR Root: Tree; VAR Data: WordType);
  PROCEDURE CopyContainer(VAR FileIn: TEXT; VAR Root: Tree);
  PROCEDURE ClearContainer(VAR Root: Tree);
IMPLEMENTATION
PROCEDURE AddWordInContainer(VAR Root: Tree; VAR Data: WordType);
BEGIN {AddWordInContainer}
  IF Root = NIL
  THEN
    BEGIN {������� ���� �� ��������� Data}
      NEW(Root);
      Root^.LLink := NIL;
      Root^.NewWord := Data;
      Root^.RLink := NIL;
      Root^.WordCount := 1;
    END
  ELSE
    IF Root^.NewWord > Data
    THEN
      AddWordInContainer(Root^.LLink, Data)
    ELSE
      IF Root^.NewWord < Data
      THEN
        AddWordInContainer(Root^.RLink, Data)
      ELSE
        Root^.WordCount := Root^.WordCount + 1
END;  {AddWordInContainer}

PROCEDURE CopyContainer(VAR FileIn: TEXT; VAR Root: Tree);
BEGIN {PrintTree}
  IF Root <> NIL
  THEN  {�������� ��������� �����, �������, ��������� ������}
    BEGIN
      CopyContainer(FileIn, Root^.LLink);
      WRITELN(FileIn, Root^.NewWord, ': ', Root^.WordCount);
      CopyContainer(FileIn, Root^.RLink);
    END;  
END;  {PrintTree}  
  
PROCEDURE ClearContainer(VAR Root: Tree);
BEGIN{DelTree}
  IF Root^.LLink <> NIL
  THEN
    ClearContainer(Root^.LLink);
  IF Root^.RLink <> NIL
  THEN
    ClearContainer(Root^.RLink);
  DISPOSE(Root)
END; {DelTree}  
BEGIN 
END.  

