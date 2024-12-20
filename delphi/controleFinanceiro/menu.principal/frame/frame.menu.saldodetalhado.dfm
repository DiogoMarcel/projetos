object frameMenuSaldoDetalhado: TframeMenuSaldoDetalhado
  Left = 0
  Top = 0
  Width = 418
  Height = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clFuchsia
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object sbFrame: TScrollBox
    Left = 0
    Top = 0
    Width = 418
    Height = 480
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object pResumo: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 5
      Width = 418
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Resumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      object sResumo: TShape
        Left = 0
        Top = 29
        Width = 418
        Height = 1
        Align = alBottom
        Brush.Color = clGray
        Pen.Color = clGray
        ExplicitTop = 0
        ExplicitWidth = 397
      end
      object lResumo: TLabel
        Left = 0
        Top = 0
        Width = 343
        Height = 29
        Align = alClient
        Alignment = taCenter
        Caption = 'Resumo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 46
        ExplicitHeight = 16
      end
      object btnAnonimo: TButton
        Tag = 1
        Left = 343
        Top = 0
        Width = 75
        Height = 29
        Align = alRight
        ImageAlignment = iaCenter
        ImageIndex = 16
        Images = dataImages.il24
        TabOrder = 0
        OnClick = btnAnonimoClick
        ExplicitLeft = 312
        ExplicitHeight = 25
      end
    end
    object clResumo: TControlList
      Left = 0
      Top = 35
      Width = 418
      Height = 38
      Align = alTop
      BorderStyle = bsNone
      ItemColor = clBtnFace
      ItemHeight = 30
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ItemSelectionOptions.SelectedColorAlpha = 120
      ParentColor = False
      TabOrder = 1
      OnBeforeDrawItem = clResumoBeforeDrawItem
      object dbtValor: TDBText
        AlignWithMargins = True
        Left = 256
        Top = 5
        Width = 157
        Height = 21
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 4
        Align = alRight
        Alignment = taRightJustify
        DataField = 'valor'
        DataSource = dataMenuSaldoDetalhe.dsMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 240
        ExplicitTop = 0
        ExplicitHeight = 25
      end
      object dbtTitulo: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 251
        Height = 21
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alClient
        Alignment = taRightJustify
        DataField = 'titulo'
        DataSource = dataMenuSaldoDetalhe.dsMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 288
        ExplicitTop = 16
        ExplicitWidth = 65
        ExplicitHeight = 17
      end
    end
    object pAdicionais: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 151
      Width = 418
      Height = 62
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Adicionais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 2
      object sAdicionais: TShape
        Left = 0
        Top = 61
        Width = 418
        Height = 1
        Align = alBottom
        Brush.Color = clGray
        Pen.Color = clGray
        ExplicitTop = 22
        ExplicitWidth = 397
      end
      object lAdicionais: TLabel
        Left = 0
        Top = 1
        Width = 418
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'Adicionais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 57
      end
      object sDivAdicionais: TShape
        Left = 0
        Top = 0
        Width = 418
        Height = 1
        Align = alTop
        Brush.Color = clGray
        Pen.Color = clGray
        ExplicitTop = 1
        ExplicitWidth = 397
      end
      object pSaldoGeralMembros: TPanel
        Left = 0
        Top = 31
        Width = 418
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'pSaldoGeralMembros'
        ShowCaption = False
        TabOrder = 0
        object lSaldoFolha: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 230
          Height = 24
          Align = alLeft
          AutoSize = False
          Caption = 'Saldo em Folha por membro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 91
          ExplicitTop = 0
          ExplicitHeight = 28
        end
        object lValorSaldoGeral: TLabel
          AlignWithMargins = True
          Left = 239
          Top = 3
          Width = 176
          Height = 24
          Align = alClient
          Alignment = taRightJustify
          Caption = 'lValorSaldoGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 320
          ExplicitWidth = 95
          ExplicitHeight = 16
        end
      end
    end
    object clSaldoFolha: TControlList
      Left = 0
      Top = 213
      Width = 418
      Height = 38
      Align = alTop
      BorderStyle = bsNone
      ItemColor = clBtnFace
      ItemHeight = 30
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ItemSelectionOptions.SelectedColorAlpha = 120
      ParentColor = False
      TabOrder = 3
      OnBeforeDrawItem = clSaldoFolhaBeforeDrawItem
      object dbtSaldoFolhaNOME: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 251
        Height = 21
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alClient
        Alignment = taRightJustify
        DataField = 'NOME'
        DataSource = dataMenuSaldoDetalhe.dsSaldoFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 9
        ExplicitWidth = 392
      end
      object dbtSaldoFolhaVALOR: TDBText
        AlignWithMargins = True
        Left = 256
        Top = 5
        Width = 157
        Height = 21
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 4
        Align = alRight
        Alignment = taRightJustify
        DataField = 'VALORFOLHAMEMBRO'
        DataSource = dataMenuSaldoDetalhe.dsSaldoFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 240
        ExplicitTop = 9
      end
    end
    object clContaPagamentos: TControlList
      Left = 0
      Top = 286
      Width = 418
      Height = 38
      Align = alTop
      BorderStyle = bsNone
      ItemColor = clBtnFace
      ItemHeight = 30
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ItemSelectionOptions.SelectedColorAlpha = 120
      ParentColor = False
      TabOrder = 4
      OnBeforeDrawItem = clContaPagamentosBeforeDrawItem
      OnDblClick = clContaPagamentosDblClick
      object dbtDESCRICAO: TDBText
        AlignWithMargins = True
        Left = 74
        Top = 5
        Width = 182
        Height = 21
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alClient
        Alignment = taRightJustify
        DataField = 'DESCRICAO'
        DataSource = dataMenuSaldoDetalhe.dsContaPagamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 5
        ExplicitTop = 9
        ExplicitWidth = 392
      end
      object dbtVALORcp: TDBText
        AlignWithMargins = True
        Left = 256
        Top = 5
        Width = 157
        Height = 21
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 4
        Align = alRight
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dataMenuSaldoDetalhe.dsContaPagamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 240
        ExplicitTop = 9
      end
      object dbtSINAL: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 64
        Height = 21
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'sinal'
        DataSource = dataMenuSaldoDetalhe.dsContaPagamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitHeight = 16
      end
    end
    object pContaPagamentos: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 256
      Width = 418
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Resumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 5
      object sContaPagamentos: TShape
        Left = 0
        Top = 29
        Width = 418
        Height = 1
        Align = alBottom
        Brush.Color = clGray
        Pen.Color = clGray
        ExplicitTop = 0
        ExplicitWidth = 397
      end
      object lContaPagamentos: TLabel
        Left = 0
        Top = 1
        Width = 418
        Height = 28
        Align = alClient
        Alignment = taCenter
        Caption = 'Contas Pendentes no M'#234's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 147
        ExplicitHeight = 16
      end
      object sDivContaPagamentos: TShape
        Left = 0
        Top = 0
        Width = 418
        Height = 1
        Align = alTop
        Brush.Color = clGray
        Pen.Color = clGray
        ExplicitTop = 8
        ExplicitWidth = 397
      end
    end
    object pProjecao: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 78
      Width = 418
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Resumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 6
      object sProjecao: TShape
        Left = 0
        Top = 29
        Width = 418
        Height = 1
        Align = alBottom
        Brush.Color = clGray
        Pen.Color = clGray
        ExplicitTop = 0
        ExplicitWidth = 397
      end
      object lProjecao: TLabel
        Left = 0
        Top = 0
        Width = 149
        Height = 29
        Align = alClient
        Alignment = taCenter
        Caption = 'Proje'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 50
        ExplicitHeight = 16
      end
      object pQtdMeses: TPanel
        Left = 149
        Top = 0
        Width = 269
        Height = 29
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pQtdMeses'
        ShowCaption = False
        TabOrder = 0
        object lMeses: TLabel
          AlignWithMargins = True
          Left = 145
          Top = 3
          Width = 70
          Height = 23
          Align = alClient
          Caption = 'Meses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 36
          ExplicitHeight = 16
        end
        object eQtdMeses: TEdit
          Left = 0
          Top = 0
          Width = 142
          Height = 29
          Align = alLeft
          Alignment = taCenter
          NumbersOnly = True
          TabOrder = 0
          Text = '2'
        end
        object bCalcular: TButton
          AlignWithMargins = True
          Left = 221
          Top = 3
          Width = 45
          Height = 23
          Action = aCalcularProjecao
          Align = alRight
          ImageAlignment = iaCenter
          Images = dataImages.il16
          TabOrder = 1
        end
      end
    end
    object clProjecao: TControlList
      Left = 0
      Top = 108
      Width = 418
      Height = 38
      Align = alTop
      BorderStyle = bsNone
      ItemColor = clBtnFace
      ItemHeight = 30
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ItemSelectionOptions.SelectedColorAlpha = 120
      ParentColor = False
      TabOrder = 7
      OnBeforeDrawItem = clProjecaoBeforeDrawItem
      object dbtValorProjecao: TDBText
        AlignWithMargins = True
        Left = 256
        Top = 5
        Width = 157
        Height = 21
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 4
        Align = alRight
        Alignment = taRightJustify
        DataField = 'valor'
        DataSource = dataMenuSaldoDetalhe.dsProjecao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 240
        ExplicitTop = 0
        ExplicitHeight = 25
      end
      object dbtTituloProjecao: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 251
        Height = 21
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 4
        Align = alClient
        Alignment = taRightJustify
        DataField = 'titulo'
        DataSource = dataMenuSaldoDetalhe.dsProjecao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 288
        ExplicitTop = 16
        ExplicitWidth = 65
        ExplicitHeight = 17
      end
    end
  end
  object ActionList: TActionList
    Images = dataImages.il16
    Left = 32
    Top = 360
    object aCalcularProjecao: TAction
      ImageIndex = 1
      OnExecute = aCalcularProjecaoExecute
    end
  end
end
