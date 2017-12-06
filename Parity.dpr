program Parity;

{$APPTYPE CONSOLE}
uses
  SysUtils,
  Classes;

// Проверка, является ли символ буквой
function IsLetter(var c: char): Boolean;
var
  isCapital, isLower: Boolean;
begin
  isLower := (Ord(c) >= Ord('a')) And (Ord(c) <= Ord('z'));
  isCapital := (Ord(c) >= Ord('A')) AND (Ord(c) <= Ord('Z'));
  Result := isLOwer OR isCapital;
end;


  var
  mainString: string;
  isWord: Boolean;
  isLtr: Boolean;
  wordParity: Boolean;

  i, n: Integer;
  parityWordsCount: Integer;
  wordLen: Integer;
  cur: Char;

begin
  // Ввод строки для анализа
  WriteLn('Enter the string:');
  ReadLn(mainString);

  isWord := false;
  isLtr := false;
  parityWordsCount := 0;
  wordLen := 0;
  for i := 0 to length(mainString) do begin
    cur := mainString[i];
    isLtr := IsLetter(cur);
    if (isLtr = true) then
    begin
      if (isWord = true) then
      begin
        wordLen := wordLen + 1;
      end
      else
      begin
        isWord := true;
        wordLen := 0;
      end;
    end
    else
    begin
      if (isWord = true) then
      begin
        // Проверка длины слова на четность и сложение 
        parityWordsCount := parityWordsCount + ((wordLen) MOD 2);
      end;
      
      isWord := false;
      wordLen := 0;
    end;
  end;

  if (isWord = true) then
  begin
    // Проверка длины слова на четность и сложение
    parityWordsCount := parityWordsCount + ((wordLen) MOD 2);
  end;
    WriteLn('Parity words found: ', parityWordsCount);

  ReadLn;
end.







