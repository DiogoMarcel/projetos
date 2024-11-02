inherited formRelAbastecimentos: TformRelAbastecimentos
  BorderStyle = bsSizeable
  Caption = 'Abastecimentos'
  ClientHeight = 413
  ClientWidth = 1036
  Visible = False
  OnDestroy = FormDestroy
  ExplicitWidth = 1050
  ExplicitHeight = 448
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 1036
    Height = 413
    ExplicitWidth = 982
    ExplicitHeight = 409
    object clAbastecimentos: TControlList
      Left = 0
      Top = 60
      Width = 1032
      Height = 308
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      ItemHeight = 30
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ParentColor = False
      TabOrder = 0
      OnBeforeDrawItem = clAbastecimentosBeforeDrawItem
      ExplicitWidth = 978
      ExplicitHeight = 304
      object dbtData: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 2
        Width = 130
        Height = 26
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alLeft
        Alignment = taCenter
        Color = clMoneyGreen
        DataField = 'dataabastecimento'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentFont = False
      end
      object dbtValor: TDBText
        AlignWithMargins = True
        Left = 375
        Top = 2
        Width = 85
        Height = 26
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'totalabastecimento'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 407
      end
      object dbtObservacao: TDBText
        AlignWithMargins = True
        Left = 145
        Top = 2
        Width = 220
        Height = 26
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alClient
        DataField = 'observacao'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 127
        ExplicitWidth = 300
      end
      object dbtValorLitro: TDBText
        AlignWithMargins = True
        Left = 967
        Top = 2
        Width = 60
        Height = 26
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'valorlitro'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 1027
      end
      object dbtDifValor: TDBText
        AlignWithMargins = True
        Left = 470
        Top = 4
        Width = 60
        Height = 24
        Margins.Left = 5
        Margins.Top = 4
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'diftotalabastecimento'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 502
      end
      object dbtMedia: TDBText
        AlignWithMargins = True
        Left = 872
        Top = 1
        Width = 85
        Height = 27
        Margins.Left = 5
        Margins.Top = 1
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'media'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 917
      end
      object dbtKMCarro: TDBText
        AlignWithMargins = True
        Left = 540
        Top = 2
        Width = 85
        Height = 26
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'kmcarro'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 577
      end
      object dbtDifQuantidadeLitros: TDBText
        AlignWithMargins = True
        Left = 800
        Top = 4
        Width = 62
        Height = 24
        Margins.Left = 5
        Margins.Top = 4
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'difquantidadelitros'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 750
      end
      object dbtQuantidadeLitros: TDBText
        AlignWithMargins = True
        Left = 705
        Top = 2
        Width = 85
        Height = 26
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'quantidadelitros'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 747
      end
      object dbtDifKMCarro: TDBText
        AlignWithMargins = True
        Left = 635
        Top = 4
        Width = 60
        Height = 24
        Margins.Left = 5
        Margins.Top = 4
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        DataField = 'difkmcarro'
        DataSource = dmAbastecimentos.dsAbastecimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 634
      end
    end
    object pCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 1032
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 978
      object lData: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 130
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object lDifValorTotal: TLabel
        AlignWithMargins = True
        Left = 470
        Top = 5
        Width = 60
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Dif. Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 517
      end
      object lSaldoDisponivel: TLabel
        AlignWithMargins = True
        Left = 145
        Top = 5
        Width = 220
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        AutoSize = False
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 162
        ExplicitWidth = 300
      end
      object lValorLitro: TLabel
        AlignWithMargins = True
        Left = 967
        Top = 5
        Width = 60
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Litro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 997
      end
      object lValorTotal: TLabel
        AlignWithMargins = True
        Left = 375
        Top = 5
        Width = 85
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 432
      end
      object lKMCarro: TLabel
        AlignWithMargins = True
        Left = 540
        Top = 5
        Width = 85
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'KM Carro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 597
      end
      object lDifKMCarro: TLabel
        AlignWithMargins = True
        Left = 635
        Top = 5
        Width = 60
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Dif. KM Carro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 677
      end
      object lQuantidadeLitros: TLabel
        AlignWithMargins = True
        Left = 705
        Top = 5
        Width = 85
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Quantidade Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 762
      end
      object lDifQuantidadeLitros: TLabel
        AlignWithMargins = True
        Left = 800
        Top = 5
        Width = 62
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Dif. Quantidade Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 750
      end
      object lMediaCarro: TLabel
        AlignWithMargins = True
        Left = 872
        Top = 5
        Width = 85
        Height = 50
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'M'#233'dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 927
      end
    end
    object pRodape: TPanel
      Left = 0
      Top = 368
      Width = 1032
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pRodape'
      ShowCaption = False
      TabOrder = 2
      ExplicitTop = 364
      ExplicitWidth = 978
      object lValorLitroGeral: TLabel
        AlignWithMargins = True
        Left = 967
        Top = 2
        Width = 60
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'lValorLitroGeral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 915
      end
      object lMediaGeral: TLabel
        AlignWithMargins = True
        Left = 872
        Top = 2
        Width = 85
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'lMediaGeral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 820
      end
      object lEspaco1: TLabel
        AlignWithMargins = True
        Left = 800
        Top = 2
        Width = 62
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 748
      end
      object lQtdLitrosGeral: TLabel
        AlignWithMargins = True
        Left = 705
        Top = 2
        Width = 85
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'lQtdLitrosGeral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 517
      end
      object lEspaco2: TLabel
        AlignWithMargins = True
        Left = 635
        Top = 2
        Width = 60
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 583
      end
      object lKMRodados: TLabel
        AlignWithMargins = True
        Left = 540
        Top = 2
        Width = 85
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'lKMRodados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 342
        ExplicitTop = 5
      end
      object lEspaco3: TLabel
        AlignWithMargins = True
        Left = 470
        Top = 2
        Width = 60
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 369
        ExplicitTop = -6
      end
      object lValorTotalGeral: TLabel
        AlignWithMargins = True
        Left = 375
        Top = 2
        Width = 85
        Height = 37
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        Align = alRight
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'lValorTotalGeral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 228
        ExplicitTop = 5
      end
    end
  end
  inherited alAcoes: TActionList
    Left = 32
    Top = 248
  end
end
