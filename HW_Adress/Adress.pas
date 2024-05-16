unit Adress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, XPMan, Mask, IniFiles, Menus,
  ToolWin, Buttons, printers, ShlObj, ActiveX, ShellApi;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    XPManifest1: TXPManifest;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    Label1: TLabel;
    Label2Notiz: TLabel;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    MaskEdit1: TMaskEdit;
    Geburtstag: TLabel;
    CheckBox2: TCheckBox;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    ToolBar1: TToolBar;
    NeuDatenbankerstellen1: TMenuItem;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ProgressBar1: TProgressBar;
    Datenbankffnen1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Bearbeiten1: TMenuItem;
    Datensatz1: TMenuItem;
    NeuerDatensatz1: TMenuItem;
    Beenden1: TMenuItem;
    info1: TMenuItem;
    TabSheet3: TTabSheet;
    Memo2: TMemo;
    GroupBox3: TGroupBox;
    Datenbankschlieen1: TMenuItem;
    N1: TMenuItem;
    DatenbankalsTextdateiexportieren1: TMenuItem;
    N2: TMenuItem;
    HWAdressArbeitsverzeichnis1: TMenuItem;
    AktuellenDatensatzspeichern1: TMenuItem;
    N3: TMenuItem;
    AktuellenDatensatzlschen1: TMenuItem;
    N4: TMenuItem;
    AktuellenDatensatzdrucken1: TMenuItem;
    PrintDialog1: TPrintDialog;
    Label11: TLabel;
    N5: TMenuItem;
    Schriftart1: TMenuItem;
    FontDialog1: TFontDialog;
    N6: TMenuItem;
    AlleDatenstzeanzeigen1: TMenuItem;
    Datenstzesuchen1: TMenuItem;
    SpeedButton12: TSpeedButton;
    DatenstzenachAlphabet1: TMenuItem;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    DatensatzindieZwischenablagekopieren1: TMenuItem;
    Beenden2: TMenuItem;
    N8: TMenuItem;
    Ausschneiden1: TMenuItem;
    Kopieren1: TMenuItem;
    Einfgen1: TMenuItem;
    N9: TMenuItem;
    Allesmarkieren1: TMenuItem;
    N10: TMenuItem;
    Datum1: TMenuItem;
    Uhrzeit1: TMenuItem;
    Email1: TMenuItem;
    Homepage1: TMenuItem;
    Optionen1: TMenuItem;
    Einstellungen1: TMenuItem;
    Optionen: TMenuItem;
    N12: TMenuItem;
    Briefverfassen1: TMenuItem;
    Memo3: TMemo;
    SpeedButton16: TSpeedButton;
    SaveDialog2: TSaveDialog;
    N13: TMenuItem;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Info2: TMenuItem;
    SpeedButton17: TSpeedButton;
    Lizenz1: TMenuItem;
    Splitter1: TSplitter;
    Hilfe1: TMenuItem;
    N7: TMenuItem;
    AllesmarkierenNotiz1: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    Datenbankspeichernunter1: TMenuItem;
    SaveDialog3: TSaveDialog;
    DatenbankalsHelpWriterDatenbankexportieren1: TMenuItem;
    procedure DatenbankalsHelpWriterDatenbankexportieren1Click(Sender: TObject);
    procedure Datenbankspeichernunter1Click(Sender: TObject);
    procedure AllesmarkierenNotiz1Click(Sender: TObject);
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
    procedure Hilfe1Click(Sender: TObject);
    procedure Lizenz1Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure Info2Click(Sender: TObject);
    procedure DatenbankalsTextdateiexportieren1Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure Briefverfassen1Click(Sender: TObject);
    procedure OptionenClick(Sender: TObject);
    procedure Einstellungen1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Homepage1Click(Sender: TObject);
    procedure Email1Click(Sender: TObject);
    procedure Uhrzeit1Click(Sender: TObject);
    procedure Datum1Click(Sender: TObject);
    procedure Allesmarkieren1Click(Sender: TObject);
    procedure Ausschneiden1Click(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure Einfgen1Click(Sender: TObject);
    procedure Beenden2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DatensatzindieZwischenablagekopieren1Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DatenstzenachAlphabet1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Datenstzesuchen1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AlleDatenstzeanzeigen1Click(Sender: TObject);
    procedure Schriftart1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure AktuellenDatensatzdrucken1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure AktuellenDatensatzlschen1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure AktuellenDatensatzspeichern1Click(Sender: TObject);
    procedure HWAdressArbeitsverzeichnis1Click(Sender: TObject);
    procedure Datenbankschlieen1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure NeuerDatensatz1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Datenbankffnen1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure NeuDatenbankerstellen1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  xsuchwort : string;
  SucheAnzeigen : boolean;
  Form3Top,
  Form3Left : integer;

const
  HW_AdressTempFile  = 'HW_AdressTemp1_xse365kk7890bgh.tmp';
  HW_AdressTempFile2 = 'HW_AdressTemp2_xse3fdbkghggzbgh.tmp';

implementation

{$R *.dfm}

uses
  rs_math, rs_util, NeuerDatensatz, Verzeichnis, Suchen, suchen2,
  Eigenedaten, optionen, xAbout, Lizense, Hilfe, LeseKonfig;

type
TExecuteWaitEvent = procedure(const ProcessInfo: TProcessInformation;
                                    var ATerminate: Boolean) of object;

var
  Ini            : TIniFile;
  AnwendungsdatenOrdner,
  AktuelleDatei,
  LetzteDatei,
  Arbeitsverzeichnis,
  ProgDir        : string;
  LetzteDBankopen,
  ZeigeLabel10,
  Fett,
  Kursiv,
  Unterstrichen,
  Durchgestrichen: Boolean;
  Farbe          : String;

procedure ErstelleIni;
begin
  if FileExists(AnwendungsdatenOrdner+'HW_Adress.ini') = false then
  begin
    Showmessage('Datei '+AnwendungsdatenOrdner+'HW_Adress.ini wurde nicht gefunden,'+#10+#13+
                'Datei wird neu erstellt...');
    try
      Ini:=TIniFile.Create(AnwendungsdatenOrdner+'HW_Adress.ini');
      Ini.WriteBool('Option','Tab',false);
      Ini.WriteBool('Option','LetzteDatenbank',false);
      Ini.WriteString('Option','Datei','');
      Ini.WriteString('Option','Arbeitsverzeichnis','');
      Ini.WriteInteger('Option','Listboxbreite',230);

      Ini.WriteInteger('Option','Width',800);
      Ini.WriteInteger('Option','Height',600);

      Ini.WriteInteger('Option','Top',0);
      Ini.WriteInteger('Option','Left',0);
      Ini.WriteBool('Option','Visible',false);

      Ini.WriteInteger('Option','Top3',20);
      Ini.WriteInteger('Option','Left3',20);

      Ini.WriteString('Font','Schrift','Tahoma');
      Ini.WriteInteger('Font','Schriftgröße',8);
      Ini.WriteBool('Font','Fett',false);
      Ini.WriteBool('Font','Kursiv',false);
      Ini.WriteBool('Font','Unterstrichen',false);
      Ini.WriteBool('Font','Durchgestrichen',false);
      Ini.WriteString('Font','Farbe',ColorToString(clWindowText));

    finally
      Ini.Free;
    end;
  end;
end;


procedure LeseIni;
begin
  try
    Ini:=TIniFile.Create(AnwendungsdatenOrdner+'HW_Adress.ini');
    form1.Checkbox1.Checked:=Ini.ReadBool('Option','Tab',False);
    form1.Checkbox2.Checked:=Ini.ReadBool('Option','LetzteDatenbank',False);

    if form1.CheckBox2.Checked = true then
    LetzteDatei := Ini.ReadString('Option','Datei','')
    else LetzteDatei := '';

    Arbeitsverzeichnis := Ini.ReadString('Option','Arbeitsverzeichnis','');
    form1.Listbox1.Width := Ini.ReadInteger('Option','Listboxbreite',230);

    form1.Width := Ini.ReadInteger('Option','Width',800);
    form1.Height := Ini.ReadInteger('Option','Height',600);

    form1.Top := Ini.ReadInteger('Option','Top',0);
    form1.Left := Ini.ReadInteger('Option','Left',0);
    ZeigeLabel10 := Ini.ReadBool('Option','Visible',False);
     
    Form3Top := Ini.ReadInteger('Option','Top3',20);
    Form3Left := Ini.ReadInteger('Option','Left3',20);

    form1.Memo1.Font.Name := Ini.ReadString('Font','Schrift','Tahoma');
    form1.Memo1.Font.Size := Ini.ReadInteger('Font','Schriftgröße',8);
    Fett:=Ini.ReadBool('Font','Fett',False);
    Kursiv:=Ini.ReadBool('Font','Kursiv',False);
    Unterstrichen:=Ini.ReadBool('Font','Unterstrichen',False);
    Durchgestrichen:=Ini.ReadBool('Font','Durchgestrichen',False);
    farbe:=Ini.ReadString('Font','Farbe',ColorToString(clWindowText));
  finally
    Ini.Free;
  end;
end;

procedure SchreibeIni;
begin
  try
    Ini:=TIniFile.Create(AnwendungsdatenOrdner+'HW_Adress.ini');
    Ini.WriteBool('Option','Tab',form1.CheckBox1.Checked);
    Ini.WriteBool('Option','LetzteDatenbank',form1.CheckBox2.Checked);

    if form1.CheckBox2.Checked = true then
    Ini.WriteString('Option','Datei',LetzteDatei)
    else Ini.WriteString('Option','Datei','');

    Ini.WriteString('Option','Arbeitsverzeichnis',Arbeitsverzeichnis);
    Ini.WriteInteger('Option','Listboxbreite',form1.Listbox1.Width);

    Ini.WriteInteger('Option','Width',form1.Width);
    Ini.WriteInteger('Option','Height',form1.Height);

    Ini.WriteInteger('Option','Top',form1.Top);
    Ini.WriteInteger('Option','Left',form1.Left);
    Ini.WriteBool('Option','Visible',ZeigeLabel10);

    Ini.WriteInteger('Option','Top3',Form3Top);
    Ini.WriteInteger('Option','Left3',Form3Left);

    Ini.WriteString('Font','Schrift',form1.Memo1.Font.Name);
    Ini.WriteInteger('Font','Schriftgröße',form1.Memo1.Font.Size);
    Ini.WriteBool('Font','Fett',Fett);
    Ini.WriteBool('Font','Kursiv',Kursiv);
    Ini.WriteBool('Font','Unterstrichen',Unterstrichen);
    Ini.WriteBool('Font','Durchgestrichen',Durchgestrichen);
    Ini.WriteString('Font','Farbe',farbe);
  finally
    Ini.Free;
  end;
end;

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

procedure ButtonAnAus(anaus : Boolean);
Begin
  with form1 do
  begin
    Datei1.Enabled := anaus;
    Bearbeiten1.Enabled := anaus;
    Datensatz1.Enabled := anaus;
    info1.Enabled := anaus;
    beenden1.Enabled := anaus;
    optionen1.Enabled := anaus;
    hilfe1.Enabled := anaus;

    listbox1.Enabled := anaus;

    checkbox1.Enabled := anaus;
    checkbox2.Enabled := anaus;

    speedbutton1.enabled := anaus;
    speedbutton2.enabled := anaus;
    speedbutton3.enabled := anaus;
    speedbutton4.enabled := anaus;
    speedbutton5.enabled := anaus;
    speedbutton6.enabled := anaus;
    speedbutton7.enabled := anaus;
    speedbutton8.enabled := anaus;
    speedbutton9.enabled := anaus;
    speedbutton10.enabled := anaus;
    speedbutton11.enabled := anaus;
    speedbutton12.enabled := anaus;
    speedbutton13.enabled := anaus;
    speedbutton14.enabled := anaus;
    speedbutton15.enabled := anaus;
    speedbutton16.enabled := anaus;
    speedbutton17.enabled := anaus;
  end;
end;

//Für leseDatensatz wegen listbox
procedure ButtonAnAus2(anaus : Boolean);
Begin
  with form1 do
  begin
    Datei1.Enabled := anaus;
    Bearbeiten1.Enabled := anaus;
    Datensatz1.Enabled := anaus;
    info1.Enabled := anaus;
    beenden1.Enabled := anaus;
    optionen1.Enabled := anaus;
    hilfe1.Enabled := anaus;

    //Listbox funzt sonst nicht!!!
    //listbox1.Enabled := anaus;

    checkbox1.Enabled := anaus;
    checkbox2.Enabled := anaus;

    speedbutton1.enabled := anaus;
    speedbutton2.enabled := anaus;
    speedbutton3.enabled := anaus;
    speedbutton4.enabled := anaus;
    speedbutton5.enabled := anaus;
    speedbutton6.enabled := anaus;
    speedbutton7.enabled := anaus;
    speedbutton8.enabled := anaus;
    speedbutton9.enabled := anaus;
    speedbutton10.enabled := anaus;
    speedbutton11.enabled := anaus;
    speedbutton12.enabled := anaus;
    speedbutton13.enabled := anaus;
    speedbutton14.enabled := anaus;
    speedbutton15.enabled := anaus;
    speedbutton16.enabled := anaus;
    speedbutton17.enabled := anaus;
  end;
end;

procedure LoescheAlleEingabefelder;
begin
  with form1 do
  begin
    memo1.Clear;
    memo2.Clear;
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
    memo2.Clear;
    LoescheAlleEingabefelder;
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
          //Nur das Prog sich beim einlesen mal meldet
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
  i, Stepper, n,
  zeilenzaehler,
  fehler            : integer;
  TempZeile,
  TempZeile2,
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
    zeilenzaehler := 0;
    memo1.Clear;
    LoescheAlleEingabefelder;
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
          inc(zeilenzaehler);
          case zeilenzaehler of
            2 : LabeledEdit2.text := zeile;
            3 : LabeledEdit3.text := zeile;
            4 : LabeledEdit4.text := zeile;
            5 : LabeledEdit5.text := zeile;
            6 : LabeledEdit6.text := zeile;
            7 : LabeledEdit7.text := zeile;
            8 : LabeledEdit8.text := zeile;
            9 : LabeledEdit9.text := zeile;
            10 : LabeledEdit10.text := zeile;
            11 : LabeledEdit11.text := zeile;
            12 : LabeledEdit12.text := zeile;
            13 : MaskEdit1.text := zeile;
            14 : LabeledEdit14.text := zeile;
          end;

          if (minizeile <> '#') and (zeilenzaehler > 14) then
          memo1.Lines.Add(zeile);

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
  Screen.cursor := crDefault;
  form1.progressbar1.Position := 0;
  ButtonAnAus2(true);
  with form1 do
  begin
    TempZeile2 := (LabeledEdit3.text+' '+LabeledEdit2.text);
    TempZeile2 := vorneleerentf(TempZeile2);
    memo2.Lines.Add(Tempzeile2);
    memo2.Lines.Add(LabeledEdit4.text);
    TempZeile2 := (LabeledEdit5.text+' '+LabeledEdit6.text+
                                      ' '+LabeledEdit7.text);
    TempZeile2 := vorneleerentf(TempZeile2);
    memo2.Lines.Add(TempZeile2);
    memo2.Lines.Add('Telefon...: '+LabeledEdit8.text);
    memo2.Lines.Add('Mobil.....: '+LabeledEdit9.text);
    memo2.Lines.Add('Fax.......: '+LabeledEdit10.text);
    memo2.Lines.Add('E-mail....: '+LabeledEdit11.text);
    memo2.Lines.Add('Homepage..: '+LabeledEdit12.text);
    memo2.Lines.Add('Geburtstag: '+MaskEdit1.text);
    memo2.Lines.Add('Kinder....: '+LabeledEdit14.text);
    memo2.Lines.Add('');
    memo2.Lines.Add('Notiz');
    memo2.Lines.Add('------');

    memo2.Lines.BeginUpdate;
    for n := 0 to (memo1.Lines.Count - 1) do
    memo2.Lines.Add(memo1.Lines[n]);
    memo2.Lines.EndUpdate;

    Memo2.Perform(EM_LineScroll, 0 , -Memo2.Lines.Count-1);
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


procedure LeseEinstellungen;
var
  _ParamString: string;
  AnzahlParam,
  fehler      : integer;
begin
  AnzahlParam := paramcount;
  if AnzahlParam > 0 then _ParamString := ParamStr(1)
                     else _ParamString := '';

  ProgDir:=ExtractFilePath(ParamStr(0));

  {$I-}
  chdir(progdir);
  {$I+}
  fehler := ioresult;
  if fehler <> 0 then
  begin
    showmessage('Es konnte nicht ins Arbeitsverzeichnis von HW_Ardess'+#10#13+
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


  ErstelleIni;
  LeseIni;

  if arbeitsverzeichnis <> '' then
  if RS_HasBackSlash(arbeitsverzeichnis) = false then
    arbeitsverzeichnis := arbeitsverzeichnis + '\';
  //showmessage(Arbeitsverzeichnis);
  
  if ZeigeLabel10 = false then form1.Label10.Visible := false;
  form1.Label11.Caption := '';

  if (fett = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsBold];
  if (Kursiv = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsItalic];
  if (Unterstrichen = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsUnderline];
  if (Durchgestrichen = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsStrikeout];
  form1.Memo1.Font.Color := StringToColor(farbe);

  form1.memo2.Font := form1.Memo1.Font;
  form1.ListBox1.Font := form1.Memo1.Font;

  form1.LabeledEdit2.Font := form1.Memo1.Font;
  form1.LabeledEdit3.font := form1.Memo1.Font;
  form1.LabeledEdit4.font := form1.Memo1.Font;
  form1.LabeledEdit5.font := form1.Memo1.Font;
  form1.LabeledEdit6.font := form1.Memo1.Font;
  form1.LabeledEdit7.font := form1.Memo1.Font;
  form1.LabeledEdit8.font := form1.Memo1.Font;
  form1.LabeledEdit9.font := form1.Memo1.Font;
  form1.LabeledEdit10.font := form1.Memo1.Font;
  form1.LabeledEdit11.font := form1.Memo1.Font;
  form1.LabeledEdit12.font := form1.Memo1.Font;
  form1.Maskedit1.Font := form1.Memo1.Font;
  form1.LabeledEdit14.font := form1.Memo1.Font;

  if form1.checkbox1.Checked = true then form1.memo1.WantTabs := true
                                    else form1.memo1.WantTabs := false;

  //Falls parameter übergeben wurden,
  //letzte Datenbank nicht öffnen  !!!
  if AnzahlParam > 0 then
  begin
    LetzteDBankopen := form1.CheckBox2.Checked;
    form1.CheckBox2.Checked := false;
  end;

  if form1.CheckBox2.Checked then
  begin
    if (LetzteDatei <> '') then
    begin
      LeseDatenbank(LetzteDatei);
      AktuelleDatei := LetzteDatei;
    end;
  end;

  if AnzahlParam > 0 then
  begin
    if FileExists(_ParamString) then
    begin
      LeseDatenbank(_ParamString);
      AktuelleDatei := _ParamString;
      //showmessage('Datei geladen!'+#10#13+ _ParamString);
      form1.CheckBox2.Checked := LetzteDBankopen;
    end
    else showmessage('Datei konnte nicht geöffnet werden!'+#10#13+
                     _ParamString);
  end;
end;

procedure SetzeAllesAufLeer;
begin
  with form1 do
  begin
    SucheAnzeigen := true;
    listbox1.Clear;
    Statusbar1.SimpleText := '';
    panel1.Caption := '';
    memo1.Clear;
    memo2.Clear;
    LoescheAlleEingabefelder;

    checkbox1.Checked := false;
    checkbox2.Checked := false;

    pagecontrol1.ActivePage := Tabsheet1;
    ActiveControl := LabeledEdit2;

    LetzteDatei := '';
    AktuelleDatei := '';

    label3.Caption := '';
    label5.Caption := '';
    label7.Caption := '';
    label9.Caption := '';
    label10.caption := '-1';

    label2notiz.Caption := '';
    label12.Caption := '';
    label13.Caption := '';
    label14.Caption := '';
  end;
end;

procedure SetzeAllesFuerLadeNeueDatei;
begin
  with form1 do
  begin
    SucheAnzeigen := true;
    LetzteDatei := '';
    AktuelleDatei := '';
    listbox1.Clear;
    Statusbar1.SimpleText := '';
    panel1.Caption := '';
    memo1.Clear;
    memo2.Clear;
    LoescheAlleEingabefelder;

    pagecontrol1.ActivePage := Tabsheet1;

    label3.Caption := '';
    label5.Caption := '';
    label7.Caption := '';
    label9.Caption := '';
    label10.caption := '-1';

    label2notiz.Caption := '';
    label12.Caption := '';
    label13.Caption := '';
    label14.Caption := '';
  end;
end;

//diese Procedure für speichern und löschen
procedure SetzeAllesFuerLadeNeueDatei_ohne_ActivePage;
begin
  with form1 do
  begin
    SucheAnzeigen := true;
    LetzteDatei := '';
    AktuelleDatei := '';
    listbox1.Clear;
    Statusbar1.SimpleText := '';
    panel1.Caption := '';
    memo1.Clear;
    memo2.Clear;
    LoescheAlleEingabefelder;

    //pagecontrol1.ActivePage := Tabsheet1;

    label3.Caption := '';
    label5.Caption := '';
    label7.Caption := '';
    label9.Caption := '';
    label10.caption := '-1';

    label2notiz.Caption := '';
    label12.Caption := '';
    label13.Caption := '';
    label14.Caption := '';
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  SetzeAllesAufLeer;
  LeseEinstellungen;
  if (memo1.lines.Count) > 0 then label2Notiz.Caption := 'Ja'
                             else label2Notiz.Caption := 'Nein';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked = true then memo1.WantTabs := true
                              else memo1.WantTabs := false;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  if (memo1.lines.Count) > 0 then label2Notiz.Caption := 'Ja'
                             else label2Notiz.Caption := 'Nein';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF DeleteFile(progdir+HW_AdressTempFile) = false then begin end;
  If DeleteFile(ProgDir+HW_AdressTempFile2) = false then begin end;
  LetzteDatei := AktuelleDatei;
  SchreibeIni;
end;

function Dateierzeugen(Dateiname : string) : Boolean;
var
  fehler : integer;
  f      : Textfile;
begin
  Dateierzeugen := false;
  AssignFile(f,Dateiname);
  {$I-}
  rewrite(f);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Dateiname+'" konnte nicht geschlossen werden!');
    end
    else
    begin
      Dateierzeugen := true;
      Showmessage('Datei "'+Dateiname+'" wurde erfolgreich erzeugt.');
    end;
  end
  else
  begin
    showmessage('Datei "'+Dateiname+'" konnte nicht erzeugt werden!');
  end;
end;

procedure TForm1.NeuDatenbankerstellen1Click(Sender: TObject);
var
  _dateiname : string;
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
    _dateiname := saveDialog1.FileName;
    _dateiname := _Lastleerentf(_dateiname);
    if _dateiname <> '' then
    begin
      if FileExists(_dateiname) = true then
      begin
        if MessageDlg('Datei '+_dateiname+' besteht bereits!'+#10#13+
                      'Überschreiben?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin //wenn Yes
          if Dateierzeugen(_dateiname) = true then
          begin
            SetzeAllesFuerLadeNeueDatei;
            AktuelleDatei := _dateiname;
            statusbar1.SimpleText := AktuelleDatei;
          end;
        end;
      end
      else
      begin
        if Dateierzeugen(_dateiname) = true then
        begin
          SetzeAllesFuerLadeNeueDatei;
          AktuelleDatei := _dateiname;
          statusbar1.SimpleText := AktuelleDatei;
        end
      end;
    end;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  NeuDatenbankerstellen1Click(form1);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  tmpStg,
  was     : String;
  KurzStg : String[10];
begin
  was := ListBox1.Items[listbox1.itemindex];
  LeseDatensatz(AktuelleDatei,was);
  panel1.Caption := ListBox1.Items[listbox1.itemindex];
  label10.caption := inttostr(ListBox1.ItemIndex);
  if (memo1.lines.Count) > 0 then label2Notiz.Caption := 'Ja'
                             else label2Notiz.Caption := 'Nein';

  TmpStg := panel1.Caption;
  Delete(TmpStg,1,101);
  KurzStg := TmpStg;
  label12.Caption := 'Letzte Änderung';
  label13.Caption := KurzStg;
  Delete(TmpStg,1,11);
  label14.Caption := TmpStg;
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

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Datenbankffnen1Click(form1);
end;

procedure TForm1.NeuerDatensatz1Click(Sender: TObject);
var
  ListboxString,
  TempString,
  Tempdatei : string;
  gefunden  : Boolean;
  i         : integer;
begin
  If (AktuelleDatei <> '') then
  begin
    ListboxString := panel1.Caption;
    
    Tempdatei := AktuelleDatei;
    AllesVorbereitenForm2(AktuelleDatei,
                          progdir,
                          Arbeitsverzeichnis,
                          AnwendungsdatenOrdner,
                          label7.Caption);
    Form2.showmodal;
    SetzeAllesFuerLadeNeueDatei;
    AktuelleDatei := Tempdatei;
    LeseDatenbank(AktuelleDatei);

    //Alten Datensatz in Listbox wieder markieren
    if ListboxString <> '' then
    begin
      gefunden := false;
      i := -1;

      if ListBox1.Items.Count > 0 then
      begin
        repeat
          inc(i);
          TempString := ListBox1.Items[i];
          if ListboxString = TempString then
          gefunden := true;
        until (i = (listbox1.Items.Count - 1)) or (gefunden = true);
      end;

      if gefunden = true then
      begin
        //showmessage('I = '+inttostr(i));
        IF listbox1.Items.Count > 0 then
        begin
          Listbox1.Selected[i]:=True;
          ListBox1Click(form1);
        end
      end;
    end;

  end
  else Showmessage('Es wurde noch keine Datei ausgewählt!');  
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  NeuerDatensatz1Click(form1);
end;

procedure TForm1.Beenden1Click(Sender: TObject);
begin
  //WindowState := wsMinimized;
  close;
  application.Terminate;
end;

procedure TForm1.Datenbankschlieen1Click(Sender: TObject);
begin
  SetzeAllesFuerLadeNeueDatei;
end;

procedure TForm1.HWAdressArbeitsverzeichnis1Click(Sender: TObject);
Var
  TempStg : String;
begin
  if arbeitsverzeichnis <> '' then
  A_Verzeichnis.DirectoryListBox1.Directory := arbeitsverzeichnis
  else A_Verzeichnis.DirectoryListBox1.Directory := progdir;

  A_VerzeichnisArbeitsverzeichnis := '';
  A_Verzeichnis.Caption := 'HW Adress - Arbeitsverzeichnis';

  A_Verzeichnis.ShowModal;
  if A_VerzeichnisArbeitsverzeichnis <> '' then
  begin
    if DirectoryExists(A_VerzeichnisArbeitsverzeichnis) = false then
    begin
      TempStg := arbeitsverzeichnis;
      if TempStg = '' then Tempstg := '-';
      showmessage('Verzeichnis existiert nicht!'+#10#13+
                  A_VerzeichnisArbeitsverzeichnis+#10#13+#10#13+
                  'Aktuelles Verzeichnis: '+TempStg)
    end
    else
    begin
      arbeitsverzeichnis := A_VerzeichnisArbeitsverzeichnis;
      if RS_HasBackSlash(arbeitsverzeichnis) = false then
      arbeitsverzeichnis := arbeitsverzeichnis + '\';
    end;
  end
  else
  begin
    if MessageDlg('Es wurde kein Verzeichnis ausgewählt. '+#10#13+
                  'Soll das bisherige Verzeichnis gelöscht werden?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      arbeitsverzeichnis := '';
    end;
  end;
end;

procedure TForm1.AktuellenDatensatzspeichern1Click(Sender: TObject);
var
  i,//n,m,
  anfang,
  ende,
  stepper,
  fehler    : integer;
  f, f2, f3 : Textfile;
  Tempdatei,
  ListboxString,
  Tempstring,
  Murxzeile,
  Murxzeile2,
  zeile2,
  zeile     : string;
  gefunden,
  warFehler : Boolean;
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

  LabeledEdit2.Text := VorneRauteEntf(LabeledEdit2.Text);
  LabeledEdit2.Text := _LastLeerEntf(LabeledEdit2.Text);
  if LabeledEdit2.Text = '' then
  begin
    form1.PageControl1.ActivePage := form1.TabSheet1;
    ActiveControl := LabeledEdit2;
    showmessage('Eingabe erforderlich!');
    exit;
  end;

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

  try
    memo1.Lines.SaveToFile(progdir+HW_AdressTempFile2);
  except
    Showmessage('Es konnte nicht auf den Datenträger geschrieben werden.'+
                #10#13+'Speichern wird beendet!');
    Screen.cursor := crDefault;
    ButtonAnAus(true);
    exit;
  end;

  anfang := RS_strtoint(label3.Caption);
  ende := RS_strtoint(label5.Caption);
  i := 0;
  stepper := 0;
  warFehler := false;

  ProgressBar1.Position := 0;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := RS_StrToInt(label9.caption);
  ProgressBar1.Step := 500;

  AssignFile(f,AktuelleDatei);
  {$I-}
  Reset(f);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    AssignFile(f2,progdir+HW_AdressTempFile);
    {$I-}
    Rewrite(f2);
    {$I+}
    if IoResult = 0 then
    begin
      buttonanaus(false);
      Screen.cursor := crHourGlass;
      while not eof(f) do
      begin
        inc(i);
        inc(stepper);
        if stepper = 500 then
        begin
          ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
        {$I-}
        readln(f,zeile);
        if (i < anfang) or (i > ende) then Writeln(f2,zeile);
        {$I+}
        if (ioresult <> 0) then
        Begin
          Screen.cursor := crDefault;
          buttonanaus(true);
          Showmessage('Kritischer Fehler: Es konnte nicht in eine Datei '+
                      'geschrieben werden!'+#10#13+
                      'Die Originaldatei ist noch intakt.'+#10#13+
                      'Procedure wird beendet.');
          //Dateien noch schließen bevor Prog beendet wird!!!
          {$I-}
          closefile(f);
          closefile(f2);
          {$I+}
          if IoResult <> 0 then begin end;
          Screen.cursor := crDefault;
          ButtonAnAus(true);
          Exit;
        end;
      end;

      {$I-}
      //Hier Datensatz an Tempdatei anhängen
      Murxzeile := '';
      Murxzeile2 := '';
      Murxzeile := LabeledEdit2.Text+' '+LabeledEdit3.Text;
      Murxzeile := _FillStrHinten(Murxzeile,101,' ');
      Murxzeile2 := (DateToStr(Date));
      Murxzeile2 := Murxzeile2 + ' ';
      Murxzeile := Murxzeile + Murxzeile2;
      Murxzeile2 := (TimeToStr(Time));
      Murxzeile := Murxzeile + Murxzeile2;

      writeln(f2,'#'+Murxzeile);

      writeln(f2,LabeledEdit2.text);
      writeln(f2,LabeledEdit3.text);
      writeln(f2,LabeledEdit4.text);
      writeln(f2,LabeledEdit5.text);
      writeln(f2,LabeledEdit6.text);
      writeln(f2,LabeledEdit7.text);
      writeln(f2,LabeledEdit8.text);
      writeln(f2,LabeledEdit9.text);
      writeln(f2,LabeledEdit10.text);
      writeln(f2,LabeledEdit11.text);
      writeln(f2,LabeledEdit12.text);
      writeln(f2,MaskEdit1.text);
      writeln(f2,LabeledEdit14.text);
      {$I+}
      if ioresult <> 0 then begin end;

      AssignFile(f3,ProgDir+HW_AdressTempFile2);
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
          Writeln(f2,zeile2);
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
          closefile(f2);
          closefile(f3);
          {$I+}
          if IoResult <> 0 then begin end;
          Screen.cursor := crDefault;
          ButtonAnAus(true);
          Exit;
        end;
        {$I-}
        closefile(f3);
        {$I+}
        if (ioresult <> 0) then
        begin
          showmessage('Datei '+ProgDir+HW_AdressTempFile2+
                      ' konnte nicht geschlossen werden!');
        end;
      end
      else
      begin
        showmessage('Datei '+ProgDir+HW_AdressTempFile2+
                    ' konnte nicht geöffnet werden!');
      end;
      //Ende Datei(F3)

      {$I-}
      writeln(f2,'#END');
      {$I+}
      if (ioresult <> 0) then warFehler := true
                         else warFehler := false;

      {$I-}
      closeFile(f2);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei konnte nicht geschlossen werden!');
      end;
      Screen.cursor := crDefault;
      buttonanaus(true);
    end
    else Showmessage('Temp Datei "'+HW_AdressTempFile+
                     '" konnte nicht erzeugt werden!');

    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei konnte nicht geschlossen werden!');
    end
  end
  else
  begin
    showmessage('Datei konnte nicht geöffnet werden!');
  end;
  if warFehler = false then
  begin
    //Jetzt alles in Aktuelle Datei zurückschreiben
    AssignFile(f2,progdir+HW_AdressTempFile);
    {$I-}
    reset(f2);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      AssignFile(f,AktuelleDatei);
      {$I-}
      rewrite(f);
      {$I+}
      fehler := ioresult;
      if fehler = 0 then
      begin
        {$I-}
        while not eof(f2) do
        begin
          Readln(f2,zeile);
          Writeln(f,zeile);
        end;
        {$I+}
        fehler := ioresult;
        if fehler <> 0 then
        begin
          Screen.cursor := crDefault;
          buttonanaus(true);
          Showmessage('Kritischer Fehler: Es konnte nicht in eine Datei '+
                      'geschrieben werden!'+#10#13+
                      'Die Originaldatei wurde überschrieben.'+#10#13+
                      'Procedure wird beendet.');
          //Dateien noch schließen bevor Prog beendet wird!!!
          {$I-}
          closefile(f);
          closefile(f2);
          {$I+}
          if ioresult <> 0 then begin end;
          Screen.cursor := crDefault;
          ButtonAnAus(true);
          exit;
        end;

        {$I-}
        closefile(f);
        {$I+}
        if (ioresult <> 0) then
        begin
          showmessage('Datei '+AktuelleDatei+
                      ' konnte nicht geschlossen werden!');
        end;
      end
      else
      begin
        showmessage('Datei '+AktuelleDatei+
                    ' konnte nicht geöffnet werden!');
      end;
      //End Datei(f);

      {$I-}
      closefile(f2);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei '+progdir+HW_AdressTempFile+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+progdir+HW_AdressTempFile+
                  ' konnte nicht geöffnet werden!');
    end;
    //Ende in alte Datei zurückschreiben

    IF DeleteFile(progdir+HW_AdressTempFile) = false then
    Showmessage('Temporäre Datei: '+progdir+HW_AdressTempFile+#10#13+
                'konnte nicht gelöscht werden !');
  end
  else
  begin
    If DeleteFile(progdir+HW_AdressTempFile) = false then
    Showmessage('Temporäre Datei: '+#10#13+progdir+HW_AdressTempFile+#10#13+
                'konnte nicht gelöscht werden !');

    showmessage('Es ist ein Fehler aufgetreten!'+#10#13+
                'Speichern nicht möglich.');
  end;

  Screen.cursor := crDefault;
  buttonanaus(true);

  If DeleteFile(ProgDir+HW_AdressTempFile2) = false then
  Showmessage('Temporäre Datei: '+#10#13+ProgDir+HW_AdressTempFile2+#10#13+
              'konnte nicht gelöscht werden !');

  ListboxString := Murxzeile;

  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei_ohne_ActivePage;
  
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);

  //Alten Datensatz in Listbox wieder markieren
  ListboxString := _LastLeerEntf(ListboxString);
  if ListboxString <> '' then
  begin
    gefunden := false;
    i := -1;
    
    if ListBox1.Items.Count > 0 then
    begin
      repeat
        inc(i);
        TempString := ListBox1.Items[i];
        if ListboxString = TempString then
        gefunden := true;
      until (i = (listbox1.Items.Count - 1)) or (gefunden = true);
    end;

    if gefunden = true then
    begin
      //showmessage('I = '+inttostr(i));
      IF listbox1.Items.Count > 0 then
      begin
        Listbox1.Selected[i]:=True;
        ListBox1Click(form1);
      end
    end;
  end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  AktuellenDatensatzspeichern1Click(form1);
end;

procedure TForm1.AktuellenDatensatzlschen1Click(Sender: TObject);
var
  i,
  anfang,
  ende,
  stepper,
  fehler    : integer;
  f, f2     : Textfile;
  Tempdatei,
  TempCap,
  zeile     : string;
  warFehler : Boolean;
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
  if MessageDlg('Datensatz löschen?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;

  anfang := RS_strtoint(label3.Caption);
  ende := RS_strtoint(label5.Caption);
  i := 0;
  stepper := 0;
  warFehler := false;

  ProgressBar1.Position := 0;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := RS_StrToInt(label9.caption);
  ProgressBar1.Step := 500;

  AssignFile(f,AktuelleDatei);
  {$I-}
  Reset(f);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    AssignFile(f2,progdir+HW_AdressTempFile);
    {$I-}
    Rewrite(f2);
    {$I+}
    if IoResult = 0 then
    begin
      buttonanaus(false);
      Screen.cursor := crHourGlass;
      while not eof(f) do
      begin
        inc(i);
        inc(stepper);
        if stepper = 500 then
        begin
          ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
        {$I-}
        readln(f,zeile);
        if (i < anfang) or (i > ende) then Writeln(f2,zeile);
        {$I+}
        if (ioresult <> 0) then
        Begin
          Screen.cursor := crDefault;
          buttonanaus(true);
          Showmessage('Kritischer Fehler: Es konnte nicht in eine Datei '+
                      'geschrieben werden!'+#10#13+
                      'Die Originaldatei ist noch intakt.'+#10#13+
                      'Procedure wird beendet.');
          //Dateien noch schließen bevor Prog beendet wird!!!
          {$I-}
          closefile(f);
          closefile(f2);
          {$I+}
          if IoResult <> 0 then begin end;
          Screen.cursor := crDefault;
          ButtonAnAus(true);
          Exit;
        end;
      end;

      {$I-}
      closeFile(f2);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei konnte nicht geschlossen werden!');
      end;
      Screen.cursor := crDefault;
      buttonanaus(true);
    end
    else Showmessage('Temp Datei "'+HW_AdressTempFile+
                     '" konnte nicht erzeugt werden!');

    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei konnte nicht geschlossen werden!');
    end
  end
  else
  begin
    showmessage('Datei konnte nicht geöffnet werden!');
  end;
  if warFehler = false then
  begin
    //Jetzt alles in Aktuelle Datei zurückschreiben
    AssignFile(f2,progdir+HW_AdressTempFile);
    {$I-}
    reset(f2);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      AssignFile(f,AktuelleDatei);
      {$I-}
      rewrite(f);
      {$I+}
      fehler := ioresult;
      if fehler = 0 then
      begin
        {$I-}
        while not eof(f2) do
        begin
          Readln(f2,zeile);
          Writeln(f,zeile);
        end;
        {$I+}
        fehler := ioresult;
        if fehler <> 0 then
        begin
          Screen.cursor := crDefault;
          buttonanaus(true);
          Showmessage('Kritischer Fehler: Es konnte nicht in eine Datei '+
                      'geschrieben werden!'+#10#13+
                      'Die Originaldatei wurde überschrieben.'+#10#13+
                      'Procedure wird beendet.');
          //Dateien noch schließen bevor Prog beendet wird!!!
          {$I-}
          closefile(f);
          closefile(f2);
          {$I+}
          if ioresult <> 0 then begin end;
          Screen.cursor := crDefault;
          ButtonAnAus(true);
          exit;
        end;

        {$I-}
        closefile(f);
        {$I+}
        if (ioresult <> 0) then
        begin
          showmessage('Datei '+AktuelleDatei+
                      ' konnte nicht geschlossen werden!');
        end;
      end
      else
      begin
        showmessage('Datei '+AktuelleDatei+
                    ' konnte nicht geöffnet werden!');
      end;
      //End Datei(f);

      {$I-}
      closefile(f2);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei '+progdir+HW_AdressTempFile+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+progdir+HW_AdressTempFile+
                  ' konnte nicht geöffnet werden!');
    end;
    //Ende in alte Datei zurückschreiben

    IF DeleteFile(progdir+HW_AdressTempFile) = false then
    Showmessage('Temporäre Datei: '+progdir+HW_AdressTempFile+#10#13+
                'konnte nicht gelöscht werden !');
  end
  else
  begin
    If DeleteFile(progdir+HW_AdressTempFile) = false then
    Showmessage('Temporäre Datei: '+#10#13+progdir+HW_AdressTempFile+#10#13+
                'konnte nicht gelöscht werden !');

    showmessage('Es ist ein Fehler aufgetreten!'+#10#13+
                'Löschen nicht möglich.');
  end;

  TempCap := label10.caption;
  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei_ohne_ActivePage;
  
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);
  label10.caption := TempCap;

  IF listbox1.Items.Count > 0 then
  begin
    if (strtoint(label10.caption) > 0) then
    begin
      Listbox1.Selected[strtoint(label10.caption)-1]:=True;
      ListBox1Click(form1);
    end
    else
    begin
      Listbox1.Selected[0]:=True;
      ListBox1Click(form1);
    end;
  end
  else label10.caption := '-1';
  Screen.cursor := crDefault;
  buttonanaus(true);
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  AktuellenDatensatzlschen1Click(form1);
end;

//Beachten: uses printers
procedure TForm1.AktuellenDatensatzdrucken1Click(Sender: TObject);
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
   pagecontrol1.ActivePage := Tabsheet3;
   label11.Caption := 'Datensatz drucken . . .';
   If Printdialog1.execute then begin
      //Setze den Title des Druckauftragen auf den Dateinamen
      Printer.title:='HW Adress';;
      //Fange mit der Aufzeichnung der Befehle an

      (*
      Printer.Canvas.Font.size := 10;
      Printer.Orientation := poPortrait;
      Printer.Canvas.Font.name := 'Courier New';
      Printer.Canvas.Font.Pitch := fpFixed;
      *)
      Printer.Canvas.Font := Memo2.Font;
      Printer.Orientation := poPortrait;

      Printer.begindoc;
      //Setze Variblen auf genz oben
      Zeile:=0;
      Geschriebenes:=0;
      //Solange wir die Anzahl der Memo-Zeilen nicht überschritten haben...
      while Zeile<Memo2.lines.count do begin
         //Gebe den Text der Aktuellen Zeile aus
         //mit: Abstand von links: 50
         //mit: Abstand von oben: 50 + Bisher geschriebenes

         xPrnText := Memo2.lines[Zeile];
         if xPrnText = '' then xPrnText := xPrnText + ' ';
         Printer.Canvas.Textout(250,50+geschriebenes,xPrnText);

         //Ergänze den Bisher geschribenen Text um dei letzte Zeile
         maxtext:=Printer.canvas.TextHeight(xPrnText);
         //maxtext:=Printer.canvas.TextHeight(Memo2.Lines[Zeile]);

         (*
         Printer.Canvas.Textout(250,50+geschriebenes,Memo2.lines[Zeile]);
         //Ergänze den Bisher geschribenen Text um dei letzte Zeile
         maxtext:=Printer.canvas.TextHeight(Memo2.Lines[Zeile]);
         *)

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
  label11.Caption := '';
  application.ProcessMessages;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  AktuellenDatensatzdrucken1Click(form1);
end;

procedure TForm1.Schriftart1Click(Sender: TObject);
const
  mld : string = 'Um Darstellungsfehler in der Tabelle vorzubeugen'+#10#13+
                 'wird die Datei neu eingelesen. Alle Anderungen'+#10#13+
                 'gehen verloren. Wenn Sie zuerst speichern möchten'+#10#13+
                 'drücken Sie "Nein".'+#10#13+
                 'Fortfahren?';
var
  tempStr : string;
begin
  FontDialog1.Font := memo1.Font;
  if fontdialog1.execute then
  begin
    memo1.font:=fontdialog1.font;

    if memo1.Font.Size > 16 then memo1.Font.Size := 16;
    if memo1.Font.Size < 8 then memo1.Font.Size := 8;

    listbox1.Font:=memo1.font;

    form1.memo2.Font := form1.Memo1.Font;

    form1.LabeledEdit2.Font := form1.Memo1.Font;
    form1.LabeledEdit3.font := form1.Memo1.Font;
    form1.LabeledEdit4.font := form1.Memo1.Font;
    form1.LabeledEdit5.font := form1.Memo1.Font;
    form1.LabeledEdit6.font := form1.Memo1.Font;
    form1.LabeledEdit7.font := form1.Memo1.Font;
    form1.LabeledEdit8.font := form1.Memo1.Font;
    form1.LabeledEdit9.font := form1.Memo1.Font;
    form1.LabeledEdit10.font := form1.Memo1.Font;
    form1.LabeledEdit11.font := form1.Memo1.Font;
    form1.LabeledEdit12.font := form1.Memo1.Font;
    form1.Maskedit1.Font := form1.Memo1.Font;
    form1.LabeledEdit14.font := form1.Memo1.Font;

    if fsBold in  memo1.font.style then
    Fett := true else fett := false;
    if fsItalic in  memo1.font.style then
    Kursiv := true else Kursiv := false;
    if fsUnderline in  memo1.font.style then
    Unterstrichen := true else Unterstrichen := false;
    if fsStrikeout in  memo1.font.style then
    Durchgestrichen := true else Durchgestrichen := false;

    farbe := ColorToString(fontdialog1.font.Color);

    if AktuelleDatei <> '' then
    begin
      if MessageDlg(mld,mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
        exit;
      end;
    end;
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


procedure TForm1.AlleDatenstzeanzeigen1Click(Sender: TObject);
var
  tempdatei : string;
begin
  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei;
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  progressbar1.Left := Width-180;
end;

procedure TForm1.Datenstzesuchen1Click(Sender: TObject);
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
  If (AktuelleDatei = '') then
  begin
    Showmessage('Es wurde noch keine Datei ausgewählt!');
    exit;
  end;

  if SucheAnzeigen = true then
  begin
    xsuchwort := '';
    SuchenForm.SearchEdit.Text := '';
    SuchenForm.ShowModal;
  end;
  xsuchwort := _LastLeerEntf(xsuchwort);
  if xsuchwort <> '' then
  begin
    if AktuelleDatei = '' then exit;
    label10.caption := '-1';
    listbox1.clear;
    memo1.Clear;
    label3.caption := '';
    label5.caption := '';
    panel1.Caption := '';
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
            such := xsuchwort;
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
    //showmessage('Eingabe erforderlich!');
    //activecontrol := edit1;
  end;
  Screen.cursor := crDefault;
  buttonanaus(true);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  Datenstzesuchen1Click(form1);
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  AlleDatenstzeanzeigen1Click(form1);
end;

procedure TForm1.DatenstzenachAlphabet1Click(Sender: TObject);
begin
  form3.left := Form3Left;
  form3.top := Form3Top;
  Form3.Show;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
  DatenstzenachAlphabet1Click(form1);
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet2;
  activecontrol := memo1;
  memo1.PasteFromClipboard;
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet2;
  activecontrol := memo1;
  memo1.SelText := (DateToStr(Date));
  memo1.SelText := ' ';
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet2;
  activecontrol := memo1;
  memo1.SelText := (TimeToStr(Time));
  memo1.SelText := ' ';
end;

procedure TForm1.DatensatzindieZwischenablagekopieren1Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet3;
  activecontrol := memo2;
  memo2.SelectAll;
  memo2.CopyToClipboard;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  DatensatzindieZwischenablagekopieren1Click(form1);
end;

procedure TForm1.Beenden2Click(Sender: TObject);
begin
  Beenden1Click(form1);
end;

procedure TForm1.Einfgen1Click(Sender: TObject);
begin
  SpeedButton13Click(form1);
end;

procedure TForm1.Kopieren1Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet2;
  activecontrol := memo1;
  memo1.CopyToClipboard;
end;

procedure TForm1.Ausschneiden1Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet2;
  activecontrol := memo1;
  memo1.CutToClipboard ;
end;

procedure TForm1.Allesmarkieren1Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet3;
  activecontrol := memo2;
  memo2.SelectAll;
end;

procedure TForm1.Datum1Click(Sender: TObject);
begin
  SpeedButton14Click(form1);;
end;

procedure TForm1.Uhrzeit1Click(Sender: TObject);
begin
  SpeedButton15Click(form1);
end;

procedure TForm1.Email1Click(Sender: TObject);
var
  pc1 : pchar;
begin
  labelededit11.text := _Lastleerentf(labelededit11.text);
  if labelededit11.text <> '' then
  begin
    PC1 := PChar('mailto:'+labelededit11.text);
    ShellExecute(Application.MainForm.Handle, NIL,PC1,'','', SW_SHOWNORMAL);
  end
  else
  begin
    form1.PageControl1.ActivePage := form1.TabSheet1;
    activecontrol := labelededit11;
    showmessage('Keine E-Mail Adresse angegeben');
  end;
end;

procedure TForm1.Homepage1Click(Sender: TObject);
begin
  if labelededit12.text <> '' then
  ShellExecute(Application.MainForm.Handle, NIL, PChar(labelededit12.text), '', '', SW_SHOWNORMAL)
  else
  begin
    showmessage('Datenfeld ist leer.');
    form1.PageControl1.ActivePage := form1.TabSheet1;
    activecontrol := labelededit12;
  end;
end;


procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
  Email1Click(form1);
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
  Homepage1Click(form1);
end;

procedure TForm1.Einstellungen1Click(Sender: TObject);
begin
  SetupDateiName := AnwendungsdatenOrdner+'Setup.cfg';
  Optionen_AnwendungsdatenOrdner := AnwendungsdatenOrdner;
  Optioneneinlesen;
  option.Edit1.Text := arbeitsverzeichnis;
  option.showmodal;
end;

procedure TForm1.OptionenClick(Sender: TObject);
begin
  Firmendateiname := AnwendungsdatenOrdner+'Eigenedaten.cfg';
  Eigen_AnwendungsdatenOrdner := AnwendungsdatenOrdner;
  Eigendatenholen;
  eigen.showmodal;
end;

procedure TForm1.Briefverfassen1Click(Sender: TObject);
var
  zeile : string;
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
  Firmendateiname := AnwendungsdatenOrdner+'Eigenedaten.cfg';
  SetupDateiName := AnwendungsdatenOrdner+'Setup.cfg';
  StandardLeseDatei;
  leseFirmenAdr;

  labelededit2.Text := _LastLeerEntf(labelededit2.Text);
  if labelededit2.Text = '' then
  begin
    form1.PageControl1.ActivePage := form1.TabSheet1;
    activecontrol := labelededit2;
    showmessage('Eingabe erforderlich!');
    exit;
  end;
  setupsatz.endung := _lastLeerEntf(setupsatz.endung);
  if setupsatz.endung = '' then
  begin
    showmessage('Bitte geben Sie unter Optionen-Einstellungen die Dateiendung '+
                'Ihrer Textverarbeitung ein.');
    exit;
  end;

  memo3.Clear;
  memo3.Lines.Add(firmensatz.ort+', '+gebedatum);
  if setupsatz.Eigenkopf[1] = true then memo3.Lines.Add(firmensatz.vorname+' '+firmensatz.name);
  //if setupsatz.Eigenkopf[2] = true then memo3.Lines.Add(firmensatz.ansprechpartner);
  if setupsatz.Eigenkopf[3] = true then
  begin
    memo3.Lines.Add(firmensatz.Strasse);
    zeile := firmensatz.land+' '+firmensatz.plz+' '+firmensatz.ort;
    zeile := vorneleerentf(zeile);
    memo3.Lines.Add(zeile);
  end;
  if setupsatz.Eigenkopf[4] = true then memo3.Lines.Add('Telefon: '+firmensatz.tel);
  if setupsatz.Eigenkopf[5] = true then memo3.Lines.Add('Handy:   '+firmensatz.Handy);
  if setupsatz.Eigenkopf[6] = true then memo3.Lines.Add('Fax:     '+firmensatz.Fax);
  if setupsatz.Eigenkopf[7] = true then memo3.Lines.Add('E-Mail:  '+firmensatz.E_Mail);
  if setupsatz.Eigenkopf[8] = true then memo3.Lines.Add('Homepage:'+firmensatz.Homepage);

  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  if setupsatz.adresskopf[1] = true then memo3.Lines.Add(labelededit3.text+' '+labelededit2.text);
  //if setupsatz.adresskopf[2] = true then memo3.Lines.Add(labelededit3.text);
  if setupsatz.adresskopf[3] = true then
  begin
    memo3.Lines.Add(labelededit4.text);
    zeile := labelededit5.text+' '+labelededit6.text+' '+labelededit7.text;
    zeile := vorneleerentf(zeile);
    memo3.Lines.Add(zeile);
  end;
  if setupsatz.adresskopf[4] = true then memo3.Lines.Add('Telefon: '+labelededit8.text);
  if setupsatz.adresskopf[5] = true then memo3.Lines.Add('Handy:   '+labelededit9.text);
  if setupsatz.adresskopf[6] = true then memo3.Lines.Add('Fax:     '+labelededit10.text);
  if setupsatz.adresskopf[7] = true then memo3.Lines.Add('E-Mail:  '+labelededit11.text);
  if setupsatz.adresskopf[8] = true then memo3.Lines.Add('Homepage:'+labelededit12.text);
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('Betreff:');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add('Mit freundlichen Grüßen ');
  memo3.Lines.Add('');
  memo3.Lines.Add('');
  memo3.Lines.Add(firmensatz.vorname+' '+firmensatz.name);

  try
    memo3.Lines.SaveToFile(Arbeitsverzeichnis+labelededit2.text+labelededit3.text+'_'+gebedatum+'.'+setupsatz.endung);
  except
    showmessage('Datei konnte nicht erzeugt werden!');
  end;
  try
    ShellExecute(0,
                 Nil,
                 PChar(Arbeitsverzeichnis+labelededit2.text+labelededit3.text+'_'+gebedatum+'.'+setupsatz.endung),
                 Nil,
                 Nil,
                 SW_NORMAL);
  except
    showmessage('Textverarbeitung konnte nicht gestartet werden!');
  end;
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
  Briefverfassen1Click(form1);
end;

//ab hier für export
function Dateierzeugen2(Datei_name : string) : Boolean;
var
  fehler : integer;
  f      : textfile;
begin
  Dateierzeugen2 := false;
  AssignFile(f,Datei_name);
  {$I-}
  rewrite(f);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Datei_name+'" konnte nicht geschlossen werden!');
    end
    else Dateierzeugen2 := true;
  end
  else
  begin
    showmessage('Datei "'+Datei_name+'" konnte nicht erzeugt werden!');
  end;
end;

procedure Datenexport(Exportdatei: string);
var
  zeile,
  upzeile   : string;
  kurzzeile : string[1];
  f,
  f2        : textfile;
  i,n,
  stepper,
  fehler    : integer;
begin
  n := 0;
  assignfile(f2,Exportdatei);
  {$I-}
  append(f2);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    //anfang export
    buttonanaus(false);
    assignfile(f,AktuelleDatei);
    {$I-}
    reset(f);
    {$I+}
    if ioresult = 0 then
    begin
      Screen.cursor := crHourGlass;

      stepper := 0;
      form1.ProgressBar1.Position := 0;
      form1.ProgressBar1.Min := 0;
      form1.ProgressBar1.Max := RS_StrToInt(form1.label9.caption);
      form1.ProgressBar1.Step := 500;

      while not eof(f) do
      begin
        inc(stepper);
        if (stepper = 500) then
        begin
          form1.ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;

        zeile := '';
        readln(f,zeile);
        upzeile := zeile;
        upzeile := rs_upcase(upzeile);

        kurzzeile := zeile;
        if kurzzeile = '#' then
        begin
          n := 0;
          if (upzeile <> '#END') then
          begin
            delete(zeile,1,1);
            //writeln(f2,zeile);
          end
          else for i := 1 to 5 do writeln(f2,'');
        end
        else
        begin
          inc(n);
          //Hier zerpflücken
          Case n of
            1 : write(f2,zeile+' ');   //Name
            2 : writeln(f2,zeile);     //Vorname
            3 : writeln(f2,zeile);     //Strasse
            4 : begin
                  Zeile := VorneLeerEntf(Zeile);
                  if Zeile <> '' then
                  write(f2,zeile+' ');   //Land
                end;
            5 : begin
                  Zeile := VorneLeerEntf(Zeile);
                  if Zeile <> '' then
                  write(f2,zeile+' ');   //Plz
                end;  
            6 : writeln(f2,zeile);     //Ort
            7 : writeln(f2,'Telefon....: '+zeile);
            8 : writeln(f2,'Mobil......: '+zeile);
            9 : writeln(f2,'Fax........: '+zeile);
            10: writeln(f2,'E-mail.....: '+zeile);
            11: writeln(f2,'Homepage...: '+zeile);
            12: writeln(f2,'Geburtstag.: '+zeile);
            13: writeln(f2,'Anz. Kinder: '+zeile);
            14: begin
                  writeln(f2,'');
                  writeln(f2,'Notiz');
                  writeln(f2,'------');
                  writeln(f2,zeile); //Zeile bei Notiz noch mitnehmen
                end;
            else writeln(f2,zeile);    //Rest
          end;
        end;
      end;
      {$I-}
      closefile(f);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+AktuelleDatei+'" konnte nicht geschlossen werden!');
      end;
    end
    else Showmessage('Datei "'+AktuelleDatei+'" konnte nicht geöffnet werden!');
    Screen.cursor := crDefault;
    buttonanaus(true);
    form1.ProgressBar1.Position := 0;
    //ende export

    {$I-}
    closefile(f2);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Exportdatei+'" konnte nicht geschlossen werden!');
    end;
    showmessage('Export beendet !'+#10#13+#10#13+Exportdatei);
  end
  else
  begin
    showmessage('Datei "'+Exportdatei+'" konnte nicht geöffnet werden!');
  end;
  Screen.cursor := crDefault;
  buttonanaus(true);
  form1.ProgressBar1.Position := 0;
end;


procedure TForm1.DatenbankalsTextdateiexportieren1Click(Sender: TObject);
var
  _Datei_name : string;
begin
  AktuelleDatei := _Lastleerentf(AktuelleDatei); 
  if AktuelleDatei = '' then
  begin
    Showmessage('Es ist keine Datenbank geöffnet!');
    exit;
  end;
  if RS_StrToInt(label7.Caption) = 0 then
  begin
    MessageDlg('Datenbank enthält keine Datensätze.', mtInformation, [mbOk], 0);
    exit;
  end;

  if DirectoryExists(Arbeitsverzeichnis) = false then
  begin
    if Arbeitsverzeichnis <> '' then
    showmessage('Verzeichnis existiert nicht!'+#10#13+#10#13+Arbeitsverzeichnis);
    Arbeitsverzeichnis := '';
  end;
  if Arbeitsverzeichnis <> '' Then
  saveDialog2.InitialDir := Arbeitsverzeichnis
  else  saveDialog2.InitialDir := ExtractFilePath(Application.ExeName);

  if saveDialog2.Execute then
  begin
    _Datei_name := saveDialog2.FileName;
    _Datei_name := _Lastleerentf(_Datei_name);
    if _Datei_name <> '' then
    begin
      if FileExists(_Datei_name) = true then
      begin
        if MessageDlg('Datei '+_Datei_name+' besteht bereits!'+#10#13+
                      'Überschreiben?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if Dateierzeugen2(_Datei_name) = true then
          Datenexport(_Datei_name);
        end;
      end
      else
      begin
        if Dateierzeugen2(_Datei_name) = true then
        Datenexport(_Datei_name);
      end;
    end;
  end;
end;


procedure TForm1.Info2Click(Sender: TObject);
begin
  _xAboutBox.showmodal;
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
  _xAboutBox.showmodal;
end;

procedure TForm1.Lizenz1Click(Sender: TObject);
begin
  try
    ZeigeLicense.Memo1.clear;
    ZeigeLicense.Memo1.Lines.LoadFromFile(progdir+'license.dat');
    ZeigeLicense.caption := 'Software Lizenz';
    ZeigeLicense.ShowModal;
  except
    Showmessage('Datei konnte nicht geladen werden.');
  end;
end;

procedure TForm1.Hilfe1Click(Sender: TObject);
begin
  ZeigeHilfe(AnwendungsdatenOrdner,'HW_Adress.hlp','Einführung');
  RS_Hilfe.ShowModal;
end;

procedure TForm1.LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit8KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit9KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit10KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit12KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure TForm1.LabeledEdit14KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    //Perform(WM_NEXTDLGCTL, 0, 0);
    pagecontrol1.ActivePage := Tabsheet2;
    ActiveControl := memo1;
    key := #0;
  end;
end;

procedure TForm1.MaskEdit1Exit(Sender: TObject);
begin
  maskedit1.Text := RS_DelKomma(maskedit1.Text);
end;

procedure TForm1.AllesmarkierenNotiz1Click(Sender: TObject);
begin
  form1.PageControl1.ActivePage := form1.TabSheet2;
  activecontrol := memo1;
  memo1.SelectAll;
end;

procedure TForm1.Datenbankspeichernunter1Click(Sender: TObject);
var
  f, f2: Textfile;
  stepper,
  fehler : integer;
  Name1,Name2,
  zeile,
  Hier_dateiname: string;
begin
  Hier_dateiname := '';
  if AktuelleDatei = '' then
  begin
    showmessage('Es wurde noch keine Datei ausgewählt.');
    exit;
  end;

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
    if Hier_dateiname = '' then exit;
  end;
  if Hier_dateiname = '' then exit;

  name1 := Hier_dateiname;
  name2 := AktuelleDatei;

  name1 := RS_Upcase(name1);
  name2 := RS_Upcase(name2);
  if name1 = name2 then
  begin
    Showmessage('Neuer Dateiname ist identisch mit altem Dateinamen.'+#10#13+
                'Aktion kann nicht durchgeführt werden!');
    exit;
  end;

  if FileExists(Hier_dateiname) = true then
  begin
    //hier wenn Datei besteht
    if MessageDlg('Datei "'+Hier_dateiname+'" besteht bereits!'+#10#13+
                  'Überschreiben?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      //wenn No, was soll passieren
      exit;
    end;
  end;


  AssignFile(f,AktuelleDatei);
  {$I-}
  reset(f);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    AssignFile(f2,Hier_dateiname);
    {$I-}
    Rewrite(f2);
    {$I+}
    if ioresult <> 0 then
    begin
      showmessage('Datei "'+Hier_dateiname+'" konnte nicht erzeugt werden.'+#10#13+
                  'Aktion kann nicht durchgeführt werden!');

      {$I-}
      closefile(f);
      {$I+}
      Showmessage('Datei "'+AktuelleDatei+'" wurde geschlossen.');
      if IoResult <> 0 then begin end;
    end;

    Stepper := 0;
    ProgressBar1.Position := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := RS_StrToInt(label9.caption);
    ProgressBar1.Step := 500;

    buttonanaus(false);
    Screen.cursor := crHourGlass;
    {$I-}
    while not eof(f) do
    begin
      inc(stepper);
      if (stepper = 500) then
      begin
        ProgressBar1.Stepit;
        stepper := 0;
        Application.Processmessages;
      end;

      Readln(f,zeile);
      Writeln(f2,zeile);
    end;
    {$I+}
    if (ioresult <> 0) then
    begin
      Screen.cursor := crDefault;
      buttonanaus(true);
      ProgressBar1.Position := 0;
      showmessage('Lesefehler / Schreibfehler, Aktion fehlgeschlagen!');
    end;
    Screen.cursor := crDefault;
    buttonanaus(true);
    ProgressBar1.Position := 0;

    {$I-}
    closefile(f2);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Hier_dateiname+'" konnte nicht geschlossen werden!');
    end
    else showmessage('Datei "'+Hier_dateiname+'" wurde geschlossen.');

    {$I-}
    closefile(f);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+AktuelleDatei+'" konnte nicht geschlossen werden!');
    end
    else showmessage('Datei "'+AktuelleDatei+'" wurde geschlossen.');
  end
  else
  begin
    showmessage('Datei "'+AktuelleDatei+'" konnte nicht geöffnet werden!');
  end;

  if MessageDlg('Datei "'+Hier_dateiname+'" laden?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    SetzeAllesFuerLadeNeueDatei;
    AktuelleDatei := Hier_dateiname;
    statusbar1.SimpleText := AktuelleDatei;
    LeseDatenbank(AktuelleDatei);
  end;
end;


procedure HW_Datenexport(Exportdatei: string);
var
  zeile,
  upzeile   : string;
  kurzzeile : string[1];
  f,
  f2        : textfile;
  n,
  stepper,
  fehler    : integer;
begin
  n := 0;
  assignfile(f2,Exportdatei);
  {$I-}
  append(f2);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    //anfang export
    buttonanaus(false);
    assignfile(f,AktuelleDatei);
    {$I-}
    reset(f);
    {$I+}
    if ioresult = 0 then
    begin
      Screen.cursor := crHourGlass;

      stepper := 0;
      form1.ProgressBar1.Position := 0;
      form1.ProgressBar1.Min := 0;
      form1.ProgressBar1.Max := RS_StrToInt(form1.label9.caption);
      form1.ProgressBar1.Step := 500;

      while not eof(f) do
      begin
        inc(stepper);
        if (stepper = 500) then
        begin
          form1.ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;

        zeile := '';
        readln(f,zeile);
        upzeile := zeile;
        upzeile := rs_upcase(upzeile);

        kurzzeile := zeile;
        if kurzzeile = '#' then
        begin
          n := 0;
          if (upzeile <> '#END') then
          begin
            writeln(f2,zeile);
          end
          else writeln(f2,zeile);
        end
        else
        begin
          inc(n);
          //Hier zerpflücken
          Case n of
            1 : write(f2,zeile+' ');   //Name
            2 : writeln(f2,zeile);     //Vorname
            3 : writeln(f2,zeile);     //Strasse
            4 : begin
                  Zeile := VorneLeerEntf(Zeile);
                  if Zeile <> '' then
                  write(f2,zeile+' ');   //Land
                end;
            5 : begin
                  Zeile := VorneLeerEntf(Zeile);
                  if Zeile <> '' then
                  write(f2,zeile+' ');   //Plz
                end;  
            6 : writeln(f2,zeile);     //Ort
            7 : writeln(f2,'Telefon....: '+zeile);
            8 : writeln(f2,'Mobil......: '+zeile);
            9 : writeln(f2,'Fax........: '+zeile);
            10: writeln(f2,'E-mail.....: '+zeile);
            11: writeln(f2,'Homepage...: '+zeile);
            12: writeln(f2,'Geburtstag.: '+zeile);
            13: writeln(f2,'Anz. Kinder: '+zeile);
            14: begin
                  writeln(f2,'');
                  writeln(f2,'Notiz');
                  writeln(f2,'------');
                  writeln(f2,zeile); //Zeile bei Notiz noch mitnehmen
                end;
            else writeln(f2,zeile);    //Rest
          end;
        end;
      end;
      {$I-}
      closefile(f);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+AktuelleDatei+'" konnte nicht geschlossen werden!');
      end;
    end
    else Showmessage('Datei "'+AktuelleDatei+'" konnte nicht geöffnet werden!');
    Screen.cursor := crDefault;
    buttonanaus(true);
    form1.ProgressBar1.Position := 0;
    //ende export

    {$I-}
    closefile(f2);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Exportdatei+'" konnte nicht geschlossen werden!');
    end;
    showmessage('Export beendet !'+#10#13+#10#13+Exportdatei);
  end
  else
  begin
    showmessage('Datei "'+Exportdatei+'" konnte nicht geöffnet werden!');
  end;
  Screen.cursor := crDefault;
  buttonanaus(true);
  form1.ProgressBar1.Position := 0;
end;

procedure TForm1.DatenbankalsHelpWriterDatenbankexportieren1Click(
  Sender: TObject);
var
  _Datei_name : string;
begin
  AktuelleDatei := _Lastleerentf(AktuelleDatei); 
  if AktuelleDatei = '' then
  begin
    Showmessage('Es ist keine Datenbank geöffnet!');
    exit;
  end;
  if RS_StrToInt(label7.Caption) = 0 then
  begin
    MessageDlg('Datenbank enthält keine Datensätze.', mtInformation, [mbOk], 0);
    exit;
  end;

  if DirectoryExists(Arbeitsverzeichnis) = false then
  begin
    if Arbeitsverzeichnis <> '' then
    showmessage('Verzeichnis existiert nicht!'+#10#13+#10#13+Arbeitsverzeichnis);
    Arbeitsverzeichnis := '';
  end;
  if Arbeitsverzeichnis <> '' Then
  saveDialog3.InitialDir := Arbeitsverzeichnis
  else saveDialog3.InitialDir := ExtractFilePath(Application.ExeName);

  if saveDialog3.Execute then
  begin
    _Datei_name := saveDialog3.FileName;
    _Datei_name := _Lastleerentf(_Datei_name);
    if _Datei_name <> '' then
    begin
      if FileExists(_Datei_name) = true then
      begin
        if MessageDlg('Datei '+_Datei_name+' besteht bereits!'+#10#13+
                      'Überschreiben?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if Dateierzeugen2(_Datei_name) = true then
          HW_Datenexport(_Datei_name);
        end;
      end
      else
      begin
        if Dateierzeugen2(_Datei_name) = true then
        HW_Datenexport(_Datei_name);
      end;
    end;
  end;
end;

end.
