unit SUCHEN2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls;

type
  TForm3 = class(TForm)
    SpeedButton27: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton28: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  adress;

procedure ZeigeNachAlphabet(xSuch : string);
begin
  SucheAnzeigen := false;
  xsuchwort := xSuch;
  form1.Datenstzesuchen1Click(form1);
  SucheAnzeigen := true;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  ZeigeNachAlphabet('A');
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  ZeigeNachAlphabet('B');
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
  ZeigeNachAlphabet('C');
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
  ZeigeNachAlphabet('D');
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
  ZeigeNachAlphabet('E');
end;

procedure TForm3.SpeedButton6Click(Sender: TObject);
begin
  ZeigeNachAlphabet('F');
end;

procedure TForm3.SpeedButton7Click(Sender: TObject);
begin
  ZeigeNachAlphabet('G');
end;

procedure TForm3.SpeedButton8Click(Sender: TObject);
begin
  ZeigeNachAlphabet('H');
end;

procedure TForm3.SpeedButton9Click(Sender: TObject);
begin
  ZeigeNachAlphabet('I');
end;

procedure TForm3.SpeedButton10Click(Sender: TObject);
begin
  ZeigeNachAlphabet('J');
end;

procedure TForm3.SpeedButton11Click(Sender: TObject);
begin
  ZeigeNachAlphabet('K');
end;

procedure TForm3.SpeedButton12Click(Sender: TObject);
begin
  ZeigeNachAlphabet('L');
end;

procedure TForm3.SpeedButton13Click(Sender: TObject);
begin
  ZeigeNachAlphabet('M');
end;

procedure TForm3.SpeedButton14Click(Sender: TObject);
begin
  ZeigeNachAlphabet('N');
end;

procedure TForm3.SpeedButton15Click(Sender: TObject);
begin
  ZeigeNachAlphabet('O');
end;

procedure TForm3.SpeedButton16Click(Sender: TObject);
begin
  ZeigeNachAlphabet('P');
end;

procedure TForm3.SpeedButton17Click(Sender: TObject);
begin
  ZeigeNachAlphabet('Q');
end;

procedure TForm3.SpeedButton18Click(Sender: TObject);
begin
  ZeigeNachAlphabet('R');
end;

procedure TForm3.SpeedButton19Click(Sender: TObject);
begin
  ZeigeNachAlphabet('S');
end;

procedure TForm3.SpeedButton20Click(Sender: TObject);
begin
  ZeigeNachAlphabet('T');
end;

procedure TForm3.SpeedButton21Click(Sender: TObject);
begin
  ZeigeNachAlphabet('U');
end;

procedure TForm3.SpeedButton22Click(Sender: TObject);
begin
  ZeigeNachAlphabet('V');
end;

procedure TForm3.SpeedButton23Click(Sender: TObject);
begin
  ZeigeNachAlphabet('W');
end;

procedure TForm3.SpeedButton24Click(Sender: TObject);
begin
  ZeigeNachAlphabet('X');
end;

procedure TForm3.SpeedButton25Click(Sender: TObject);
begin
  ZeigeNachAlphabet('Y');
end;

procedure TForm3.SpeedButton26Click(Sender: TObject);
begin
  ZeigeNachAlphabet('Z');
end;

procedure TForm3.SpeedButton27Click(Sender: TObject);
begin
  form1.AlleDatenstzeanzeigen1Click(form1);
end;

procedure TForm3.SpeedButton28Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form3Top := form3.top;
  Form3Left := form3.left;
end;

end.
