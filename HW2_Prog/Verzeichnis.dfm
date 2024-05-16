object A_Verzeichnis: TA_Verzeichnis
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'HelpWriter Arbeitsverzeichnis'
  ClientHeight = 368
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 394
    Height = 49
    Align = alTop
    TabOrder = 0
    object DriveComboBox1: TDriveComboBox
      Left = 8
      Top = 16
      Width = 177
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 263
    Width = 394
    Height = 105
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 141
      Height = 13
      Caption = 'HelpWriter Arbeitsverzeichnis'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 377
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 88
      Top = 64
      Width = 89
      Height = 25
      Caption = '&Ok'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 208
      Top = 64
      Width = 89
      Height = 25
      Caption = '&Abbrechen'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 0
    Top = 49
    Width = 394
    Height = 214
    Align = alClient
    ItemHeight = 16
    TabOrder = 2
    OnChange = DirectoryListBox1Change
  end
end
