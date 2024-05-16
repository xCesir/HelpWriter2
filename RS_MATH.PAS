UNIT RS_MATH;

INTERFACE

uses Dialogs, sysutils;

type
  _Str1    = string[1];                {String der L„nge  1}
  _Str2    = string[2];                {String der L„nge  2}
  _Str3    = string[3];                {String der L„nge  3}
  _Str4    = string[4];                {String der L„nge  4}
  _Str5    = string[5];                {String der L„nge  5}
  _Str6    = string[6];                {String der L„nge  6}
  _Str7    = string[7];                {String der L„nge  7}
  _Str8    = string[8];                {String der L„nge  8}
  _Str9    = string[9];                {String der L„nge  9}
  _Str10   = string[10];               {String der L„nge 10}
  _Str11   = string[11];               {String der L„nge 11}
  _Str12   = string[12];               {String der L„nge 12}
  _Str14   = string[14];               {String der L„nge 14}
  _Str15   = string[15];               {String der L„nge 15}
  _Str20   = string[20];               {String der L„nge 20}
  _Str25   = string[25];               {String der L„nge 25}
  _Str30   = string[30];               {String der L„nge 30}
  _Str40   = string[40];               {String der L„nge 40}
  _WorkStr = string;        {Globaler Arbeitsstring der}


Function StrToIntegerToStr(min,max : REAL; _Stg : String) : String;
function rs_upcase(zeile : string) : string;
procedure SetFourDigitYearFormat;
function GebeDatum : _Str10;
function GebeTag : _Str10;
function GebeMonat : _Str10;
function GebeJahr : _Str10;
function RS_StrToInt(StrZahl : String) : longint;
function RS_IntToStr(zahl: Longint): string;
function RS_IntegerCheck(StrZahl: String): Boolean;
function _LastLeerEntf(St: _WorkStr): _WorkStr;
function _RealRange(Min,Max,Zahl: real): boolean;
function _FillStrVorne(_Stg : _WorkStr; lange : Byte; Zeichen : _Str1) : _WorkStr;
function _FillStrHinten(_Stg : _WorkStr; lange : Byte; Zeichen : _Str1) : _WorkStr;
function _NumToStr(Zahl:real;Laenge,Nach:byte): _WorkStr;
function _AlleLeerEntf(St: _WorkStr): _WorkStr;
function _StrToReal(Str: _WorkStr): real;
Function _RS_RealCheck(_Stg : _WorkStr) : Boolean;
Function StrToRealToStr(min,max : REAL; _Stg : _WorkStr) : _WorkStr;
Function StrToRealToStr2(min,max : REAL; _Stg : _WorkStr; vorne,hine:byte) : _WorkStr;
Function StrToRealToStr3(min,max : REAL; _Stg : _WorkStr; vorne,hine:byte) : _WorkStr;
Function StrToRealToStr4(min,max : REAL; _Stg : _WorkStr; vorne,hine:byte; var richtig: boolean) : _WorkStr;
function RS_DelKomma(RS_Stg : _WorkStr) : _WorkStr;
function RS_Delpunkt(RS_Stg : _WorkStr) : _WorkStr;
function vorneleerentf(stg: string): string;


IMPLEMENTATION


Function StrToIntegerToStr(min,max : REAL; _Stg : String) : String;
VAR
  Stg2 : String;
  Zahl : REAL;

