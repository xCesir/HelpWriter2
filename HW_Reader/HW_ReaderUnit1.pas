unit HW_ReaderUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, ToolWin, Menus, Buttons, printers,
  XPMan;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    ToolBar1: TToolBar;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    Datei1: TMenuItem;
    Bearbeiten1: TMenuItem;
    Beenden1: TMenuItem;
    Datenbankffnen1: TMenuItem;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Datensatz1: TMenuItem;
    CheckBox3: TCheckBox;
    PrintDialog1: TPrintDialog;
    Datensatzdrucken1: TMenuItem;
    Datenbankschlieen1: TMenuItem;
    N1: TMenuItem;
    Beenden2: TMenuItem;
    DatensatzindieZwischenablagekopieren1: TMenuItem;
    N2: TMenuItem;
    Datensatzsuchen1: TMenuItem;
    AlleDatenstzeanzeigen1: TMenuItem;
    ber1: TMenuItem;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    N3: TMenuItem;
    Schrift1: TMenuItem;
    FontDialog1: TFontDialog;
    Hilfe1: TMenuItem;
    XPManifest1: TXPManifest;
    procedure Hilfe1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Beenden2Click(Sender: TObject);
    procedure Schrift1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ber1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure AlleDatenstzeanzeigen1Click(Sender: TObject);
    procedure Datensatzsuchen1Click(Sender: TObject);
    procedure DatensatzindieZwischenablagekopieren1Click(Sender: TObject);
    procedure Datenbankschlieen1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Datensatzdrucken1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Datenbankffnen1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  rs_Math, rs_util, xAbout, Hilfe;

const
  VerschluesselString = 'HW2#4fggkfg5gjo#+fpdospg#d#556ofdgg2';

Type Datensatz = Record
       schriftgroesse,
       oben,
       links,
       hoehe,
       breite,
       listboxbreite : integer;
       Schrift       : string[255];
       Zeilenumbruch : boolean;
     end;


var
  Datei          : File of Datensatz;
  satz           : Datensatz;
  AktuelleDatei,
  Arbeitsverzeichnis,
  progdir                : string;
  IstDatenVerschluesselt : Boolean;


procedure DateiStandard;
begin
  satz.schriftgroesse := 8;
  satz.oben := 0;
  satz.links := 0;
  satz.hoehe := 420;
  satz.breite := 640;
  satz.listboxbreite := 250;
  satz.Schrift := 'Courier New';
  satz.Zeilenumbruch := true;
end;

procedure Dateicheck(Dateiname: string);
var
  fehler : integer;
  mld    : string;
begin
  mld := 'Datei "'+ dateiname +'" nicht gefunden.'+
          #10#13+#10#13+'Datei wird erstellt!';
    
  if not FileExists(dateiname) then
  begin
    MessageDlg(mld, mtInformation, [mbOk], 0);
    assignfile(datei,dateiname);
    {$I-}
    REWRITE(datei);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      //Datensatz zuweisen
      DateiStandard;
      
      {$I-}
      write(datei,satz);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+dateiname+'" Schreibfehler!');
      end;
      
      {$I-}
      closefile(datei);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+dateiname+'" konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      //bei fehler zuweisen
      DateiStandard;
      showmessage('Datei "'+dateiname+'" konnte nicht erzeugt werden.');
    end
  end
end;


Procedure LeseDatei(Dateiname: string);
var
  fehler : integer;
