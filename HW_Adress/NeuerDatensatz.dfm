object Form2: TForm2
  Left = 0
  Top = 0
  Width = 600
  Height = 570
  Caption = 'HW Adress - Neuen Datensatz erstellen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 517
    Width = 592
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 463
    Width = 592
    Height = 54
    Align = alBottom
    TabOrder = 0
    object SpeedButton5: TSpeedButton
      Left = 464
      Top = 16
      Width = 25
      Height = 25
      Hint = 'Hilfe'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFADADADA19A989C827D9C827DA19A98ADADADFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADADA9847AD29D70E4B874EF
        D48BEFD48BE4B874D29D70A9847AADADADFF00FFFF00FFFF00FFFF00FFFF00FF
        9F9E9DC38764F1CE6FFCEA81ECDD91CECBC6C9C5BFEDDC8BFCEA81F1CE6FC387
        64A19A98FF00FFFF00FFFF00FFADADADC3845FF7D160FBD965FBD965E5D7B4E8
        EAECDDDFDFDACB9FFBD965FBD965F7D160C38764ADADADFF00FFFF00FFA9847A
        EDB249F8C953F8C953F8C953E6C785EEEFF1E8EAECE5C47AF8C953F8C953F8C9
        53EDB249A9847AFF00FFADADADCE854CF4B942F4B942F4B942F4B942EDB249CF
        B184CFB184EDB249F4B942F4B942F4B942F4B942CE854CADADADA19A98DE7E3E
        F59E4DF1A733F1A931F1A931E0AC5AD1D2D3CECECFDDA959F1A931F1A931F1A9
        31F1A931DB8226A19A989C827DF58985FE7E7EFC6B63F6763BEF9322E0A250DD
        DFDFD4D6D7CEB9A0E09C40EE9920EE9920EE9920E3861C9C827D9C827DF58985
        FE7E7EFE6868FE5151FD4039F25D25DF9750D7C6B6D7D9DBD0CFCEDA9646EB89
        0FEB890FE0790E9C827DA19A98E5786FFE8585FE6868FE5B5BFE4949FE3A3AFD
        382FED5D2ADCD3D2DCDEE0CFBFB2E17707E17707D16009A19A98ADADADD27C6F
        FE9090FE8585FE6868E48788F3595AFE4949FE5151E4D4D6E8EAECDDDFDFE475
        3CE8804ACF7A5BADADADFF00FFA9847AF28D88FE9090FE8585E7D7D8E8EAECE2
        CBCDE5DADCF0F2F4F0F2F4E4D0D2FE9090F19C98AC8880FF00FFFF00FFADADAD
        C27A6DF99E9CF99E9CE4C8CAEEEFF1F0F2F4F0F2F4F0F2F4E8D8DAF3A6A7F8A3
        A0C27A6DADADADFF00FFFF00FFFF00FFA19A98C27A6DF19C98FDA9A9F3A6A7F2
        ACADF0B1B2F2ACADFDAEAEED9B95BF7667A19A98FF00FFFF00FFFF00FFFF00FF
        FF00FFADADADA9847AD18579E28D84EFA39FF3A6A7E49289CF8477A9847AADAD
        ADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADADA19A989C
        827D9C827DA19A98ADADADFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton5Click
    end
    object Button1: TButton
      Left = 24
      Top = 16
      Width = 105
      Height = 25
      Caption = '&Speichern'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 144
      Top = 16
      Width = 185
      Height = 25
      Caption = 'S&peichern und Schlie'#223'en'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 344
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Sch&lie'#223'en'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 438
    Width = 592
    Height = 25
    Align = alBottom
    Alignment = taLeftJustify
    Caption = 'Panel1'
    TabOrder = 1
    object ProgressBar1: TProgressBar
      Left = 432
      Top = 4
      Width = 150
      Height = 17
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 17
    Width = 592
    Height = 421
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = '&Adresse'
      object Geburtstag: TLabel
        Left = 8
        Top = 344
        Width = 54
        Height = 13
        Caption = 'Geburtstag'
      end
      object LabeledEdit12: TLabeledEdit
        Left = 6
        Top = 312
        Width = 417
        Height = 21
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'Homepage'
        MaxLength = 70
        TabOrder = 10
        OnKeyPress = LabeledEdit12KeyPress
      end
      object LabeledEdit11: TLabeledEdit
        Left = 6
        Top = 264
        Width = 417
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'E-mail'
        MaxLength = 70
        TabOrder = 9
        OnKeyPress = LabeledEdit11KeyPress
      end
      object LabeledEdit10: TLabeledEdit
        Left = 361
        Top = 216
        Width = 170
        Height = 21
        EditLabel.Width = 18
        EditLabel.Height = 13
        EditLabel.Caption = 'Fax'
        MaxLength = 30
        TabOrder = 8
        OnKeyPress = LabeledEdit10KeyPress
      end
      object LabeledEdit9: TLabeledEdit
        Left = 184
        Top = 216
        Width = 170
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Mobil'
        MaxLength = 30
        TabOrder = 7
        OnKeyPress = LabeledEdit9KeyPress
      end
      object LabeledEdit8: TLabeledEdit
        Left = 6
        Top = 216
        Width = 170
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Telefon'
        MaxLength = 30
        TabOrder = 6
        OnKeyPress = LabeledEdit8KeyPress
      end
      object LabeledEdit7: TLabeledEdit
        Left = 166
        Top = 168
        Width = 350
        Height = 21
        EditLabel.Width = 16
        EditLabel.Height = 13
        EditLabel.Caption = 'Ort'
        MaxLength = 50
        TabOrder = 5
        OnKeyPress = LabeledEdit7KeyPress
      end
      object LabeledEdit6: TLabeledEdit
        Left = 64
        Top = 168
        Width = 81
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Postleitzahl'
        MaxLength = 10
        TabOrder = 4
        OnKeyPress = LabeledEdit6KeyPress
      end
      object LabeledEdit5: TLabeledEdit
        Left = 6
        Top = 168
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'Land'
        MaxLength = 3
        TabOrder = 3
        OnKeyPress = LabeledEdit5KeyPress
      end
      object LabeledEdit4: TLabeledEdit
        Left = 6
        Top = 120
        Width = 350
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Strasse'
        MaxLength = 50
        TabOrder = 2
        OnKeyPress = LabeledEdit4KeyPress
      end
      object LabeledEdit3: TLabeledEdit
        Left = 7
        Top = 72
        Width = 350
        Height = 21
        EditLabel.Width = 133
        EditLabel.Height = 13
        EditLabel.Caption = 'Vorname / Ansprechpartner'
        MaxLength = 50
        TabOrder = 1
        OnKeyPress = LabeledEdit3KeyPress
      end
      object LabeledEdit2: TLabeledEdit
        Left = 6
        Top = 24
        Width = 350
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'Name / Firma'
        MaxLength = 50
        TabOrder = 0
        OnKeyPress = LabeledEdit2KeyPress
      end
      object LabeledEdit14: TLabeledEdit
        Left = 152
        Top = 360
        Width = 40
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Kinder'
        MaxLength = 3
        TabOrder = 12
        OnKeyPress = LabeledEdit14KeyPress
      end
      object MaskEdit1: TMaskEdit
        Left = 8
        Top = 360
        Width = 105
        Height = 21
        MaxLength = 10
        TabOrder = 11
        OnExit = MaskEdit1Exit
        OnKeyPress = MaskEdit1KeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Notiz'
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 584
        Height = 41
        Align = alTop
        TabOrder = 0
        object SpeedButton2: TSpeedButton
          Left = 352
          Top = 11
          Width = 23
          Height = 22
          Hint = 'Uhrzeit einf'#252'gen'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000C0C0C0B0B0B0
            8080808080808080808080808080808080808080808080808080808080808080
            8080808080808090909090909000005F00005F00005F00005F00005F00005F00
            005F00005F00005F00005F00005F00005F00005F20205F8080806060600000BF
            00005F00005F00005F00005F00005F00005F00005F00005F00005F00005F0000
            5F00007F00005F8080806060600000BF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFBF
            BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00005F00005F8080806060600000BF
            7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00005F00005F8080806060600000BF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00005F00005F8080806060600000BF
            7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00005F00005F8080806060600000BF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F
            7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00005F00005F8080806060600000BF
            7F7F7FBFBFBFFFFFFFFFFFFFBFBFBF0000007F7F7F7F7F7F7F7F7FFFFFFFBFBF
            BF00005F00005F8080806060600000BF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F
            7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF00005F00005F8080806060600000BF
            7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00005F00005F8080806060600000BF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F
            7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00005F00005F8080806060600000BF
            7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00005F00005F8080806060600000BF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFBF
            BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00005F00005F8080806060600000BF
            00005F00005F00005F00005F00005F00005F00005F00005F00005F00005F0000
            5F00009F00005F90909090909000005F00005F00005F00005F00005F00005F00
            005F00005F00005F00005F00005F00005F00005F303050C0C0C0}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object SpeedButton1: TSpeedButton
          Left = 320
          Top = 11
          Width = 23
          Height = 22
          Hint = 'Datum einf'#252'gen'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080808080
            8080808080808080808080808080808080808080808080808080000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000008080800000007F7F7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFBFBFBF7F7F7F0000008080800000007F7F7F
            BFBFBF7F7F7F7F7F7F7F7F7FBFBFBF000000BFBFBF7F7F7F7F7F7F7F7F7FBFBF
            BF7F7F7F0000008080800000007F7F7FBFBFBF7F7F7F7F7F7F7F7F7FBFBFBF7F
            7F7FBFBFBF7F7F7F7F7F7F7F7F7FBFBFBF7F7F7F0000008080800000007F7F7F
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF7F7F7F0000008080800000007F7F7FFFFFFF7F7FBF0000807F7FBFFFFFFF00
            0000FFFFFF7F7FBF000080000080FFFFFF7F7F7F0000008080800000007F7F7F
            FFFFFFFFFFFF000080FFFFFFFFFFFF000000FFFFFF7F7FBF3F3F9FFFFFFFFFFF
            FF7F7F7F0000008080800000007F7F7FFFFFFFFFFFFF000080FFFFFFFFFFFF00
            0000FFFFFFFFFFFF3F3F9F3F3F9FFFFFFF7F7F7F0000008080800000007F7F7F
            FFFFFF7F7FBF000080FFFFFF7F7F7F7F7F7F7F7F7F7F7FBF3F3F9F000080FFFF
            FF7F7F7F0000008080800000007F7F7FFFFFFFFFFFFF7F7FBFFFFFFFFFFFFF00
            0000FFFFFFFFFFFF7F7FBFBFBFDFFFFFFF7F7F7F0000008080800000003F3F3F
            3F3F3F7F7F7F7F7F7F7F7F7F7F7F7F0000007F7F7F7F7F7F7F7F7F7F7F7F3F3F
            3F3F3F3F000000BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object SpeedButton3: TSpeedButton
          Left = 384
          Top = 11
          Width = 23
          Height = 22
          Hint = 'Daten in die Zwischenablage kopieren'
          Glyph.Data = {
            56070000424D5607000000000000360400002800000028000000140000000100
            0800000000002003000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            03030303030303030303030303030303030303030303FFFFFFFFFFFFFFFFFFFF
            0303030303030303030000000000000000000003030303030303030303F8F8F8
            F8F8F8F8F8F8F8FF03030303030303030300FFFFFFFFFFFFFFFF000303030303
            0303030303F8FF03030303030303F8FF03030303030303030300FBFFFBFFFBFF
            FBFF0003030303030303030303F8FF03FFFFFFFFFFFFF8FF0303030303030303
            0300FFF8F8F8F8F8F8FF0003030303030303030303F8FFF8F8F8F8F8F803F8FF
            03030303030303030300FBFFFBFFFBFFFBFF00030303030303FFFFFFFFF8FF03
            FFFFFFFFFFFFF8FF03030303000000000000FFF8F8F8F8F8F8FF000303030303
            F8F8F8F8F8F8FFF8F8F8F8F8F803F8FF0303030300FFFFFFFF00FBFFFBFFFBFF
            FBFF000303030303F8FF030303F8FF03FFFFFFFFFFFFF8FF0303030300FFFFFF
            FF00FFF8F8F8F8F8F8FF000303030303F8FF030303F8FFF8F8F8F8F8F803F8FF
            0303030300FF07070700FBFFFBFFFBFFFBFF000303030303F8FF030303F8FF03
            0303030303FFF8FF0303030300FFFFFFFF00FFFFFFFFFFFF0000000303030303
            F8FF030303F8FF0303030303F8F8F8030303030300FF07070700FBFFFBFFFBFF
            0000030303030303F8FF030303F8FFFFFFFFFFFFF8F803030303030300FFFFFF
            FF000000000000000003030303030303F8FF030303F8F8F8F8F8F8F8F8030303
            0303030300FF070707070707FF0003030303030303030303F8FF030303030303
            03F8FF03030303030303030300FFFFFFFFFFFFFFFF0003030303030303030303
            F8FF030303030303FFF8FF03030303030303030300FFFFFFFFFFFF0000000303
            0303030303030303F8FF0303030303F8F8F80303030303030303030300FFFFFF
            FFFFFF00000303030303030303030303F8FFFFFFFFFFFFF8F803030303030303
            030303030000000000000000030303030303030303030303F8F8F8F8F8F8F8F8
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 416
          Top = 11
          Width = 23
          Height = 22
          Hint = 'Einf'#252'gen aus Zwischenablage'
          Glyph.Data = {
            56070000424D5607000000000000360400002800000028000000140000000100
            0800000000002003000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            03030303030303030303030303030303030303030303030303FFFFFFFFFFFFFF
            FFFF030303030303030303030000000000000000000303030303030303030303
            F8F8F8F8F8F8F8F8F8FF0303030303030303030300FBFFFBFFFBFFFB00030303
            03FFFFFFFFFFFFFFF8FF03FFFFFFFFFFF8FF0303000000000000000000FFF8F8
            F8F8F8FF00030303F8F8F8F8F8F8F8F8F8FFF8F8F8F8F803F8FF030007FF07FF
            07FF07FF00FBFFFBFFFBFFFB000303F8FF03030303030303F8FF030303FFFFFF
            F8FF0300FF07FF07FF07FF0700FF0707F8F8F8FF000303F8FF03030303030303
            F8FFFFFFF8F8F803F8FF030007FF07FF07FF0704040404FBFFFBFFFB000303F8
            FF030303030303F8F8F8F8FF03FFFFFFF8FF0300FF07FF07FF07FF07FC040407
            F8F8F8FF000303F8FF03030303030303F8F8F8FFF8F8F803F8FF030007FF07FF
            07FF070404FC04FBFFFBFFFB000303F8FF030303030303F8F8F8F8FF030303FF
            F8FF0300FF07FF07FF07040404FF04FFFFFFF8F8000303F8FF0303030303F8F8
            F8FFF8030303F8F8F803030007FF07FF0704040400FBFFFBFFFBF800030303F8
            FF03030303F8F8F8F8FFFFFFFFFFF8F803030300FF07FF070404040700000000
            00000003030303F8FF030303F8F8F803F8F8F8F8F8F8F8030303030007FF07FF
            070407FF07FF000303030303030303F8FF03030303F803030303F8FF03030303
            03030300FF07FF07FF07FF07FF07000303030303030303F8FF03030303030303
            0303F8FF030303030303030007FF07FF07FF07FF07FF000303030303030303F8
            FF0303FFFFFFFFFFFF03F8FF0303030303030300FF07040404040404FF070003
            03030303030303F803FFF8F8F8F8F8F8FFFFF80303030303030303030000FEFC
            FCFCFC04000003030303030303030303F8F803F8F8F8F8F8F8F8030303030303
            030303030303FEFCFCFCFC04030303030303030303030303030303F8F8F8F8F8
            030303030303030303030303030303FEFEFEFE03030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton4Click
        end
        object CheckBox1: TCheckBox
          Left = 16
          Top = 16
          Width = 105
          Height = 17
          Caption = '&Tab an/aus'
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object CheckBox3: TCheckBox
          Left = 144
          Top = 16
          Width = 153
          Height = 17
          Caption = 'Formular &verwenden'
          TabOrder = 1
          OnClick = CheckBox3Click
        end
      end
      object Memo1: TMemo
        Left = 0
        Top = 41
        Width = 584
        Height = 352
        Align = alClient
        Lines.Strings = (
          'Memo1')
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 592
    Height = 17
    Align = alTop
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'hwf'
    Filter = 'HelpWriter Formulardatei *.hwf|*.hwf'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 376
    Top = 64
  end
end
