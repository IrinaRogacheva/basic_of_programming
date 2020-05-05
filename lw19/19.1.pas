PROGRAM Prime(INPUT, OUTPUT); 
CONST
  Min = 2;
  Max = 100;
VAR
  Sieve: SET OF Min..Max;
  Number, MinPrime: INTEGER;
BEGIN
  Number := Min;
  MinPrime := Min;
  Sieve := [Min..Max];
  WRITE('Простые числа: {');
  WHILE (Number <= Max) 
  DO
    BEGIN
      WHILE (Number <= Max)
      DO
        BEGIN
          Number := Number + MinPrime;
          Sieve := Sieve - [Number];         
        END;  
      IF MinPrime IN Sieve
      THEN
        WRITE(MinPrime, ' ');   
      MinPrime := MinPrime + 1; 
      Number := MinPrime;
    END;
  WRITELN('}')
END.
