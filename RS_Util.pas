UNIT RS_Util;

INTERFACE

uses Dialogs, sysutils;


function RS_HasBackSlash(const S: String): Boolean;
function VorneRauteEntf(stg: string): string;
function TextKodieren(s: string) : String;
function TextDekodieren(s: string) : String;
function TextKodieren2(bis31: integer; s: string) : String;
function TextDekodieren2(bis31: integer; s: string) : String;
function VerschiebeVerschlpos(const s: String; Passwort: string):String;
function VerschiebeVerschlneg(const s: String; Passwort: String):String;
function VerschldurchTausch(const s: String; vor:boolean; Passwort: String):String;

IMPLEMENTATION

function RS_HasBackSlash(const S: String): Boolean;
begin
  Result := (Length(S) > 0) and (AnsiLastChar(S) = '\');
end;


function VorneRauteEntf(stg: string): string;
var
  n : integer;
  str1 : string[1];
  zeilex : string;
begin
  n := 0;
  repeat
    inc(n);
    str1 := stg;
    if str1 = '#' then
    begin
      zeilex := stg;
      delete(zeilex,1,1);
      stg := zeilex;
    end;
  until (str1 <> '#') or (n >= 25000);
  VorneRauteEntf := stg;
end;

function TextKodieren(s: string) : String;
var
  i: Integer;
begin
  // Kodieren
  for i:=1 to length(s) do s[i]:=char(3 Xor Ord(s[i]));
  TextKodieren := s;
end;

function TextDekodieren(s: string) : String;
var
  i: Integer;
begin
  // Dekodieren
  for i:=1 to length(s) do s[i]:=char(3 Xor ord(s[i]));
  TextDekodieren := s;
end;

function TextKodieren2(bis31: integer; s: string) : String;
var
  i: Integer;
begin
  // Kodieren
  for i:=1 to length(s) do s[i]:=char(bis31 Xor Ord(s[i]));
  TextKodieren2 := s;
end;

function TextDekodieren2(bis31: integer; s: string) : String;
var
  i: Integer;
begin
  // Dekodieren
  for i:=1 to length(s) do s[i]:=char(bis31 Xor ord(s[i]));
  TextDekodieren2 := s;
end;

{Verschiebt Buchstabe für Buchstabe positiv}
function VerschiebeVerschlpos(const s: String; Passwort: string):String;
  //Damit ein Textfile wieder ein Textfile wird, werden
  //Steuerzeichen wie #13#10 nicht verschlüsselt, sondern bleiben erhalten.
  const //Passwort ='245abx988GHIVZ'; //oder Benutzer gibt es ein
        B{Basis = Zahl der Buchstaben ohne Steuerzeichen} = 224;
  var i,q,nr :integer;
begin
  result := s;
  q:=1;
  for i:=1 to Length(result) do  Begin
    if result[i] >= ' ' then BEgin
      nr := (Ord(result[i]) - 32) + (Ord(Passwort[q]) - 32);
      if nr > B then nr := nr - B;
      result[i]:=Chr(nr+32);
    ENd;
    inc(q);
   if q > length(Passwort) then q:=1;
  end;
end;

{Verschiebt Buchstabe für Buchstabe negativ}
function VerschiebeVerschlneg(const s: String; Passwort: String):String;
  {Damit ein Textfile wieder ein Textfile wird, werden
   Steuerzeichen wie #13#10 nicht verschlüsselt, sondern bleiben erhalten.}
  const //Passwort ='245abx988GHIVZ'; //oder Benutzer gibt es ein
        B{Basis} = 224;
  var i,q,nr :integer;
begin
  result := s;
  q:=1;
  for i:=1 to Length(result) do  Begin
    if result[i] >= ' ' then BEgin
      nr := (Ord(result[i]) - 32) - (Ord(Passwort[q]) - 32);
      if nr < 0 then nr := nr + B;
      result[i]:=Chr(nr+32);
    ENd;
    inc(q);
   if q > length(Passwort) then q:=1; //"Ring"verschlüsselung
  end;
end;


(*==== Tausche =========================================*)
procedure tauscheBuchstaben(const L:integer; var s: string; const j: integer; k:integer);
var c: char;
begin
  while k > L do dec(k,L);
  if (s[j] < #32) or (s[k] < #32) then exit; //keine Steuerzeichen
  c := s[j];
  s[j] := s[k];
  s[k] := c;
end;

procedure vertauschen(const passwort: string; var s: string; vor:boolean);
    var k, L, block, n, m: integer;
  procedure Fallunterscheidung;
       var j, h, u: integer;
    begin
      for j := 1 to n do Begin
        h := 2*j*n;
        for u := 0 to j - 1 do
        if (k mod h) = (j + u*n) then tauscheBuchstaben(L,s,k,block + k + j*n);
      End;
    end;
begin
  L := length(s);
  for m := 1 to length(passwort) do Begin
    if vor then n := ord(passwort[m]) - 31 else
      n:=ord(passwort[length(passwort) - m + 1]) -31;
    if n < 2 then inc(n,31);
    block := L div n;
    if vor then for k := 1 to L do Fallunterscheidung
      else for k := L downto 1 do Fallunterscheidung
 End;
end;

function VerschldurchTausch(const s: String; vor:boolean; Passwort: String):String;
begin
  result := s;
  vertauschen(passwort,result,vor);
end;

(*
procedure TForm1.Vreschluesseln1Click(Sender: TObject);
begin
  memo1.Text := VerschldurchTausch(memo1.text,true);//vorwärts
end;

procedure TForm1.Entschluesseln1Click(Sender: TObject);
begin
  memo1.Text := VerschldurchTausch(memo1.text,false);//rückwärts
end;
*)
(*==== Ende Tausche ===================================*)

end.
