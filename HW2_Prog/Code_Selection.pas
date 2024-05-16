unit Code_Selection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TCodeSelection = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  CodeSelection: TCodeSelection;

implementation

{$R *.dfm}

uses unit1;

procedure TCodeSelection.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if RadioButton1.Checked = true then EncodeSelection := 0;
  if RadioButton2.Checked = true then EncodeSelection := 1;
  if Checkbox1.Checked = true then RS_XOR := true
                              else RS_XOR := false;
end;

procedure TCodeSelection.Button1Click(Sender: TObject);
begin
  close;
end;

end.
