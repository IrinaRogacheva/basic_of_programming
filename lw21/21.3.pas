PROGRAM Decryption(INPUT, OUTPUT);
{Переводит зашифрованные символы из файла в код согласно Dehiper 
  и печатает исходные символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Decode: Chiper;
  I: INTEGER;
  K: CHAR;
  Length: 1 .. Len;
  DechiperFile, ChiperText: TEXT;
 
PROCEDURE Decoding(VAR S: Str);
{Выводит символы из Decode, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Length
  DO 
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Decode[S[Index]])
    ELSE
      IF S[Index] = '!'
      THEN
        WRITE(' ')
      ELSE
        WRITE(S[Index]);      
  WRITELN
END;  {Decoding}
 
BEGIN {Decryption}
  ASSIGN(DechiperFile, 'DECHIPER.TXT'); 
  RESET(DechiperFile);
  FOR K := 'A' TO 'Z'
  DO
    READ(DechiperFile, Decode[K]);
  ASSIGN(ChiperText, 'CHIPERTEXT.TXT'); 
  RESET(ChiperText);  
  WHILE NOT EOLN(ChiperText)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;  
      WHILE NOT EOLN(ChiperText) AND (I < Len)
      DO
        BEGIN
          I := I + 1; 
          Length := I;
          READ(ChiperText, Msg[I]);
          WRITE(Msg[I])
        END;  
      WRITELN;        
      {распечатать кодированное сообщение}
      Decoding(Msg)
    END; 
END.  {Encryption}
