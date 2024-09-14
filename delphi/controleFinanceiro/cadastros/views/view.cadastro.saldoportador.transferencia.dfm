inherited formSaldoPortadorTransferencia: TformSaldoPortadorTransferencia
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Transferir saldo entre portadores'
  ClientHeight = 304
  ClientWidth = 626
  Visible = False
  ExplicitWidth = 640
  ExplicitHeight = 339
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 626
    Height = 304
    ExplicitWidth = 624
    ExplicitHeight = 300
    object lId_Portador_Origem: TLabel
      Left = 29
      Top = 60
      Width = 117
      Height = 21
      Alignment = taRightJustify
      Caption = 'Portador Origem'
    end
    object lId_Portador_Destino: TLabel
      Left = 29
      Top = 95
      Width = 117
      Height = 21
      Alignment = taRightJustify
      Caption = 'Portador Destino'
    end
    object lValor: TLabel
      Left = 110
      Top = 130
      Width = 36
      Height = 21
      Alignment = taRightJustify
      Caption = 'Valor'
    end
    object lcbId_Portador_Origem: TDBLookupComboBox
      Left = 152
      Top = 52
      Width = 400
      Height = 29
      DataField = 'Id_Portador_Origem'
      DataSource = dataCadastroSaldoPortadorTransferencia.dsCadastro
      KeyField = 'IdPortador'
      ListField = 'NomePortador'
      NullValueKey = 8
      TabOrder = 0
    end
    object lcbId_Portador_Destino: TDBLookupComboBox
      Left = 152
      Top = 87
      Width = 400
      Height = 29
      DataField = 'Id_Portador_Destino'
      DataSource = dataCadastroSaldoPortadorTransferencia.dsCadastro
      KeyField = 'IdPortador'
      ListField = 'NomePortador'
      NullValueKey = 8
      TabOrder = 1
    end
    object pRodapeBotoesCad: TPanel
      Left = 0
      Top = 232
      Width = 622
      Height = 68
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitTop = 228
      ExplicitWidth = 620
      object sbCancelarCadastro: TSpeedButton
        AlignWithMargins = True
        Left = 457
        Top = 3
        Width = 150
        Height = 62
        Margins.Left = 15
        Margins.Right = 15
        Action = aSair
        Align = alRight
        ImageIndex = 1
        Images = dataImages.il40
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        StyleElements = [seBorder]
        ExplicitLeft = 709
        ExplicitHeight = 58
      end
      object sbSalvarCadastro: TSpeedButton
        AlignWithMargins = True
        Left = 277
        Top = 3
        Width = 150
        Height = 62
        Margins.Left = 15
        Margins.Right = 15
        Action = aTransferir
        Align = alRight
        Images = dataImages.il40
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        StyleElements = [seBorder]
        ExplicitLeft = 591
        ExplicitHeight = 58
      end
    end
    object eValorTransferencia: TEdit
      Left = 152
      Top = 122
      Width = 249
      Height = 29
      Alignment = taRightJustify
      TabOrder = 2
      TextHint = 'Informe o valor da transfer'#234'ncia'
      OnKeyPress = eValorTransferenciaKeyPress
    end
  end
  inherited alAcoes: TActionList
    object aTransferir: TAction
      Caption = 'Transferir'
      ImageIndex = 0
      OnExecute = aTransferirExecute
    end
  end
end
