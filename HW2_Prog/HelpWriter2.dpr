program HelpWriter2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  NeuerDatensatz in 'NeuerDatensatz.pas' {Form2},
  Lizense in 'Lizense.pas' {ZeigeLicense},
  xAbout in 'xAbout.pas' {_xAboutBox},
  Verzeichnis in 'Verzeichnis.pas' {A_Verzeichnis},
  Code in 'Code.pas' {CodeDlg},
  Hilfe in 'Hilfe.pas' {RS_Hilfe},
  PassWord in 'PassWord.pas' {PasswordDlg},
  Code_Selection in 'Code_Selection.pas' {CodeSelection};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Help Writer 2';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TZeigeLicense, ZeigeLicense);
  Application.CreateForm(T_xAboutBox, _xAboutBox);
  Application.CreateForm(TA_Verzeichnis, A_Verzeichnis);
  Application.CreateForm(TA_Verzeichnis, A_Verzeichnis);
  Application.CreateForm(TCodeDlg, CodeDlg);
  Application.CreateForm(TRS_Hilfe, RS_Hilfe);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TCodeSelection, CodeSelection);
  Application.Run;
end.