BEGIN
  Stg2 := '';
  Stg2 := _Stg;
  Stg2 := _AlleLeerEntf(Stg2);
  _Stg := _AlleLeerEntf(_Stg);
  IF _Stg <> '' THEN
  BEGIN
    IF _RS_RealCheck(_Stg) = TRUE THEN
    BEGIN
      zahl := _StrToReal(_Stg);
      IF ((Zahl >= min) AND (Zahl <= max)) THEN
      BEGIN
        _Stg := _NumToStr(zahl,1,0);
        _stg := RS_Delpunkt(_stg);
        StrToIntegerToStr := _Stg;
      END
      ELSE
      BEGIN
         MessageDlg('Ganzzahl erwartet! gültig von ' +
                     _NumToStr(min,1,0)+' bis '+_NumToStr(max,1,0),
                     mtError,[mbOk], 0);
        StrToIntegerToStr := '';
      END
    END
    ELSE
    BEGIN
      MessageDlg('Ganzzahl erwartet !', mtInformation,[mbOk], 0);
      StrToIntegerToStr := '';
    END
  END
  ELSE
  StrToIntegerToStr := Stg2;
END;


function _Upcase(ch: char): char;
begin
  case ch of
    'ä': ch:= 'Ä';
    'ö': ch:= 'Ö';
    'ü': ch:= 'Ü';
    else ch:= Upcase(ch);
  end; {case}
  _Upcase:= ch;
end;


function rs_upcase(zeile : string) : string;
var i: byte;

begin
  for i:= 1 to Length(Zeile) do
  Zeile[i]:= _Upcase(Zeile[i]);
  rs_upcase := zeile;
end;

procedure SetFourDigitYearFormat;
var
  i : Integer;
begin
  ShortDateFormat:=AnsiUpperCase(ShortDateFormat);
  i:=Pos('YYYY',ShortDateFormat);
  if i < 1 then begin
    i:=Pos('YY',ShortDateFormat);
    if i > 0 then
      Insert('YY',ShortDateFormat,i);
  end;
end; {Peter Haas}

function GebeDatum : _Str10;
begin
  SetFourDigitYearFormat;
  GebeDatum := DateToStr(Date);
end;

function GebeTag : _Str10;
var
  zeile : String[10];
begin
  SetFourDigitYearFormat;
  zeile := DateToStr(Date);
  zeile := Copy(zeile,1,2);
  GebeTag := zeile
end;

function GebeMonat : _Str10;
var
  zeile : String[10];
begin
  SetFourDigitYearFormat;
  zeile := DateToStr(Date);
  zeile := Copy(zeile,4,2);
  GebeMonat := zeile
end;

function GebeJahr : _Str10;
var
  zeile : String[10];
begin
  SetFourDigitYearFormat;
  zeile := DateToStr(Date);
  zeile := Copy(zeile,7,4);
  GebeJahr := zeile
end;


function RS_IntToStr(zahl: Longint): string;
{ Beliebigen Integer-Typ in String konvertieren }
var
  S: string[11];
begin
  Str(zahl, S);
  RS_IntToStr:= S;
end;

function RS_StrToInt(StrZahl : String) : longint;
var
  I, Code: longint;
begin
  StrZahl := _LastLeerEntf(StrZahl);
  { Text aus TEdit holen }
  Val(strZahl, I, Code);
  { Fehler bei Konvertierung in Integer? }
  if code <> 0 then
  BEGIN
    MessageDlg('Keine Integer Zahl: ' + IntToStr(Code), mtWarning, [mbOk], 0);
    RS_StrToInt := 0
  END
  else
    RS_StrToInt := I;
END;

function RS_IntegerCheck(StrZahl: String): Boolean;
var
  Integerzahl, Code: longint;
begin
  RS_IntegerCheck := False;
  StrZahl := _LastLeerEntf(StrZahl);
  { Text aus TEdit holen }
  Val(strZahl, Integerzahl, Code);
  { Fehler bei Konvertierung in Integer? }
  if code = 0 then RS_IntegerCheck := true;
END;

function _LastLeerEntf(St: _WorkStr): _WorkStr;
var
  HelpStr: _WorkStr;
  i      : byte;                              {Z„hlvariable}
  j      : byte;                    {Letztes Zeichen <> ' '}

