unit KonfigUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShlObj, ActiveX, ShellApi, Filectrl, XPMan, Mask,
  Registry;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    Label5: TLabel;
    Button3: TButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Button4: TButton;
    Button5: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton2KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
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

uses
  RS_Math, RS_Util, Hilfe;

Type Datensatz = Record
       EigenerOrdnerSpeichern : Boolean;
     end;

Type PasswortDatensatz = Record
       Neuespasswort          : String[50];
     end;

var
  KonfigDatei                 : File of Datensatz;
  Konfigsatz                  : Datensatz;
  PasswortDatei               : file of PasswortDatensatz;
  Passwortsatz                : PasswortDatensatz;
  RS_EigenerOrdnerSpeichern   : Boolean;
  RS_Passwort                 : String[50];
  AnwendungsdatenOrdner,
  progdir                     : string;

procedure DateiStandard;
begin
  Konfigsatz.EigenerOrdnerSpeichern := true;
end;

procedure KonfigDateicheck(Dateiname : String);
var
  fehler : byte;
  mld    : string;
begin
  mld := 'Datei '+dateiname+' nicht gefunden.'+#10#13+#10#13+
          'Datei wird erstellt!';

  if not FileExists(dateiname) then
  begin
    MessageDlg(mld, mtInformation, [mbOk], 0);
    assignfile(Konfigdatei,dateiname);
    {$I-}
    REWRITE(Konfigdatei);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      DateiStandard;
      {$I-}
      Write(Konfigdatei,Konfigsatz);
      {$I+}
      if ioresult <> 0 then showmessage('Es konnte nicht in die Datei '+
                                        'geschrieben werden!'+#10#13+
                                        Dateiname);

      {$I-}
      closefile(Konfigdatei);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei '+dateiname+' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+dateiname+' konnte nicht erzeugt werden.');
      DateiStandard;
    end
  end
end;

procedure LeseKonfigdatei(Dateiname: String);
var
  fehler: integer;
