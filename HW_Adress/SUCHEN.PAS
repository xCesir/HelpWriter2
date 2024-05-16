unit Suchen;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSuchenForm = class(TForm)
    AbbruchButton: TBitBtn;
    SucheButton: TBitBtn;
    Label1: TLabel;
    SearchEdit: TEdit;
    procedure SucheButtonClick(Sender: TObject);
    procedure AbbruchButtonClick(Sender: TObject);
  private
    FSuchName : String;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    property SuchName : string read FSuchName;
  end;

var
  SuchenForm: TSuchenForm;

implementation

{$R *.DFM}

uses adress;

procedure TSuchenForm.SucheButtonClick(Sender: TObject);
begin
  FSuchName := SearchEdit.Text;
  xsuchwort := SearchEdit.Text;
end;

procedure TSuchenForm.AbbruchButtonClick(Sender: TObject);
begin
  xsuchwort := '';
end;

end.
