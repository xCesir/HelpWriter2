unit NeuerDatensatz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask;

type
  TForm2 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Geburtstag: TLabel;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    MaskEdit1: TMaskEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton5Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure LabeledEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit12KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
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

uses Adress, RS_Math, RS_Util, Hilfe;

{$R *.dfm}

Const HW_maxDatensatz : integer = 50000;

Type Datensatz = Record
       oben,
       links,
       beite,
       hoehe         : integer;
       TabAn         : Boolean;
     end;

Var
  Form2AnzDatensatz : integer;
  AnwendungsdatenOrdner,
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
  satz.hoehe := 570;
  satz.TabAn := false;
end;

procedure Dateicheck(Form2Dateiname : string);
var
  fehler : integer;
  mld    : string;
begin
  mld := 'Datei "'+Form2Dateiname+'" nicht gefunden.'+#10#13+#10#13+
         'Datei wird erstellt!';
    
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
    showmessage('Datei "'+Form2Dateiname+'" konnte nicht erzeugt werden!');
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

    form2.progressbar1.Left := form2.Width-170;
  end;
end;

procedure LoescheAlleEingabefelder;
begin
  with form2 do
  begin
    memo1.Clear;
    LabeledEdit2.Text := '';
    LabeledEdit3.Text := '';
    LabeledEdit4.Text := '';
    LabeledEdit5.Text := '';
    LabeledEdit6.Text := '';
    LabeledEdit7.Text := '';
    LabeledEdit8.Text := '';
    LabeledEdit9.Text := '';
    LabeledEdit10.Text := '';
    LabeledEdit11.Text := '';
    LabeledEdit12.Text := '';
    MaskEdit1.Text := '';
    LabeledEdit14.Text := '';
  end;
end;

procedure AllesVorbereitenForm2(_Dateiname,
                                Arbeitsverzeichnis,
                                FormularVerzeichnis,
                                RSAnwendungsdatenOrdner,
                                _AnzDatensatz : string);
