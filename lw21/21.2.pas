PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper, взятому из файла 
  и печатает новые символы в файл}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  K: CHAR;
  Length: 1 .. Len;
  ChiperFile, ChiperText: TEXT;
 
PROCEDURE Encode(VAR S: Str; VAR FileIn: TEXT);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Length
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(FileIn, Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE(FileIn, 'G')
      ELSE
        WRITE(FileIn, S[Index]);
  WRITELN(FileIn)
END;  {Encode}
 
BEGIN {Encryption}
  ASSIGN(ChiperFile, 'CHIPER.TXT'); 
  RESET(ChiperFile);
  FOR K := 'A' TO 'Z'
  DO
    READ(ChiperFile, Code[K]);
  WHILE NOT EOLN
  DO
    BEGIN
      {читать строку в Msg}
      I := 0;  
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1; 
          Length := I;
          READ(Msg[I]);
        END;  
      ASSIGN(ChiperText, 'CHIPERTEXT.TXT'); 
      REWRITE(ChiperText);       
      {распечатать кодированное сообщение}
      Encode(Msg, ChiperText)
    END;
  WRITELN   
END.  {Encryption}
