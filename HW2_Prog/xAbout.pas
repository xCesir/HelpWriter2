unit xAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, GesamtVersion;

type
  T_xAboutBox = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _xAboutBox: T_xAboutBox;

implementation



{$R *.DFM}

procedure T_xAboutBox.OKButtonClick(Sender: TObject);
begin
  close;
end;

procedure SetFourDigitYearFormat;
var
  i : Integer;
begin
  ShortDateFormat:=AnsiUpperCase(ShortDateFormat);
  i:=Pos('YYYY',ShortDateFormat);
  if i < 1 then begin
    i:=Pos('YY',ShortDateFormat);
    if i > 0 then
      Insert('YY',ShortDateFormat,i);
  end;
end; {Peter Haas}


function GebeJahr : String;
var
  zeile : String[10];
begin
  SetFourDigitYearFormat;
  zeile := DateToStr(Date);
  zeile := Copy(zeile,7,4);
  GebeJahr := zeile
end;

procedure T_xAboutBox.FormCreate(Sender: TObject);
begin
  version.caption := 'Version 2.0.11';
  label3.Caption := HW2_GV;
  label2.caption := GebeJahr;
end;

end.

