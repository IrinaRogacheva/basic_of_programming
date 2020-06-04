PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper, взятому из файла 
  и печатает новые символы в файл}
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

PROCEDURE InitializeDecode(VAR Decode: Chiper; VAR ChiperFile: TEXT);
VAR
  I: INTEGER;
{Присвоить Code шифр замены}
BEGIN {Initialize} 
  RESET(ChiperFile);
  I := 0;
  WHILE (NOT EOF(ChiperFile))
  DO
    BEGIN
      READ(ChiperFile, EncodedSymbole);
      READ(ChiperFile, ChDecode);          
      Decode[ChDecode] := EncodedSymbole;
      CodesOfSymbols := CodesOfSymbols + [ChDecode];
      READLN(ChiperFile)
    END;       
END;  {Initialize} 
 
PROCEDURE Encode(VAR S: Str; Length: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
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
  {Инициализировать Code}
  ASSIGN(ChiperFile, 'Chiper.txt');
  IF ErrorMessage(ChiperFile) = ''
  THEN
    BEGIN
      CodesOfSymbols := [];
      InitializeDecode(Decode, ChiperFile);
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
    WRITELN(ErrorMessage(ChiperFile))  
END.  {Encryption}
