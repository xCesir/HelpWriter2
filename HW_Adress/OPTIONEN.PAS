unit optionen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  Toption = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    Label4: TLabel;
    Bevel1: TBevel;
    CheckBox10: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private-Deklarationen}
  public
    { Public-Deklarationen}
  end;

procedure StandardLeseDatei;

Type SetupTyp = RECORD
                  AktDatenbank : String[255];
                  endung       : string[20];
                  Eigenkopf,
                  adresskopf   : array[1..12] of boolean;
                END;

var
  option: Toption;
  SetupDatei : FILE OF SetupTyp;
  SetupSatz  : SetupTyp;
  Optionen_AnwendungsdatenOrdner,
  SetupDateiName  : String;


Procedure Optioneneinlesen;

implementation

uses Hilfe;

{$R *.DFM}


Function DbfFehlerMeldung(Code : Word) : string;
begin
  case Code of
      1   : DbfFehlerMeldung := inttostr(code);
    ELSE
     DbfFehlerMeldung := inttostr(code);
   END;
end;

Procedure StandardTypZuweisen;
var
  i : integer;
BEGIN
  setupsatz.AktDatenbank := '';
  setupsatz.endung       := 'DOC';
  for i := 1 to 12 do
  begin
    setupsatz.Eigenkopf[i] := false;
    setupsatz.adresskopf[i] := false;
  end;
  setupsatz.Eigenkopf[1] := true;
  setupsatz.Eigenkopf[3] := true;
  setupsatz.adresskopf[1] := true;
  setupsatz.adresskopf[3] := true;
END;

Procedure FehlerTypZuweisen;
var
  i : integer;
BEGIN
  setupsatz.AktDatenbank := '';
  setupsatz.endung       := 'DOC';
  for i := 1 to 12 do
  begin
    setupsatz.Eigenkopf[i] := false;
    setupsatz.adresskopf[i] := false;
  end;
  setupsatz.Eigenkopf[1] := true;
  setupsatz.Eigenkopf[3] := true;
  setupsatz.adresskopf[1] := true;
  setupsatz.adresskopf[3] := true;
END;

procedure StandardFileCheck;
CONST
  Mld : String[120] = ' nicht gefunden, Datei neu erstellen?';
VAR
  Fehler : Word;
BEGIN
  IF NOT FileExists(SetupDateiName)THEN
  BEGIN
    if MessageDlg(SetupDateiName + mld,mtWarning, [mbYes, mbNo], 0) = mrYes then
    BEGIN
      ASSIGNFile(SetupDatei,SetupDateiName);
      {$I-}
      REWRITE(SetupDatei);
      {$I+}
      Fehler := IOResult;
      IF Fehler = 0 THEN
      BEGIN
        StandardTypZuweisen;
        {$I-}
        WRITE(SetupDatei,SetupSatz);
        {$I+}
        Fehler := IOResult;
        CLOSEFile(SetupDatei);
        IF Fehler <> 0 THEN
        BEGIN
          MessageDlg('Der Versuch in die Datei '+SetupDateiName+' zu Schreiben miﬂlang!'+
                     #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
                      mtWarning,[mbOk], 0);
        END;
      END
      ELSE
      BEGIN
        MessageDlg('Der Versuch die Datei '+SetupDateiName+' zu erzeugen miﬂlang!'+
                   #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
                   mtWarning,[mbOk], 0);

      END
    END
    else showmessage('Datei '+SetupDateiName+' wurde nicht erstellt !');
  END
END;


procedure StandardLeseDatei;
VAR
  Fehler : Word;

BEGIN
  ASSIGNFile(SetupDatei,SetupDateiName);
  {$I-}
  RESET(SetupDatei);
  {$I+}
  Fehler := IOResult;
  IF Fehler = 0 THEN
  BEGIN
    {$I-}
    READ(SetupDatei,SetupSatz);
    {$I+}
    Fehler := IOResult;
    CLOSEFile(SetupDatei);
    IF Fehler <> 0 THEN
    BEGIN
      MessageDlg('Der Versuch aus der Datei '+SetupDateiName+' zu lesen miﬂlang !'+
         #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
                 mtWarning,[mbOk], 0);
      FehlerTypZuweisen;
    END
  END
  ELSE
  BEGIN
    MessageDlg('Der Versuch die Datei '+SetupDateiName+' zu ˆffnen miﬂlang !'+
               #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
                 mtWarning,[mbOk], 0);
    FehlerTypZuweisen;
  END
END;