begin
  if (Length(St) > 255) or (Length(St) = 0)
  then begin
         HelpStr:= '';                          {Leerstring}
         (*_Error:= 10;*)        {String zu lang ( >79 Zeichen)}
       end
  else begin
         j:= 0;
         HelpStr:= '';                 {Leerstring vorgeben}
         for i:= 1 to Length(St) do
         begin
           if St[i] <> ' ' then j:= i;
         end; {for}
         if (j > 0) and (j < Length(St))
         then begin
                for i:= 1 to j do
                 HelpStr:= HelpStr + St[i];
              end
         else if j <> 0 then HelpStr:= St;
       end;
  _LastLeerEntf:= HelpStr;
end;

function _RealRange(Min,Max,Zahl: real): boolean;
begin
  if (Zahl >= Min) and (Zahl <= Max)
    then _RealRange:= true
    else _RealRange:= false;
end;

function _FillStrVorne(_Stg : _WorkStr; lange : Byte; Zeichen : _Str1) : _WorkStr;
BEGIN
  WHILE LENGTH (_Stg) < lange DO _Stg := zeichen + _Stg;
  _FillStrVorne := _Stg;
END;

function _FillStrHinten(_Stg : _WorkStr; lange : Byte; Zeichen : _Str1) : _WorkStr;
BEGIN
  WHILE LENGTH (_Stg) < lange DO _Stg := _Stg + zeichen;
  _FillStrHinten := _Stg;
END;

function _AlleLeerEntf(St: _WorkStr): _WorkStr;
var
  HelpStr: _WorkStr;
  i      : byte;                              {Z„hlvariable}

begin
  if (Length(St) > 255) or (Length(St) = 0)
  then begin
         HelpStr:= '';                          {Leerstring}
         (*_Error:= 10;*)         {String zu lang (>79 Zeichen)}
       end
  else begin
         HelpStr:= '';                 {Leerstring vorgeben}
         for i:= 1 to Length(St) do
         begin
           if (Copy(St,i,1)) <> ' '
             then HelpStr:= HelpStr + Copy(St,i,1);
         end; {for}
         (*_Error:= 0;*)                {Fehlerfreie Ausfhrung}
       end; {if-else}
  _AlleLeerEntf:= HelpStr;
end;


function _StrToReal(Str: _WorkStr): real;
var
  RealZahl: real;            {Umgewandelter String als Real}
  Fehler  : integer;            {Innerhalb der Val-Prozedur}
  i       : byte;                             {Z„hlvariable}

procedure KeineRealZahl;
begin
  (*_Error:= 21;*)                              {Keine Realzahl}
  _StrToReal:= 0;
end;

begin
  Str:= _AlleLeerEntf(Str);        {Evtl. Leerzeichen entfernen}
  if Length(Str) > 0
  then begin {(1)}
         for i:= 1 to Length(Str) do
         begin
           if Str[i] = ',' then Str[i]:= '.';
         end;
         Val(Str,RealZahl,Fehler);
         if Fehler = 0
         then begin {(2)}                {Konvertierung ok!}
                _StrToReal:= RealZahl;
                (*_Error:= 0; *)     {Fehlerfreie Konvertierung}
              end {if-then (2)}
         else KeineRealZahl;       {Konvertierung nicht ok!}
       end {if-then (1)}
  else KeineRealZahl;                      {Wenn Nullstring}
end;

function RS_DelKomma(RS_Stg : _WorkStr) : _WorkStr;
VAR
  i : integer;
BEGIN
  for i := 1 to LENGTH (RS_Stg) do
  begin
    if RS_Stg[i] = ',' THEN RS_Stg[i] := '.';
  end;
  RS_DelKomma := RS_Stg;
END;

function RS_Delpunkt(RS_Stg : _WorkStr) : _WorkStr;
VAR
  i : integer;
BEGIN
  for i := 1 to LENGTH (RS_Stg) do
  begin
    if RS_Stg[i] = '.' THEN RS_Stg[i] := ',';
  end;
  RS_Delpunkt := RS_Stg;
END;

