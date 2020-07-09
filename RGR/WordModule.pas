UNIT WordModule;
INTERFACE
  CONST
    MaxLengthOfWord = 50;
    OrdDifference = 32;
    Alphabet = ['A' .. 'Z', 'a' .. 'z', 'À' .. 'ß', 'à' .. 'ÿ'];
    AlphabetUpperCase = ['À' .. 'ß', 'A' .. 'Z'];
  TYPE
    WordType = STRING[MaxLengthOfWord];
PROCEDURE GetWord(VAR FileFrom: TEXT; VAR WordFrom: WordType; VAR Found: BOOLEAN);
IMPLEMENTATION
  FUNCTION ConvertToLowerCase(VAR Ch: CHAR): CHAR;
  BEGIN       
    IF (Ch IN AlphabetUpperCase)
    THEN
      Ch := CHR(ORD(Ch) + OrdDifference);   
    IF (Ch = '¨') OR (Ch = '¸')
    THEN
      Ch := 'å';
    ConvertToLowerCase := Ch  
  END;        

  PROCEDURE GetWord(VAR FileFrom: TEXT; VAR WordFrom: WordType; VAR Found: BOOLEAN);
  VAR
    Ch: CHAR;
  BEGIN
    WordFrom := '';
    Found := FALSE;
    WHILE NOT EOLN(FileFrom) AND (NOT Found)
    DO
      BEGIN
        READ(FileFrom, Ch);
        IF (Ch IN Alphabet) 
        THEN 
          BEGIN
            Found := TRUE;
            WHILE NOT EOLN(FileFrom) AND (Ch IN Alphabet) 
            DO
              BEGIN
                Ch := ConvertToLowerCase(Ch);
                WordFrom := WordFrom + Ch;
                READ(FileFrom, Ch);
              END
          END
      END;            
  END;        
BEGIN
END.  
