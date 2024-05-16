unit NeuerDatensatz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2 : TForm2;

procedure AllesVorbereitenForm2(_Dateiname,
                                Arbeitsverzeichnis,
                                FormularVerzeichnis,
                                RSAnwendungsdatenOrdner,
                                _AnzDatensatz : string);

implementation

uses Unit1, RS_Math, RS_Util, Hilfe;

{$R *.dfm}

Const HW_maxDatensatz : integer = 50000;

Type Datensatz = Record
       oben,
       links,
       beite,
       hoehe         : integer;
       TabAn,
       Zeilenumbruch : Boolean;
     end;

Var
  Form2AnzDatensatz : integer;
  Form2AnwendungsdatenOrdner,
  Formulardateiname,
  Form2ProgDir,
  Form2FormularVerzeichnis,
  Form2Dateiname : string;
  Datei          : File of Datensatz;
  satz           : Datensatz;


procedure DatensatzStandard;
begin
  satz.oben := 0;
  satz.links := 0;
  satz.beite := 600;
  satz.hoehe := 440;
  satz.TabAn := false;
  satz.Zeilenumbruch := false;
end;

procedure Dateicheck(Form2Dateiname : string);
var
  fehler : integer;
  mld    : string;
begin
  mld := 'Datei "'+Form2Dateiname+'" wurde nicht gefunden.'+#10#13+#10#13+
         'Datei wird neu erstellt!';
    
  if not FileExists(Form2Dateiname) then
  begin
    MessageDlg(mld, mtInformation, [mbOk], 0);
    assignfile(datei,Form2Dateiname);
    {$I-}
    REWRITE(datei);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      DatensatzStandard;
      {$I-}
      Write(datei,satz);
      {$I+}
      Fehler := IoResult;
      if (fehler <> 0) then
      begin
        showmessage('In Datei "'+Form2Dateiname+ '" konnte nicht geschrieben werden!');
      end;
      {$I-}
      closefile(datei);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+Form2Dateiname+'" konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      DatensatzStandard;
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht erzeugt werden.');
    end
  end
end;

procedure LeseDatei(Form2Dateiname : string);
var
  fehler : integer;