begin
  AssignFile(datei,dateiname);
  {$I-}
  reset(datei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    Read(datei,satz);
    {$I+}
    if (ioresult <> 0) then
    begin
      //bei fehler zuweisen
      DateiStandard;
      //showmessage('Datei "'+dateiname+'" Lesefehler!');
    end;

    {$I-}
    closefile(datei);
    {$I+}
    if (ioresult <> 0) then
    begin
      DateiStandard;
      //showmessage('Datei "'+Dateiname+'" konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    //bei fehler zuweisen
    DateiStandard;
    //showmessage('Datei "'+Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;


procedure SchreibeDatei(Dateiname: String);
var
  fehler: integer;
begin
  AssignFile(datei,dateiname);
  {$I-}
  rewrite(datei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    //Datensatz zuweisen
    satz.oben := form1.Top;
    satz.links := form1.Left;
    satz.listboxbreite := form1.ListBox1.Width;
    satz.hoehe := form1.Height;
    satz.breite := form1.Width;

    if form1.CheckBox3.Checked = true
    then satz.Zeilenumbruch := true
    else satz.Zeilenumbruch := false;

    {$I-}
    Write(datei,satz);
    {$I+}
    if ioresult <> 0 then 
    begin
      //showmessage('Datei "'+dateiname+'" Schreibfehler!');
    end;
  
    {$I-}
    closefile(datei);
    {$I+}
    if (ioresult <> 0) then
    begin
      //showmessage('Datei '+Dateiname+' konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    //showmessage('Datei '+dateiname+' konnte nicht überschrieben werden!');
  end;
end;


Procedure ButtonAnAus(anAus : Boolean);
begin
  with form1 do
  begin
    Datei1.Enabled := anaus;
    Bearbeiten1.Enabled := anaus;
    Datensatz1.Enabled := Anaus;
    ber1.Enabled := Anaus;
    Hilfe1.Enabled := Anaus;
    Beenden1.Enabled := anaus;

    checkbox3.Enabled := anaus;
    listbox1.Enabled := anaus;

    Speedbutton1.Enabled := anaus;
    Speedbutton2.Enabled := anaus;
    Speedbutton3.Enabled := anaus;
    Speedbutton4.Enabled := anaus;
    Speedbutton5.Enabled := anaus;
    Speedbutton6.Enabled := anaus;
  end;
end;

Procedure ButtonAnAus2(anAus : Boolean);
begin
  with form1 do
  begin
    Datei1.Enabled := anaus;
    Bearbeiten1.Enabled := anaus;
    Datensatz1.Enabled := Anaus;
    ber1.Enabled := Anaus;
    Hilfe1.Enabled := Anaus;
    Beenden1.Enabled := anaus;

    checkbox3.Enabled := anaus;
    //listbox1.Enabled := anaus;

    Speedbutton1.Enabled := anaus;
    Speedbutton2.Enabled := anaus;
    Speedbutton3.Enabled := anaus;
    Speedbutton4.Enabled := anaus;
    Speedbutton5.Enabled := anaus;
    Speedbutton6.Enabled := anaus;
  end;
end;



procedure LeseDatenbank(Dateiname : string);
VAR
  f                 : textfile;
  zaehler,
  AnzZeilen,
  AnzahlDatensatz,
  fehler            : integer;
  TempZeile,
  zeile             : String;
  Minizeile         : String[1];
begin
  Dateiname := _LastLeerEntf(Dateiname);
  if Dateiname = '' then
  begin
    Showmessage('Kein gültiger Dateiname!'+#10#13+Dateiname);
    exit;
  end;
  with form1 do
  begin
    AnzZeilen := 0;
    AnzahlDatensatz := 0;
    zaehler := 0;
    listbox1.Clear;
    memo1.Clear;
    statusbar1.SimpleText := Dateiname;
    AssignFile(f,Dateiname);
    {$I-}
    reset(f);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      ButtonAnAus(false);
      Screen.cursor := crHourGlass;
      listbox1.Items.BeginUpdate;
      while not eof(f)do
      begin
        inc(zaehler);
        if zaehler = 100000 then
        begin
          //Nur das Prog sich bein einlesen mal meldet
          Application.Processmessages;
          zaehler := 0;
        end;
        inc(AnzZeilen);
        zeile := '';
        Readln(f,zeile);
        Tempzeile := zeile;
        Minizeile := zeile;
        Tempzeile := RS_upcase(Tempzeile);
        if (Minizeile = '#') and (Tempzeile <> '#END') then
        begin
          inc(AnzahlDatensatz);
          delete(zeile,1,1);
          listbox1.Items.Add(zeile)
        end;
      end;
      Screen.cursor := crDefault;
      ButtonAnAus(true);
      listbox1.Items.EndUpdate;
      label7.Caption := RS_inttostr(AnzahlDatensatz);
      label9.Caption := RS_inttostr(AnzZeilen);
      {$I-}
      closefile(f);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage(Dateiname+#10#13+'Datei konnte nicht geschlossen werden!');
      end;
    end
    else showmessage(Dateiname+#10#13+'Datei konnte nicht geöffnet werden!');
  end;
end;

procedure LeseDatensatz(Dateiname, Datensatz : string);
VAR
  f                 : textfile;
  i,Stepper,
  fehler            : integer;
  TempZeile,
  zeile             : String;
  gefunden          : Boolean;
  minizeile         : string[1];
begin
  Dateiname := _LastLeerEntf(Dateiname);
  if Dateiname = '' then
  begin
    Showmessage('Kein gültiger Dateiname!'+#10#13+Dateiname);
    exit;
  end;
  with form1 do
  begin
    i := 0;
    Stepper := 0;
    memo1.Clear;
    ProgressBar1.Position := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := RS_StrToInt(label9.caption);
    ProgressBar1.Step := 500;
    gefunden := false;
    AssignFile(f,Dateiname);
    {$I-}
    reset(f);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      ButtonAnAus2(false);
      Screen.cursor := crHourGlass;
      Datensatz := '#'+Datensatz;

      memo1.Lines.BeginUpdate;
      while not eof(f)do
      begin
        inc(stepper);
        if (stepper = 500) then
        begin
          ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
        inc(i);
        zeile := '';
        Readln(f,zeile);
        Tempzeile := zeile;
        Tempzeile := RS_upcase(Tempzeile);
        Datensatz := RS_Upcase(Datensatz);
        if (Datensatz = Tempzeile) then
        begin
          gefunden := true;
          label3.Caption := RS_IntToStr(i);
        end;
        if (gefunden = true) then
        begin
          if (Tempzeile = '#END') then
          begin
            gefunden := false;
            label5.Caption := RS_IntToStr(i);
          end;
          minizeile := zeile;
          if (minizeile <> '#') then memo1.Lines.Add(zeile)
        end;
      end;
      memo1.Lines.EndUpdate;

      Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
      Screen.cursor := crDefault;
      progressbar1.Position := 0;
      ButtonAnAus2(true);
      label9.Caption := Inttostr(i);
      {$I-}
      closefile(f);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage(Dateiname+#10#13+'Datei konnte nicht geschlossen werden!');
      end
    end
    else showmessage(Dateiname+#10#13+'Datei konnte nicht geöffnet werden!');
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  progressbar1.Left := form1.Width - 180;
end;


procedure SetzeAllesFuerLadeNeueDatei;
begin
  with form1 do
  begin
    Listbox1.Clear;
    memo1.Clear;
    panel1.Caption := '';
    panel2.Caption := '';
    panel2.Visible := false;
    edit1.Text := '';
    label3.Caption := '';
    label5.Caption := '';
    label7.Caption := '';
    label9.Caption := '';
    label10.Caption := '-1';
    label11.Caption := '';
    label12.Caption := '';
    statusbar1.SimpleText := '';
  end;
  AktuelleDatei := '';
  IstDatenVerschluesselt := False;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  laenge,
  fehler : integer;
begin
  progdir := ExtractFilePath(Application.ExeName);
  laenge := length(progdir);
  if progdir[length(progdir)] = '\' THEN Delete(progdir,laenge,1);
  {$I-}
  chdir(progdir);
  {$I+}
  fehler := IoResult;
  if fehler = 0 then  begin end;
  Arbeitsverzeichnis := progdir;

  if RS_HasBackSlash(ProgDir) = false then
  ProgDir := ProgDir + '\';

  SetzeAllesFuerLadeNeueDatei;

  Dateicheck(progdir+'HW_Reader.cfg');
  LeseDatei(progdir+'HW_Reader.cfg');

  form1.top := satz.oben;
  form1.Left := satz.links;
  form1.Height := satz.hoehe;
  form1.Width := satz.breite;
  form1.ListBox1.Width := satz.listboxbreite;

  if satz.Zeilenumbruch = true then form1.CheckBox3.Checked := true
                               else form1.CheckBox3.Checked := false;
  CheckBox3Click(form1);

  form1.Memo1.Font.Name := satz.Schrift;
  form1.Memo1.Font.Size := satz.schriftgroesse;

  form1.ListBox1.Font := form1.Memo1.Font;
  form1.Edit1.Font := form1.Memo1.Font;
end;

procedure TForm1.Beenden1Click(Sender: TObject);
begin
  //WindowState := wsMinimized;
  close;
  application.Terminate;
end;

procedure TForm1.Datenbankffnen1Click(Sender: TObject);
var
  Tempdatei : string;
begin
  if DirectoryExists(Arbeitsverzeichnis) = false then
  begin
    if Arbeitsverzeichnis <> '' then
    showmessage('Verzeichnis existiert nicht!'+#10#13+#10#13+Arbeitsverzeichnis);
    Arbeitsverzeichnis := '';
  end;
  if Arbeitsverzeichnis <> '' then
  OpenDialog1.InitialDir := Arbeitsverzeichnis
  else OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);

  if OpenDialog1.Execute then
  begin
    Tempdatei := OpenDialog1.FileName;
    Tempdatei := _Lastleerentf(Tempdatei);
    if Tempdatei <> '' then
    begin
      if FileExists(Tempdatei) = false then
      begin
        MessageDlg('Datei "'+Tempdatei+'" kann nicht geöffnet '+
                   'werden!', mtError, [mbOk], 0);
        exit;
      end;
      SetzeAllesFuerLadeNeueDatei;
      AktuelleDatei := Tempdatei;
      statusbar1.SimpleText := AktuelleDatei;
      LeseDatenbank(AktuelleDatei);
    end;
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  RS_Stg10  : string[10];
  RS_stg120 : String[120];
  RS_stg100 : String[100];
  was : String;
  String36 : String[36];
  Tag      : String[2];
  zahl     : integer;
begin
  was := ListBox1.Items[listbox1.itemindex];
  LeseDatensatz(AktuelleDatei,was);
  panel1.Caption := ListBox1.Items[listbox1.itemindex];
  edit1.text := ListBox1.Items[listbox1.itemindex];
  //Hier wegen neuer speichermethode, Datenkopf änderbar
  RS_stg100 := edit1.Text;
  RS_stg120 := edit1.Text;
  RS_stg100 := _Lastleerentf(RS_stg100);
  edit1.Text := RS_stg100;

  delete(RS_stg120,1,101);
  RS_Stg10 := RS_stg120;
  label11.Caption := RS_stg10;
  delete(RS_stg120,1,11);
  label12.Caption := RS_stg120;

  label10.caption := RS_inttostr(ListBox1.ItemIndex);

  form1.Panel2.Visible := false;
  application.ProcessMessages;

  if memo1.Lines.Count > 0 then
  begin
    zahl := 1;
    was := memo1.Lines[0];
    //Falls verschlüsselt minuszeichen entfernen
    delete(was,1,1);
    //Schlüsselstring entfernen
    Delete(was,1,36);
    //Tag ist dann die Dekodierzahl
    tag := was;
    Tag := _AlleLeerEntf(Tag);
    if RS_IntegerCheck(tag) = true then Zahl := RS_StrToInt(tag);

    //Zuerst Zahl rausgeholt dann schlüsselstring
    was := memo1.Lines[0];
    delete(was,1,1);

    was := TextDekodieren2(zahl,was);
    string36 := was;
    if string36 = verschluesselstring then
    begin
      //Datensatz ist verschlüsselt
      IstDatenVerschluesselt := true;
      form1.Panel2.Caption := 'Dieser Datensatz wurde mit Help Writer 2 verschlüsselt!';
      form1.Panel2.Visible := true;
      application.ProcessMessages;
    end
    else
    begin
      //Datensatz ist nicht verschlüsselt
      IstDatenVerschluesselt := false;
      form1.Panel2.Visible := false;
      application.ProcessMessages;
    end;
  end
  else IstDatenVerschluesselt := false;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Datenbankffnen1Click(Form1);
end;

//Beachten: uses printers
//Problem mit Leerzeilen behoben
procedure TForm1.Datensatzdrucken1Click(Sender: TObject);
var
   Geschriebenes,Zeile,maxtext:word;
   xPrnText                   :string;
begin
  if label3.Caption = '' then
  begin
    Showmessage('Es wurde noch kein Datensatz ausgewählt!');
    exit;
  end;
  if label5.Caption = '' then
  begin
    Showmessage('Es wurde noch kein Datensatz ausgewählt!');
    exit;
  end;
   //Falls der Druckdialog mit 'Ok' bestätigt wird...
   If Printdialog1.execute then begin
      //Setze den Title des Druckauftragen auf den Dateinamen
      Printer.title:='Help Writer 2';;
      //Fange mit der Aufzeichnung der Befehle an
  
      (*
      Printer.Canvas.Font.size := 10;
      Printer.Orientation := poPortrait;
      Printer.Canvas.Font.name := 'Courier New';
      Printer.Canvas.Font.Pitch := fpFixed;
      *)
      Printer.Canvas.Font := memo1.Font;
      Printer.Orientation := poPortrait;
  
      Printer.begindoc;
      //Setze Variblen auf genz oben
      Zeile:=0;
      Geschriebenes:=0;
      //Solange wir die Anzahl der Memo-Zeilen nicht überschritten haben...
      while Zeile<Memo1.lines.count do begin
         //Gebe den Text der Aktuellen Zeile aus
         //mit: Abstand von links: 50
         //mit: Abstand von oben: 50 + Bisher geschriebenes
         xPrnText := Memo1.lines[Zeile];
         if xPrnText = '' then xPrnText := xPrnText + ' ';
         Printer.Canvas.Textout(250,50+geschriebenes,xPrnText);
  
         //Printer.Canvas.Textout(250,50+geschriebenes,Memo1.lines[Zeile]);
  
         //Ergänze den Bisher geschribenen Text um dei letzte Zeile
         maxtext:=Printer.canvas.TextHeight(xPrnText);
         //maxtext:=Printer.canvas.TextHeight(Memo1.Lines[Zeile]);
  
         inc(Geschriebenes,maxtext);
         //Falls die Seite voll ist (50 oben, 50 unten)...
         If Geschriebenes >=Printer.Pageheight-100 then begin
            //Fange eine neue Seite an
            printer.newpage;
            //Setze das bisher geschriebene auf 0
            geschriebenes:=0;
            end;
         //Nächste Zeile im Memo
         inc(Zeile);
         end;
      //Beendet das Formular
      Printer.enddoc;
      end;
end;


procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if form1.checkbox3.Checked = true then
  begin
    form1.Memo1.ScrollBars := ssVertical;
    form1.memo1.WordWrap := true
  end
  else
  begin
    form1.Memo1.ScrollBars := ssBoth;
    form1.memo1.WordWrap := false;
  end;
end;



procedure TForm1.Datenbankschlieen1Click(Sender: TObject);
begin
  SetzeAllesFuerLadeNeueDatei;
end;

procedure TForm1.DatensatzindieZwischenablagekopieren1Click(Sender: TObject);
begin
  activeControl := Memo1;
  memo1.SelectAll;
  memo1.CopyToClipboard;
end;

procedure TForm1.Datensatzsuchen1Click(Sender: TObject);
var
  i : integer;
  f : Textfile;
  (* Ab hier für Suchroutine *)
  zeile,
  upzeile,
  SuchQual,
  such     : String[255];
  gefunden : Boolean;
  iii  : Integer;
  kurzzeile : string[1];

procedure _Suchwort(wort_laenge : INTEGER);
VAR
 b        : INTEGER;
 Auftragg : String;
BEGIN
 Auftragg := '';
 IF wort_laenge > 0 THEN
 BEGIN
   FOR b := 1 TO wort_laenge DO
   BEGIN
     Auftragg := Auftragg + SuchQual[b];
     IF Auftragg = Such
     THEN gefunden := TRUE
     ELSE gefunden := FALSE
   END
 END
 ELSE gefunden := FALSE;
// if gefunden = true then inc(wieviele);
END;

begin
  if edit1.text <> '' then
  begin
    if AktuelleDatei = '' then exit;
    label10.caption := '-1';
    listbox1.clear;
    memo1.Clear;
    label3.caption := '';
    label5.caption := '';
    panel1.Caption := '';
    label11.Caption := '';
    label12.Caption := '';
    
    assignfile(f,AktuelleDatei);
    {$I-}
    reset(f);
    {$I+}
    if ioresult = 0 then
    begin
      buttonanaus(false);
      Screen.cursor := crHourGlass;
      listbox1.Items.BeginUpdate;
      while not eof(f) do
      begin
        zeile := '';
        readln(f,zeile);
        upzeile := zeile;
        for i := 1 to Length(upzeile) do upzeile[i] := UpCase(upzeile[i]);
        kurzzeile := zeile;
        if kurzzeile = '#' then
        begin
          if (upzeile <> '#END') then
          begin
            delete(zeile,1,1);
            such := edit1.text;
            suchqual := zeile;
            such := rs_upcase(such);
            suchqual := rs_upcase(suchqual);
            FOR iii := 1 TO LENGTH(Such) DO _Suchwort(iii);

            IF (SuchQual = such) OR (Gefunden = TRUE) THEN
            BEGIN
              try
                listbox1.Items.Add(zeile);
              except
              end
            end;
          end;
        end;
      end;
      listbox1.Items.EndUpdate;
      closefile(f);
      Screen.cursor := crDefault;
      buttonanaus(true);
    end
    else Showmessage('Datei konnte nicht geöffnet werden!');
  end
  else
  begin
    showmessage('Eingabe erforderlich!');
    activecontrol := edit1;
  end;
  Screen.cursor := crDefault;
  buttonanaus(true);
end;

procedure TForm1.AlleDatenstzeanzeigen1Click(Sender: TObject);
var
  tempdatei : string;
begin
  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei;
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  rsx_Stg : String;
begin
  if key = #13 then
  begin
    rsx_Stg := edit1.text;
    rsx_Stg := _Lastleerentf(rsx_Stg);
    if rsx_Stg <> '' Then Datensatzsuchen1Click(form1)
                     else AlleDatenstzeAnzeigen1Click(form1);
    key := #0;
  end;
end;

procedure TForm1.ber1Click(Sender: TObject);
begin
  _xAboutBox.showmodal;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  DatensatzindieZwischenablagekopieren1Click(form1);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Datensatzdrucken1Click(form1);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Datensatzsuchen1Click(form1);
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  AlleDatenstzeanzeigen1Click(form1);
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  ber1Click(form1);
end;



procedure TForm1.Schrift1Click(Sender: TObject);
var
  tempstr : string;
begin
  FontDialog1.Font := memo1.Font;
  if fontdialog1.execute then
  begin
    if fontdialog1.Font.Size < 8 then
    fontdialog1.Font.Size := 8;
    
    if fontdialog1.Font.Size > 14 then
    fontdialog1.Font.Size := 14;

    memo1.font := fontdialog1.font;
    listbox1.Font := fontdialog1.font;
    edit1.Font := fontdialog1.font;

    satz.Schrift := memo1.Font.Name;
    satz.schriftgroesse := memo1.Font.Size;

    tempstr := label10.Caption;
    if AktuelleDatei <> '' then AlleDatenstzeAnzeigen1Click(form1);
    label10.Caption := tempstr;
    IF listbox1.Items.Count > 0 then
    begin
      if (RS_strtoint(label10.caption) > 0) then
      begin
        Listbox1.Selected[strtoint(label10.caption)]:=True;
        ListBox1Click(form1);
      end
      else
      begin
        Listbox1.Selected[0]:=True;
        ListBox1Click(form1);
      end;
    end
    else label10.caption := '-1';
  end;
end;

procedure TForm1.Beenden2Click(Sender: TObject);
begin
  Beenden1Click(form1);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SchreibeDatei(progdir+'HW_Reader.cfg');
end;

procedure TForm1.Hilfe1Click(Sender: TObject);
begin
  ZeigeHilfe(progdir,'HW_Reader.hlp','Bedienoberfläche von  HW Reader');
  RS_Hilfe.ShowModal;
end;

end.
