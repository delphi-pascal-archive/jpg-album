object JPGA_Main: TJPGA_Main
  Left = 225
  Top = 203
  Width = 686
  Height = 496
  Caption = 'JPGAlbum - '#1060#1086#1090#1086#1075#1088#1072#1092#1080#1080' '#1074' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 678
    Height = 431
    Align = alClient
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Caption = 'Mailto: alegun72@mail.ru'
    Color = clNone
    Ctl3D = False
    UseDockManager = False
    FullRepaint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object gg: TGauge
      Left = 0
      Top = 0
      Width = 678
      Height = 6
      Align = alTop
      BackColor = clBtnFace
      Color = clNone
      ForeColor = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -1
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpVariable
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Progress = 100
      ShowText = False
    end
    object Image1: TImage
      Left = 0
      Top = 6
      Width = 678
      Height = 425
      Align = alClient
      AutoSize = True
      Center = True
      Proportional = True
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    UseDockManager = False
    FullRepaint = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 115
      Top = 2
      Width = 561
      Height = 27
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object sps: TComboBox
        Left = 4
        Top = 3
        Width = 77
        Height = 21
        Style = csDropDownList
        BiDiMode = bdLeftToRight
        Ctl3D = True
        Enabled = False
        ItemHeight = 13
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = spsChange
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 113
      Height = 27
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object sbNext: TSpeedButton
        Left = 90
        Top = 2
        Width = 23
        Height = 22
        Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103
        Flat = True
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFF0FFF77777777777F0FF777777777777F0F0000000000077F0F0FFFFFFFFF0
          77F0F0FFFF44FFF077F0F0FFFFF44FF077F0F0F4444444F077F0F0FFFFF44FF0
          77F0F0FFFF44FFF077F0F0FFFFFFFFF07FF0F00000000000FFF0FFFFFFFFFFFF
          FFF0}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbNextClick
      end
      object sbPrev: TSpeedButton
        Left = 65
        Top = 2
        Width = 23
        Height = 22
        Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103
        Flat = True
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000F0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFF0FFF77777777777F0FF777777777777F0F0000000000077F0F0FFFFFFFFF0
          77F0F0FFF44FFFF077F0F0FF44FFFFF077F0F0F4444444F077F0F0FF44FFFFF0
          77F0F0FFF44FFFF077F0F0FFFFFFFFF07FF0F00000000000FFF0FFFFFFFFFFFF
          FFF0}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbPrevClick
      end
      object sbSave: TSpeedButton
        Left = 33
        Top = 2
        Width = 23
        Height = 22
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        Flat = True
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FFFFFF0000FFFFFF000000FF8C0800000000000000000000000000
          0000000000000000000000BDBDBDBDBDBDBDBDBD000000FF8C08000000FFFFFF
          0000FFFFFF000000FF8C08000000737B73737B73737B73737B73737B73737B73
          000000BDBDBDBDBDBDBDBDBD000000FF8C08000000FFFFFF0000FFFFFF000000
          FFA531000000000000000000000000000000000000000000000000BDBDBDBDBD
          BDBDBDBD000000FF8C08000000FFFFFF0000FFFFFF000000FFBD52000000737B
          73737B73737B73737B73737B73737B73000000BDBDBDBDBDBDBDBDBD000000FF
          8C08000000FFFFFF0000FFFFFF000000FFC66300000000000000000000000000
          0000000000000000000000000000000000000000000000FF8C08000000FFFFFF
          0000FFFFFF000000FFE79CFFDE8CFFDE8CFFD684FFCE73FFC663FFC65AFFBD52
          FFB54AFFAD42FFAD39FFA531FF9C21FF8C08000000FFFFFF0000FFFFFF000000
          FFE79CFFDE8C0000000000000000000000000000000000000000000000000000
          00000000FF9418FFA531000000FFFFFF0000FFFFFF000000FFE79C000000BDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD000000FF
          A531000000FFFFFF0000FFFFFF000000FFE79C000000FFFFFF8CFFFFFFFFFF8C
          FFFFFFFFFF8CFFFFFFFFFF8CFFFFFFFFFFBDBDBD000000FFBD52000000FFFFFF
          0000FFFFFF000000FFE79C0000008CFFFFFFFFFF8CFFFFFFFFFF8CFFFFFFFFFF
          8CFFFFFFFFFF8CFFFFBDBDBD000000FFBD52000000FFFFFF0000FFFFFF000000
          FFE79C000000FFFFFFFF6321FF6321FF6321FF6321FF6321FFFFFF8CFFFFFFFF
          FFBDBDBD000000FFE79C000000FFFFFF0000FFFFFF000000FFFFCE000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CFFFFFFFFFF8CFFFFBDBDBD00000000
          0000000000FFFFFF0000FFFFFF000000FFFFCE000000FFFFFFFF6321FF6321FF
          6321FF6321FF6321FF6321FF6321FFFFFFBDBDBD000000BDBDBD000000FFFFFF
          0000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBDBDBD000000BDBDBD000000FFFFFF0000FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbSaveClick
      end
      object sbOpen: TSpeedButton
        Left = 0
        Top = 2
        Width = 23
        Height = 22
        Hint = #1054#1090#1082#1088#1099#1090#1100
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000635A000000
          000052C6DE0052C6DE004AC6DE0052C6DE0042BDDE0042BDDE0042BDDE0039BD
          DE0031B5D60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000635A008CFF
          FF000000000052C6DE0052C6DE0052C6DE0052C6DE004AC6DE004AC6DE0042BD
          DE0039BDDE0039BDDE0000000000FFFFFF00FFFFFF00FFFFFF0000635A008CFF
          FF0000CEFF000000000052C6DE0052C6DE0052C6DE0052C6DE004AC6DE004AC6
          DE0042BDDE0042BDDE0039BDD60000000000FFFFFF00FFFFFF0000635A008CFF
          FF00FFFFFF0000CEFF000000000063CEE70052C6DE0052C6DE0052C6DE004AC6
          DE004AC6DE004AC6DE0042BDDE0039BDDE0000000000FFFFFF0000635A008CFF
          FF0000CEFF00EFFFFF0000CEFF00000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000635A008CFF
          FF00EFFFFF0000CEFF00FFFFFF0000CEFF00FFFFFF0000CEFF00EFFFFF0000CE
          FF00EFFFFF0000CEFF0000000000FFFFFF00FFFFFF00FFFFFF0000635A008CFF
          FF0000CEFF00FFFFFF0000CEFF00EFFFFF008CFFFF008CFFFF008CFFFF008CFF
          FF008CFFFF008CFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000635A008CFF
          FF00FFFFFF0000CEFF00EFFFFF0000CEFF008CFFFF0000635A0000635A000063
          5A0000635A0000635A0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000063
          5A008CFFFF008CFFFF008CFFFF008CFFFF0000635A00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000635A0000635A0000635A0000635A00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbOpenClick
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 65
    Top = 34
  end
  object Sv: TSaveDialog
    DefaultExt = 'jpg'
    Filter = #1060#1072#1081#1083' '#1092#1086#1088#1084#1072#1090#1072'  JPEG (*.jpg)|*.jpg'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 36
    Top = 34
  end
  object Op: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' '#1092#1086#1088#1084#1072#1090#1072' JPGA  (*.jpga)|*.jpga;*.JPGA'
    Left = 8
    Top = 34
  end
end