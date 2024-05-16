unit Code;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
     Buttons, Dialogs;

type
  TCodeDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    procedure PasswordKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  CodeDlg         : TCodeDlg;
  WieIstDerCode   : string;
  CodeDialogAbbrechen : boolean;
  
implementation

{$R *.dfm}

procedure TCodeDlg.FormCreate(Sender: TObject);
begin
  activecontrol := password;
  checkbox1.Checked := false;
  password.PasswordChar := '*';
  edit1.PasswordChar := '*';
end;

procedure TCodeDlg.Button3Click(Sender: TObject);
begin
  CodeDialogAbbrechen := true;
  WieIstDerCode := '';
  close;
end;

procedure TCodeDlg.Button2Click(Sender: TObject);
begin
  if password.Text = edit1.Text then
  begin
    WieIstDerCode := password.Text;
    close;
  end
  else showmessage('Beide Eingabefelder müssen den gleichen Code enthalten!');
end;

procedure TCodeDlg.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
   Button2Click(CodeDlg);
   key := #0;
  end;
end;

procedure TCodeDlg.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked = true then
  begin
    Password.PasswordChar := #0;
    edit1.PasswordChar := #0;
    activecontrol := password;
    edit1.Enabled := false;
    edit1.Text := password.text;
  end
  else
  begin
    password.PasswordChar := '*';
    edit1.PasswordChar := '*';
    edit1.Enabled := true;
  end;
end;

procedure TCodeDlg.FormShow(Sender: TObject);
begin
  checkbox1.Checked := false;
  password.PasswordChar := '*';
  edit1.PasswordChar := '*';
end;

procedure TCodeDlg.PasswordKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if checkbox1.Checked = true then
  edit1.text := Password.text;
end;

end.

