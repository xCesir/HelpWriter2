unit Lizense;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TZeigeLicense = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen}
  public
    { Public-Deklarationen}
  end;

var
  ZeigeLicense: TZeigeLicense;

implementation

{$R *.DFM}

procedure TZeigeLicense.Button1Click(Sender: TObject);
begin
  close;
end;

end.