function _NumToStr(Zahl:real;Laenge,Nach:byte): _WorkStr;
var St: _WorkStr;

begin
  St:= '';
  Str(Zahl:Laenge:Nach,St);
  st := RS_Delpunkt(st);
  _NumToStr:= St;
end;

Function _RS_RealCheck(_Stg : _WorkStr) : Boolean;
var
  Code : Integer;
  RealZahl : REAL;

begin
  _Stg := _AlleLeerEntf(_Stg);
  IF _Stg <> '' THEN
  BEGIN
    _Stg := RS_DelKomma(_Stg);
    Val(_Stg, RealZahl, Code);
    if code <> 0 then
    BEGIN
      _RS_RealCheck := FALSE;
    END
    ELSE
    BEGIN
      _RS_RealCheck := TRUE;
    END
  END
  ELSE
  _RS_RealCheck := TRUE;
END;


Function StrToRealToStr(min,max : REAL; _Stg : _WorkStr) : _WorkStr;
VAR
  Stg2 : _workStr;
  Zahl : REAL;

BEGIN
  Stg2 := '';
  Stg2 := _Stg;
  Stg2 := _AlleLeerEntf(Stg2);
  _Stg := _AlleLeerEntf(_Stg);
  IF _Stg <> '' THEN
  BEGIN
    IF _RS_RealCheck(_Stg) = TRUE THEN
    BEGIN
      zahl := _StrToReal(_Stg);
      IF ((Zahl >= min) AND (Zahl <= max)) THEN
      BEGIN
        _Stg := _NumToStr(zahl,1,3);
        _stg := RS_Delpunkt(_stg);
        StrToRealToStr := _Stg;
      END
      ELSE
      BEGIN
         MessageDlg('Dezimalzahl erwartet! gültig von ' +
                     _NumToStr(min,1,3)+' bis '+_NumToStr(max,1,3)+
                     #10+#13+#10+#13+
                     'Decimal number awaits! valid from '+
                     _NumToStr(min,1,3)+' to '+_NumToStr(max,1,3),
                     mtError,[mbOk], 0);
        StrToRealToStr := '';
      END
    END
    ELSE
    BEGIN
      MessageDlg('Dezimalzahl erwartet !'+#10+#13+
                 'Decimal number awaits!', mtInformation,[mbOk], 0);
      StrToRealToStr := '';
    END
  END
  ELSE
  StrToRealToStr := Stg2;
END;

Function StrToRealToStr2(min,max : REAL; _Stg : _WorkStr; vorne,hine:byte) : _WorkStr;
VAR
  Stg2 : _workStr;
  Zahl : REAL;

BEGIN
  Stg2 := '';
  Stg2 := _Stg;
  Stg2 := _AlleLeerEntf(Stg2);
  _Stg := _AlleLeerEntf(_Stg);
  IF _Stg <> '' THEN
  BEGIN
    IF _RS_RealCheck(_Stg) = TRUE THEN
    BEGIN
      zahl := _StrToReal(_Stg);
      IF ((Zahl >= min) AND (Zahl <= max)) THEN
      BEGIN
        _Stg := _NumToStr(zahl,vorne,hine);
        _stg := RS_Delpunkt(_stg);
        StrToRealToStr2 := _Stg;
      END
      ELSE
      BEGIN
         MessageDlg('Dezimalzahl erwartet! gültig von ' +
                     _NumToStr(min,vorne,hine)+' bis '+_NumToStr(max,vorne,hine)+
                     #10+#13+#10+#13+
                     'Decimal number awaits! valid from '+
                     _NumToStr(min,vorne,hine)+' to '+_NumToStr(max,vorne,hine),
                     mtError,[mbOk], 0);
        StrToRealToStr2 := '';
      END
    END
    ELSE
    BEGIN
      MessageDlg('Dezimalzahl erwartet !'+#10+#13+
                 'Decimal number awaits!', mtInformation,[mbOk], 0);
      StrToRealToStr2 := '';
    END
  END
  ELSE
  StrToRealToStr2 := Stg2;
