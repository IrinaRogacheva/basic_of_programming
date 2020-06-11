PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
  Alphabet = 26 + 1;
  EncodedSymbols = [' ', 'A' .. 'Z'];
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Decode: Chiper;
  I: INTEGER;
  ChDecode, EncodedSymbole: CHAR;
  Length: 1 .. Len;
  ChiperFile, EncodedText: TEXT;
  CodesOfSymbols: SET OF CHAR;
  Error: BOOLEAN;
 
PROCEDURE InitializeDecode(VAR Decode: Chiper; VAR ChiperFile: TEXT; VAR Error: BOOLEAN);
VAR
  Count: INTEGER;
BEGIN {Initialize} 
  RESET(ChiperFile); 
  Count := 0;
  WHILE NOT EOF(ChiperFile) AND NOT Error
  DO
    BEGIN
      READ(ChiperFile, EncodedSymbole);
      IF (EncodedSymbole IN EncodedSymbols)
      THEN 
        BEGIN
          IF (NOT EOLN(ChiperFile))
          THEN
            BEGIN 
              READ(ChiperFile, ChDecode); 
              Decode[ChDecode] := EncodedSymbole;
              CodesOfSymbols := CodesOfSymbols + [ChDecode];
              Count := Count + 1
            END
          ELSE 
            Error := TRUE;
        END    
      ELSE
        Error := TRUE;
      READLN(ChiperFile)  
    END;
  IF Count <> Alphabet
  THEN
    Error := TRUE;       
END;  {Initialize} 
 
PROCEDURE Encode(VAR S: Str; Length: INTEGER);
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Length
  DO
    IF S[Index] IN CodesOfSymbols
    THEN
      WRITE(Decode[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  ASSIGN(ChiperFile, 'Chiper.txt');
  CodesOfSymbols := [];
  Error := FALSE;
  InitializeDecode(Decode, ChiperFile, Error);
  IF NOT Error
  THEN
    BEGIN
      ASSIGN(EncodedText, 'ChiperText.txt');  
      RESET(EncodedText);
      WHILE NOT EOLN(EncodedText) AND (I < Len)
      DO
        BEGIN
          I := I + 1; 
          Length := I;
          READ(EncodedText, Msg[I])
        END;   
      Encode(Msg, Length)
    END 
  ELSE
    WRITELN('Проверьте правильность файла шифра')
END.  {Encryption}
