unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls, Menus, ToolWin, Buttons, ExtCtrls,
  IniFiles, CategoryButtons, printers, ShlObj, ActiveX, ShellApi;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Datensatz1: TMenuItem;
    Info1: TMenuItem;
    NeueDatenbank1: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Bevel1: TBevel;
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    Datenbankffnen1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Beenden2: TMenuItem;
    Label8: TLabel;
    Label9: TLabel;
    ProgressBar1: TProgressBar;
    Label10: TLabel;
    Datenbankschlieen1: TMenuItem;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    SaveDialog1: TSaveDialog;
    NeuerDatensatz1: TMenuItem;
    SpeedButton3: TSpeedButton;
    N2: TMenuItem;
    Schriftart1: TMenuItem;
    FontDialog1: TFontDialog;
    Bearbeiten1: TMenuItem;
    SpeedButton4: TSpeedButton;
    Datensatzspeichern1: TMenuItem;
    SpeedButton5: TSpeedButton;
    AktuellenDatensatzlschen1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    AktuellenDatensatzdrucken1: TMenuItem;
    PrintDialog1: TPrintDialog;
    SpeedButton6: TSpeedButton;
    N5: TMenuItem;
    AktuellenDatensatzsuchen1: TMenuItem;
    AlleDatenstzeAnzeigen1: TMenuItem;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Allesindie1: TMenuItem;
    N6: TMenuItem;
    Datensatz2Zeicheneinrcken1: TMenuItem;
    SaveDialog2: TSaveDialog;
    N7: TMenuItem;
    DatenbankalsTextdateiexportieren1: TMenuItem;
    N8: TMenuItem;
    DateimitEditorbearbeiten1: TMenuItem;
    N9: TMenuItem;
    Ausschneiden1: TMenuItem;
    Kopieren1: TMenuItem;
    Einfgen1: TMenuItem;
    Lschen1: TMenuItem;
    N10: TMenuItem;
    Allesmarkieren1: TMenuItem;
    DatumUhrzeit1: TMenuItem;
    N11: TMenuItem;
    Datum1: TMenuItem;
    Uhrzeit1: TMenuItem;
    N12: TMenuItem;
    ber1: TMenuItem;
    Lizenz1: TMenuItem;
    SpeedButton11: TSpeedButton;
    N14: TMenuItem;
    Formularmanager1: TMenuItem;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    ToolBar2: TToolBar;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Optionen1: TMenuItem;
    Optionen2: TMenuItem;
    HelpwriterArbeitsverzeichnis2: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    SpeedButton41: TSpeedButton;
    Hintergrundfarbe1: TMenuItem;
    ColorDialog1: TColorDialog;
    N13: TMenuItem;
    HintergrundfarbeTabelle1: TMenuItem;
    N15: TMenuItem;
    Datensatzverschlsseln1: TMenuItem;
    Datensatzentschlsseln1: TMenuItem;
    SpeedButton43: TSpeedButton;
    SpeedButton42: TSpeedButton;
    Panel2: TPanel;
    Passwortzurcksetzen1: TMenuItem;
    RS_Image2: TSpeedButton;
    RS_Image1: TSpeedButton;
    Hilfe1: TMenuItem;
    Codezurcksetzen1: TMenuItem;
    NeuenCodeeingeben1: TMenuItem;
    N16: TMenuItem;
    FindDialog1: TFindDialog;
    Suchen1: TMenuItem;
    N17: TMenuItem;
    SpeedButton44: TSpeedButton;
    N18: TMenuItem;
    N19: TMenuItem;
    Datenbankspeichernunter1: TMenuItem;
    N20: TMenuItem;
    Datenbankverschlsseln1: TMenuItem;
    Datenbankentschlsseln1: TMenuItem;
    procedure Datenbankentschlsseln1Click(Sender: TObject);
    procedure Datenbankverschlsseln1Click(Sender: TObject);
    procedure Datenbankspeichernunter1Click(Sender: TObject);
    procedure RS_Image2Click(Sender: TObject);
    procedure SpeedButton44Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure NeuenCodeeingeben1Click(Sender: TObject);
    procedure Codezurcksetzen1Click(Sender: TObject);
    procedure Hilfe1Click(Sender: TObject);
    procedure Passwortzurcksetzen1Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure Datensatzentschlsseln1Click(Sender: TObject);
    procedure Datensatzverschlsseln1Click(Sender: TObject);
    procedure HintergrundfarbeTabelle1Click(Sender: TObject);
    procedure Hintergrundfarbe1Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure HelpwriterArbeitsverzeichnis2Click(Sender: TObject);
    procedure Optionen2Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Formularmanager1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ber1Click(Sender: TObject);
    procedure Lizenz1Click(Sender: TObject);
    procedure Uhrzeit1Click(Sender: TObject);
    procedure Datum1Click(Sender: TObject);
    procedure DatumUhrzeit1Click(Sender: TObject);
    procedure Lschen1Click(Sender: TObject);
    procedure Einfgen1Click(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure Allesmarkieren1Click(Sender: TObject);
    procedure Ausschneiden1Click(Sender: TObject);
    procedure DateimitEditorbearbeiten1Click(Sender: TObject);
    procedure DatenbankalsTextdateiexportieren1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Datensatz2Zeicheneinrcken1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Allesindie1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure AktuellenDatensatzsuchen1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton8Click(Sender: TObject);
    procedure AlleDatenstzeAnzeigen1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure AktuellenDatensatzdrucken1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure AktuellenDatensatzlschen1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Datensatzspeichern1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Schriftart1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure NeuerDatensatz1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure NeueDatenbank1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Datenbankffnen1Click(Sender: TObject);
    procedure Datenbankschlieen1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Beenden2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1  : TForm1;
  EncodeSelection: integer;
  RS_XOR         : Boolean;

const
  HelpWriterTempFile  = 'HelpWriter2Temp1_xse365kk7890bgh.tmp';
  HelpWriterTempFile2 = 'HelpWriter2Temp2_xdgghhgfti0bgh.tmp';
  VerschluesselString = 'HW2#4fggkfg5gjo#+fpdospg#d#556ofdgg2';
  VerschluesselString2 = 'HW2*glkjgr#tgijrt>grigjo<irhjrh~oioiewr9@%4#qpp|qp"p}x4<qgsxdgp4s4"';

implementation

{$R *.dfm}

uses
  RS_Util, RS_MATH, NeuerDatensatz, lizense, xAbout,
  Verzeichnis, LeseKonfig, PassWord, Hilfe, code, Code_Selection;

type
TExecuteWaitEvent = procedure(const ProcessInfo: TProcessInformation;
                                    var ATerminate: Boolean) of object;


var
  Ini            : TIniFile;
  Listbox1_breite: integer;
  AnwendungsdatenOrdner,
  Arbeitsverzeichnis,
  AktuelleDatei,
  LetzteDatei,
  ProgDir        : string;
  Checkbox4Zaehler,
  RS_Width,
  RS_Height      : integer;
  Datenbankverschluesselt,
  ZeigeGroupBox1,
  ZeigeGroupBox2,
  ZeigeLabel10,
  Fett,
  Kursiv,
  Unterstrichen,
  Durchgestrichen: Boolean;
  Hintergrundfarbe,
  Hintergrundfarbe2,
  Farbe          : String;
  _key           : char;
  IstDatenVerschluesselt,
  PasswortOk     : Boolean;
  RS_Tag         : String[2];
  TagAlsZahl     : integer;



procedure ErstelleIni;
begin
  if FileExists(AnwendungsdatenOrdner+'HelpWriter2.ini') = false then
  begin
    Showmessage('Datei '+AnwendungsdatenOrdner+'HelpWriter2.ini wurde nicht gefunden.'+#10+#13+
                'Datei wird neu erstellt...');
    try
      Ini:=TIniFile.Create(AnwendungsdatenOrdner+'HelpWriter2.ini');
      Ini.WriteBool('Option','Tab',false);
      Ini.WriteBool('Option','Zeilenumbruch',false);
      Ini.WriteBool('Option','LetzteDatenbank',false);
      Ini.WriteBool('Option','Sort',true);
      Ini.WriteString('Option','Datei','');
      Ini.WriteString('Option','Arbeitsverzeichnis','');
      Ini.WriteInteger('Option','Listboxbreite',230);
      Ini.WriteInteger('Option','Width',640);
      Ini.WriteInteger('Option','Height',420);
      Ini.WriteInteger('Option','Top',0);
      Ini.WriteInteger('Option','Left',0);
      Ini.WriteBool('Option','Visible1',false);
      Ini.WriteBool('Option','ZeigeOption1',false);
      Ini.WriteBool('Option','ZeigeOption2',false);
      Ini.WriteInteger('Option','EncodeSelection',1);
      Ini.WriteBool('Option','XOR',false);

      Ini.WriteString('Font','Schrift','Courier New');
      Ini.WriteInteger('Font','Schriftgröße',10);
      Ini.WriteBool('Font','Fett',false);
      Ini.WriteBool('Font','Kursiv',false);
      Ini.WriteBool('Font','Unterstrichen',false);
      Ini.WriteBool('Font','Durchgestrichen',false);
      Ini.WriteString('Font','Farbe',ColorToString(clWindowText));

      Ini.WriteString('Hintergrund','Hintergrundfarbe',ColorToString(clWindow));
      Ini.WriteString('Hintergrund','Hintergrundfarbe2',ColorToString(clWindow));
    finally
      Ini.Free;
    end;
  end;
end;

procedure LeseIni;
begin
  try
    Ini:=TIniFile.Create(AnwendungsdatenOrdner+'HelpWriter2.ini');
    form1.Checkbox1.Checked:=Ini.ReadBool('Option','Tab',False);
    form1.Checkbox3.Checked:=Ini.ReadBool('Option','Zeilenumbruch',False);
    form1.Checkbox2.Checked:=Ini.ReadBool('Option','LetzteDatenbank',False);
    form1.Checkbox4.Checked:=Ini.ReadBool('Option','Sort',true);

    if form1.CheckBox2.Checked = true then
    LetzteDatei := Ini.ReadString('Option','Datei','')
    else LetzteDatei := '';

    Arbeitsverzeichnis := Ini.ReadString('Option','Arbeitsverzeichnis','');
    Listbox1_breite := Ini.ReadInteger('Option','Listboxbreite',230);
    RS_Width := Ini.ReadInteger('Option','Width',640);
    RS_Height := Ini.ReadInteger('Option','Height',420);
    form1.Top := Ini.ReadInteger('Option','Top',0);
    form1.Left := Ini.ReadInteger('Option','Left',0);
    ZeigeLabel10 := Ini.ReadBool('Option','Visible1',False);
    ZeigeGroupBox1 := Ini.ReadBool('Option','ZeigeOption1',False);
    ZeigeGroupBox2 := Ini.ReadBool('Option','ZeigeOption2',False);
    EncodeSelection := Ini.ReadInteger('Option','EncodeSelection',1);
    RS_XOR := Ini.ReadBool('Option','XOR',False);

    form1.Memo1.Font.Name := Ini.ReadString('Font','Schrift','Courier New');
    form1.Memo1.Font.Size := Ini.ReadInteger('Font','Schriftgröße',10);
    Fett:=Ini.ReadBool('Font','Fett',False);
    Kursiv:=Ini.ReadBool('Font','Kursiv',False);
    Unterstrichen:=Ini.ReadBool('Font','Unterstrichen',False);
    Durchgestrichen:=Ini.ReadBool('Font','Durchgestrichen',False);
    farbe:=Ini.ReadString('Font','Farbe',ColorToString(clWindowText));

    Hintergrundfarbe:=Ini.ReadString('Hintergrund','Hintergrundfarbe',ColorToString(clWindow));
    Hintergrundfarbe2:=Ini.ReadString('Hintergrund','Hintergrundfarbe2',ColorToString(clWindow));
  finally
    Ini.Free;
  end;
end;

procedure SchreibeIni;
begin
  try
    Ini:=TIniFile.Create(AnwendungsdatenOrdner+'HelpWriter2.ini');
    Ini.WriteBool('Option','Tab',form1.CheckBox1.Checked);
    Ini.WriteBool('Option','Zeilenumbruch',form1.CheckBox3.Checked);
    Ini.WriteBool('Option','LetzteDatenbank',form1.CheckBox2.Checked);
    Ini.WriteBool('Option','Sort',form1.CheckBox4.Checked);


    if form1.CheckBox2.Checked = true then
    Ini.WriteString('Option','Datei',LetzteDatei)
    else Ini.WriteString('Option','Datei','');

    Ini.WriteString('Option','Arbeitsverzeichnis',Arbeitsverzeichnis);
    Ini.WriteInteger('Option','Listboxbreite',Listbox1_breite);
    Ini.WriteInteger('Option','Width',RS_Width);
    Ini.WriteInteger('Option','Height',RS_Height);
    Ini.WriteInteger('Option','Top',form1.Top);
    Ini.WriteInteger('Option','Left',form1.Left);
    Ini.WriteBool('Option','Visible1',ZeigeLabel10);
    Ini.WriteBool('Option','ZeigeOption1',ZeigeGroupBox1);
    Ini.WriteBool('Option','ZeigeOption2',ZeigeGroupBox2);
    Ini.WriteInteger('Option','EncodeSelection',EncodeSelection);
    Ini.WriteBool('Option','XOR',RS_XOR);

    Ini.WriteString('Font','Schrift',form1.Memo1.Font.Name);
    Ini.WriteInteger('Font','Schriftgröße',form1.Memo1.Font.Size);
    Ini.WriteBool('Font','Fett',Fett);
    Ini.WriteBool('Font','Kursiv',Kursiv);
    Ini.WriteBool('Font','Unterstrichen',Unterstrichen);
    Ini.WriteBool('Font','Durchgestrichen',Durchgestrichen);
    Ini.WriteString('Font','Farbe',farbe);

    Ini.WriteString('Hintergrund','Hintergrundfarbe',Hintergrundfarbe);
    Ini.WriteString('Hintergrund','Hintergrundfarbe2',Hintergrundfarbe2);
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
    Info1.Enabled := anaus;
    Hilfe1.Enabled := anaus;
    Beenden2.Enabled := anaus;
    optionen1.Enabled := anaus;

    listbox1.Enabled := anaus;

    checkbox1.Enabled := anaus;
    checkbox2.Enabled := anaus;
    checkbox3.Enabled := anaus;
    checkbox4.Enabled := anaus;
    edit1.Enabled := anaus;

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
    speedbutton18.enabled := anaus;
    speedbutton19.enabled := anaus;
    speedbutton20.enabled := anaus;
    speedbutton21.enabled := anaus;
    speedbutton22.enabled := anaus;
    speedbutton23.enabled := anaus;
    speedbutton24.enabled := anaus;
    speedbutton25.enabled := anaus;
    speedbutton26.enabled := anaus;
    speedbutton27.enabled := anaus;
    speedbutton28.enabled := anaus;
    speedbutton29.enabled := anaus;
    speedbutton30.enabled := anaus;
    speedbutton31.enabled := anaus;
    speedbutton32.enabled := anaus;
    speedbutton33.enabled := anaus;
    speedbutton34.enabled := anaus;
    speedbutton35.enabled := anaus;
    speedbutton36.enabled := anaus;
    speedbutton37.enabled := anaus;
    speedbutton38.enabled := anaus;
    speedbutton39.enabled := anaus;
    speedbutton40.enabled := anaus;
    speedbutton41.enabled := anaus;
    speedbutton42.enabled := anaus;
    speedbutton43.enabled := anaus;
    speedbutton44.enabled := anaus;

    button1.Enabled := anaus;
    button2.Enabled := anaus;

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
    Info1.Enabled := anaus;
    Hilfe1.Enabled := anaus;
    Beenden2.Enabled := anaus;
    optionen1.Enabled := anaus;

    //Listbox funzt sonst nicht!!!
    //listbox1.Enabled := anaus;

    checkbox1.Enabled := anaus;
    checkbox2.Enabled := anaus;
    checkbox3.Enabled := anaus;
    checkbox4.Enabled := anaus;
    edit1.Enabled := anaus;

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
    speedbutton18.enabled := anaus;
    speedbutton19.enabled := anaus;
    speedbutton20.enabled := anaus;
    speedbutton21.enabled := anaus;
    speedbutton22.enabled := anaus;
    speedbutton23.enabled := anaus;
    speedbutton24.enabled := anaus;
    speedbutton25.enabled := anaus;
    speedbutton26.enabled := anaus;
    speedbutton27.enabled := anaus;
    speedbutton28.enabled := anaus;
    speedbutton29.enabled := anaus;
    speedbutton30.enabled := anaus;
    speedbutton31.enabled := anaus;
    speedbutton32.enabled := anaus;
    speedbutton33.enabled := anaus;
    speedbutton34.enabled := anaus;
    speedbutton35.enabled := anaus;
    speedbutton36.enabled := anaus;
    speedbutton37.enabled := anaus;
    speedbutton38.enabled := anaus;
    speedbutton39.enabled := anaus;
    speedbutton40.enabled := anaus;
    speedbutton41.enabled := anaus;
    speedbutton42.enabled := anaus;
    speedbutton43.enabled := anaus;
    speedbutton44.enabled := anaus;

    button1.Enabled := anaus;
    button2.Enabled := anaus;
  end;
end;

//Falls komplette Datenbank verschlüsselt ist
procedure ButtonAnAus3(anaus : Boolean);
Begin
  with form1 do
  begin
    if anaus = false then form1.Caption := 'Help Writer 2  -  Datenbank ist verschlüsselt und gesperrt!'
                     else form1.Caption := 'Help Writer 2';
    //Datei1.Enabled := anaus;
    Bearbeiten1.Enabled := anaus;
    Datensatz1.Enabled := anaus;
    //Info1.Enabled := anaus;
    //Hilfe1.Enabled := anaus;
    //Beenden2.Enabled := anaus;
    optionen1.Enabled := anaus;

    //listbox1.Enabled := anaus;

    checkbox1.Enabled := anaus;
    checkbox2.Enabled := anaus;
    checkbox3.Enabled := anaus;
    checkbox4.Enabled := anaus;
    //edit1.Enabled := anaus;
    if anaus = false then memo1.ReadOnly := true
                     else memo1.ReadOnly := false;

    //speedbutton1.enabled := anaus;
    //speedbutton2.enabled := anaus;
    speedbutton3.enabled := anaus;
    speedbutton4.enabled := anaus;
    speedbutton5.enabled := anaus;
    speedbutton6.enabled := anaus;
    speedbutton7.enabled := anaus;
    //speedbutton8.enabled := anaus;
    speedbutton9.enabled := anaus;
    speedbutton10.enabled := anaus;
    //speedbutton11.enabled := anaus;
    speedbutton12.enabled := anaus;
    speedbutton13.enabled := anaus;
    {speedbutton14.enabled := anaus;
    speedbutton15.enabled := anaus;
    speedbutton16.enabled := anaus;
    speedbutton17.enabled := anaus;
    speedbutton18.enabled := anaus;
    speedbutton19.enabled := anaus;
    speedbutton20.enabled := anaus;
    speedbutton21.enabled := anaus;
    speedbutton22.enabled := anaus;
    speedbutton23.enabled := anaus;
    speedbutton24.enabled := anaus;
    speedbutton25.enabled := anaus;
    speedbutton26.enabled := anaus;
    speedbutton27.enabled := anaus;
    speedbutton28.enabled := anaus;
    speedbutton29.enabled := anaus;
    speedbutton30.enabled := anaus;
    speedbutton31.enabled := anaus;
    speedbutton32.enabled := anaus;
    speedbutton33.enabled := anaus;
    speedbutton34.enabled := anaus;
    speedbutton35.enabled := anaus;
    speedbutton36.enabled := anaus;
    speedbutton37.enabled := anaus;
    speedbutton38.enabled := anaus;
    speedbutton39.enabled := anaus; }
    speedbutton40.enabled := anaus;
    speedbutton41.enabled := anaus;
    speedbutton42.enabled := anaus;
    speedbutton43.enabled := anaus;
    speedbutton44.enabled := anaus;

    button1.Enabled := anaus;
    button2.Enabled := anaus;

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
  Tempzeile2,
  zeile             : String;
  Minizeile         : String[1];
begin
  Datenbankverschluesselt := false;
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

        if AnzZeilen = 1 then
        begin
          tempzeile2 := zeile;
          if Tempzeile2 = Verschluesselstring2 then
          Datenbankverschluesselt := true
          else Datenbankverschluesselt := false;
        end;

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
  if Datenbankverschluesselt = true then
  begin
    showmessage('Diese Datenbank wurde mit HelpWriter komplett verschlüsselt.'+#10#13+
                'Die Datenbank ist gesperrt!');
    ButtonAnAus3(false)
  end else ButtonAnAus3(true);
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


procedure SetzeAllesAufLeer;
begin
  with form1 do
  begin
    Listbox1_breite := 230;
    Listbox1.Width := Listbox1_breite;
    listbox1.Clear;
    Statusbar1.SimpleText := '';
    panel1.Caption := '';
    memo1.Clear;
    edit1.Clear;
    checkbox1.Checked := false;
    checkbox2.Checked := false;
    checkbox3.Checked := false;
    LetzteDatei := '';
    AktuelleDatei := '';
    label3.Caption := '';
    label5.Caption := '';
    label7.Caption := '';
    label9.Caption := '';
    label10.caption := '-1';
    label11.Caption := '';
    label12.Caption := '';
  end;
end;

procedure SetzeAllesFuerLadeNeueDatei;
begin
  with form1 do
  begin
    LetzteDatei := '';
    AktuelleDatei := '';
    listbox1.Clear;
    Statusbar1.SimpleText := '';
    panel1.Caption := '';
    memo1.Clear;
    edit1.Clear;
    label3.Caption := '';
    label5.Caption := '';
    label7.Caption := '';
    label9.Caption := '';
    label10.caption := '-1';
    label11.Caption := '';
    label12.Caption := '';
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
  LetzteDBankopen : boolean;
begin
  LetzteDBankopen := false;
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

  ErstelleIni;
  LeseIni;

  if arbeitsverzeichnis <> '' then
  if RS_HasBackSlash(arbeitsverzeichnis) = false then
    arbeitsverzeichnis := arbeitsverzeichnis + '\';
  //showmessage(Arbeitsverzeichnis);

  form1.Edit2.Text := Arbeitsverzeichnis;

  if ZeigeLabel10 = false then
  begin
    form1.Label10.Visible := false;
    form1.DateimitEditorbearbeiten1.Visible := false
  end;  

  if ZeigeGroupBox1 = false then form1.GroupBox1.Visible := false;
  if ZeigeGroupBox2 = false then form1.GroupBox2.Visible := false;

  if (fett = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsBold];
  if (Kursiv = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsItalic];
  if (Unterstrichen = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsUnderline];
  if (Durchgestrichen = true) then
  form1.memo1.font.style := form1.memo1.font.style + [fsStrikeout];
  form1.Memo1.Font.Color := StringToColor(farbe);
  form1.Memo1.Color :=  StringToColor(Hintergrundfarbe);

  form1.Listbox1.Color :=  StringToColor(Hintergrundfarbe2);

  form1.ListBox1.Font := form1.Memo1.Font;
  form1.Edit1.Font := form1.Memo1.Font;

  form1.Width := RS_Width;
  form1.Height := RS_Height;
  form1.progressbar1.Left := form1.Width-170;

  if form1.checkbox1.Checked = true then form1.memo1.WantTabs := true
                                    else form1.memo1.WantTabs := false;

  //Falls parameter übergeben wurden,
  //letzte Datenbank nicht öffnen  !!!
  if AnzahlParam > 0 then
  begin
    LetzteDBankopen := form1.CheckBox2.Checked;
    form1.CheckBox2.Checked := false;
  end;

  Checkbox4Zaehler := 0;
  if form1.CheckBox4.Checked then
  begin
    form1.listbox1.Sorted := true;
    inc(Checkbox4Zaehler);
  end
  else
  begin
    form1.listbox1.Sorted := false;
    inc(Checkbox4Zaehler);
  end;

  if form1.CheckBox2.Checked then
  begin
    if (LetzteDatei <> '') then
    begin
      LeseDatenbank(LetzteDatei);
      AktuelleDatei := LetzteDatei;
    end;
  end;

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

  form1.Listbox1.Width := Listbox1_breite;

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

  PasswortOk := false;
  form1.RS_Image1.Visible := true;
  form1.RS_Image2.Visible := false;

  IstDatenVerschluesselt := false;
  form1.Panel2.Visible := false;

  //Für Verschlüsselung
  SetFourDigitYearFormat;
  RS_tag := GebeTag;
  TagAlsZahl := RS_StrToInt(RS_Tag);

  WieIstDerCode := '';
end;

   
procedure TForm1.FormCreate(Sender: TObject);
begin
  SetzeAllesAufLeer;
  LeseEinstellungen;
  PasswortOk := false;
  form1.RS_Image1.Visible := true;
  form1.RS_Image2.Visible := false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF DeleteFile(progdir+HelpWriterTempFile) = false then begin end;
  If DeleteFile(progdir+HelpWriterTempFile2) = false then begin end;
  RS_Width:=form1.Width;
  RS_Height:=form1.Height;
  Listbox1_breite := form1.ListBox1.Width;
  LetzteDatei := AktuelleDatei;
  SchreibeIni;
end;

procedure TForm1.Beenden1Click(Sender: TObject);
begin
  //Form1.WindowState :=  wsMinimized;
  close;
  Application.Terminate;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked = true then memo1.WantTabs := true
                              else memo1.WantTabs := false;
end;


procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Datenbankffnen1Click(form1);
end;

procedure TForm1.Beenden2Click(Sender: TObject);
begin
  //Form1.WindowState :=  wsMinimized;
  close;
  Application.Terminate;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  form1.progressbar1.Left := form1.Width-170;
  edit2.Width := form1.Width-230;
  button1.Left := form1.Width-150;
  button2.Left := form1.Width-200;
end;

procedure TForm1.Datenbankschlieen1Click(Sender: TObject);
begin
  SetzeAllesFuerLadeNeueDatei;
  Datenbankverschluesselt := false;
  if Datenbankverschluesselt = true then ButtonAnAus3(false)
                                    else ButtonAnAus3(true);
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

  //Damit bei jedem Satensatz ReadOnly erstmal aus ist
  //Datensatz ist nicht verschlüsselt
  form1.Panel2.Visible := false;
  application.ProcessMessages;
  memo1.ReadOnly := false;

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
      form1.Panel2.Caption := 'Dieser Datensatz ist verschlüsselt, um den Datensatz '+
                              'zu bearbeiten bitte entschlüsseln und speichern!';
      form1.Panel2.Visible := true;
      application.ProcessMessages;
      memo1.ReadOnly := true;
      exit; //wegen ButtonAnAus3 wegen Memo1 Readonly
    end
    else
    begin
      //Datensatz ist nicht verschlüsselt
      IstDatenVerschluesselt := false;
      form1.Panel2.Visible := false;
      application.ProcessMessages;
      memo1.ReadOnly := false;
    end;
  end
  else IstDatenVerschluesselt := false;

  if Datenbankverschluesselt = true then ButtonAnAus3(false)
                                    else ButtonAnAus3(true);
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

procedure TForm1.NeueDatenbank1Click(Sender: TObject);
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
            LeseDatenbank(AktuelleDatei);
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
          LeseDatenbank(AktuelleDatei);
        end
      end;
    end;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  NeueDatenbank1Click(form1);
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
    listbox1.Font:=fontdialog1.font;
    edit1.Font :=fontdialog1.font;

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

procedure TForm1.Datensatzspeichern1Click(Sender: TObject);
var
  i,//n,m,
  anfang,
  ende,
  stepper,
  fehler    : integer;
  f, f2, f3 : Textfile;
  RS_Stg01,
  RS_Stg02  : String[20];
  Tempstring,
  Tempdatei,
  ListboxString,
  zeile,
  zeile2    : string;
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

  Edit1.Text := _LastLeerEntf(Edit1.Text);
  if Edit1.Text = '' then
  begin
    Showmessage('Eingabe erforderlich!');
    activecontrol := edit1;
    exit;
  end;

  Edit1.Text := VorneRauteEntf(Edit1.Text);
  
  try
    memo1.Lines.SaveToFile(progdir+HelpWriterTempFile2);
  except
    Showmessage('Es konnte nicht auf den Datenträger '+
                'geschrieben werden!'+#10#13+
                'Vorgang wird beendet.');
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
    AssignFile(f2,progdir+HelpWriterTempFile);
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

      //Hier Datensatz an Tempdatei anhängen

      Edit1.Text := _LastLeerEntf(Edit1.Text);
      ListboxString := Edit1.Text;

      //FillStrHinten 100 weil Edit1 maxlength = 100
      ListboxString := _FillStrHinten(ListboxString,100,' ');
      RS_Stg01 := (DateToStr(Date));
      RS_Stg02 := (TimeToStr(Time));
      ListboxString := ListboxString+' '+RS_Stg01+' '+RS_Stg02;
      {$I-}
      writeln(f2,'#'+ListboxString);
      {$I+}
      if ioresult <> 0 then begin end;

      AssignFile(f3,progdir+HelpWriterTempFile2);
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
          exit;
        end;
        {$I-}
        closefile(f3);
        {$I+}
        if (ioresult <> 0) then
        begin
          showmessage('Datei '+progdir+HelpWriterTempFile2+
                      ' konnte nicht geschlossen werden!');
        end;
      end
      else
      begin
        showmessage('Datei '+progdir+HelpWriterTempFile2+
                    ' konnte nicht geöffnet werden!');
      end;
      //Ende Datei(f3)

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
    else Showmessage('Temp Datei "'+HelpWriterTempFile+
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
    //Renamefile wird nicht angewendet,
    //war in Vergangenheit zu oft fehlerbehaftet
    AssignFile(f2,progdir+HelpWriterTempFile);
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
        showmessage('Datei '+progdir+HelpWriterTempFile+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+progdir+HelpWriterTempFile+
                  ' konnte nicht geöffnet werden!');
    end;
    //Ende in alte Datei zurückschreiben

    IF DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');
    
  end
  else
  begin
    If DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+#10#13+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');

    showmessage('Es ist ein Fehler aufgetreten!'+#10#13+
                'Speichern nicht möglich.');
  end;

  If DeleteFile(progdir+HelpWriterTempFile2) = false then
  Showmessage('Temporäre Datei: '+#10#13+progdir+HelpWriterTempFile2+#10#13+
              'konnte nicht gelöscht werden !');
              
  //listbox1click(form1); ausschalten wegen suchroutine unten
  Screen.cursor := crDefault;
  buttonanaus(true);

  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei;
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);

  //Alten Datensatz in Listbox wieder markieren
  // ListboxString ist das Suchwort
  IF listbox1.Items.Count > 0 then
  begin
    if ListboxString <> '' then
    begin
      gefunden := false;
      TempString := '';
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
      end
      else label10.Caption := '-1';
    end
    else label10.Caption := '-1';
  end
  else label10.Caption := '-1';
end;


procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Datensatzspeichern1Click(form1);
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
  //Ist die gleiche Procedure wie beim speichern, es wird nur nicht
  //das Memofeld angehängt und somit der akt Datensatz gelöscht!!!
  //Listbox ganz unten muß auf -1 gesetzt werden
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
    AssignFile(f2,progdir+HelpWriterTempFile);
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
          exit;
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
    else Showmessage('Temp Datei "'+HelpWriterTempFile+
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
    //Tempdatei umbenennen hat bei Renamefile oft
    //versagt, wird deshalb nicht angewendet
    AssignFile(f2,progdir+HelpWriterTempFile);
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
        showmessage('Datei '+progdir+HelpWriterTempFile+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+progdir+HelpWriterTempFile+
                  ' konnte nicht geöffnet werden!');
    end;
    //Ende in alte Datei zurückschreiben

    IF DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');
  end
  else
  begin
    If DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+#10#13+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');

    showmessage('Es ist ein Fehler aufgetreten!'+#10#13+
                'Löschen nicht möglich.');
  end;

  TempCap := label10.caption;
  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei;
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


procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  AktuellenDatensatzdrucken1Click(form1);
end;

procedure TForm1.AlleDatenstzeAnzeigen1Click(Sender: TObject);
var
  tempdatei : string;
begin
  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei;
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  AlleDatenstzeAnzeigen1Click(form1);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  rsx_Stg : String;
begin
  if key = #13 then
  begin
    rsx_Stg := edit1.text;
    rsx_Stg := _Lastleerentf(rsx_Stg);
    if rsx_Stg <> '' Then AktuellenDatensatzsuchen1Click(form1)
                     else AlleDatenstzeAnzeigen1Click(form1);
    key := #0;
  end;
end;

procedure TForm1.AktuellenDatensatzsuchen1Click(Sender: TObject);
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

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  AktuellenDatensatzsuchen1Click(form1);
end;

procedure TForm1.Allesindie1Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelectAll;
  memo1.CopyToClipboard;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelectAll;
  memo1.CopyToClipboard;
end;

procedure TForm1.Datensatz2Zeicheneinrcken1Click(Sender: TObject);
var
  i,
  stepper : integer;
begin
  if memo1.Lines.Count = 0 then
  begin
    showmessage('Es gibt keine Daten zum bearbeiten!');
    exit;
  end;
  if IstDatenVerschluesselt = true then
  begin
    showmessage('Datensatz ist verschlüsselt, Option steht nicht zur Verfühgung!');
    exit;
  end;
  
  checkbox3.Checked := false;
  
  buttonanaus(false);
  Screen.cursor := crHourGlass;

  if memo1.Lines.Count > 0 then
  begin
    Stepper := 0;
    ProgressBar1.Position := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := (memo1.Lines.Count - 1);
    ProgressBar1.Step := 100;

    for i := 0 to (memo1.Lines.Count - 1) do
    begin
      memo1.Lines[i] :=  '  '+ memo1.Lines[i];
      
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
  
  ProgressBar1.Position := 0;
  Screen.cursor := crDefault;
  buttonanaus(true);
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
  Datensatz2Zeicheneinrcken1Click(form1);
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
  i,
  stepper,
  fehler    : integer;
begin
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
          if (upzeile <> '#END') then
          begin
            //Raute entfernen
            delete(zeile,1,1);

            //Datum und Uhrzeit entfernen
            delete(zeile,100,length(zeile));
            zeile := _LastLeerEntf(zeile);
            //Dann in Datei schreiben
            
            writeln(f2,zeile);
          end
          else for i := 1 to 5 do writeln(f2,'');
        end
        else writeln(f2,zeile);
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


procedure TForm1.DateimitEditorbearbeiten1Click(Sender: TObject);
var
  tempdatei : string;
begin
  aktuelleDatei := _LastLeerEntf(aktuelleDatei);
  if aktuelleDatei = '' then
  begin
    Showmessage('Es ist keine Datenbank geöffnet!');
    exit;
  end;
  try
    ExecuteFile('c:\windows\notepad.exe', AktuelleDatei, '', false);
  except
    MessageDlg('Anwendung konnte nicht gestartet werden!', mtError, [mbOk], 0);
  end;
  (*
  ShellExecute(Form1.Handle, 'open', 'NOTEPAD.EXE',
               PChar(dateiname), '', SW_SHOWNORMAL);
  *)
  tempdatei := aktuelleDatei;
  Datenbankschlieen1Click(form1);
  if MessageDlg('Die Datei muß nach dem bearbeiten mit dem Editor'+#10#13+
                'neu geladen werden!'+#10#13+#10#13+
                tempdatei+#10#13+#10#13+
                'Datei neu laden?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    aktuelleDatei := tempdatei;
    SetzeAllesFuerLadeNeueDatei;
    AktuelleDatei := Tempdatei;
    statusbar1.SimpleText := AktuelleDatei;
    LeseDatenbank(AktuelleDatei);
  end;
  activecontrol:=edit1;
end;

procedure TForm1.Ausschneiden1Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.CutToClipboard;
end;

procedure TForm1.Allesmarkieren1Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.SelectAll;
end;

procedure TForm1.Kopieren1Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.CopyToClipboard;
end;

procedure TForm1.Einfgen1Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.PasteFromClipboard;
end;

procedure TForm1.Lschen1Click(Sender: TObject);
begin
  activecontrol := memo1;
  memo1.Clear;
end;

procedure TForm1.DatumUhrzeit1Click(Sender: TObject);
begin
  if IstDatenVerschluesselt = true then
  begin
    showmessage('Datensatz ist verschlüsselt, Option steht nicht zur Verfühgung!');
    exit;
  end;
  activecontrol := memo1;
  memo1.SelText := (DateTimeToStr(Now));
  memo1.SelText := ' ';
end;

procedure TForm1.Datum1Click(Sender: TObject);
begin
  if IstDatenVerschluesselt = true then
  begin
    showmessage('Datensatz ist verschlüsselt, Option steht nicht zur Verfühgung!');
    exit;
  end;
  activecontrol := memo1;
  memo1.SelText := (DateToStr(Date));
  memo1.SelText := ' ';
end;

procedure TForm1.Uhrzeit1Click(Sender: TObject);
begin
  if IstDatenVerschluesselt = true then
  begin
    showmessage('Datensatz ist verschlüsselt, Option steht nicht zur Verfühgung!');
    exit;
  end;
  activecontrol := memo1;
  memo1.SelText := (TimeToStr(Time));
  memo1.SelText := ' ';
end;

procedure TForm1.Lizenz1Click(Sender: TObject);
begin
  try
    ZeigeLicense.Memo1.clear;
    ZeigeLicense.Memo1.Lines.LoadFromFile('license.dat');
    ZeigeLicense.caption := 'Software Lizenz';
    ZeigeLicense.ShowModal;
  except
    Showmessage('Datei konnte nicht geladen werden.');
  end;
end;

procedure TForm1.ber1Click(Sender: TObject);
begin
  _xAboutBox.ShowModal;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
  _xAboutBox.ShowModal;
end;

procedure TForm1.Formularmanager1Click(Sender: TObject);
begin
  try
    ExecuteFile(progdir+'Formularmanager.exe', '', '', false);
  except
    MessageDlg('Anwendung konnte nicht gestartet werden!', mtError, [mbOk], 0);
  end;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  inc(Checkbox4Zaehler);
  if Checkbox4Zaehler > 1 then
  begin
    if Checkbox4Zaehler > 50 then Checkbox4Zaehler := 5;
    if checkbox4.Checked = true then listbox1.Sorted := true
                                else listbox1.Sorted := false;
    if AktuelleDatei <> '' then
    begin
      MessageDlg('Datei muß neu gelesen werden.', mtInformation, [mbOk], 0);
      AlleDatenstzeAnzeigen1Click(form1);
    end;
  end;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
  if IstDatenVerschluesselt = true then
  begin
    showmessage('Datensatz ist verschlüsselt, Option steht nicht zur Verfühgung!');
    exit;
  end;
  activecontrol := memo1;
  memo1.SelText := (DateToStr(Date));
  memo1.SelText := ' ';
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
  if IstDatenVerschluesselt = true then
  begin
    showmessage('Datensatz ist verschlüsselt, Option steht nicht zur Verfühgung!');
    exit;
  end;
  activecontrol := memo1;
  memo1.SelText := (TimeToStr(Time));
  memo1.SelText := ' ';
end;

procedure PressAlphabet(Buchstabe : _str1);
begin
  form1.edit1.Text := Buchstabe;
  _key := #13;
  form1.Edit1KeyPress(form1,_key);
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
  PressAlphabet('A');
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
  PressAlphabet('B');
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
  PressAlphabet('C');
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
  PressAlphabet('D');
end;

procedure TForm1.SpeedButton18Click(Sender: TObject);
begin
  PressAlphabet('E');
end;

procedure TForm1.SpeedButton19Click(Sender: TObject);
begin
    PressAlphabet('F');
end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
begin
  PressAlphabet('G');
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
begin
    PressAlphabet('H');
end;

procedure TForm1.SpeedButton22Click(Sender: TObject);
begin
  PressAlphabet('I');
end;

procedure TForm1.SpeedButton23Click(Sender: TObject);
begin
  PressAlphabet('J');
end;

procedure TForm1.SpeedButton24Click(Sender: TObject);
begin
  PressAlphabet('K');
end;

procedure TForm1.SpeedButton25Click(Sender: TObject);
begin
  PressAlphabet('L');
end;

procedure TForm1.SpeedButton26Click(Sender: TObject);
begin
  PressAlphabet('M');
end;

procedure TForm1.SpeedButton27Click(Sender: TObject);
begin
  PressAlphabet('N');
end;

procedure TForm1.SpeedButton28Click(Sender: TObject);
begin
  PressAlphabet('O');
end;

procedure TForm1.SpeedButton29Click(Sender: TObject);
begin
  PressAlphabet('P');
end;

procedure TForm1.SpeedButton30Click(Sender: TObject);
begin
  PressAlphabet('Q');
end;

procedure TForm1.SpeedButton31Click(Sender: TObject);
begin
  PressAlphabet('R');
end;

procedure TForm1.SpeedButton32Click(Sender: TObject);
begin
  PressAlphabet('S');
end;

procedure TForm1.SpeedButton33Click(Sender: TObject);
begin
  PressAlphabet('T');
end;

procedure TForm1.SpeedButton34Click(Sender: TObject);
begin
  PressAlphabet('U');
end;

procedure TForm1.SpeedButton35Click(Sender: TObject);
begin
  PressAlphabet('V');
end;

procedure TForm1.SpeedButton36Click(Sender: TObject);
begin
  PressAlphabet('W');
end;

procedure TForm1.SpeedButton37Click(Sender: TObject);
begin
  PressAlphabet('X');
end;

procedure TForm1.SpeedButton38Click(Sender: TObject);
begin
  PressAlphabet('Y');
end;

procedure TForm1.SpeedButton39Click(Sender: TObject);
begin
  PressAlphabet('Z');
end;

procedure TForm1.SpeedButton40Click(Sender: TObject);
begin
  Einfgen1Click(form1);
end;

procedure TForm1.Optionen2Click(Sender: TObject);
begin
  if ZeigeGroupBox1 = false then
  begin
    ZeigeGroupBox1 := true;
    GroupBox1.Visible := true;
  end
  else
  begin
    ZeigeGroupBox1 := false;
    GroupBox1.Visible := false;
  end;
end;

procedure TForm1.HelpwriterArbeitsverzeichnis2Click(Sender: TObject);
begin
  if ZeigeGroupBox2 = false then
  begin
    ZeigeGroupBox2 := true;
    GroupBox2.Visible := true;
  end
  else
  begin
    ZeigeGroupBox2 := false;
    GroupBox2.Visible := false;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if arbeitsverzeichnis <> '' then
  A_Verzeichnis.DirectoryListBox1.Directory := arbeitsverzeichnis
  else A_Verzeichnis.DirectoryListBox1.Directory := progdir;

  A_VerzeichnisArbeitsverzeichnis := '';
  A_Verzeichnis.ShowModal;
  if A_VerzeichnisArbeitsverzeichnis <> '' then
  begin
    if DirectoryExists(A_VerzeichnisArbeitsverzeichnis) = false then
    begin
      showmessage('Verzeichnis existiert nicht!'+#10#13+edit2.Text)
    end
    else
    begin
      arbeitsverzeichnis := A_VerzeichnisArbeitsverzeichnis;
      if RS_HasBackSlash(arbeitsverzeichnis) = false then
      arbeitsverzeichnis := arbeitsverzeichnis + '\';
      Edit2.Text := arbeitsverzeichnis;
    end;  
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit2.Text := _LastLeerEntf(edit2.Text);
  if DirectoryExists(edit2.Text) = false then
  begin
    showmessage('Verzeichnis existiert nicht!'+#10#13+edit2.Text);
    Arbeitsverzeichnis := '';
    edit2.Text := '';
    activecontrol := edit2;
  end
  else
  begin
    if RS_HasBackSlash(edit2.Text) = false then
    edit2.Text := edit2.Text + '\';
    Arbeitsverzeichnis := edit2.Text;
  end;
end;

procedure TForm1.SpeedButton41Click(Sender: TObject);
begin
  Optionen2Click(form1);
end;

procedure TForm1.Hintergrundfarbe1Click(Sender: TObject);
begin
  ColorDialog1.Color := memo1.Color;
  if ColorDialog1.execute then
  begin
    memo1.color:=ColorDialog1.color;
    Hintergrundfarbe := ColorToString(ColorDialog1.Color);
  end;
end;

procedure TForm1.HintergrundfarbeTabelle1Click(Sender: TObject);
const
  mld : string = 'Um Darstellungsfehler in der Tabelle vorzubeugen'+#10#13+
                 'wird die Datei neu eingelesen. Alle Anderungen'+#10#13+
                 'gehen verloren. Wenn Sie zuerst speichern möchten'+#10#13+
                 'drücken Sie "Nein".'+#10#13+
                 'Fortfahren?';
var
  tempStr : string;
begin
  ColorDialog1.Color := Listbox1.Color;
  if ColorDialog1.execute then
  begin
    Listbox1.color:=ColorDialog1.color;
    Hintergrundfarbe2 := ColorToString(ColorDialog1.Color);

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

procedure TForm1.Datensatzverschlsseln1Click(Sender: TObject);
var
  i,
  stepper  : integer;
  istCH3an : boolean;
  tag      : String[2];
begin
  if memo1.Lines.Count = 0 then
  begin
    showmessage('Es gibt keine Daten zum bearbeiten!');
    exit;
  end;
  if IstDatenVerschluesselt = true then
  begin
    Showmessage('Der Datensatz ist bereits verschlüsselt!');
    exit;
  end;
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
        form1.RS_Image1.Visible := false;
        form1.RS_Image2.Visible := true;
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
    istCH3an := checkbox3.Checked;
    checkbox3.Checked := false;
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
        memo1.Lines[i] := '-' + memo1.Lines[i];
        
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
  
    checkbox3.Checked := istCH3an;
  
    //Damit keiner mehr was ändert
    //Datensatz ist verschlüsselt
    Panel2.Caption := 'Dieser Datensatz wurde verschlüsselt aber nicht gespeichert! '+
                      'Datensatz ist gesperrt.';
    IstDatenVerschluesselt := true;
    form1.Panel2.Visible := true;
    application.ProcessMessages;
    memo1.ReadOnly := true;
  end;
end;

procedure TForm1.Datensatzentschlsseln1Click(Sender: TObject);
var
  i,
  zahl,
  stepper  : integer;
  zeile    : string;
  istCH3an : boolean;
  tag      : String[2];
begin
  if memo1.Lines.Count = 0 then
  begin
    showmessage('Es gibt keine Daten zum bearbeiten!');
    exit;
  end;
  if IstDatenVerschluesselt = false then
  begin
    Showmessage('Der Datensatz ist nicht verschlüsselt!');
    exit;
  end;
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
        form1.RS_Image1.Visible := false;
        form1.RS_Image2.Visible := true;
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
    istCH3an := checkbox3.Checked;
    checkbox3.Checked := false;
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
        zeile := memo1.Lines[i];
        delete(zeile,1,1);
        memo1.Lines[i] := zeile;

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
      panel2.Enabled := false;

      Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
    end;
  
    ProgressBar1.Position := 0;
  
    Screen.cursor := crDefault;
    buttonanaus(true);
  
    checkbox3.Checked := istCH3an;
  
    //Datensatz ist nicht verschlüsselt
    IstDatenVerschluesselt := false;
    form1.Panel2.Visible := false;
    application.ProcessMessages;
    memo1.ReadOnly := false;
  end;
end;


procedure TForm1.SpeedButton42Click(Sender: TObject);
begin
  Datensatzverschlsseln1Click(form1);
end;

procedure TForm1.SpeedButton43Click(Sender: TObject);
begin
  Datensatzentschlsseln1Click(form1);
end;

procedure TForm1.Passwortzurcksetzen1Click(Sender: TObject);
begin
  PasswortOk := false;
  form1.RS_Image1.Visible := true;
  form1.RS_Image2.Visible := false;
end;

procedure TForm1.Hilfe1Click(Sender: TObject);
begin
  ZeigeHilfe(AnwendungsdatenOrdner,'HelpWriter.hlp','Einführung');
  RS_Hilfe.ShowModal;
end;

procedure TForm1.Codezurcksetzen1Click(Sender: TObject);
begin
  WieIstDerCode := '';
end;

procedure TForm1.NeuenCodeeingeben1Click(Sender: TObject);
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

procedure TForm1.Suchen1Click(Sender: TObject);
begin
  finddialog1.Execute;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
const
TWordSeperators: set of Char = ['A'..'Z','a'..'z','ö','Ö','Ä','ä','ü','Ü','ß','´','`','@','_','0'..'9'];
var
Buffer: String;
CmpText: String;

Position: Integer;
Counter: Integer;

Left, Right: Boolean;
Hit: Boolean;
begin
if not (frMatchCase in Finddialog1.Options) then
begin
  CmpText:=AnsiUpperCase(Finddialog1.FindText);
  Buffer:=AnsiUpperCase(Copy(Memo1.Text,Memo1.SelStart+Memo1.SelLength+1,Length(Memo1.Text)))
end
else
begin
  CmpText:=Finddialog1.FindText;
  Buffer:=Copy(Memo1.Text,Memo1.SelStart+Memo1.SelLength+1,Length(Memo1.Text));
end;

Position:=AnsiPos(CmpText, Buffer);

if Position>0 then
begin
  if frWholeWord in FindDialog1.Options then
  begin
    Counter:=0;
    Position:=AnsiPos(CmpText, Buffer);
    Hit:=False;
    while (Position>0) and not Hit do
    begin
      Left:=(Position = 1) or (not (Buffer[Position-1] in TWordSeperators));
      Right:=(Position+Length(Finddialog1.FindText) >= Length(Buffer)) or
             (not (Buffer[Position+Length(Finddialog1.FindText)] in TWordSeperators));
      Hit:=Left and Right;
      Inc(Counter, Position);
      Delete(Buffer, 1, Position);
      Position:=Pos(CmpText, Buffer);
    end;

    if Hit then
    begin
      Memo1.SelStart:= Memo1.SelStart+Memo1.SelLength+Counter-1;
      Memo1.SelLength:= Length(Finddialog1.FindText);
    end
    else
      FindDialog1.CloseDialog;
  end
  else
  begin
    Memo1.SelStart:= Memo1.SelStart+Memo1.SelLength+Position-1;
    Memo1.SelLength:= Length(Finddialog1.FindText);
  end;
end
else
  FindDialog1.CloseDialog;
Memo1.SetFocus;
end;

procedure TForm1.SpeedButton44Click(Sender: TObject);
begin
  Schriftart1Click(form1);
end;

procedure TForm1.RS_Image2Click(Sender: TObject);
begin
  Passwortzurcksetzen1Click(form1);
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

procedure TForm1.Datenbankverschlsseln1Click(Sender: TObject);
var
  stepper,
  fehler    : integer;
  f, f2     : Textfile;
  Tempdatei,
  TempCap,
  zeile     : string;
  warFehler : Boolean;
  Kurzzeile : String[1];
begin
  if Datenbankverschluesselt = true then
  begin
    showmessage('Datenbank ist bereits verschlüsselt!');
    exit;
  end;
  
  if AktuelleDatei = '' then
  begin
    Showmessage('Es wurde noch keine Datenbank gewählt!');
    exit;
  end;
  if label9.Caption = '' then
  begin
    Showmessage('Datenbank enthält keine Daten!');
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
        form1.RS_Image1.Visible := false;
        form1.RS_Image2.Visible := true;
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

  if PasswortOk = false then
  begin
    showmessage('Passwort ist nicht korrekt!');
    exit;
  end;
  if WieIstDerCode = '' then
  begin
    showmessage('Bitte geben Sie zuerst einen Code ein.'+#10#13+
                'Aktion wird abgebrochen!');
    exit;
  end;


  if label9.Caption = '' then
  begin
    Showmessage('Datenbank enthält keine Daten!');
    exit;
  end;

  if MessageDlg('Datenbank verschlüsseln.'+#10#13+
                'Aktion kann nicht rückgängig gemacht werden!'+#10#13+#10#13+
                'Möchten Sie fortfahren?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;

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

  //Prüfen ob selektion ok
  Case EncodeSelection of
    0 : begin end;
    1 : begin end;
  else
    begin
      Showmessage('Fehler in der Verschlüsselungsauswahl.'+#10#13+
                  'Verschlüsselung fehlgeschlagen !');
      exit;
    end;
  end;


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
    AssignFile(f2,progdir+HelpWriterTempFile);
    {$I-}
    Rewrite(f2);
    {$I+}
    if IoResult = 0 then
    begin
      buttonanaus(false);
      Screen.cursor := crHourGlass;

      panel2.Visible := true;
      panel2.Caption := 'Verschlüsselung läuft...';
      application.ProcessMessages;

      {$I-}
      Writeln(f2,Verschluesselstring2);
      {$I+}
      if IoResult <> 0 then begin end;

      while not eof(f) do
      begin
        inc(stepper);
        if stepper = 500 then
        begin
          ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
        {$I-}
        readln(f,zeile);

        Kurzzeile := zeile;
        if kurzzeile <> '#' then
        begin
          Case EncodeSelection of
            0 : zeile := VerschiebeVerschlpos(zeile,WieIstDerCode);
            1 : zeile := VerschldurchTausch(zeile,true,WieIstDerCode);//vorwärts
          end;

          IF RS_XOR = true then
          zeile := TextKodieren2(8,zeile);

          //Damit keine # am Anfang steht;
          zeile := '-' + zeile;
        end;

        Writeln(f2,zeile);
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
          panel2.Visible := false;
          exit;
        end;
      end;
      panel2.Visible := false;

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
    else Showmessage('Temp Datei "'+HelpWriterTempFile+
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
    //Tempdatei umbenennen hat bei Renamefile oft
    //versagt, wird deshalb nicht angewendet
    AssignFile(f2,progdir+HelpWriterTempFile);
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
        showmessage('Datei '+progdir+HelpWriterTempFile+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+progdir+HelpWriterTempFile+
                  ' konnte nicht geöffnet werden!');
    end;
    //Ende in alte Datei zurückschreiben

    IF DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');
  end
  else
  begin
    If DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+#10#13+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');

    showmessage('Es ist ein Fehler aufgetreten!'+#10#13+
                'Löschen nicht möglich.');
  end;

  TempCap := label10.caption;
  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei;
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);
  label10.caption := TempCap;

  IF listbox1.Items.Count > 0 then
  begin
    if (strtoint(label10.caption) > 0) then
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
  Screen.cursor := crDefault;
  buttonanaus(true);

  Datenbankverschluesselt := true;
  if Datenbankverschluesselt = true then ButtonAnAus3(false)
                                    else ButtonAnAus3(true);
  showmessage('Datenbank verschlüsseln beendet!');
end;

procedure TForm1.Datenbankentschlsseln1Click(Sender: TObject);
var
  stepper,
  fehler    : integer;
  f, f2     : Textfile;
  Tempdatei,
  TempCap,
  zeile     : string;
  warFehler : Boolean;
  Kurzzeile : String[1];
begin
  if Datenbankverschluesselt = false then
  begin
    showmessage('Datenbank ist nicht verschlüsselt!');
    exit;
  end;

  if AktuelleDatei = '' then
  begin
    Showmessage('Es wurde noch keine Datenbank gewählt!');
    exit;
  end;

  if label9.Caption = '' then
  begin
    Showmessage('Datenbank enthält keine Daten!');
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
        form1.RS_Image1.Visible := false;
        form1.RS_Image2.Visible := true;
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

  if PasswortOk = false then
  begin
    showmessage('Passwort ist nicht korrekt!');
    exit;
  end;
  if WieIstDerCode = '' then
  begin
    showmessage('Bitte geben Sie zuerst einen Code ein.'+#10#13+
                'Aktion wird abgebrochen!');
    exit;
  end;


  if label9.Caption = '' then
  begin
    Showmessage('Datenbank enthält keine Daten!');
    exit;
  end;

  if MessageDlg('Datenbank entschlüsseln.'+#10#13+
                'Aktion kann nicht rückgängig gemacht werden!'+#10#13+#10#13+
                'Möchten Sie fortfahren?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;

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

  
  //Prüfen ob selektion ok
  Case EncodeSelection of
    0 : begin end;
    1 : begin end;
  else
    begin
      Showmessage('Fehler in der Verschlüsselungsauswahl.'+#10#13+
                  'Verschlüsselung fehlgeschlagen !');
      exit;
    end;
  end;


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
    AssignFile(f2,progdir+HelpWriterTempFile);
    {$I-}
    Rewrite(f2);
    {$I+}
    if IoResult = 0 then
    begin
      buttonanaus(false);
      Screen.cursor := crHourGlass;

      panel2.Visible := true;
      panel2.Caption := 'Entschlüsselung läuft...';
      application.ProcessMessages;

      while not eof(f) do
      begin
        inc(stepper);
        if stepper = 500 then
        begin
          ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
        {$I-}
        readln(f,zeile);

        if zeile <> Verschluesselstring2 then
        begin
          Kurzzeile := zeile;
          if kurzzeile <> '#' then
          begin
            //Minuszeichen wieder entfernen
            delete(zeile,1,1);

            if RS_XOR = true then
            zeile := TextDekodieren2(8,zeile);

            case EncodeSelection of
              0: zeile := VerschiebeVerschlneg(zeile,WieIstDerCode);
              1: zeile := VerschldurchTausch(zeile,false,WieIstDerCode);//rückwärts
            end;
          end;

          Writeln(f2,zeile);
        end;
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
          panel2.Visible := false;
          exit;
        end;
      end;
      panel2.Visible := false;

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
    else Showmessage('Temp Datei "'+HelpWriterTempFile+
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
    //Tempdatei umbenennen hat bei Renamefile oft
    //versagt, wird deshalb nicht angewendet
    AssignFile(f2,progdir+HelpWriterTempFile);
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
        showmessage('Datei '+progdir+HelpWriterTempFile+
                    ' konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      showmessage('Datei '+progdir+HelpWriterTempFile+
                  ' konnte nicht geöffnet werden!');
    end;
    //Ende in alte Datei zurückschreiben

    IF DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');
  end
  else
  begin
    If DeleteFile(progdir+HelpWriterTempFile) = false then
    Showmessage('Temporäre Datei: '+#10#13+progdir+HelpWriterTempFile+#10#13+
                'konnte nicht gelöscht werden !');

    showmessage('Es ist ein Fehler aufgetreten!'+#10#13+
                'Löschen nicht möglich.');
  end;

  TempCap := label10.caption;
  Tempdatei := AktuelleDatei;
  SetzeAllesFuerLadeNeueDatei;
  AktuelleDatei := Tempdatei;
  LeseDatenbank(AktuelleDatei);
  label10.caption := TempCap;

  IF listbox1.Items.Count > 0 then
  begin
    if (strtoint(label10.caption) > 0) then
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
  Screen.cursor := crDefault;
  buttonanaus(true);

  Datenbankverschluesselt := false;
  if Datenbankverschluesselt = true then ButtonAnAus3(false)
                                    else ButtonAnAus3(true);
  showmessage('Datenbank entschlüsseln beendet!');
end;

end.
