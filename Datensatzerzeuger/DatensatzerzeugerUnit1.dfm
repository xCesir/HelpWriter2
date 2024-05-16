object Form1: TForm1
  Left = 0
  Top = 0
  Width = 392
  Height = 333
  ActiveControl = Edit1
  Caption = 'Helpwriter Datensatzerzeuger'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 234
    Height = 13
    Caption = 'Erzeugen der Datei Test.hwd mit X Datens'#228'tzen!'
  end
  object Label2: TLabel
    Left = 40
    Top = 32
    Width = 29
    Height = 19
    Caption = 'X ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 88
    Width = 226
    Height = 13
    Caption = 'Erzeugen der Datei Test.ha mit X Datens'#228'tzen!'
  end
  object Label4: TLabel
    Left = 40
    Top = 112
    Width = 29
    Height = 19
    Caption = 'X ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 80
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 216
    Top = 32
    Width = 75
    Height = 25
    Caption = '&Go'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Beenden'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ProgressBar1: TProgressBar
    Left = 56
    Top = 232
    Width = 265
    Height = 17
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 80
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 216
    Top = 112
    Width = 75
    Height = 25
    Caption = 'G&o'
    TabOrder = 5
    OnClick = Button3Click
  end
end
