unit HW_EncryptUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ShlObj, ActiveX, ShellApi, Buttons,
  XPMan;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    XPManifest1: TXPManifest;
    SpeedButton2: TSpeedButton;
    Button7: TButton;
    Button3: TButton;
    SpeedButton4: TSpeedButton;
    Button4: TButton;
    Button5: TButton;
    Panel2: TPanel;
    Button6: TButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  progdir,
  AnwendungsdatenOrdner,
  Dateiname  : string;
  PasswortOk :Boolean;
  EncodeSelection: integer;
  RS_XOR         : Boolean;
  TagAlsZahl     : integer;

implementation

{$R *.dfm}

uses
  RS_Math, RS_Util, LeseKonfig, PASSWORD, xAbout, code, XOR_Methode_,
  Code_Selection;

const
  VerschluesselString = 'HW2#4fggkfg5gjo#+fpdospg#d#556ofdgg2';


function GetSpecialFolder(const AFolder: Integer): String;
var
  ItemIDList: PItemIDList;
  hPath: PChar;
  ShellH: IMalloc;
begin
  if SUCCEEDED(SHGetSpecialFolderLocation(Application.Handle, AFolder, ItemIDList)) then
  begin
    try
      hPath:= StrAlloc(max_path);
      try
        if SHGetPathFromIDList (ItemIDList, hPath) then
          Result:=hPath;
      finally
        StrDispose(hPath);
      end;
    finally
     if SHGetMalloc(ShellH) = NOERROR then
       ShellH.Free(ItemIDList);
    end;
  end
  else
    RaiseLastOSError;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  fehler   : integer;
  RS_tag   : string;
begin
  ProgDir:=ExtractFilePath(ParamStr(0));

  {$I-}
  chdir(progdir);
  {$I+}
  fehler := ioresult;
  if fehler <> 0 then
  begin
    showmessage('Es konnte nicht ins Verzeichnis von HelpWriter '+#10#13+
                'gewechselt werden.'+#10#13+
                'Fehler: '+inttostr(fehler));
  end;

  if RS_HasBackSlash(ProgDir) = false then ProgDir := ProgDir + '\';

  AnwendungsdatenOrdner := '';
  AnwendungsdatenOrdner := GetSpecialFolder(CSIDL_APPDATA);
  AnwendungsdatenOrdner := _LastLeerEntf(AnwendungsdatenOrdner);

  if RS_HasBackSlash(AnwendungsdatenOrdner) = false then
  AnwendungsdatenOrdner := AnwendungsdatenOrdner + '\';

  AnwendungsdatenOrdner := AnwendungsdatenOrdner + 'HelpWriter2';
  CreateDir(AnwendungsdatenOrdner);

  if DirectoryExists(AnwendungsdatenOrdner) = true then
  begin
    if RS_HasBackSlash(AnwendungsdatenOrdner) = false then
    AnwendungsdatenOrdner := AnwendungsdatenOrdner + '\';
  end
  else AnwendungsdatenOrdner := ProgDir;
  //Showmessage(AnwendungsdatenOrdner);

  if xLeseKonfigdatei(progdir+'Konfig.cfg') = false then
  begin
    Showmessage('Konfiguration konnte nicht gelesen werden.'+#10#13+
                'Beenden Sie das Programm und starten Sie HW_Konfig.exe !');

  end;
  if konfigsatz.EigenerOrdnerSpeichern = true then
     AnwendungsdatenOrdner := ProgDir;

  form1.Width := 640;
  form1.Height:= 420;

  memo1.Clear;
  Dateiname := '';
  panel1.Visible := false;
  panel2.Visible := false;
  PasswortOk := false;

  //Für Verschlüsselung
  SetFourDigitYearFormat;
  RS_tag := GebeTag;
  TagAlsZahl := RS_StrToInt(RS_Tag);
  
  WieIstDerCode := '';

  EncodeSelection := 1;
  RS_XOR := true;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Hier_dateiname: string;
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute then
  begin
    Hier_dateiname := OpenDialog1.FileName;
    Hier_dateiname := _Lastleerentf(Hier_dateiname);
    if Hier_dateiname <> '' then
    begin
      if FileExists(Hier_dateiname) = false then
      begin
        showmessage('Datei nicht gefunden!');
        statusbar1.SimpleText := '';
        exit;
      end;
      memo1.Clear;
      try
        memo1.Lines.LoadFromFile(Hier_dateiname);
        statusbar1.SimpleText := Hier_dateiname;
      except
        showmessage('Datei konnte nicht geladen werden!');
        statusbar1.SimpleText := '';
        panel1.Visible := False;
      end;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Hier_dateiname: string;
