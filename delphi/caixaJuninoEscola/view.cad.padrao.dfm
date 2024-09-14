object fCadPadrao: TfCadPadrao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro Padr'#227'o'
  ClientHeight = 421
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 24
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 688
    Height = 415
    Align = alClient
    BevelKind = bkSoft
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 687
    ExplicitHeight = 356
    object DBGrid1: TDBGrid
      Left = 0
      Top = 202
      Width = 684
      Height = 184
      Align = alBottom
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 386
      Width = 684
      Height = 25
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 327
      ExplicitWidth = 683
    end
  end
  object ActionList1: TActionList
    Left = 187
    Top = 19
    object aSair: TAction
      Caption = 'aSair'
      ShortCut = 27
      OnExecute = aSairExecute
    end
  end
end
