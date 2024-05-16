unit DatensatzerzeugerUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Heimverzeichnis;
var
  fehler : integer;
  progdir : string;
  laenge : word;
begin
  // in verzeichnis wechseln falls über path aufgerufen
  progdir := ExtractFilePath(Application.ExeName);
  laenge := length(progdir);
  if progdir[length(progdir)] = '\' THEN Delete(progdir,laenge,1);
  {$I-}
  chdir(progdir);
  {$I+}
  fehler := IoResult;
  if (fehler <> 0) then
  begin
    showmessage('Es konnte nicht ins Home Verzeichnis gewechselt werden!');
  end;
end;


function _FillStrVorne(_Stg : String; lange : Byte; Zeichen : string) : String;
BEGIN
  WHILE LENGTH (_Stg) < lange DO _Stg := zeichen + _Stg;
  _FillStrVorne := _Stg;
END;

procedure ErzeugeDatensaetze(Anzahl : integer);
VAR
  f       : Textfile;
  fehler,
  i,n,b   : integer;
begin
  n := 0;
  AssignFile(f,'Test.hwd');
  {$I-}
  rewrite(f);
  {$I+}
  fehler := ioresult;

  form1.ProgressBar1.Position := 0;
  form1.ProgressBar1.Min := 0;
  form1.ProgressBar1.Max := Anzahl;
  form1.ProgressBar1.Step := 1;

  if fehler = 0 then
  begin
    for i := 1 to anzahl do
    begin
      form1.ProgressBar1.Stepit;
      inc(n);
      Writeln(f,'#Datensatz '+_FillStrVorne(inttostr(i),6,'0'));
      Writeln(f,'Datensatz Anfang '+inttostr(i));
      for b := 1 to n do Writeln(f,'Zeile '+inttostr(b));
      Writeln(f,'Datensatz Ende '+inttostr(i));
      Writeln(f,'#END');
      if (n = 10) then n := 0;
    end;
    //showmessage('Fertig !');
    sleep(500);
    form1.ProgressBar1.Position := 0;
    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei Test.hwd konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    showmessage('Datei Test.hwd konnte nicht geöffnet werden!');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   edit1.Text := '10';
   edit2.Text := '10';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  WindowState := wsMinimized;
  application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
(*
  if (StrToInt(edit1.Text) > 1) and
     (StrToInt(edit1.Text) < 32001) then
  ErzeugeDatensaetze(StrToInt(edit1.Text)) else
  showmessage('Die Zahl muß zwischen 2 und 32000 liegen!');
  *)
  ErzeugeDatensaetze(StrToInt(edit1.Text))
end;


procedure ErzeugeDatensaetzeAdress(Anzahl : integer);
VAR
  f       : Textfile;
  fehler,
  i,n,b   : integer;
begin
  n := 0;
  AssignFile(f,'Test.ha');
  {$I-}
  rewrite(f);
  {$I+}
  fehler := ioresult;

  form1.ProgressBar1.Position := 0;
  form1.ProgressBar1.Min := 0;
  form1.ProgressBar1.Max := Anzahl;
  form1.ProgressBar1.Step := 1;

  if fehler = 0 then
  begin
    for i := 1 to anzahl do
    begin
      form1.ProgressBar1.Stepit;
      inc(n);
      Writeln(f,'#Datensatz '+_FillStrVorne(inttostr(i),6,'0'));

      Writeln(f,'Name '+inttostr(i));
      Writeln(f,'Vorname '+inttostr(i));
      Writeln(f,'Strasse '+inttostr(i));
      Writeln(f,'D ');
      Writeln(f,'Plz '+_FillStrVorne(inttostr(i),5,'0'));
      Writeln(f,'Ort '+inttostr(i));
      Writeln(f,'Telefon '+_FillStrVorne(inttostr(i),6,'0'));
      Writeln(f,'Handy '+_FillStrVorne(inttostr(i),6,'0'));
      Writeln(f,'Fax '+_FillStrVorne(inttostr(i),6,'0'));
      Writeln(f,'E-Mail '+inttostr(i));
      Writeln(f,'Homepage '+inttostr(i));
      Writeln(f,'03.01.1965');
      Writeln(f,'K');

      Writeln(f,'Datensatz Anfang '+inttostr(i));
      for b := 1 to n do Writeln(f,'Notizzeile '+inttostr(b));
      Writeln(f,'Datensatz Ende '+inttostr(i));
      Writeln(f,'#END');
      if (n = 20) then n := 0;
    end;
    //showmessage('Fertig !');
    sleep(500);
    form1.ProgressBar1.Position := 0;
    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei Test.ha konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    showmessage('Datei Test.ha konnte nicht geöffnet werden!');
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ErzeugeDatensaetzeAdress(StrToInt(edit2.Text))
end;

end.