begin
  AnwendungsdatenOrdner := RSAnwendungsdatenOrdner;

  form2Dateiname := _Dateiname;
  Form2ProgDir := Arbeitsverzeichnis;
  Form2FormularVerzeichnis := FormularVerzeichnis;

  Dateicheck(AnwendungsdatenOrdner+'HW_Adress.cfg');
  LeseDatei(AnwendungsdatenOrdner+'HW_Adress.cfg');

  Positionen;
  form2.checkbox1.Checked := satz.TabAn;

  if form2.checkbox1.Checked = true then form2.memo1.WantTabs := true
                                    else form2.memo1.WantTabs := false;

  _AnzDatensatz := _AlleLeerEntf(_Anzdatensatz);
  if _AnzDatensatz <> '' Then
  Form2AnzDatensatz := RS_StrToInt(_AnzDatensatz)
  else Form2AnzDatensatz := 0;
  form2.Panel1.Caption := '';
  form2.panel1.Caption := ' Anzahl Datensätze in der Datenbank: '+
                          inttostr(Form2AnzDatensatz)+
                          '     max: '+inttostr(HW_maxDatensatz);

  Formulardateiname := '';
  
  loescheAlleEingabefelder;

  form2.statusbar1.SimpleText := form2Dateiname;
  form2.PageControl1.ActivePage := form2.TabSheet1;
  form2.ActiveControl := form2.LabeledEdit2;

  form2.Memo1.Font := form1.Memo1.Font;
  form2.LabeledEdit2.Font := form2.Memo1.Font;
  form2.LabeledEdit3.font := form2.Memo1.Font;
  form2.LabeledEdit4.font := form2.Memo1.Font;
  form2.LabeledEdit5.font := form2.Memo1.Font;
  form2.LabeledEdit6.font := form2.Memo1.Font;
  form2.LabeledEdit7.font := form2.Memo1.Font;
  form2.LabeledEdit8.font := form2.Memo1.Font;
  form2.LabeledEdit9.font := form2.Memo1.Font;
  form2.LabeledEdit10.font := form2.Memo1.Font;
  form2.LabeledEdit11.font := form2.Memo1.Font;
  form2.LabeledEdit12.font := form2.Memo1.Font;
  form2.Maskedit1.Font := form2.Memo1.Font;
  form2.LabeledEdit14.font := form2.Memo1.Font;
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
  form2.CheckBox1.Enabled := anaus;
  form2.CheckBox3.Enabled := anaus;
  form2.SpeedButton1.Enabled := anaus;
  form2.SpeedButton2.Enabled := anaus;
  form2.SpeedButton3.Enabled := anaus;
  form2.SpeedButton4.Enabled := anaus;
  form2.SpeedButton5.Enabled := anaus;
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
    Showmessage('Eingabe erforderlich!');
    form2.PageControl1.ActivePage := form2.TabSheet1;
    form2.ActiveControl := form2.LabeledEdit2;
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
        stepper := 0;
        application.ProcessMessages;
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
  f, f3  : textfile;
  //i,
  fehler : integer;
  zeile2,
  Murxzeile,
  Murxzeile2 : string;
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
    Murxzeile := '';
    Murxzeile2 := '';
    Murxzeile := form2.LabeledEdit2.Text+' '+form2.LabeledEdit3.Text;
    Murxzeile := _FillStrHinten(Murxzeile,101,' ');
    Murxzeile2 := (DateToStr(Date));
    Murxzeile2 := Murxzeile2 + ' ';
    Murxzeile := Murxzeile + Murxzeile2;
    Murxzeile2 := (TimeToStr(Time));
    Murxzeile := Murxzeile + Murxzeile2;
    {$I-}
    writeln(f,'#'+Murxzeile);

    writeln(f,form2.LabeledEdit2.text);
    writeln(f,form2.LabeledEdit3.text);
    writeln(f,form2.LabeledEdit4.text);
    writeln(f,form2.LabeledEdit5.text);
    writeln(f,form2.LabeledEdit6.text);
    writeln(f,form2.LabeledEdit7.text);
    writeln(f,form2.LabeledEdit8.text);
    writeln(f,form2.LabeledEdit9.text);
    writeln(f,form2.LabeledEdit10.text);
    writeln(f,form2.LabeledEdit11.text);
    writeln(f,form2.LabeledEdit12.text);
    writeln(f,form2.MaskEdit1.text);
    writeln(f,form2.LabeledEdit14.text);
    {$I+}
    if ioresult <> 0 then begin end;

    AssignFile(f3,Form2ProgDir+HW_AdressTempFile2);
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
        if IoResult <> 0 then begin end;
        Exit;
      end;
      {$I-}
      closefile(f3);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei '+Form2ProgDir+HW_AdressTempFile2+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+form2ProgDir+HW_AdressTempFile2+
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

  LabeledEdit2.Text := _LastLeerEntf(LabeledEdit2.Text);
  if LabeledEdit2.Text = '' then
  Begin
    Showmessage('Eingabe erforderlich!');
    pagecontrol1.ActivePage := Tabsheet1;
    ActiveControl := LabeledEdit2;
    exit;
  end;

  LabeledEdit2.Text := VorneRauteEntf(LabeledEdit2.Text);
  LabeledEdit3.Text := VorneRauteEntf(LabeledEdit3.Text);
  LabeledEdit4.Text := VorneRauteEntf(LabeledEdit4.Text);
  LabeledEdit5.Text := VorneRauteEntf(LabeledEdit5.Text);
  LabeledEdit6.Text := VorneRauteEntf(LabeledEdit6.Text);
  LabeledEdit7.Text := VorneRauteEntf(LabeledEdit7.Text);
  LabeledEdit8.Text := VorneRauteEntf(LabeledEdit8.Text);
  LabeledEdit9.Text := VorneRauteEntf(LabeledEdit9.Text);
  LabeledEdit10.Text := VorneRauteEntf(LabeledEdit10.Text);
  LabeledEdit11.Text := VorneRauteEntf(LabeledEdit11.Text);
  LabeledEdit12.Text := VorneRauteEntf(LabeledEdit12.Text);
  Maskedit1.Text := VorneRauteEntf(maskedit1.Text);
  LabeledEdit14.Text := VorneRauteEntf(LabeledEdit14.Text);

  if ExistDatensatz(form2Dateiname,LabeledEdit2.Text) = false then
  begin
    try
      memo1.Lines.SaveToFile(Form2progdir+HW_AdressTempFile2);
    except
      Showmessage('Es konnte nicht auf den Datenträger geschrieben werden.'+
                  #10#13+'Speichern wird beendet!');
      exit;
    end;

    //jetzt speichern
    if DatensatzSpeichern = true then
    begin
      LoescheAlleEingabefelder;
      form2.PageControl1.ActivePage := form2.TabSheet1;
      activecontrol := LabeledEdit2;
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
  If DeleteFile(Form2ProgDir+HW_AdressTempFile2) = false then
  Showmessage('Temporäre Datei: '+#10#13+Form2ProgDir+HW_AdressTempFile2+#10#13+
              'konnte nicht gelöscht werden !');
end;

procedure TForm2.FormResize(Sender: TObject);
begin
  form2.progressbar1.Left := form2.Width-170;
  button2.Left := (form2.GroupBox2.Width div 2)-105;
  button1.Left := button2.Left-130;
  button3.Left := button2.Left+210;
  speedbutton5.Left := button2.Left+340;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SchreibeDatei(AnwendungsdatenOrdner+'HW_Adress.cfg');
   checkbox3.Checked := false;
   Formulardateiname := '';
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if form2.checkbox1.Checked = true then form2.memo1.WantTabs := true
                                    else form2.memo1.WantTabs := false;
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

  LabeledEdit2.Text := _LastLeerEntf(LabeledEdit2.Text);
  if LabeledEdit2.Text = '' then
  Begin
    Showmessage('Eingabe erforderlich!');
    form2.PageControl1.ActivePage := form2.TabSheet1;
    ActiveControl := LabeledEdit2;
    exit;
  end;

  LabeledEdit2.Text := VorneRauteEntf(LabeledEdit2.Text);
  LabeledEdit3.Text := VorneRauteEntf(LabeledEdit3.Text);
  LabeledEdit4.Text := VorneRauteEntf(LabeledEdit4.Text);
  LabeledEdit5.Text := VorneRauteEntf(LabeledEdit5.Text);
  LabeledEdit6.Text := VorneRauteEntf(LabeledEdit6.Text);
  LabeledEdit7.Text := VorneRauteEntf(LabeledEdit7.Text);
  LabeledEdit8.Text := VorneRauteEntf(LabeledEdit8.Text);
  LabeledEdit9.Text := VorneRauteEntf(LabeledEdit9.Text);
  LabeledEdit10.Text := VorneRauteEntf(LabeledEdit10.Text);
  LabeledEdit11.Text := VorneRauteEntf(LabeledEdit11.Text);
  LabeledEdit12.Text := VorneRauteEntf(LabeledEdit12.Text);
  Maskedit1.Text := VorneRauteEntf(maskedit1.Text);
  LabeledEdit14.Text := VorneRauteEntf(LabeledEdit14.Text);

  if ExistDatensatz(form2Dateiname,LabeledEdit2.Text) = false then
  begin
    try
      memo1.Lines.SaveToFile(Form2progdir+HW_AdressTempFile2);
    except
      Showmessage('Es konnte nicht auf den Datenträger geschrieben werden.'+
                  #10#13+'Speichern wird beendet!');
      exit;
    end;

    //jetzt speichern
    if DatensatzSpeichern = true then
    begin
      If DeleteFile(Form2ProgDir+HW_AdressTempFile2) = false then
      Showmessage('Temporäre Datei: '+#10#13+Form2ProgDir+HW_AdressTempFile2+#10#13+
                  'konnte nicht gelöscht werden !');
                  
      LoescheAlleEingabefelder;
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

procedure TForm2.LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit8KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit9KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit10KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit12KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm2.LabeledEdit14KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    //Perform(WM_NEXTDLGCTL, 0, 0);
    pagecontrol1.ActivePage := Tabsheet2;
    ActiveControl := memo1;
    key := #0;
  end;
end;

procedure TForm2.MaskEdit1Exit(Sender: TObject);
begin
  maskedit1.Text := RS_DelKomma(maskedit1.Text);
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  ZeigeHilfe(AnwendungsdatenOrdner,'HW_Adress.hlp','Neuen Datensatz erstellen');
  RS_Hilfe.ShowModal;
end;

end.
