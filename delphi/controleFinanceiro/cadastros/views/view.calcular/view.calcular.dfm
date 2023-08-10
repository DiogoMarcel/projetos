inherited formCalcular: TformCalcular
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculator'
  ClientHeight = 545
  ClientWidth = 611
  Visible = False
  ExplicitWidth = 617
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 611
    Height = 545
    ExplicitWidth = 611
    ExplicitHeight = 545
    object ButtonGroup2: TButtonGroup
      AlignWithMargins = True
      Left = 540
      Top = 3
      Width = 62
      Height = 535
      Margins.Right = 5
      Align = alRight
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonHeight = 55
      ButtonWidth = 62
      ButtonOptions = [gboFullSize, gboShowCaptions]
      Images = dataImages.vil54
      Items = <
        item
          Action = aSomar
        end
        item
          Action = aSubtrair
        end
        item
          Action = aMultiplicar
        end
        item
          Action = aDividir
        end
        item
          Action = aMemory
        end
        item
          Action = aLimpar
        end
        item
          Action = aResult
        end
        item
          Action = aConfirmar
        end>
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 537
      Height = 541
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel3'
      ShowCaption = False
      TabOrder = 1
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 57
        Width = 531
        Height = 355
        Align = alClient
        BorderStyle = bsNone
        DataSource = sourceCalc
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'valor'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Width = 201
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'tipo'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 185
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 418
        Width = 531
        Height = 120
        Align = alBottom
        BorderStyle = bsNone
        DataSource = sourceMemory
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'total'
            Title.Alignment = taRightJustify
            Title.Caption = 'Mem'#243'ria'
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'seq'
            Title.Alignment = taRightJustify
            Title.Caption = 'Sequencial'
            Visible = False
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 537
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 2
        object Label1: TLabel
          AlignWithMargins = True
          Left = 30
          Top = 3
          Width = 53
          Height = 48
          Margins.Left = 30
          Align = alLeft
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 32
        end
        object editValor: TEditMaskMDS
          AlignWithMargins = True
          Left = 89
          Top = 3
          Width = 249
          Height = 48
          Align = alLeft
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = ''
          TextHint = 'Informe o valor'
          OnKeyPress = editValorKeyPress
          ExplicitHeight = 45
        end
      end
    end
  end
  inherited alAcoes: TActionList
    Images = dataImages.vil54
    Left = 40
    Top = 136
    object aSomar: TAction
      Category = 'calculator'
      ImageIndex = 7
      ImageName = 'icons8-soma'
      OnExecute = aSomarExecute
    end
    object aSubtrair: TAction
      Category = 'calculator'
      ImageIndex = 10
      ImageName = 'icons8-subtra'#231#227'o'
      OnExecute = aSubtrairExecute
    end
    object aMultiplicar: TAction
      Category = 'calculator'
      ImageIndex = 9
      ImageName = 'icons8-multiplica'#231#227'o'
      OnExecute = aMultiplicarExecute
    end
    object aDividir: TAction
      Category = 'calculator'
      ImageIndex = 8
      ImageName = 'icons8-dividis'#227'o'
      OnExecute = aDividirExecute
    end
    object aConfirmar: TAction
      Category = 'geral'
      ImageIndex = 14
      ImageName = 'icons8-selecionado'
      OnExecute = aConfirmarExecute
    end
    object aLimpar: TAction
      Category = 'calculator'
      ImageIndex = 13
      ImageName = 'icons8-calculadora'
      OnExecute = aLimparExecute
    end
    object aMemory: TAction
      Category = 'calculator'
      ImageIndex = 12
      ImageName = 'icons8-m'
      OnExecute = aMemoryExecute
    end
    object aResult: TAction
      Category = 'calculator'
      ImageIndex = 11
      ImageName = 'icons8-sinal-de-igual'
      OnExecute = aResultExecute
    end
  end
  object sourceCalc: TDataSource
    DataSet = tableCalc
    Left = 248
    Top = 136
  end
  object tableCalc: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 136
    object tableCalcvalor: TCurrencyField
      FieldName = 'valor'
    end
    object tableCalctipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object tableCalctotal: TCurrencyField
      FieldName = 'total'
    end
  end
  object tableMemory: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 288
    object tableMemoryseq: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'seq'
    end
    object tableMemorytotal: TCurrencyField
      FieldName = 'total'
    end
  end
  object sourceMemory: TDataSource
    DataSet = tableMemory
    Left = 248
    Top = 288
  end
end