END;

Function StrToRealToStr3(min,max : REAL; _Stg : _WorkStr; vorne,hine:byte) : _WorkStr;
VAR
  Stg2 : _workStr;
  Zahl : REAL;

BEGIN
  Stg2 := '';
  Stg2 := _Stg;
  Stg2 := _AlleLeerEntf(Stg2);
  _Stg := _AlleLeerEntf(_Stg);
  IF _Stg <> '' THEN
  BEGIN
    IF _RS_RealCheck(_Stg) = TRUE THEN
    BEGIN
      zahl := _StrToReal(_Stg);
      IF ((Zahl >= min) AND (Zahl <= max)) THEN
      BEGIN
        _Stg := _NumToStr(zahl,vorne,hine);
        _stg := RS_Delpunkt(_stg);
        StrToRealToStr3 := _Stg;
      END
      ELSE
      BEGIN
         MessageDlg('Dezimalzahl erwartet! gültig von ' +
                     _NumToStr(min,vorne,hine)+' bis '+_NumToStr(max,vorne,hine)+
                     #10+#13+#10+#13+
                     'Decimal number awaits! valid from '+
                     _NumToStr(min,vorne,hine)+' to '+_NumToStr(max,vorne,hine),
                     mtError,[mbOk], 0);
        StrToRealToStr3 := '';
      END
    END
    ELSE
    BEGIN
      MessageDlg('Dezimalzahl erwartet !'+#10+#13+
                 'Decimal number awaits!', mtInformation,[mbOk], 0);
      StrToRealToStr3 := '';
    END
  END
  ELSE
  StrToRealToStr3 := Stg2;
END;

Function StrToRealToStr4(min,max : REAL; _Stg : _WorkStr; vorne,hine:byte; var richtig: boolean) : _WorkStr;
VAR
  Stg2 : _workStr;
  Zahl : REAL;

BEGIN
  Stg2 := '';
  Stg2 := _Stg;
  Stg2 := _AlleLeerEntf(Stg2);
  _Stg := _AlleLeerEntf(_Stg);
  richtig := false;
  IF _Stg <> '' THEN
  BEGIN
    IF _RS_RealCheck(_Stg) = TRUE THEN
    BEGIN
      zahl := _StrToReal(_Stg);
      IF ((Zahl >= min) AND (Zahl <= max)) THEN
      BEGIN
        _Stg := _NumToStr(zahl,vorne,hine);
        _stg := RS_Delpunkt(_stg);
        StrToRealToStr4 := _Stg;
        richtig := true;
      END
      ELSE
      BEGIN
         MessageDlg('Dezimalzahl erwartet! gültig von ' +
                     _NumToStr(min,vorne,hine)+' bis '+_NumToStr(max,vorne,hine)+
                     #10+#13+#10+#13+
                     'Decimal number awaits! valid from '+
                     _NumToStr(min,vorne,hine)+' to '+_NumToStr(max,vorne,hine),
                     mtError,[mbOk], 0);
        StrToRealToStr4 := '';
      END
    END
    ELSE
    BEGIN
      MessageDlg('Dezimalzahl erwartet !'+#10+#13+
                 'Decimal number awaits!', mtInformation,[mbOk], 0);
      StrToRealToStr4 := '';
    END
  END
  ELSE
  begin
    StrToRealToStr4 := Stg2;
    richtig := true;
  end;
END;

function vorneleerentf(stg: string): string;
var
  n : integer;
  str1 : string[1];
  zeilex : string;
begin
  n := 0;
  repeat
    inc(n);
    str1 := stg;
    if str1 = ' ' then
    begin
      zeilex := stg;
      delete(zeilex,1,1);
      stg := zeilex;
    end;
  until (str1 <> ' ') or (n >= 25000);
  vorneleerentf := stg;
end;

END.