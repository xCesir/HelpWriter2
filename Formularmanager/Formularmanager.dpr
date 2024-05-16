program Formularmanager;

uses
  Forms,
  FormularmanagerUnit1 in 'FormularmanagerUnit1.pas' {Form1},
  RS_Util in '..\..\RS_Util.pas',
  xAbout in 'xAbout.pas' {_xAboutBox},
  Hilfe in '..\..\Hilfe.pas' {RS_Hilfe};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Formularmanager';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(T_xAboutBox, _xAboutBox);
  Application.CreateForm(TRS_Hilfe, RS_Hilfe);
  Application.Run;
end.
