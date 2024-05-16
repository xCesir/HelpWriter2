object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Help Writer 2 Konfig'
  ClientHeight = 329
  ClientWidth = 554
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
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 71
    Height = 13
    Caption = 'Altes Passwort'
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 77
    Height = 13
    Caption = 'Neues Passwort'
  end
  object Label3: TLabel
    Left = 32
    Top = 128
    Width = 138
    Height = 13
    Caption = 'Neues Passwort wiederholen'
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 200
    Width = 529
    Height = 105
    Caption = ' Speicherort der Konfigurationsdateien '
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 232
    Width = 505
    Height = 17
    Caption = 'RadioButton1'
    TabOrder = 1
    OnKeyPress = RadioButton1KeyPress
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 264
    Width = 505
    Height = 17
    Caption = 'RadioButton2'
    TabOrder = 2
    OnKeyPress = RadioButton2KeyPress
  end
  object Button1: TButton
    Left = 376
    Top = 24
    Width = 150
    Height = 25
    Caption = '&Speichern'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 376
    Top = 56
    Width = 150
    Height = 25
    Caption = 'Schlie'#223'e&n'
    TabOrder = 4
    OnClick = Button2Click
  end
  object MaskEdit1: TMaskEdit
    Left = 32
    Top = 48
    Width = 250
    Height = 21
    Enabled = False
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 9
    Text = 'MaskEdit1'
  end
  object MaskEdit2: TMaskEdit
    Left = 32
    Top = 96
    Width = 250
    Height = 21
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 10
    Text = 'MaskEdit2'
    OnKeyPress = MaskEdit2KeyPress
  end
  object MaskEdit3: TMaskEdit
    Left = 32
    Top = 144
    Width = 250
    Height = 21
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 11
    Text = 'MaskEdit3'
    OnKeyPress = MaskEdit3KeyPress
  end
  object GroupBox1: TGroupBox
    Left = 184
    Top = 72
    Width = 185
    Height = 73
    TabOrder = 7
    object Label4: TLabel
      Left = 24
      Top = 32
      Width = 66
      Height = 13
      Caption = 'Speichert....'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Button4: TButton
    Left = 376
    Top = 120
    Width = 150
    Height = 25
    Caption = '&Hilfe'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 376
    Top = 88
    Width = 150
    Height = 25
    Caption = 'Programme registrieren'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 537
    Height = 313
    TabOrder = 8
    object Label5: TLabel
      Left = 136
      Top = 88
      Width = 44
      Height = 13
      Caption = 'Passwort'
    end
    object Button3: TButton
      Left = 136
      Top = 136
      Width = 249
      Height = 25
      Caption = '&Ok'
      TabOrder = 1
      OnClick = Button3Click
    end
    object MaskEdit4: TMaskEdit
      Left = 136
      Top = 104
      Width = 250
      Height = 21
      MaxLength = 50
      PasswordChar = '*'
      TabOrder = 0
      Text = 'MaskEdit4'
      OnKeyPress = MaskEdit4KeyPress
    end
  end
  object XPManifest1: TXPManifest
    Left = 496
    Top = 160
  end
end
