unit Eigenedaten;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  Teigen = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit13: TEdit;
    Label13: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private-Deklarationen}
  public
    { Public-Deklarationen}
  end;

procedure leseFirmenAdr;

TYPE FirmenTyp = Record
                   Name,
                   Vorname,
                   Ansprechpartner : String[50];
                   Strasse         : String[50];
                   land            : string[4];
                   plz             : String[6];
                   ort             : String[50];
                   tel             : String[40];
                   Handy           : String[40];
                   Fax             : String[40];
                   E_Mail          : String[60];
                   Homepage        : String[80];
                 end;

var
  eigen: Teigen;
  FirmenDatei: File Of Firmentyp;
  Firmensatz : Firmentyp;
  Eigen_AnwendungsdatenOrdner,
  Firmendateiname : string;

procedure Eigendatenholen;

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


procedure FirmenadrFileChk;
var fehler : integer;
begin
  IF not FileExists(Firmendateiname) Then
  Begin
    if MessageDlg('Die Datei mit Ihrer Adresse wurde nicht gefunden.'+#10#13+
                  'Soll die Datei neu erstellt werden ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ASSIGNFILE(firmendatei,Firmendateiname);
      {$I-}
      REWRITE(firmendatei);
      {$I+}
      fehler := IoResult;
      IF Fehler = 0 THEN
      BEGIN
        firmensatz.Ansprechpartner := '';
        firmensatz.name            := 'Ihr Name';
        firmensatz.vorname         := 'Ihr Vorname';
        firmensatz.Strasse         := 'Ihre Strasse';
        firmensatz.land            := '';
        firmensatz.plz             := '';
        firmensatz.ort             := 'Ihr Ort';
        firmensatz.tel             := '';
        firmensatz.Fax             := '';
        firmensatz.E_Mail          := '';
        firmensatz.Homepage        := '';
        {$I-}
        Write(firmendatei,firmensatz);
        {$I+}
        fehler := IoResult;
        if fehler <> 0 then
        showmessage('Es konnte nicht in die Datei geschrieben '+
                    'werden!'+#10#13+Firmendateiname);

        closefile(Firmendatei);
      END
      Else
      BEGIN
        MessageDlg('Der Versuch die Datei zu erzeugen miﬂlang!'+
              #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
              mtWarning,[mbOk], 0);
      END;
    end
    Else Showmessage('Datei wurde nicht erstellt !');
  end;
end;

procedure leseFirmenAdr;
var fehler : integer;
Begin
  firmensatz.Ansprechpartner := '';
  firmensatz.name            := '';
  firmensatz.vorname         := '';
  firmensatz.Strasse         := '';
  firmensatz.land            := '';
  firmensatz.plz             := '';
  firmensatz.ort             := '';
  firmensatz.tel             := '';
  firmensatz.Fax             := '';
  firmensatz.E_Mail          := '';
  firmensatz.Homepage        := '';

  ASSIGNFILE(firmendatei,Firmendateiname);
  {$I-}
  RESET(firmendatei);
  {$I+}
  fehler := IoResult;
  IF Fehler = 0 THEN
  BEGIN
    {$I-}
    Read(firmendatei,firmensatz);
    {$I+}
    fehler := IoResult;
    if fehler <> 0 then
    showmessage('Datei konnte nicht gelesen werden!'+
                #10#13+Firmendateiname);

    closefile(Firmendatei);
  END
  else
  begin
    MessageDlg('Der Versuch die Datei '+firmendateiname+' zu lesen miﬂlang!'+
              #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
              mtWarning,[mbOk], 0);
  end
end;

procedure speichereFirmenadr;
var fehler : integer;
begin
  ASSIGNFILE(firmendatei,Firmendateiname);
  {$I-}
  RESET(firmendatei);
  {$I+}
  fehler := IoResult;
  IF Fehler = 0 THEN
  BEGIN
    {$I-}
    Write(firmendatei,firmensatz);
    {$I+}
    fehler := IoResult;
    if fehler <> 0 then
    showmessage('Es konnte nicht in die Datei geschrieben '+
                'werden!'+#10#13+Firmendateiname);

    closefile(Firmendatei);
  END
  else
  begin
    MessageDlg('Der Versuch in die Datei '+firmendateiname+' zu schreiben miﬂlang!'+
              #10#13+ 'Fehler : ' +DbfFehlerMeldung(fehler),
              mtWarning,[mbOk], 0);
  end
end;



procedure Eigendatenholen;
begin
  FirmenadrFileChk;
  leseFirmenAdr;
  eigen.activecontrol := eigen.edit3;
  eigen.Edit2.text := firmensatz.Ansprechpartner;
  eigen.Edit3.text := firmensatz.Name;
  eigen.Edit4.text := firmensatz.Vorname;
  eigen.Edit5.text := firmensatz.Strasse;
  eigen.Edit6.text := firmensatz.land;
  eigen.Edit7.text := firmensatz.plz;
  eigen.Edit8.text := firmensatz.ort;
  eigen.Edit9.text := firmensatz.tel;
  eigen.Edit10.text := firmensatz.Fax;
  eigen.Edit11.text := firmensatz.E_Mail;
  eigen.Edit12.text := firmensatz.Homepage;
  eigen.Edit13.text := firmensatz.Handy;
end;

procedure Teigen.BitBtn2Click(Sender: TObject);
begin
  close
end;

procedure Teigen.BitBtn1Click(Sender: TObject);
begin
  firmensatz.Ansprechpartner := eigen.Edit2.text;
  firmensatz.Name            := eigen.Edit3.text;
  firmensatz.Vorname         := eigen.Edit4.text;
  firmensatz.Strasse         := eigen.Edit5.text;
  firmensatz.land            := eigen.Edit6.text;
  firmensatz.plz             := eigen.Edit7.text;
  firmensatz.ort             := eigen.Edit8.text;
  firmensatz.tel             := eigen.Edit9.text;
  firmensatz.Fax             := eigen.Edit10.text;
  firmensatz.E_Mail          := eigen.Edit11.text;
  firmensatz.Homepage        := eigen.Edit12.text;
  firmensatz.Handy           := eigen.Edit13.text;
  speichereFirmenadr; 
end;

procedure Teigen.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Teigen.Button1Click(Sender: TObject);
begin
  ZeigeHilfe(Eigen_AnwendungsdatenOrdner,'HW_Adress.hlp','Eigene Daten');
  RS_Hilfe.ShowModal;
end;

end.