Procedure Optioneneinlesen;
begin
  StandardFileCheck;
  StandardLeseDatei;
  with option do
  begin
    activecontrol := edit2;
    edit2.text := setupsatz.endung;
    //edit1.text := setupsatz.AktDatenbank;

    checkbox1.checked := false;
    checkbox2.checked := false;
    checkbox3.checked := false;
    checkbox4.checked := false;
    checkbox5.checked := false;
    checkbox6.checked := false;
    checkbox7.checked := false;
    checkbox8.checked := false;
    checkbox9.checked := false;
    checkbox10.checked := false;
    checkbox11.checked := false;
    checkbox12.checked := false;
    checkbox13.checked := false;
    checkbox14.checked := false;
    checkbox15.checked := false;
    checkbox16.checked := false;

    if setupsatz.Eigenkopf[1] = true then checkbox1.Checked := true;
    if setupsatz.Eigenkopf[2] = true then checkbox2.Checked := true;
    if setupsatz.Eigenkopf[3] = true then checkbox3.Checked := true;
    if setupsatz.Eigenkopf[4] = true then checkbox4.Checked := true;
    if setupsatz.Eigenkopf[5] = true then checkbox5.Checked := true;
    if setupsatz.Eigenkopf[6] = true then checkbox6.Checked := true;
    if setupsatz.Eigenkopf[7] = true then checkbox7.Checked := true;
    if setupsatz.Eigenkopf[8] = true then checkbox8.Checked := true;

    if setupsatz.Adresskopf[1] = true then checkbox9.Checked := true;
    if setupsatz.Adresskopf[2] = true then checkbox10.Checked := true;
    if setupsatz.Adresskopf[3] = true then checkbox11.Checked := true;
    if setupsatz.Adresskopf[4] = true then checkbox12.Checked := true;
    if setupsatz.Adresskopf[5] = true then checkbox13.Checked := true;
    if setupsatz.Adresskopf[6] = true then checkbox14.Checked := true;
    if setupsatz.Adresskopf[7] = true then checkbox15.Checked := true;
    if setupsatz.Adresskopf[8] = true then checkbox16.Checked := true;

  end;
end;

procedure Toption.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure StandardDateiSpeichern;
VAR
  Fehler : Word;
BEGIN
  ASSIGNFile(SetupDatei,SetupDateiName);
  {$I-}
  RESET(SetupDatei);
  {$I+}
  Fehler := IOResult;
  IF Fehler = 0 THEN
  BEGIN
    {$I-}
    WRITE(SetupDatei,SetupSatz);
    {$I+}
    Fehler := IOResult;
    CLOSEFile(SetupDatei);
    IF Fehler <> 0 THEN
    BEGIN
      MessageDlg('Der Versuch die Einstellung zu Speichern miﬂlang!'+
                 #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler) ,
               mtWarning,[mbOk], 0);
    END
  END
  ELSE MessageDlg('Der Versuch die Datei '+SetupDateiName+' zu ˆffnen miﬂlang!'+
                  #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
                  mtWarning,[mbOk], 0);
END;


procedure Toption.BitBtn1Click(Sender: TObject);
begin
  setupsatz.endung := edit2.text;
  //setupsatz.AktDatenbank := edit1.Text;

  setupsatz.adresskopf[1] := false;
  setupsatz.adresskopf[2] := false;
  setupsatz.adresskopf[3] := false;
  setupsatz.adresskopf[4] := false;
  setupsatz.adresskopf[5] := false;
  setupsatz.adresskopf[6] := false;
  setupsatz.adresskopf[7] := false;
  setupsatz.adresskopf[8] := false;

  setupsatz.Eigenkopf[1] := false;
  setupsatz.Eigenkopf[2] := false;
  setupsatz.Eigenkopf[3] := false;
  setupsatz.Eigenkopf[4] := false;
  setupsatz.Eigenkopf[5] := false;
  setupsatz.Eigenkopf[6] := false;
  setupsatz.Eigenkopf[7] := false;
  setupsatz.Eigenkopf[8] := false;

  if checkbox1.checked = true then setupsatz.Eigenkopf[1] := true;
  if checkbox2.checked = true then setupsatz.Eigenkopf[2] := true;
  if checkbox3.checked = true then setupsatz.Eigenkopf[3] := true;
  if checkbox4.checked = true then setupsatz.Eigenkopf[4] := true;
  if checkbox5.checked = true then setupsatz.Eigenkopf[5] := true;
  if checkbox6.checked = true then setupsatz.Eigenkopf[6] := true;
  if checkbox7.checked = true then setupsatz.Eigenkopf[7] := true;
  if checkbox8.checked = true then setupsatz.Eigenkopf[8] := true;

  if checkbox9.checked = true then setupsatz.adresskopf[1] := true;
  if checkbox10.checked = true then setupsatz.adresskopf[2] := true;
  if checkbox11.checked = true then setupsatz.adresskopf[3] := true;
  if checkbox12.checked = true then setupsatz.adresskopf[4] := true;
  if checkbox13.checked = true then setupsatz.adresskopf[5] := true;
  if checkbox14.checked = true then setupsatz.adresskopf[6] := true;
  if checkbox15.checked = true then setupsatz.adresskopf[7] := true;
  if checkbox16.checked = true then setupsatz.adresskopf[8] := true;

  StandardDateiSpeichern;
end;

procedure Toption.Button1Click(Sender: TObject);
begin
  ZeigeHilfe(Optionen_AnwendungsdatenOrdner,'HW_Adress.hlp','Einstellungen');
  RS_Hilfe.ShowModal;
end;

end.
