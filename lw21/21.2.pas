PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper, взятому из файла 
  и печатает новые символы в файл}
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
 
FUNCTION ErrorMessage(VAR ChiperFile: TEXT): STRING;
VAR
  Ch: CHAR;
  Count: INTEGER;
BEGIN  
  ErrorMessage := '';
  Count := 0;
  RESET(ChiperFile);
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      READ(ChiperFile, Ch);
      IF (Ch IN EncodedSymbols)
      THEN 
        BEGIN
          IF (NOT EOLN(ChiperFile))
          THEN
            BEGIN 
              READ(ChiperFile, Ch);
              Count := Count + 1
            END
          ELSE 
            ErrorMessage := 'Ошибка: в файле шифра код указан не для всех символов'
        END    
      ELSE
        ErrorMessage := 'Ошибка: в файле шифра есть лишние символы';
      READLN(ChiperFile)  
    END;
  IF Count <> Alphabet
  THEN
    ErrorMessage := 'Ошибка: проверьте файл шифра на количество закодированных символов'                    
END; 
 
PROCEDURE Initialize(VAR Code: Chiper; VAR ChiperFile: TEXT);
{Присвоить Code шифр замены}
BEGIN {Initialize} 
  RESET(ChiperFile);
  WHILE (NOT EOF(ChiperFile))
  DO
    BEGIN
      READ(ChiperFile, Ch);
      READ(ChiperFile, Code[Ch]);
      READLN(ChiperFile)
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
  IF ErrorMessage(ChiperFile) = ''
  THEN
    BEGIN  
      Initialize(Code, ChiperFile);
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
    WRITELN(ErrorMessage(ChiperFile))     
END.  {Encryption}
