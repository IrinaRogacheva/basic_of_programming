PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper, взятому из файла 
  и печатает новые символы в файл}
CONST
  Len = 20;
  Alphabet = 26 + 1;
  ChiperSymbols = [' ', 'A' .. 'Z'];
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
 
PROCEDURE Initialize(VAR Code: Chiper; VAR Error: BOOLEAN; VAR ChiperFile: TEXT);
VAR
  I: INTEGER;
{Присвоить Code шифр замены}
BEGIN {Initialize} 
  RESET(ChiperFile);
  I := 0;
  Error := FALSE;
  WHILE (NOT EOF(ChiperFile))
  DO
    BEGIN
      READ(ChiperFile, Ch);
      IF (Ch IN ChiperSymbols) AND (NOT EOLN(ChiperFile)) 
      THEN
        BEGIN
          READ(ChiperFile, Code[Ch]);
          I := I + 1;
        END;
      READLN(ChiperFile)
    END;
  IF I < Alphabet
  THEN
    BEGIN
      Error := TRUE; 
      WRITELN('Ошибка в файле шифров: не все символы могут быть зашифрованы')
    END           
END;  {Initialize} 
 
PROCEDURE Encode(VAR S: Str; VAR FileIn: TEXT; Length: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  REWRITE(FileIn);
  FOR Index := 1 TO Length
  DO
    IF S[Index] IN ChiperSymbols
    THEN
      WRITE(FileIn, Code[S[Index]])
    ELSE
      WRITE(FileIn, S[Index]);
  WRITELN(FileIn)
END;  {Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(ChiperFile, 'Chiper.txt');
  Initialize(Code, Error, ChiperFile);
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
END.  {Encryption}
