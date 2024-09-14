inherited formAluguelEditor: TformAluguelEditor
  Caption = 'formAluguelEditor'
  ClientHeight = 379
  ClientWidth = 518
  Visible = False
  OnShow = FormShow
  ExplicitWidth = 518
  ExplicitHeight = 379
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 518
    Height = 379
    ExplicitWidth = 518
    ExplicitHeight = 379
    object lDescricao: TLabel
      Left = 97
      Top = 102
      Width = 67
      Height = 21
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o'
    end
    object lValor: TLabel
      Left = 128
      Top = 137
      Width = 36
      Height = 21
      Alignment = taRightJustify
      Caption = 'Valor'
    end
    object lQtdParcela: TLabel
      Left = 68
      Top = 172
      Width = 96
      Height = 21
      Alignment = taRightJustify
      Caption = 'Tipo de Conta'
    end
    object lIDAluguel: TLabel
      Left = 170
      Top = 67
      Width = 72
      Height = 21
      Caption = 'lIDAluguel'
    end
    object Label2: TLabel
      Left = 57
      Top = 67
      Width = 107
      Height = 21
      Alignment = taRightJustify
      Caption = 'C'#243'digo Aluguel'
    end
    object Label1: TLabel
      Left = 60
      Top = 207
      Width = 104
      Height = 21
      Alignment = taRightJustify
      Caption = 'Compartilhado'
    end
    object editDescricao: TEdit
      Left = 170
      Top = 94
      Width = 286
      Height = 29
      TabOrder = 0
      Text = 'editDescricao'
    end
    object boxTipoConta: TComboBox
      Left = 170
      Top = 164
      Width = 145
      Height = 29
      ItemIndex = 0
      TabOrder = 1
      Text = 'Pagar'
      Items.Strings = (
        'Pagar'
        'Receber')
    end
    object boxCompartilhado: TComboBox
      Left = 170
      Top = 199
      Width = 145
      Height = 29
      ItemIndex = 1
      TabOrder = 2
      Text = 'N'#227'o'
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Somente')
    end
    object Panel1: TPanel
      Left = 0
      Top = 316
      Width = 514
      Height = 59
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 3
      object sbSalvarCadastro: TSpeedButton
        AlignWithMargins = True
        Left = 169
        Top = 3
        Width = 150
        Height = 53
        Margins.Left = 15
        Margins.Right = 15
        Action = aSalvar
        Align = alRight
        ImageIndex = 0
        Images = dataImages.il40
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
        ExplicitLeft = 591
        ExplicitHeight = 58
      end
      object sbCancelarCadastro: TSpeedButton
        AlignWithMargins = True
        Left = 349
        Top = 3
        Width = 150
        Height = 53
        Margins.Left = 15
        Margins.Right = 15
        Action = aSair
        Align = alRight
        ImageIndex = 1
        Images = dataImages.il40
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
        ExplicitLeft = 709
        ExplicitHeight = 58
      end
    end
    object editValor: TEditMaskMDS
      Left = 170
      Top = 129
      Width = 145
      Height = 29
      TabOrder = 4
      Text = 'editValor'
    end
  end
  inherited alAcoes: TActionList
    inherited aSair: TAction
      Caption = 'Cancelar'
    end
    object aSalvar: TAction
      Category = 'editor'
      Caption = 'Salvar'
      OnExecute = aSalvarExecute
    end
  end
end