begin
  saveDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  savedialog1.FileName := statusbar1.SimpleText;
  if saveDialog1.Execute then
  begin
    Hier_dateiname := saveDialog1.FileName;
    Hier_dateiname := _Lastleerentf(Hier_dateiname);
    if Hier_dateiname <> '' then
    begin
      if FileExists(Hier_dateiname) = true then
      begin
        if MessageDlg('Datei besteht bereits, Überschreiben?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        begin
          exit;
        end;
      end;
      try
        panel1.Visible := true;
        application.ProcessMessages;
        memo1.Lines.SaveToFile(Hier_dateiname);
        statusbar1.SimpleText := Hier_dateiname;
        sleep(500);
        panel1.Visible := false;
      except
        showmessage('Datei konnte nicht gespeichert werden!');
        statusbar1.SimpleText := '';
        panel1.Visible := False;
      end;
    end;
  end;
end;

procedure buttonanaus(anaus : Boolean);
begin
  form1.Button1.Enabled := anaus;
  form1.Button2.Enabled := anaus;
  form1.Button3.Enabled := anaus;
  form1.Button4.Enabled := anaus;
  form1.Button5.Enabled := anaus;
  form1.Button6.Enabled := anaus;
  form1.Button7.Enabled := anaus;
  form1.SpeedButton1.Enabled := anaus;
  form1.SpeedButton2.Enabled := anaus;
  form1.SpeedButton3.Enabled := anaus;
  form1.SpeedButton4.Enabled := anaus;

  XOR_Methode.Button1.Enabled := anaus;
  XOR_Methode.Button2.Enabled := anaus;
  XOR_Methode.Button3.Enabled := anaus;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  _xAboutBox.showmodal;
end;


procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  i,
  stepper : integer;
  zeile   : string;
begin
  if memo1.Lines.Count = 0 then
  begin
    showmessage('Es gibt keine Daten zum bearbeiten!');
    exit;
  end;

  if memo1.Lines.Count > 0 then
  begin
    Stepper := 0;
    ProgressBar1.Position := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := (memo1.Lines.Count - 1);
    ProgressBar1.Step := 100;

    for i := 0 to (memo1.Lines.Count - 1) do
    begin
      zeile := memo1.Lines[i];
      Delete(zeile,1,1);
      memo1.Lines[i] := zeile;

      inc(stepper);
      if (stepper = 100) then
      begin
        ProgressBar1.Stepit;
        stepper := 0;
        Application.Processmessages;
      end;
    end;
    Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  //WindowState := wsMinimized;
  close;
  application.Terminate;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  passwortok := false;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  xor_Methode.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i,
  stepper  : integer;
  tag      : String[2];
begin
  if memo1.Lines.Count = 0 then
  begin
    showmessage('Es gibt keine Daten zum bearbeiten!');
    exit;
  end;

  if PasswortOk = false then
  begin
    if xPasswortLeseDatei(AnwendungsdatenOrdner+'key.cfg') = true then
    begin
      WieIstDasPasswort := '';
      PasswordDlg.password.Text := '';
      passDialogAbbrechen := false;
      PasswordDlg.ActiveControl := PasswordDlg.Password;
      PasswordDlg.showmodal;
      if passDialogAbbrechen = true then exit;
  
      WieIstDasPasswort := _LastLeerEntf(WieIstDasPasswort);
  
      if WieIstDasPasswort = TextDekodieren2(31,Passwortsatz.Neuespasswort) then
      begin
        PasswortOk := true;
      end
      else showmessage('Passwort ist nicht korrekt!');
    end
    else showmessage('Es ist ein Fehler aufgetreten, Aktion kann nicht ausgeführt werden!');
  end;


  //WieIstDerCode wird beim Programmstart auf '' gesetzt.
  if PasswortOk = true then
  begin
    if WieIstDerCode = '' then
    begin
      codedlg.Password.Text := WieIstDerCode;
      codedlg.Edit1.Text := codedlg.Password.Text;
      codedlg.ActiveControl := codedlg.Password;
      codedlg.ShowModal;
      WieIstDerCode := _LastLeerEntf(WieIstDerCode);
      if WieIstDerCode = '' then
      begin
        showmessage('Um einen Datensatz zu verschlüsseln muß ein Code eingegeben werden!'+#10#13+
                    'Zum entschlüsseln muß der gleiche Code eingegeben werden, sonst'+#10#13+
                    'kann der Datensatz nicht entschlüsselt werden!');
        exit;
      end;
    end;
  end;


  if PasswortOk = true then
  begin
    application.ProcessMessages;
  
    buttonanaus(false);
    Screen.cursor := crHourGlass;

    if memo1.Lines.Count > 0 then
    begin
      Stepper := 0;
      ProgressBar1.Position := 0;
      ProgressBar1.Min := 0;
      ProgressBar1.Max := (memo1.Lines.Count - 1);
      ProgressBar1.Step := 100;

      Inc(TagAlsZahl);
      if TagAlsZahl > 30 then TagAlsZahl := 1;
      Tag := RS_IntToStr(TagAlsZahl);
      Tag := _FillStrVorne(Tag,2,' ');

      //Abfrage welche Verschlüsselung entfällt
      (*
      if EncodeSelection = 0 then CodeSelection.RadioButton1.Checked := true;
      if EncodeSelection = 1 then CodeSelection.RadioButton2.Checked := true;
      if RS_XOR = true then CodeSelection.CheckBox1.Checked := true
                       else CodeSelection.CheckBox1.Checked := false;
      CodeSelection.ShowModal;
      *)
      EncodeSelection := 1; //Für Wirbel
      RS_XOR := true; //Für ja mit XOR

      panel2.Visible := true;
      panel2.Caption := 'Verschlüsselung läuft...';
      application.ProcessMessages;

      for i := 0 to (memo1.Lines.Count - 1) do
      begin
        Case EncodeSelection of
          0 : memo1.Lines[i] := VerschiebeVerschlpos(memo1.Lines[i],WieIstDerCode);
          1 : memo1.Lines[i] := VerschldurchTausch(memo1.Lines[i],true,WieIstDerCode);//vorwärts
        else
          begin
            Showmessage('Fehler in der Verschlüsselungsauswahl.'+#10#13+
                        'Verschlüsselung fehlgeschlagen !');
            exit;
          end;
        end;

        IF RS_XOR = true then
        memo1.Lines[i] := TextKodieren2(TagAlsZahl,memo1.Lines[i]);

        //Damit keine # am Anfang steht;
        //memo1.Lines[i] := '-' + memo1.Lines[i];
        
        inc(stepper);
        if (stepper = 100) then
        begin
          ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
      end;
      panel2.Visible := false;

      //Schlüsselstring als obersten anhängen
      memo1.Lines.Insert(0,
              TextKodieren2(TagAlsZahl,Verschluesselstring)+Tag+
              TextKodieren2(TagAlsZahl,'fmgmslkg+#elkfs'));
      memo1.Lines[0] := '-'+ memo1.Lines[0];

      Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
    end;
  
    ProgressBar1.Position := 0;
  
    Screen.cursor := crDefault;
    buttonanaus(true);
  end;
end;


procedure TForm1.Button5Click(Sender: TObject);
var
  i,
  zahl,
  stepper  : integer;
  zeile    : string;
  tag      : String[2];
begin
  if memo1.Lines.Count = 0 then
  begin
    showmessage('Es gibt keine Daten zum bearbeiten!');
    exit;
  end;

  if PasswortOk = false then
  begin
    if xPasswortLeseDatei(AnwendungsdatenOrdner+'key.cfg') = true then
    begin
      WieIstDasPasswort := '';
      PasswordDlg.password.Text := '';
      passDialogAbbrechen := false;
      PasswordDlg.ActiveControl := PasswordDlg.Password;
      PasswordDlg.showmodal;
      if passDialogAbbrechen = true then exit;
  
      WieIstDasPasswort := _LastLeerEntf(WieIstDasPasswort);
  
      if WieIstDasPasswort = TextDekodieren2(31,passwortsatz.Neuespasswort) then
      begin
        PasswortOk := true;
      end
      else showmessage('Passwort ist nicht korrekt!');
    end
    else showmessage('Es ist ein Fehler aufgetreten, Aktion kann nicht ausgeführt werden!');
  end;


  //WieIstDerCode wird beim Programmstart auf '' gesetzt.
  if PasswortOk = true then
  begin
    if WieIstDerCode = '' then
    begin
      codedlg.Password.Text := WieIstDerCode;
      codedlg.Edit1.Text := codedlg.Password.Text;
      codedlg.ActiveControl := codedlg.Password;
      codedlg.ShowModal;
      WieIstDerCode := _LastLeerEntf(WieIstDerCode);
      if WieIstDerCode = '' then
      begin
        showmessage('Um einen Datensatz zu verschlüsseln muß ein Code eingegeben werden!'+#10#13+
                    'Zum entschlüsseln muß der gleiche Code eingegeben werden, sonst'+#10#13+
                    'kann der Datensatz nicht entschlüsselt werden!');
        exit;
      end;
    end;
  end;


  if PasswortOk = true then
  begin
    application.ProcessMessages;
  
    buttonanaus(false);
    Screen.cursor := crHourGlass;
  
    if memo1.Lines.Count > 0 then
    begin
      Stepper := 0;
      ProgressBar1.Position := 0;
      ProgressBar1.Min := 0;
      ProgressBar1.Max := (memo1.Lines.Count - 1);
      ProgressBar1.Step := 100;

      zeile := memo1.Lines[0];
      Delete(zeile,1,1);  //Minuszeichen entfernen
      Delete(zeile,1,36);
      tag := Zeile;
      Tag := _AlleLeerEntf(Tag);

      Zahl := RS_StrToInt(tag);

      //Abfrage welche Verschlüsselung entfällt
      (*
      if EncodeSelection = 0 then CodeSelection.RadioButton1.Checked := true;
      if EncodeSelection = 1 then CodeSelection.RadioButton2.Checked := true;
      if RS_XOR = true then CodeSelection.CheckBox1.Checked := true
                       else CodeSelection.CheckBox1.Checked := false;
      CodeSelection.ShowModal;
      *)
      EncodeSelection := 1; //Für Wirbel
      RS_XOR := true; //Für ja mit XOR

      //Verschlüsselungsstring wieder entfernen
      memo1.Lines.Delete(0);

      panel2.Visible := true;
      panel2.Caption := 'Entschlüsselung läuft...';
      application.ProcessMessages;

      for i := 0 to (memo1.Lines.Count - 1) do
      begin
        //Minuszeichen wieder entfernen
        (*zeile := memo1.Lines[i];
        delete(zeile,1,1);
        memo1.Lines[i] := zeile;*)

        if RS_XOR = true then
        memo1.Lines[i] := TextDekodieren2(zahl,memo1.Lines[i]);

        case EncodeSelection of
          0: memo1.Lines[i] := VerschiebeVerschlneg(memo1.Lines[i],WieIstDerCode);
          1: memo1.Lines[i] := VerschldurchTausch(memo1.Lines[i],false,WieIstDerCode);//rückwärts
          else
          Begin
            Showmessage('Fehler bei der Entschlüsselungsauswahl.'+#10#13+
                        'Entschlüsselung fehlgeschlagen !');
            exit;
          end;
        end;

        inc(stepper);
        if (stepper = 100) then
        begin
          ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
      end;
      panel2.Visible := false;

      Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
    end;
  
    ProgressBar1.Position := 0;
  
    Screen.cursor := crDefault;
    buttonanaus(true);
  end;
end;



procedure TForm1.Button6Click(Sender: TObject);
begin
  WieistDerCode := '';
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  i,
  stepper : integer;

begin
  if memo1.Lines.Count = 0 then
  begin
    showmessage('Es gibt keine Daten zum bearbeiten!');
    exit;
  end;

  if memo1.Lines.Count > 0 then
  begin
    Stepper := 0;
    ProgressBar1.Position := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := (memo1.Lines.Count - 1);
    ProgressBar1.Step := 100;

    for i := 0 to (memo1.Lines.Count - 1) do
    begin
      memo1.Lines[i] := '-' + memo1.Lines[i];

      inc(stepper);
      if (stepper = 100) then
      begin
        ProgressBar1.Stepit;
        stepper := 0;
        Application.Processmessages;
      end;
    end;
    Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
  end;
end;

end.
