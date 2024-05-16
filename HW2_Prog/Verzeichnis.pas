unit Verzeichnis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TA_Verzeichnis = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  A_Verzeichnis: TA_Verzeichnis;
  A_VerzeichnisArbeitsverzeichnis  : string;

implementation

{$R *.dfm}

procedure TA_Verzeichnis.DirectoryListBox1Change(Sender: TObject);
begin
  edit1.Text := DirectoryListBox1.Directory;
end;

procedure TA_Verzeichnis.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TA_Verzeichnis.Button1Click(Sender: TObject);
begin
  A_VerzeichnisArbeitsverzeichnis := edit1.text;
  close;
end;

procedure TA_Verzeichnis.FormCreate(Sender: TObject);
begin
  edit1.Text := DirectoryListBox1.Directory;
end;

end.
