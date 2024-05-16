unit FormularmanagerUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMan, IniFiles, ComCtrls, Buttons, printers,
  ShlObj, ActiveX, ShellApi;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    XPManifest1: TXPManifest;
    StatusBar1: TStatusBar;
    Button4: TButton;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    PrintDialog1: TPrintDialog;
    SpeedButton8: TSpeedButton;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;


Type Datensatz = Record
       oben,
       links,
       beite,
       hoehe         : integer;
       TabAn         : Boolean;
     end;

type
TExecuteWaitEvent = procedure(const ProcessInfo: TProcessInformation;
                                    var ATerminate: Boolean) of object;

var
  Form1 : TForm1;


implementation

{$R *.dfm}

uses
  RS_Util, RS_Math, xAbout, LeseKonfig, Hilfe;

var
  Datei : File of Datensatz;
  satz  : Datensatz;
  AnwendungsdatenOrdner,
  Arbeitsverzeichnis,
  progdir : string;

  Ini            : TIniFile;
  Fett,
  Kursiv,
  Unterstrichen,
  Durchgestrichen: Boolean;
  Farbe          : String;


procedure ExecuteFile(const AFilename: String;
                 AParameter, ACurrentDir: String; AWait: Boolean;
                 AOnWaitProc: TExecuteWaitEvent=nil);
var
  si: TStartupInfo;
  pi: TProcessInformation;
  bTerminate: Boolean;
begin
  bTerminate := False;

  if Length(ACurrentDir) = 0 then
    ACurrentDir := ExtractFilePath(AFilename);

  if AnsiLastChar(ACurrentDir) = '\' then
    Delete(ACurrentDir, Length(ACurrentDir), 1);

  FillChar(si, SizeOf(si), 0);
  with si do begin
    cb := SizeOf(si);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_NORMAL;
  end;

  FillChar(pi, SizeOf(pi), 0);
  AParameter := Format('"%s" %s', [AFilename, TrimRight(AParameter)]);

  if CreateProcess(Nil, PChar(AParameter), Nil, Nil, False,
                   CREATE_DEFAULT_ERROR_MODE or CREATE_NEW_CONSOLE or
                   NORMAL_PRIORITY_CLASS, Nil, PChar(ACurrentDir), si, pi) then
  try
    if AWait then
      while WaitForSingleObject(pi.hProcess, 50) <> Wait_Object_0 do
      begin
        if Assigned(AOnWaitProc) then
        begin
          AOnWaitProc(pi, bTerminate);
          if bTerminate then
            TerminateProcess(pi.hProcess, Cardinal(-1));
        end;

        Application.ProcessMessages;
      end;
  finally
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
  end;
end;


procedure LeseIni;
begin
  try
    Ini:=TIniFile.Create(AnwendungsdatenOrdner+'HelpWriter2.ini');

    Arbeitsverzeichnis := Ini.ReadString('Option','Arbeitsverzeichnis','');

    form1.Memo1.Font.Name := Ini.ReadString('Font','Schrift','Courier New');
    form1.Memo1.Font.Size := Ini.ReadInteger('Font','Schriftgröße',10);
    Fett:=Ini.ReadBool('Font','Fett',False);
    Kursiv:=Ini.ReadBool('Font','Kursiv',False);
    Unterstrichen:=Ini.ReadBool('Font','Unterstrichen',False);
    Durchgestrichen:=Ini.ReadBool('Font','Durchgestrichen',False);
    farbe:=Ini.ReadString('Font','Farbe',ColorToString(clWindowText));
  finally
    Ini.Free;
  end;
end;

procedure DatensatzStandard;
begin
  satz.oben := 0;
  satz.links := 0;
  satz.beite := 600;
  satz.hoehe := 440;
  satz.TabAn := false;
end;

procedure Dateicheck(Form2Dateiname : string);
var
  fehler : integer;
  mld    : string;
