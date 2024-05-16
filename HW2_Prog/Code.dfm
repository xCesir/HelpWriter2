object CodeDlg: TCodeDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Code zur Verschl'#252'sselung'
  ClientHeight = 186
  ClientWidth = 274
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 76
    Height = 13
    Caption = 'Code eingeben:'
  end
  object Label2: TLabel
    Left = 8
    Top = 57
    Width = 90
    Height = 13
    Caption = 'Code wiederholen:'
  end
  object Password: TEdit
    Left = 8
    Top = 27
    Width = 249
    Height = 21
    MaxLength = 50
    TabOrder = 0
    OnKeyPress = PasswordKeyPress
    OnKeyUp = PasswordKeyUp
  end
  object Button2: TButton
    Left = 56
    Top = 144
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 144
    Top = 144
    Width = 75
    Height = 25
    Caption = '&Abbrechen'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 75
    Width = 249
    Height = 21
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = PasswordKeyPress
  end
  object CheckBox1: TCheckBox
    Left = 56
    Top = 112
    Width = 201
    Height = 17
    Caption = '&Code im Klartext anzeigen.'
    TabOrder = 2
    OnClick = CheckBox1Click
  end
end
