inherited fLoginView: TfLoginView
  Caption = 'fLoginView'
  ClientHeight = 424
  ClientWidth = 399
  Visible = False
  ExplicitWidth = 399
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 399
    Height = 424
    Font.Height = -27
    ParentFont = False
    OnMouseDown = pGeralMouseDown
    ExplicitWidth = 399
    ExplicitHeight = 424
    object Label1: TLabel
      Left = 61
      Top = 77
      Width = 91
      Height = 37
      Caption = 'Usu'#225'rio'
    end
    object Label2: TLabel
      Left = 61
      Top = 171
      Width = 72
      Height = 37
      Caption = 'Senha'
    end
    object Button1: TButton
      Left = 61
      Top = 303
      Width = 132
      Height = 40
      Caption = 'Init'
      TabOrder = 2
      OnClick = Button1Click
    end
    object eSenha: TEdit
      Left = 61
      Top = 214
      Width = 273
      Height = 45
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Informe a senha'
    end
    object eUsuario: TEdit
      Left = 61
      Top = 120
      Width = 273
      Height = 45
      TabOrder = 0
      TextHint = 'Informe o usu'#225'rio'
    end
    object Button2: TButton
      Left = 202
      Top = 303
      Width = 132
      Height = 40
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = Button2Click
    end
    object eBanco: TComboBox
      Left = 192
      Top = 384
      Width = 193
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TextHint = 'Selecione o Banco de Dados'
      Items.Strings = (
        'Postgre'
        'Realtime')
    end
  end
end