Begin
  AssignFile(Konfigdatei,Dateiname);
  {$I-}
  reset(Konfigdatei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    Read(Konfigdatei,konfigsatz);
    {$I+}
    if IoResult <> 0 then
    begin
      DateiStandard;
      showmessage('Datei Lesefehler!'+#10#13+Dateiname);
    end;

    {$I-}
    closefile(Konfigdatei);
    {$I+}
    if (ioresult <> 0) then
    begin
      DateiStandard;
      showmessage('Datei '+Dateiname+' konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    DateiStandard;
    showmessage('Datei '+Dateiname+' konnte nicht geöffnet werden!');
  end;
end;

procedure KonfigSchreibeDatei(Dateiname: String);
var
  fehler: integer;
begin
  AssignFile(Konfigdatei,dateiname);
  {$I-}
  rewrite(Konfigdatei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    konfigsatz.EigenerOrdnerSpeichern := RS_EigenerOrdnerSpeichern;
    {$I-}
    Write(Konfigdatei,Konfigsatz);
    {$I+}
    if ioresult <> 0 then showmessage('Es konnte nicht in die Datei '+
                                      'geschrieben werden!'+#10#13+
                                       Dateiname);
    {$I-}
    closefile(Konfigdatei);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei '+Dateiname+' konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    showmessage('Datei '+dateiname+' konnte nicht erstellt werden!');
  end;
end;


procedure PasswortDateiStandard;
begin
  Passwortsatz.Neuespasswort := '';
end;


procedure PasswortDateicheck(Dateiname: string);
var
  fehler : integer;
  mld    : string;
begin
  {mld := 'Datei "'+ dateiname +'" nicht gefunden.'+
          #10#13+#10#13+'Datei wird erstellt!';}
  mld := 'Datei "'+ dateiname +'" nicht gefunden.'+
          #10#13+#10#13+'HW Konfig wird beendet!'+#10#13+
          'Bitte wenden Sie sich an Ihren Administrator.';
    
  if not FileExists(dateiname) then
  begin
    MessageDlg(mld, mtInformation, [mbOk], 0);
    
    form1.WindowState := wsMinimized;
    application.Terminate;
    Halt;

    assignfile(passwortdatei,dateiname);
    {$I-}
    REWRITE(passwortdatei);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      {$I-}
      passwortsatz.Neuespasswort := '';
      write(passwortdatei,passwortsatz);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+dateiname+'" Schreibfehler!');
      end;

      {$I-}
      closefile(passwortdatei);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+dateiname+'" konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      PasswortDateiStandard;
      showmessage('Datei "'+dateiname+'" konnte nicht erzeugt werden.');
    end
  end
end;

Procedure PasswortLeseDatei(Dateiname: string);
var
  fehler : integer;
begin
  AssignFile(passwortdatei,dateiname);
  {$I-}
  reset(passwortdatei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    Read(passwortdatei,passwortsatz);
    {$I+}
    if (ioresult <> 0) then
    begin
      PasswortDateiStandard;
      showmessage('Datei "'+dateiname+'" Lesefehler!');
    end;

    {$I-}
    closefile(passwortdatei);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Dateiname+'" konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    PasswortDateiStandard;
    showmessage('Datei "'+Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;

procedure PasswortSchreibeDatei(Dateiname: String);
var
  fehler: integer;
begin
  AssignFile(Passwortdatei,dateiname);
  {$I-}
  rewrite(Passwortdatei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    Passwortsatz.Neuespasswort := RS_Passwort;
    {$I-}
    Write(Passwortdatei,Passwortsatz);
    {$I+}
    if ioresult <> 0 then 
    begin
        showmessage('Datei "'+dateiname+'" Schreibfehler!');
    end;
  
    {$I-}
    closefile(Passwortdatei);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei '+Dateiname+' konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    showmessage('Datei '+dateiname+' konnte nicht überschrieben werden!');
  end;
end;

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

function InstallExt(Extension, ExtDescription, FileDescription,
OpenWith, ParamString: string; IconIndex: Integer = 0): Boolean;
var
  Reg: TRegistry;
begin
  Result := False;
  if Extension <> '' then
  begin
    if Extension[1] <> '.' then
      Extension := '.' + Extension;

    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CLASSES_ROOT;
      if Reg.OpenKey(Extension, True) then
      begin
       Reg.WriteString('', ExtDescription);
       if Reg.OpenKey('\' + ExtDescription, True) then
       begin
         Reg.WriteString('', FileDescription);
         if Reg.OpenKey('DefaultIcon', True) then
         begin
           Reg.WriteString('', Format('%s,%d', [OpenWith, IconIndex]));
           if Reg.OpenKey('\' + ExtDescription + '\Shell\Open\Command', True) then
           begin
             Reg.WriteString('', Format('"%s" "%s"', [OpenWith, ParamString]));
             Result:=True;
           end;
         end;
       end;
     end;
  finally
    Reg.Free;
  end;
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  fehler,
  laenge: integer;
begin
  MessageDlg('Bitte schließen Sie alle HelpWriter Anwendungen bevor Sie fortfahren!',
             mtWarning, [mbOk], 0);

  progdir := ExtractFilePath(Application.ExeName);
  laenge := length(progdir);
  if progdir[length(progdir)] = '\' THEN Delete(progdir,laenge,1);
  {$I-}
  chdir(progdir);
  {$I+}
  fehler := IoResult;
  if fehler = 0 then
  begin
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

  KonfigDateicheck(progdir+'Konfig.cfg');
  LeseKonfigdatei(progdir+'Konfig.cfg');

  if konfigsatz.EigenerOrdnerSpeichern = true then
  begin
    PasswortDateicheck(progdir+'Key.cfg');
    PasswortLeseDatei(progdir+'Key.cfg');
    radiobutton1.Checked := true
  end
  else
  begin
    PasswortDateicheck(AnwendungsdatenOrdner+'Key.cfg');
    PasswortLeseDatei(AnwendungsdatenOrdner+'Key.cfg');
    radiobutton2.Checked := true;
  end;

  MaskEdit4.Text := '';

  if (passwortsatz.Neuespasswort = '') then
  begin
    panel1.Visible := false;
    label5.Visible := false;
    Maskedit4.Visible := false;
    button3.Visible := false;
    ActiveControl := Maskedit2;
  end
  else
  begin
    label1.Visible := false;
    label2.Visible := false;
    label3.Visible := false;
    Maskedit1.Visible := false;
    Maskedit2.Visible := false;
    Maskedit3.Visible := false;
    radiobutton1.Visible := false;
    radiobutton2.Visible := false;
    button1.Visible := false;
    button2.Visible := false;
    button4.Visible := false;
    button5.Visible := false;
    ActiveControl := Maskedit4;
  end;

  label4.Visible := false;

  MaskEdit1.Text := TextDekodieren2(31,passwortsatz.Neuespasswort);

  MaskEdit2.Text := MaskEdit1.Text;
  MaskEdit3.Text := MaskEdit1.Text;

  Groupbox1.Visible := False;

  radiobutton1.Caption := MinimizeName(progdir, label1.Canvas, 450);
  radiobutton2.Caption:=MinimizeName(AnwendungsdatenOrdner, label1.Canvas, 450);
  //showmessage('Progdir   :'+progdir+#10#13+'AW Ordner :'+AnwendungsdatenOrdner)
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  WindowState := wsMinimized;
  close;
  application.Terminate;
end;

function RenameFileEx(const AOldName, ANewName: string;
   ARenameCheck: boolean = false): boolean;
var
  sh: TSHFileOpStruct;
begin
  sh.Wnd := Application.Handle;
  sh.wFunc := fo_Move;

  // String muss mit #0#0 Terminiert werden, um das Listenende zu setzen
  sh.pFrom := PChar(AOldName + #0);
  sh.pTo := PChar(ANewName + #0);
  sh.fFlags := fof_Silent or fof_MultiDestFiles;
  if ARenameCheck then
    sh.fFlags := sh.fFlags or fof_RenameOnCollision;
  Result:=ShFileOperation(sh)=0;
end;


procedure VerschiebeDateien;
var
  zeile,
  zeile2 : array[1..9] of string;
begin
  zeile[1] := AnwendungsdatenOrdner+'Eigenedaten.cfg';
  zeile[2] := AnwendungsdatenOrdner+'Formularmanager.cfg';
  zeile[3] := AnwendungsdatenOrdner+'HelpWriter2.cfg';
  zeile[4] := AnwendungsdatenOrdner+'HelpWriter2.ini';
  zeile[5] := AnwendungsdatenOrdner+'Hilfe.cfg';
  zeile[6] := AnwendungsdatenOrdner+'HW_Adress.cfg';
  zeile[7] := AnwendungsdatenOrdner+'HW_Adress.ini';
  zeile[8] := AnwendungsdatenOrdner+'Setup.cfg';
  zeile[9] := AnwendungsdatenOrdner+'Key.cfg';

  zeile2[1] := progdir+'Eigenedaten.cfg';
  zeile2[2] := progdir+'Formularmanager.cfg';
  zeile2[3] := progdir+'HelpWriter2.cfg';
  zeile2[4] := progdir+'HelpWriter2.ini';
  zeile2[5] := progdir+'Hilfe.cfg';
  zeile2[6] := progdir+'HW_Adress.cfg';
  zeile2[7] := progdir+'HW_Adress.ini';
  zeile2[8] := progdir+'Setup.cfg';
  zeile2[9] := progdir+'Key.cfg';

  //Lese Datei falls speichern scheitert
  LeseKonfigdatei(progdir+'Konfig.cfg');
  if Konfigsatz.EigenerOrdnerSpeichern = true then
  begin
    if FileExists(zeile[1]) = true then RenameFileEx(zeile[1],zeile2[1]);
    if FileExists(zeile[2]) = true then RenameFileEx(zeile[2],zeile2[2]);
    if FileExists(zeile[3]) = true then RenameFileEx(zeile[3],zeile2[3]);
    if FileExists(zeile[4]) = true then RenameFileEx(zeile[4],zeile2[4]);
    if FileExists(zeile[5]) = true then RenameFileEx(zeile[5],zeile2[5]);
    if FileExists(zeile[6]) = true then RenameFileEx(zeile[6],zeile2[6]);
    if FileExists(zeile[7]) = true then RenameFileEx(zeile[7],zeile2[7]);
    if FileExists(zeile[8]) = true then RenameFileEx(zeile[8],zeile2[8]);
    if FileExists(zeile[9]) = true then RenameFileEx(zeile[9],zeile2[9]);

    if FileExists(zeile2[1]) = false then showmessage('Datei "'+zeile2[1]+'" nicht gefunden!');
    if FileExists(zeile2[2]) = false then showmessage('Datei "'+zeile2[2]+'" nicht gefunden!');
    if FileExists(zeile2[3]) = false then showmessage('Datei "'+zeile2[3]+'" nicht gefunden!');
    if FileExists(zeile2[4]) = false then showmessage('Datei "'+zeile2[4]+'" nicht gefunden!');
    if FileExists(zeile2[5]) = false then showmessage('Datei "'+zeile2[5]+'" nicht gefunden!');
    if FileExists(zeile2[6]) = false then showmessage('Datei "'+zeile2[6]+'" nicht gefunden!');
    if FileExists(zeile2[7]) = false then showmessage('Datei "'+zeile2[7]+'" nicht gefunden!');
    if FileExists(zeile2[8]) = false then showmessage('Datei "'+zeile2[8]+'" nicht gefunden!');
    if FileExists(zeile2[9]) = false then showmessage('Datei "'+zeile2[9]+'" nicht gefunden!');
    PasswortSchreibeDatei(progdir+'Key.cfg');
  end
  else
  begin
    if FileExists(zeile2[1]) = true then RenameFileEx(zeile2[1],zeile[1]);
    if FileExists(zeile2[2]) = true then RenameFileEx(zeile2[2],zeile[2]);
    if FileExists(zeile2[3]) = true then RenameFileEx(zeile2[3],zeile[3]);
    if FileExists(zeile2[4]) = true then RenameFileEx(zeile2[4],zeile[4]);
    if FileExists(zeile2[5]) = true then RenameFileEx(zeile2[5],zeile[5]);
    if FileExists(zeile2[6]) = true then RenameFileEx(zeile2[6],zeile[6]);
    if FileExists(zeile2[7]) = true then RenameFileEx(zeile2[7],zeile[7]);
    if FileExists(zeile2[8]) = true then RenameFileEx(zeile2[8],zeile[8]);
    if FileExists(zeile2[9]) = true then RenameFileEx(zeile2[9],zeile[9]);

    if FileExists(zeile[1]) = false then showmessage('Datei "'+zeile[1]+'" nicht gefunden!');
    if FileExists(zeile[2]) = false then showmessage('Datei "'+zeile[2]+'" nicht gefunden!');
    if FileExists(zeile[3]) = false then showmessage('Datei "'+zeile[3]+'" nicht gefunden!');
    if FileExists(zeile[4]) = false then showmessage('Datei "'+zeile[4]+'" nicht gefunden!');
    if FileExists(zeile[5]) = false then showmessage('Datei "'+zeile[5]+'" nicht gefunden!');
    if FileExists(zeile[6]) = false then showmessage('Datei "'+zeile[6]+'" nicht gefunden!');
    if FileExists(zeile[7]) = false then showmessage('Datei "'+zeile[7]+'" nicht gefunden!');
    if FileExists(zeile[8]) = false then showmessage('Datei "'+zeile[8]+'" nicht gefunden!');
    if FileExists(zeile[9]) = false then showmessage('Datei "'+zeile[9]+'" nicht gefunden!');
    PasswortSchreibeDatei(AnwendungsdatenOrdner+'Key.cfg');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Maskedit2.Text := _LastLeerEntf(Maskedit2.Text);
  Maskedit3.Text := _LastLeerEntf(Maskedit3.Text);
  if Maskedit2.Text = '' then
  begin
    activecontrol := Maskedit2;
    showmessage('Eingabe erforderlich!');
    exit
  end;
  if Maskedit2.Text = Maskedit3.Text then
  begin
    RS_Passwort := TextKodieren2(31,Maskedit2.Text);
  end
  else
  begin
    activecontrol := Maskedit3;
    showmessage('Neues Passwort und Wiederholung müssen gleich sein!');
    RS_Passwort := '';
    exit
  end;
  if radiobutton1.Checked = true then
  begin
    RS_EigenerOrdnerSpeichern :=  true;
  end
  else
  begin
    RS_EigenerOrdnerSpeichern := false;
  end;

  label4.Visible := true;
  label4.Caption := 'Speichert....';
  Groupbox1.Visible := true;
  application.ProcessMessages;
  sleep(500);
  Groupbox1.Visible := false;
  
  KonfigSchreibeDatei(progdir+'Konfig.cfg');

  label4.Caption := 'Verschiebe Dateien....';
  Groupbox1.Visible := true;
  application.ProcessMessages;

  //in dieser Procedure wird passwortspeichern
  //procedure aufgerufen
  VerschiebeDateien;

  sleep(500);
  Groupbox1.Visible := false;
  label4.Caption := '';
  label4.Visible := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Maskedit4.Text = Maskedit1.Text then
  begin
    label1.Visible := true;
    label2.Visible := true;
    label3.Visible := true;
    Maskedit1.Visible := true;
    Maskedit2.Visible := true;
    Maskedit3.Visible := true;
    radiobutton1.Visible := true;
    radiobutton2.Visible := true;
    button1.Visible := true;
    button2.Visible := true;
    button4.Visible := true;
    button5.Visible := true;
    label5.Visible := false;
    Maskedit4.Visible := false;
    button3.Visible := false;
    panel1.Visible := false;
    activecontrol := Maskedit2;
  end
  else
  begin
    showmessage('Passwort ist nicht korrekt!');
    activecontrol := Maskedit4;
    Maskedit4.Text := '';
  end;
end;

procedure TForm1.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
   Button3Click(form1);
   key := #0;
  end;
end;

procedure TForm1.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.RadioButton1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.RadioButton2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if konfigsatz.EigenerOrdnerSpeichern = true then
  begin
    ZeigeHilfe(progdir,'HW_Konfig.hlp','HW Konfig');
  end
  else
  begin
    ZeigeHilfe(AnwendungsdatenOrdner,'HW_Konfig.hlp','HW_Konfig');
  end;
  RS_Hilfe.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  v1,v2,v3 : boolean;
  n1,n2,n3 : String[20];
begin
  v1 := false;
  v2 := false;
  v3 := false;
  if InstallExt('.hwd', 'HelpWriter Datenbank', 'HelpWriter 2', progdir+'HelpWriter2.exe', '"%1"',0) = true then v1 := true;
  if InstallExt('.ha', 'HW Adress Datenbank', 'HelpWriter HW Adress', progdir+'HW_Adress.exe', '"%1"',0) = true then v2 := true;
  if InstallExt('.hwf', 'HelpWriter Formularmanager', 'HelpWriter Formularmanager', progdir+'Formularmanager.exe', '"%1"',0) = true then v3 := true;
  if v1 = true then n1 := 'Ja' else n1 := 'Nein';
  if v2 = true then n2 := 'Ja' else n2 := 'Nein';
  if v3 = true then n3 := 'Ja' else n3 := 'Nein';
  showmessage('HelpWriter 2 wurde registriert: '+n1+#10#13+
              'HW Adress wurde registriert: '+n2+#10#13+
              'Formularmanager wurde registriert: '+n3);
end;

end.
