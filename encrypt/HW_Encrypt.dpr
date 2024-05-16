program HW_Encrypt;

uses
  Forms,
  HW_EncryptUnit1 in 'HW_EncryptUnit1.pas' {Form1},
  PassWord in 'PassWord.pas' {PasswordDlg},
  xAbout in 'xAbout.pas' {_xAboutBox},
  Code in 'Code.pas' {CodeDlg},
  XOR_Methode_ in 'XOR_Methode_.pas' {XOR_Methode},
  Code_Selection in 'Code_Selection.pas' {CodeSelection};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HW 2  Encrypt';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(T_xAboutBox, _xAboutBox);
  Application.CreateForm(TCodeDlg, CodeDlg);
  Application.CreateForm(TXOR_Methode, XOR_Methode);
  Application.CreateForm(TCodeSelection, CodeSelection);
  Application.Run;
end.
