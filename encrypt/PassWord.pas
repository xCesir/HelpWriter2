unit PASSWORD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    Button2: TButton;
    Button3: TButton;
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
  PasswordDlg: TPasswordDlg;
  WieIstDasPasswort : string;
  passDialogAbbrechen : boolean;
  
implementation

{$R *.dfm}

procedure TPasswordDlg.FormCreate(Sender: TObject);
begin
  activecontrol := password;
end;

procedure TPasswordDlg.Button3Click(Sender: TObject);
begin
  passDialogAbbrechen := true;
  close;
end;

procedure TPasswordDlg.Button2Click(Sender: TObject);
begin
  WieIstDasPasswort := password.Text;
  close;
end;

procedure TPasswordDlg.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Button2Click(PasswordDlg);
    key := #0;
  end;
end;

end.

