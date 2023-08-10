object formTemplate: TformTemplate
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'formTemplate'
  ClientHeight = 348
  ClientWidth = 661
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pGeral: TPanel
    Left = 0
    Top = 0
    Width = 661
    Height = 348
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    ExplicitWidth = 651
    ExplicitHeight = 338
  end
  object aListaAcoes: TActionList
    Left = 24
    Top = 8
    object aSair: TAction
      Category = 'template'
      Caption = 'Sair'
      ShortCut = 27
      OnExecute = aSairExecute
    end
  end
end