Begin
  AssignFile(datei,Form2Dateiname);
  {$I-}
  reset(datei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    Read(datei,satz);
    {$I+}
    Fehler := IoResult;
    if (fehler <> 0) then
    begin
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht gelesen werden!');
      DatensatzStandard
    end;
    {$I-}
    closefile(datei);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht geschlossen werden!');
      DatensatzStandard;
    end;
  end
  else
  begin
    DatensatzStandard;
    showmessage('Datei "'+Form2Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;

procedure SchreibeDatei(Form2Dateiname : string);
var
  fehler : integer;
Begin
  AssignFile(datei,Form2Dateiname);
  {$I-}
  Rewrite(datei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    satz.oben := form2.Top;
    satz.links := form2.Left;
    satz.beite := form2.Width;
    satz.hoehe := form2.Height;

    if form2.CheckBox1.Checked = true
    then satz.TabAn := true
    else satz.TabAn := false;

    if form2.CheckBox2.Checked = true
    then satz.Zeilenumbruch := true
    else satz.Zeilenumbruch := false;

    {$I-}
    Write(datei,satz);
    {$I+}
    Fehler := IoResult;
    if (fehler <> 0) then
    begin
      showmessage('In Datei "'+Form2Dateiname+'" konnte nicht geschrieben werden!');
    end;
    {$I-}
    closefile(datei);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    showmessage('Datei "'+Form2Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;

procedure Positionen;
begin
  with form2 do
  begin
    form2.Top := satz.oben;
    form2.Left := satz.links;
    form2.Width:= satz.beite;
    form2.Height:=satz.hoehe;

    edit1.Width := form2.Width-150;
    form2.progressbar1.Left := form2.Width-170;

  end;
end;

procedure AllesVorbereitenForm2(_Dateiname,
                                Arbeitsverzeichnis,
                                FormularVerzeichnis,
                                RSAnwendungsdatenOrdner,
                                _AnzDatensatz : string);
begin
  form2Dateiname := _Dateiname;
  Form2ProgDir := Arbeitsverzeichnis;
  Form2FormularVerzeichnis := FormularVerzeichnis;
  Form2AnwendungsdatenOrdner := RSAnwendungsdatenOrdner;

  Dateicheck(Form2AnwendungsdatenOrdner+'HelpWriter2.cfg');
  LeseDatei(Form2AnwendungsdatenOrdner+'HelpWriter2.cfg');
  
  Positionen;
  form2.checkbox1.Checked := satz.TabAn;
  form2.CheckBox2.Checked := satz.Zeilenumbruch;

  if form2.checkbox1.Checked = true then form2.memo1.WantTabs := true
                                    else form2.memo1.WantTabs := false;
  if form2.checkbox2.Checked = true then
  begin
    form2.Memo1.ScrollBars := ssVertical;
    form2.memo1.WordWrap := true
  end
  else
  begin
    form2.Memo1.ScrollBars := ssBoth;
    form2.memo1.WordWrap := false;
  end;

  _AnzDatensatz := _AlleLeerEntf(_Anzdatensatz);
  if _AnzDatensatz <> '' Then
  Form2AnzDatensatz := RS_StrToInt(_AnzDatensatz)
  else Form2AnzDatensatz := 0;
  form2.Panel1.Caption := '';
  form2.panel1.Caption := ' Anzahl Datensätze in der Datenbank: '+
                          inttostr(Form2AnzDatensatz)+
                          '     max: '+inttostr(HW_maxDatensatz);

  Formulardateiname := '';
  form2.memo1.Clear;
  form2.edit1.Clear;
  form2.statusbar1.SimpleText := form2Dateiname;
  form2.ActiveControl := form2.Edit1;
  form2.Edit1.Font := form1.Memo1.Font;
  form2.Memo1.Font := form1.Memo1.Font;
end;


procedure TForm2.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure ButtonAnAus(anaus : Boolean);
begin
  form2.button1.Enabled := anaus;
  form2.button2.Enabled := anaus;
  form2.button3.Enabled := anaus;
  form2.Edit1.Enabled := anaus;
  form2.CheckBox1.Enabled := anaus;
  form2.CheckBox2.Enabled := anaus;
end;


function ExistDatensatz(Dateiname, Datensatz : string) : Boolean;
VAR
  f                 : textfile;
  Stepper,
  fehler            : integer;
  TempZeile,
  zeile             : String;
begin
  ExistDatensatz := false;
  Datensatz := _LastLeerEntf(Datensatz);
  if Datensatz = '' then
  Begin
    Showmessage('Eingabefeld ist leer!');
    form2.ActiveControl := form2.edit1;
    exit;
  end;
  Dateiname := _LastLeerEntf(Dateiname);
  if Dateiname = '' then
  begin
    Showmessage('Kein gültiger Dateiname!'+#10#13+Dateiname);
    exit;
  end;
  Stepper := 0;
  form2.ProgressBar1.Position := 0;
  form2.ProgressBar1.Min := 0;
  form2.ProgressBar1.Max := RS_StrToInt(form1.label9.caption);
  form2.ProgressBar1.Step := 500;
  AssignFile(f,Dateiname);
  {$I-}
  reset(f);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    ButtonAnAus(false);
    Screen.cursor := crHourGlass;
    Datensatz := '#'+Datensatz;

    while not eof(f)do
    begin
      inc(stepper);
      if (stepper = 500) then
      begin
        form2.ProgressBar1.Stepit;
        application.ProcessMessages;
        stepper := 0;
      end;
      zeile := '';
      Readln(f,zeile);
      Tempzeile := zeile;
      Tempzeile := RS_upcase(Tempzeile);
      Datensatz := RS_Upcase(Datensatz);
      if (Datensatz = Tempzeile) then
      begin
        ExistDatensatz := true;
      end;
    end;
    Screen.cursor := crDefault;
    form2.progressbar1.Position := 0;
    ButtonAnAus(true);
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

function DatensatzSpeichern : Boolean;
var
  f,f3   : textfile;
  //i,
  fehler : integer;
  RS_Stg01,
  RS_Stg02  : String[20];
  zeile2,
  ListboxString : string;

begin
  //wegen Datum und Uhrzeit beim speichern (Doppelter Datensatz)
  Sleep(500);

  DatensatzSpeichern := false;
  AssignFile(f,form2Dateiname);
  {$I-}
  append(f);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    ListboxString := form2.Edit1.Text;
    //FillStrHinten 100 weil Edit1 maxlength = 100
    ListboxString := _FillStrHinten(ListboxString,100,' ');
    RS_Stg01 := (DateToStr(Date));
    RS_Stg02 := (TimeToStr(Time));
    ListboxString := ListboxString+' '+RS_Stg01+' '+RS_Stg02;

    {$I-}
    writeln(f,'#'+ListboxString);
    {$I+}
    if ioresult <> 0 then begin end;

    //HelpWriterTempFile2 wird in der folge procedure erstellt!!!
    AssignFile(f3,Form2ProgDir+HelpWriterTempFile2);
    {$I-}
    reset(f3);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      {$I-}
      while not eof(f3) do
      begin
        readln(f3,zeile2);
        zeile2 := VorneRauteEntf(zeile2);
        Writeln(f,zeile2);
      end;
      {$I+}
      if ioresult <> 0 then
      begin
        Screen.cursor := crDefault;
        buttonanaus(true);
        Showmessage('Kritischer Fehler: Es konnte nicht in eine Datei '+
                    'geschrieben werden!'+#10#13+
                    'Die Originaldatei ist noch intakt.'+#10#13+
                    'Procedure wird beendet.');
        //Dateien noch schließen bevor Prog beendet wird!!!
        {$I-}
        closefile(f);
        closefile(f3);
        {$I+}
        if ioresult <> 0 then begin end;
        Exit;
      end;
      {$I-}
      closefile(f3);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei '+Form2ProgDir+HelpWriterTempFile2+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+Form2ProgDir+HelpWriterTempFile2+
                  ' konnte nicht geöffnet werden!');
    end;
    //Ende Datei(F3)

    {$I-}
    writeln(f,'#END');
    {$I+}
    Fehler := IoResult;
    if fehler = 0 then DatensatzSpeichern := true
                  else showmessage('In Datei konnte nicht geschrieben werden!'+#10#13+
                                   'Fehler : '+inttostr(fehler));

    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    showmessage('Datei konnte nicht geöffnet werden!');
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if (Form2AnzDatensatz >= HW_maxDatensatz) then
  begin
    Showmessage('Die maximale Anzahl an Datensätzen ist erreicht.'+#10#13+
                'Bitte erstellen Sie eine neue Datenbank.');
    Exit;
  end;
  
  edit1.Text := _LastLeerEntf(edit1.Text);
  if Edit1.Text = '' then
  Begin
    Showmessage('Eingabefeld erforderlich!');
    ActiveControl := edit1;
    exit;
  end;
  Edit1.Text := VorneRauteEntf(Edit1.Text);
  if ExistDatensatz(form2Dateiname,edit1.Text) = false then
  begin
    try
      memo1.Lines.SaveToFile(Form2ProgDir+HelpWriterTempFile2);
    except
      Showmessage('Es konnte nicht auf den Datenträger '+
                  'geschrieben werden!'+#10#13+
                  'Vorgang wird beendet.');
      exit;
    end;

    //jetzt speichern
    if DatensatzSpeichern = true then
    begin
      edit1.Clear;
      memo1.Clear;
      activecontrol := edit1;
      inc(Form2AnzDatensatz);
      form2.panel1.Caption := ' Anzahl Datensätze in der Datenbank: '+
                               inttostr(Form2AnzDatensatz)+
                              '     max: '+inttostr(HW_maxDatensatz);
      if (checkbox3.Checked = true) and (Formulardateiname <> '') then
      begin
        try
          memo1.Lines.LoadFromFile(Formulardateiname);
          Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
        except
          showmessage('Formular kann nicht geladen werden!');
        end;
      end;
    end;
  end
  else Showmessage('Datensatz mit dieser Bezeichnung existiert bereits,'+#10#13+
                   'es wird nicht gespeichert!');
  If DeleteFile(Form2ProgDir+HelpWriterTempFile2) = false then
  Showmessage('Temporäre Datei: '+#10#13+Form2ProgDir+HelpWriterTempFile2+#10#13+
              'konnte nicht gelöscht werden !');
end;

procedure TForm2.FormResize(Sender: TObject);
begin
  form2.progressbar1.Left := form2.Width-170;
  edit1.Width := form2.Width-180;
  button2.Left := (form2.GroupBox2.Width div 2)-115;
  button1.Left := button2.Left-130;
  button3.Left := button2.Left+210;
  speedbutton5.left := button2.Left+340;
  speedbutton1.left := form2.Width-150;
  speedbutton2.left := form2.Width-120;
  speedbutton3.left := form2.Width-90;
  speedbutton4.left := form2.Width-60;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SchreibeDatei(Form2AnwendungsdatenOrdner+'HelpWriter2.cfg');
   checkbox3.Checked := false;
   Formulardateiname := '';
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if form2.checkbox1.Checked = true then form2.memo1.WantTabs := true
                                    else form2.memo1.WantTabs := false;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  if form2.checkbox2.Checked = true then
  begin
    form2.Memo1.ScrollBars := ssVertical;
    form2.memo1.WordWrap := true
  end
  else
  begin
    form2.Memo1.ScrollBars := ssBoth;
    form2.memo1.WordWrap := false;
  end;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
  if checkbox3.Checked = true then
  begin
    if MessageDlg('Text wird gelöscht, möchten Sie fortfahren?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      checkbox3.Checked := false;
      exit;
    end;
    if Form2FormularVerzeichnis <> '' then
    OpenDialog1.InitialDir := Form2FormularVerzeichnis
    else OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);

    if OpenDialog1.Execute then
    begin
      Formulardateiname := OpenDialog1.FileName;
      Formulardateiname := _Lastleerentf(Formulardateiname);
      if Formulardateiname <> '' then
      begin
        try
          memo1.clear;
          memo1.Lines.LoadFromFile(Formulardateiname);
          Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
        except
          showmessage('Formular kann nicht geladen werden!');
        end;
      end;
    end
    else checkbox3.Checked := false;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if (Form2AnzDatensatz >= HW_maxDatensatz) then
  begin
    Showmessage('Die maximale Anzahl an Datensätzen ist erreicht.'+#10#13+
                'Bitte erstellen Sie eine neue Datenbank.');
    Exit;
  end;

  edit1.Text := _LastLeerEntf(edit1.Text);
  if Edit1.Text = '' then
  Begin
    Showmessage('Eingabefeld erforderlich!');
    ActiveControl := edit1;
    exit;
  end;
  Edit1.Text := VorneRauteEntf(Edit1.Text);
  if ExistDatensatz(form2Dateiname,edit1.Text) = false then
  begin
    try
      memo1.Lines.SaveToFile(Form2ProgDir+HelpWriterTempFile2);
    except
      Showmessage('Es konnte nicht auf den Datenträger '+
                  'geschrieben werden!'+#10#13+
                  'Vorgang wird beendet.');
      exit;
    end;

    //jetzt speichern
    if DatensatzSpeichern = true then
    begin
      If DeleteFile(Form2ProgDir+HelpWriterTempFile2) = false then
      Showmessage('Temporäre Datei: '+#10#13+Form2ProgDir+HelpWriterTempFile2+#10#13+
                  'konnte nicht gelöscht werden !');
      edit1.Clear;
      memo1.Clear;
      checkbox3.Checked := false;
      close;
    end;
  end
  else Showmessage('Datensatz mit dieser Bezeichnung existiert bereits,'+#10#13+
                   'es wird nicht gespeichert!');
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelText := (DateToStr(Date));
  memo1.SelText := ' ';
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelText := (TimeToStr(Time));
  memo1.SelText := ' ';
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelectAll;
  memo1.CopyToClipboard;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.PasteFromClipboard;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  ZeigeHilfe(Form2AnwendungsdatenOrdner,'HelpWriter.hlp','Neuen Datensatz erstellen');
  RS_Hilfe.ShowModal;
end;

end.
