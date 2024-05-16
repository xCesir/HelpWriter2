program HW_Adress;

uses
  Forms,
  Adress in 'Adress.pas' {Form1},
  NeuerDatensatz in 'NeuerDatensatz.pas' {Form2},
  Verzeichnis in 'Verzeichnis.pas' {A_Verzeichnis},
  SUCHEN in 'SUCHEN.PAS' {SuchenForm},
  SUCHEN2 in 'SUCHEN2.pas' {Form3},
  Eigenedaten in 'Eigenedaten.pas' {eigen},
  OPTIONEN in 'OPTIONEN.PAS' {option},
  xAbout in 'xAbout.pas' {_xAboutBox},
  Lizense in 'Lizense.pas' {ZeigeLicense},
  Hilfe in 'Hilfe.pas' {RS_Hilfe};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HW Adress';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TA_Verzeichnis, A_Verzeichnis);
  Application.CreateForm(TSuchenForm, SuchenForm);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(Teigen, eigen);
  Application.CreateForm(Toption, option);
  Application.CreateForm(T_xAboutBox, _xAboutBox);
  Application.CreateForm(TZeigeLicense, ZeigeLicense);
  Application.CreateForm(TRS_Hilfe, RS_Hilfe);
  Application.Run;
end.
