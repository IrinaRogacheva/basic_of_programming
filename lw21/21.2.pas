PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  Alphabet = 26 + 1;
  EncodedSymbols = [' ', 'A' .. 'Z'];
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  Ch: CHAR;
  Length: 1 .. Len;
  ChiperFile, ChiperText: TEXT;
  Error: BOOLEAN;
 
PROCEDURE Initialize(VAR Code: Chiper; VAR ChiperFile: TEXT; VAR Error: BOOLEAN);
{Присвоить Code шифр замены}
VAR
  Count: INTEGER;
BEGIN {Initialize}
  RESET(ChiperFile); 
  Count := 0;
  WHILE NOT EOF(ChiperFile) AND NOT Error
  DO
    BEGIN
      READ(ChiperFile, Ch);
      IF (Ch IN EncodedSymbols)
      THEN 
        BEGIN
          IF (NOT EOLN(ChiperFile))
          THEN
            BEGIN 
              READ(ChiperFile, Code[Ch]);
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
 
PROCEDURE Encode(VAR S: Str; VAR FileIn: TEXT; Length: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  REWRITE(FileIn);
  FOR Index := 1 TO Length
  DO
    IF S[Index] IN EncodedSymbols
    THEN
      WRITE(FileIn, Code[S[Index]])
    ELSE
      WRITE(FileIn, S[Index]);
  WRITELN(FileIn)
END;  {Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(ChiperFile, 'Chiper.txt');  
  Error := FALSE;
  Initialize(Code, ChiperFile, Error);
  IF NOT Error
  THEN 
    BEGIN
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1; 
          Length := I;
          READ(Msg[I])
        END;  
      READLN;     
      ASSIGN(ChiperText, 'ChiperText.txt');   
      Encode(Msg, ChiperText, Length)
    END
  ELSE
    WRITELN('Проверьте правильность шифра')
END.  {Encryption}