begin
  mld := 'Datei "'+Form2Dateiname+'" wurde nicht gefunden.'+#10#13+#10#13+
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
    satz.oben := form1.Top;
    satz.links := form1.Left;
    satz.beite := form1.Width;
    satz.hoehe := form1.Height;

    if form1.CheckBox1.Checked = true
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
    end
    //else showmessage('Datei "'+Form2Dateiname+'" gespeichert.');
  end
  else
  begin
    showmessage('Datei "'+Form2Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;

procedure Positionen;
begin
  with form1 do
  begin
    Top := satz.oben;
    Left := satz.links;
    Width:= satz.beite;
    Height:=satz.hoehe;
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

procedure TForm1.FormCreate(Sender: TObject);
var
  _ParamString: string;
  laenge,
  AnzahlParam,
  fehler : integer;
begin
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

  if xLeseKonfigdatei(progdir+'Konfig.cfg') = false then
  begin
    Showmessage('Konfiguration konnte nicht gelesen werden.'+#10#13+
                'Beenden Sie das Programm und starten Sie HW_Konfig.exe !');

  end;
  if konfigsatz.EigenerOrdnerSpeichern = true then
     AnwendungsdatenOrdner := ProgDir;

  LeseIni;  
  Dateicheck(AnwendungsdatenOrdner+'Formularmanager.cfg');
  LeseDatei(AnwendungsdatenOrdner+'Formularmanager.cfg');
  Positionen;

  if satz.TabAn = true then form1.CheckBox1.Checked := true
                       else form1.CheckBox1.Checked := false;
  memo1.Clear;
  statusbar1.SimpleText := '';
  ActiveControl := memo1;
  panel1.Caption := '';
  panel1.Visible := false;
  Combobox1.Text := '';
  combobox1.Font := memo1.Font;
  if FileExists('Sonderzeichen.txt') then
  begin
    try
      combobox1.Items.LoadFromFile('Sonderzeichen.txt');
    except
    end;
  end;  

  (*
  memo1.lines.Add('Oben  : '+inttostr(satz.oben));
  memo1.lines.Add('Links : '+inttostr(satz.links));
  memo1.lines.Add('Breite: '+inttostr(satz.beite));
  memo1.lines.Add('Höhe  : '+inttostr(satz.hoehe));
  *)
  if (fett = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsBold];
  if (Kursiv = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsItalic];
  if (Unterstrichen = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsUnderline];
  if (Durchgestrichen = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsStrikeout];
  form1.Memo1.Font.Color := StringToColor(farbe);

  AnzahlParam := paramcount;
  if AnzahlParam > 0 then _ParamString := ParamStr(1)
                     else _ParamString := '';
  if AnzahlParam > 0 then
  begin
    if FileExists(_ParamString) then
    begin
      try
        memo1.Lines.LoadFromFile(_ParamString);
        statusbar1.SimpleText := _ParamString;
      except
        MessageDlg('Datei konnte nicht geöffnet werden!'+#10#13+
                    _ParamString, mtError, [mbOk], 0);
      end;
    end
    else showmessage('Datei konnte nicht geöffnet werden!'+#10#13+
                     _ParamString);
  end;

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked = true then memo1.WantTabs := true
                              else memo1.WantTabs := false;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Hier_dateiname : string;
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
    Hier_dateiname := OpenDialog1.FileName;
    Hier_dateiname := _Lastleerentf(Hier_dateiname);
    if Hier_dateiname <> '' then
    begin
      if FileExists(Hier_dateiname) = false then
      begin
        MessageDlg('Datei "'+Hier_dateiname+'" kann nicht geöffnet '+
                   'werden!', mtError, [mbOk], 0);
        exit;
      end;
      try
        memo1.Lines.LoadFromFile(Hier_dateiname);
        Statusbar1.SimpleText := Hier_dateiname;
      except
        MessageDlg('Datei konnte nicht geöffnet werden!'+#10#13+
                    Hier_dateiname, mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SchreibeDatei(AnwendungsdatenOrdner+'Formularmanager.cfg');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  //WindowState := wsMinimized;
  close;
  application.Terminate;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Hier_dateiname : String;
begin
  if DirectoryExists(Arbeitsverzeichnis) = false then
  begin
    if Arbeitsverzeichnis <> '' then
    showmessage('Verzeichnis existiert nicht!'+#10#13+#10#13+Arbeitsverzeichnis);
    Arbeitsverzeichnis := '';
  end;
  if Arbeitsverzeichnis <> '' then
  saveDialog1.InitialDir := Arbeitsverzeichnis
  else saveDialog1.InitialDir := ExtractFilePath(Application.ExeName);

  if saveDialog1.Execute then
  begin
    Hier_dateiname := saveDialog1.FileName;
    Hier_dateiname := _Lastleerentf(Hier_dateiname);
    if Hier_dateiname <> '' then
    begin
      if FileExists(Hier_dateiname) = true then
      begin
        //hier wenn Datei besteht
        if MessageDlg('Datei '+Hier_dateiname+' besteht bereits!'+#10#13+
                      'Überschreiben?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          //wenn Yes, was soll passieren
          try
            panel1.Caption := 'Speichert....';
            panel1.Visible := true;
            application.ProcessMessages;

            memo1.Lines.SaveToFile(Hier_dateiname);
            statusbar1.SimpleText := Hier_dateiname;

            sleep(500);
            panel1.Caption := '';
            panel1.Visible := false;
          except
            MessageDlg('Datei konnte nicht gespeichert werden!'+#10#13+
                        Hier_dateiname, mtError, [mbOk], 0);
          end;
        end;
      end
      else
      begin
        //hier wenn Datei nicht besteht
        try
          panel1.Caption := 'Speichert....';
          panel1.Visible := true;
          application.ProcessMessages;

          memo1.Lines.SaveToFile(Hier_dateiname);
          statusbar1.SimpleText := Hier_dateiname;

          sleep(500);
          panel1.Caption := '';
          panel1.Visible := false;
        except
          MessageDlg('Datei konnte nicht gespeichert werden!'+#10#13+
                      Hier_dateiname, mtError, [mbOk], 0);
        end;
      end;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if statusbar1.SimpleText = '' then
  begin
    Button3Click(form1);
    exit
  end;
  if FileExists(statusbar1.SimpleText) = true then
  begin
    try
      panel1.Caption := 'Speichert....';
      panel1.Visible := true;
      application.ProcessMessages;
      memo1.Lines.SaveToFile(statusbar1.SimpleText);
      sleep(500);
      panel1.Caption := '';
      panel1.Visible := false;
    except
      MessageDlg('Datei konnte nicht gespeichert werden!'+#10#13+
                 statusbar1.SimpleText, mtError, [mbOk], 0);
    end
  end
  else MessageDlg('Datei konnte nicht gespeichert werden!', mtError, [mbOk], 0);
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelText := (combobox1.Text);
  activecontrol := combobox1
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  m,
  laenge1,
  laenge2 : integer;
begin
  laenge2 := 0;
  for m := 0 to (memo1.lines.Count - 1) do
  begin
    laenge1 := length(Memo1.Lines[m]);
    if laenge1 > laenge2 then laenge2 := laenge1;
  end;
  for m := 0 to (memo1.lines.Count - 1) do
  begin
    if Memo1.Lines[m] <> '' Then
    begin
      Memo1.Lines[m] := _FillStrHinten(Memo1.Lines[m],laenge2+1,'.');
      Memo1.Lines[m] := Memo1.Lines[m] + ': ';
    end;  
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  _xAboutBox.ShowModal;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelectAll;
  memo1.CopyToClipboard;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.PasteFromClipboard;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelText := (DateToStr(Date));
  memo1.SelText := ' ';
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelText := (TimeToStr(Time));
  memo1.SelText := ' ';
end;


procedure TForm1.SpeedButton7Click(Sender: TObject);
var
   Geschriebenes,Zeile,maxtext:word;
begin
   //Falls der Druckdialog mit 'Ok' bestätigt wird...
   If Printdialog1.execute then begin
      //Setze den Title des Druckauftragen auf den Dateinamen
      Printer.title:='Formularmanager';;
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
         Printer.Canvas.Textout(250,50+geschriebenes,Memo1.lines[Zeile]);
         //Ergänze den Bisher geschribenen Text um dei letzte Zeile
         maxtext:=Printer.canvas.TextHeight(Memo1.Lines[Zeile]);
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

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  ZeigeHilfe(AnwendungsdatenOrdner,'Formularmanager.hlp','Formularmanager');
  RS_Hilfe.ShowModal;
end;

end.
