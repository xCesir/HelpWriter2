unit XOR_Methode_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TXOR_Methode = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  XOR_Methode: TXOR_Methode;

implementation

uses PassWord, Code, HW_EncryptUnit1, lesekonfig, rs_math, RS_Util;

{$R *.dfm}

procedure TXOR_Methode.FormCreate(Sender: TObject);
begin
  edit1.Text := '1';
end;

procedure TXOR_Methode.Button3Click(Sender: TObject);
begin
  close;
end;

procedure buttonanaus(anaus : Boolean);
begin
  form1.Button1.Enabled := anaus;
  form1.Button2.Enabled := anaus;
  form1.Button3.Enabled := anaus;
  //form1.Button4.Enabled := anaus;
  //form1.Button5.Enabled := anaus;
  //form1.Button6.Enabled := anaus;
  form1.Button7.Enabled := anaus;
  form1.SpeedButton1.Enabled := anaus;
  form1.SpeedButton2.Enabled := anaus;
  form1.SpeedButton4.Enabled := anaus;

  XOR_Methode.Button1.Enabled := anaus;
  XOR_Methode.Button2.Enabled := anaus;
  XOR_Methode.Button3.Enabled := anaus;
end;

procedure TXOR_Methode.Button1Click(Sender: TObject);
var
  i,
  //zahl,
  stepper  : integer;
begin
  if form1.memo1.Lines.Count = 0 then
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

  if PasswortOk = true then
  begin
    application.ProcessMessages;
  
    buttonanaus(false);
    Screen.cursor := crHourGlass;

    if form1.memo1.Lines.Count > 0 then
    begin
      Stepper := 0;
      form1.ProgressBar1.Position := 0;
      form1.ProgressBar1.Min := 0;
      form1.ProgressBar1.Max := (form1.memo1.Lines.Count - 1);
      form1.ProgressBar1.Step := 100;

      for i := 0 to (form1.memo1.Lines.Count - 1) do
      begin
        form1.memo1.Lines[i] := TextKodieren2(RS_StrToInt(edit1.Text),form1.memo1.Lines[i]);

        inc(stepper);
        if (stepper = 100) then
        begin
          form1.ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
      end;
      form1.Memo1.Perform(EM_LineScroll, 0 , -form1.Memo1.Lines.Count-1);
    end;

    form1.ProgressBar1.Position := 0;

    Screen.cursor := crDefault;
    buttonanaus(true);
  end;
end;

procedure TXOR_Methode.Button2Click(Sender: TObject);
var
  i,
  //zahl,
  stepper  : integer;
begin
  if form1.memo1.Lines.Count = 0 then
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

  if PasswortOk = true then
  begin
    application.ProcessMessages;
  
    buttonanaus(false);
    Screen.cursor := crHourGlass;
  
    if form1.memo1.Lines.Count > 0 then
    begin
      Stepper := 0;
      form1.ProgressBar1.Position := 0;
      form1.ProgressBar1.Min := 0;
      form1.ProgressBar1.Max := (form1.memo1.Lines.Count - 1);
      form1.ProgressBar1.Step := 100;

      for i := 0 to (form1.memo1.Lines.Count - 1) do
      begin
        form1.memo1.Lines[i] := TextDekodieren2(RS_StrToInt(edit1.Text),form1.memo1.Lines[i]);

        inc(stepper);
        if (stepper = 100) then
        begin
          form1.ProgressBar1.Stepit;
          stepper := 0;
          Application.Processmessages;
        end;
      end;
      form1.Memo1.Perform(EM_LineScroll, 0 , -form1.Memo1.Lines.Count-1);
    end;

    form1.ProgressBar1.Position := 0;

    Screen.cursor := crDefault;
    buttonanaus(true);
  end;
end;

procedure TXOR_Methode.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  edit1.Text := StrToIntegerToStr(1,30,edit1.Text);
end;

procedure TXOR_Methode.Edit1Exit(Sender: TObject);
begin
  edit1.Text := StrToIntegerToStr(1,30,edit1.Text);
  if edit1.Text = '' then edit1.Text := '1';
end;

end.
