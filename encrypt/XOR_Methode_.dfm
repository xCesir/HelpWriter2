object XOR_Methode: TXOR_Methode
  Left = 0
  Top = 0
  Width = 165
  Height = 198
  Caption = 'XOR Methode'
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
    Left = 16
    Top = 8
    Width = 91
    Height = 13
    Caption = 'Schl'#252'ssel (1 bis 30)'
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 49
    Height = 21
    MaxLength = 2
    TabOrder = 0
    Text = 'Edit1'
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 16
    Top = 56
    Width = 125
    Height = 25
    Caption = '&Verschl'#252'sseln'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 88
    Width = 125
    Height = 25
    Caption = '&Entschl'#252'sseln'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 120
    Width = 125
    Height = 25
    Caption = '&Schlie'#223'en'
    TabOrder = 3
    OnClick = Button3Click
  end
end
