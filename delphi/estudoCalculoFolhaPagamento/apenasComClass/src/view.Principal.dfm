object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 341
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label1: TLabel
    Left = 72
    Top = 27
    Width = 82
    Height = 15
    Alignment = taRightJustify
    Caption = 'Tipo de C'#225'lculo'
  end
  object ComboBox1: TComboBox
    Left = 168
    Top = 24
    Width = 233
    Height = 23
    ItemIndex = 0
    TabOrder = 0
    Text = 'Mensal'
    Items.Strings = (
      'Mensal'
      'F'#233'rias'
      'Rescis'#227'o'
      '13'#176' Sal'#225'rio'
      'Complementar')
  end
  object Button1: TButton
    Left = 328
    Top = 279
    Width = 250
    Height = 25
    Caption = 'Executar C'#225'lculo'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 72
    Top = 96
    Width = 250
    Height = 177
    ReadOnly = True
    TabOrder = 2
  end
  object Button2: TButton
    Left = 72
    Top = 279
    Width = 250
    Height = 25
    Caption = 'Limpar lista'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 407
    Top = 23
    Width = 161
    Height = 25
    Caption = 'Adicionar C'#225'lculo'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Memo2: TMemo
    Left = 328
    Top = 96
    Width = 250
    Height = 177
    ReadOnly = True
    TabOrder = 5
  end
  object Button4: TButton
    Left = 407
    Top = 53
    Width = 161
    Height = 25
    Caption = 'Executar Individual'
    TabOrder = 6
    OnClick = Button4Click
  end
end
