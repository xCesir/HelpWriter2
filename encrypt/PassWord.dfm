object PasswordDlg: TPasswordDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Passwort'
  ClientHeight = 93
  ClientWidth = 274
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 95
    Height = 13
    Caption = 'Passwort eingeben:'
  end
  object Password: TEdit
    Left = 8
    Top = 27
    Width = 249
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = PasswordKeyPress
  end
  object Button2: TButton
    Left = 56
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 144
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Abbrechen'
    TabOrder = 2
    OnClick = Button3Click
  end
end
