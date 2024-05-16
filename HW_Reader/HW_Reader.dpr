program HW_Reader;

uses
  Forms,
  HW_ReaderUnit1 in 'HW_ReaderUnit1.pas' {Form1},
  xAbout in 'xAbout.pas' {_xAboutBox},
  Hilfe in 'Hilfe.pas' {RS_Hilfe};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HW Reader';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(T_xAboutBox, _xAboutBox);
  Application.CreateForm(TRS_Hilfe, RS_Hilfe);
  Application.Run;
end.
