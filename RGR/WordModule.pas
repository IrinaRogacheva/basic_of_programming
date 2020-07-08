UNIT WordModule;
INTERFACE
  CONST
    MaxLengthOfWord = 50;
    AlphabetEn = ['A' .. 'Z', 'a' .. 'z'];
    AlphabetRu = ['À' .. 'ß', 'à' .. 'ÿ'];
  TYPE
    WordType = STRING[MaxLengthOfWord];
PROCEDURE GetWord(VAR FileFrom: TEXT; VAR WordFrom: WordType; VAR Found: BOOLEAN);
IMPLEMENTATION
  FUNCTION ConvertToLowerCase(VAR Ch: CHAR): CHAR;
  BEGIN       
    IF (Ch IN ['A' .. 'Z']) 
    THEN
      Ch := CHR(ORD(Ch) + ORD('a') - ORD('A'));
    IF (Ch IN ['À' .. 'ß']) 
    THEN
      Ch := CHR(ORD(Ch) + ORD('à') - ORD('À'));
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
        IF (Ch IN AlphabetRu) OR (Ch IN AlphabetEn) 
        THEN 
          BEGIN
            Found := TRUE;
            WHILE NOT EOLN(FileFrom) AND (Ch IN AlphabetRu) OR (Ch IN AlphabetEn) 
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
