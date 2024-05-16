program HW_Konfig;

uses
  Forms,
  KonfigUnit1 in 'KonfigUnit1.pas' {Form1},
  Hilfe in '..\..\Hilfe.pas' {RS_Hilfe};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HW 2  Konfig';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TRS_Hilfe, RS_Hilfe);
  Application.Run;
end.
