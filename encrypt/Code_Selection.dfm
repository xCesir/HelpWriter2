object CodeSelection: TCodeSelection
  Left = 0
  Top = 0
  Width = 343
  Height = 239
  BorderStyle = bsSizeToolWin
  Caption = 'Code Selection'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 16
    Width = 289
    Height = 89
    Caption = ' Verschl'#252'sselungsart '
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 40
    Top = 40
    Width = 200
    Height = 17
    Caption = '&Vigen'#232're'
    Enabled = False
    TabOrder = 1
  end
  object RadioButton2: TRadioButton
    Left = 40
    Top = 72
    Width = 200
    Height = 17
    Caption = '&Wirbel'
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 40
    Top = 120
    Width = 257
    Height = 17
    Caption = 'Zus'#228'tzlich &XOR Veschl'#252'sselung anwenden'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 128
    Top = 152
    Width = 75
    Height = 25
    Caption = 'W&eiter'
    TabOrder = 4
    OnClick = Button1Click
  end
end
