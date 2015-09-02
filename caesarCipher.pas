// Brian Dones
// Alan Labouseur
// Theory of Programming Languages
// 26 February 2014

// Programming in the Past (Pascal) in a procedural manner

program caesarCipher;

Var
  text : string;
  shiftValue : integer; // Shift Value given for the string
  i : integer; // this is used for all the procedures and 
  helper : integer; // this is needed for the solve function

  
// Since there is the possibility of having Capitalizecase letters and lowercase letters in a string
// I need to take the string in one function and return a new string that is either all
// capitalized or lowercased. That's the purpose of my NewString function. By subtracting 32 from
// the ascii value, I can turn all the lowercase letter values into their equivalent Capitalizecase
// value.


function Capitalize (text : string) : string;
begin
     for i := 1 to Length(text) do begin
       if (ord(text[i]) > 90) then
         text[i] := chr(ord(text[i]) - 32)
     end;
     Capitalize := text;
end;

procedure Encrypt (text : string; shiftValue : integer);
begin
     text := Capitalize(text);
     for i := 1 to Length(text) do begin
       if (ord(text[i]) = 32) then
         text[i] := text[i]
       else
           if ((ord(text[i]) + shiftValue) > 90) then begin
             text[i] := chr(64 + (ord(text[i]) + shiftValue - 90));
           end
           else
             text[i] := chr(ord(text[i]) + shiftValue);
     end;
     writeln(text);
end;

procedure Decrypt (text : string; shiftValue : integer);
begin
     text := Capitalize(text);
     for i := 1 to Length(text) do begin
       if (ord(text[i]) = 32) then
         text[i] := text[i]
       else
           if ((ord(text[i]) - shiftValue) < 65) then begin
              text[i] := chr(91 - (65 - (ord(text[i]) - shiftValue)))
           end
           else
             text[i] := chr(ord(text[i]) - shiftValue);
       end;
     writeln(text)
end;

procedure Solve (text : string);
begin
     for helper := 26 downto 0 do begin
       Decrypt(text, helper);
     end
end;

begin
     writeln('Encrypt: "Sean Connery is the best James Bond", 8');
     Encrypt('Sean Connery is the best James Bond', 8);
     writeln('Decrypt: "This is a test case", 5');
     Decrypt('This is a test case', 5);
     writeln('Solve: "This is a final test case", 26');
     Solve('This is a final test case');
end.