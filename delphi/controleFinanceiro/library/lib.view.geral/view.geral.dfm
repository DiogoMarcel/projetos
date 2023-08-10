object formTemplate: TformTemplate
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'formTemplate'
  ClientHeight = 600
  ClientWidth = 800
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ShowHint = True
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object pGeral: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
  end
  object alAcoes: TActionList
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
