inherited formAluguelLancamento: TformAluguelLancamento
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Alugueis'
  ClientHeight = 691
  ClientWidth = 997
  Visible = False
  OnDestroy = FormDestroy
  ExplicitWidth = 1003
  ExplicitHeight = 720
  PixelsPerInch = 96
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 997
    Height = 691
    BevelKind = bkNone
    ExplicitWidth = 997
    ExplicitHeight = 691
    object pHistorico: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 991
      Height = 215
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pHistorico'
      ShowCaption = False
      TabOrder = 0
      object lTituloHistorico: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 985
        Height = 30
        Align = alTop
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 82
      end
      object gAluguel: TDBGrid
        Left = 46
        Top = 36
        Width = 945
        Height = 179
        Margins.Left = 50
        Align = alClient
        BorderStyle = bsNone
        DataSource = dataAluguel.dsAluguel
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'dataaluguel'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datapagamento'
            Title.Caption = 'Pagamento'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pagamentocomp'
            Title.Caption = 'Pagamento Compartilhado'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valoraluguel'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Width = 150
            Visible = True
          end>
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 39
        Width = 40
        Height = 173
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'pIncluirHist'
        ShowCaption = False
        TabOrder = 1
        object sbExcluirCadastro: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 34
          Height = 34
          Margins.Top = 0
          Margins.Bottom = 0
          Action = aDelHist
          Align = alTop
          DisabledImageIndex = 17
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          StyleElements = [seClient]
          ExplicitTop = 3
        end
        object sbEditarCadastro: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 34
          Width = 34
          Height = 34
          Margins.Top = 0
          Margins.Bottom = 0
          Action = aEditHist
          Align = alTop
          DisabledImageIndex = 16
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitTop = 59
        end
        object sbIncluirCadastro: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 68
          Width = 34
          Height = 34
          Margins.Top = 0
          Margins.Bottom = 0
          Action = aNovoHist
          Align = alTop
          DisabledImageIndex = 18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitTop = 99
        end
        object sbConfirmarPagtoComp: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 136
          Width = 34
          Height = 34
          Hint = 'Confirmar Pagamento Aluguel Compartilhado'
          HelpType = htKeyword
          Margins.Top = 0
          Margins.Bottom = 0
          Action = aConfirmarPagtoComp
          Align = alTop
          DisabledImageIndex = 18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitTop = 129
        end
        object sbConfirmarPagto: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 102
          Width = 34
          Height = 34
          Hint = 'Confirmar Pagamento Aluguel'
          Margins.Top = 0
          Margins.Bottom = 0
          Action = aConfirmarPagto
          Align = alTop
          DisabledImageIndex = 18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitTop = 129
        end
      end
    end
    object pLancamento: TGridPanel
      Left = 0
      Top = 221
      Width = 997
      Height = 470
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pLancamento'
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = -1
          Row = -1
        end
        item
          Column = -1
          Row = 0
        end
        item
          Column = 0
          Control = fAluguel
          Row = 0
        end
        item
          Column = 1
          Control = fAluguelComp
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      ShowCaption = False
      TabOrder = 1
      inline fAluguel: TframeAluguelLancamento
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 492
        Height = 464
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 492
        ExplicitHeight = 464
        inherited pAluguel: TPanel
          Width = 492
          ExplicitWidth = 492
          inherited gAluguel: TGridPanel
            Width = 492
            ControlCollection = <
              item
                Column = 0
                Control = fAluguel.lMesAno
                Row = 0
              end
              item
                Column = 0
                Control = fAluguel.lValor
                Row = 1
              end
              item
                Column = 1
                Control = fAluguel.dbtMesAno
                Row = 0
              end
              item
                Column = 1
                Control = fAluguel.dbtValorAluguel
                Row = 1
              end>
            ExplicitWidth = 492
            inherited lMesAno: TLabel
              ExplicitLeft = 384
            end
            inherited lValor: TLabel
              ExplicitLeft = 434
            end
            inherited dbtMesAno: TDBText
              DataField = 'dataaluguel'
              DataSource = dataAluguel.dsAluguelCob
              ExplicitLeft = 312
              ExplicitWidth = 218
            end
            inherited dbtValorAluguel: TDBText
              DataField = 'valoraluguel'
              DataSource = dataAluguel.dsAluguelCob
              ExplicitLeft = 233
              ExplicitWidth = 218
            end
          end
          inherited pAluguelCabecalho: TPanel
            Width = 492
            ExplicitWidth = 492
            inherited iPago: TImage
              Left = 463
              ExplicitLeft = 431
            end
            inherited lAluguel: TLabel
              Width = 334
              Height = 26
            end
            inherited iLetraP: TImage
              Left = 406
              ExplicitLeft = 372
            end
            inherited iAguardando: TImage
              Left = 431
              ExplicitLeft = 399
            end
            inherited iLetraC: TImage
              Left = 340
              ExplicitLeft = 300
            end
            inherited iLetraO: TImage
              Left = 362
              ExplicitLeft = 324
            end
            inherited iLetraM: TImage
              Left = 384
              ExplicitLeft = 348
            end
          end
        end
        inherited pTotal: TPanel
          Top = 434
          Width = 492
          ExplicitTop = 434
          ExplicitWidth = 492
          inherited lTotal: TLabel
            Height = 24
          end
          inherited dbtTotal: TDBText
            Left = 58
            Width = 424
            Height = 30
            DataField = 'total'
            DataSource = dataAluguel.dsAluguelTotal
            ExplicitLeft = 401
          end
        end
        inherited gCorpo: TGridPanel
          Width = 492
          Height = 354
          ControlCollection = <
            item
              Column = 0
              Control = fAluguel.pDesconto
              Row = 1
            end
            item
              Column = 0
              Control = fAluguel.pCobranca
              Row = 0
            end>
          ExplicitWidth = 492
          ExplicitHeight = 354
          inherited pDesconto: TPanel
            ExplicitTop = 177
            ExplicitWidth = 492
            ExplicitHeight = 177
            inherited lDescontos: TLabel
              Width = 486
            end
            inherited gDesconto: TDBGrid
              Width = 492
              Height = 123
              DataSource = dataAluguel.dsAluguelDes
              Columns = <
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorconta'
                  Title.Caption = 'Valor'
                  Width = 150
                  Visible = True
                end>
            end
            inherited pGestaoDesconto: TPanel
              Top = 152
              Width = 492
              ExplicitTop = 152
              ExplicitWidth = 492
              inherited sbExcluirDesconto: TSpeedButton
                Left = 439
                Action = aContasDelDesc
                ExplicitLeft = 445
                ExplicitHeight = 19
              end
              inherited sbEditarDesconto: TSpeedButton
                Left = 383
                Action = aContasEditDesc
                ExplicitLeft = 439
              end
              inherited sbIncluirDesconto: TSpeedButton
                Left = 327
                Action = aContasAdicDesc
                ExplicitLeft = 311
                ExplicitTop = 3
                ExplicitHeight = 19
              end
            end
          end
          inherited pCobranca: TPanel
            ExplicitWidth = 492
            ExplicitHeight = 177
            inherited lCobrancas: TLabel
              Width = 486
            end
            inherited gCobranca: TDBGrid
              Width = 492
              Height = 123
              DataSource = dataAluguel.dsAluguelCob
              Columns = <
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorconta'
                  Title.Caption = 'Valor'
                  Width = 150
                  Visible = True
                end>
            end
            inherited pGestaoCobranca: TPanel
              Top = 152
              Width = 492
              ExplicitTop = 152
              ExplicitWidth = 492
              inherited sbIncluirCadastro: TSpeedButton
                Left = 327
                Action = aContasAdic
                ExplicitLeft = 327
              end
              inherited sbEditarCadastro: TSpeedButton
                Left = 383
                Action = aContasEdit
                ExplicitLeft = 383
              end
              inherited sbExcluirCadastro: TSpeedButton
                Left = 439
                Action = aContasDel
                ExplicitLeft = 439
              end
            end
          end
        end
      end
      inline fAluguelComp: TframeAluguelLancamento
        AlignWithMargins = True
        Left = 501
        Top = 3
        Width = 493
        Height = 464
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 501
        ExplicitTop = 3
        ExplicitWidth = 493
        ExplicitHeight = 464
        inherited pAluguel: TPanel
          Width = 493
          ExplicitWidth = 493
          inherited gAluguel: TGridPanel
            Width = 493
            ControlCollection = <
              item
                Column = 0
                Control = fAluguelComp.lMesAno
                Row = 0
              end
              item
                Column = 0
                Control = fAluguelComp.lValor
                Row = 1
              end
              item
                Column = 1
                Control = fAluguelComp.dbtMesAno
                Row = 0
              end
              item
                Column = 1
                Control = fAluguelComp.dbtValorAluguel
                Row = 1
              end>
            ExplicitWidth = 493
            inherited lMesAno: TLabel
              ExplicitLeft = 384
            end
            inherited lValor: TLabel
              ExplicitLeft = 434
            end
            inherited dbtMesAno: TDBText
              Width = 234
              DataField = 'dataaluguel'
              DataSource = dataAluguel.dsAluguelCompCob
              ExplicitLeft = 233
              ExplicitWidth = 218
            end
            inherited dbtValorAluguel: TDBText
              Width = 234
              DataField = 'valoraluguel'
              DataSource = dataAluguel.dsAluguelCompCob
              ExplicitLeft = 233
              ExplicitWidth = 218
            end
          end
          inherited pAluguelCabecalho: TPanel
            Width = 493
            ExplicitWidth = 493
            inherited iPago: TImage
              Left = 464
              ExplicitLeft = 431
            end
            inherited lAluguel: TLabel
              Width = 335
              Height = 26
            end
            inherited iLetraP: TImage
              Left = 407
              ExplicitLeft = 370
            end
            inherited iAguardando: TImage
              Left = 432
              ExplicitLeft = 399
            end
            inherited iLetraC: TImage
              Left = 341
              ExplicitLeft = 300
            end
            inherited iLetraO: TImage
              Left = 363
              ExplicitLeft = 322
            end
            inherited iLetraM: TImage
              Left = 385
              ExplicitLeft = 344
            end
          end
        end
        inherited pTotal: TPanel
          Top = 434
          Width = 493
          ExplicitTop = 434
          ExplicitWidth = 493
          inherited lTotal: TLabel
            Height = 24
          end
          inherited dbtTotal: TDBText
            Left = 58
            Width = 425
            Height = 30
            DataField = 'total'
            DataSource = dataAluguel.dsAluguelTotalComp
            ExplicitLeft = 402
          end
        end
        inherited gCorpo: TGridPanel
          Width = 493
          Height = 354
          ControlCollection = <
            item
              Column = 0
              Control = fAluguelComp.pDesconto
              Row = 1
            end
            item
              Column = 0
              Control = fAluguelComp.pCobranca
              Row = 0
            end>
          ExplicitWidth = 493
          ExplicitHeight = 354
          inherited pDesconto: TPanel
            Width = 493
            ExplicitTop = 177
            ExplicitWidth = 493
            ExplicitHeight = 177
            inherited lDescontos: TLabel
              Width = 487
              Caption = 'Acr'#233'scimos'
              ExplicitWidth = 108
            end
            inherited gDesconto: TDBGrid
              Width = 493
              Height = 123
              Columns = <
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorconta'
                  Title.Caption = 'Valor'
                  Width = 150
                  Visible = True
                end>
            end
            inherited pGestaoDesconto: TPanel
              Top = 152
              Width = 493
              ExplicitTop = 152
              ExplicitWidth = 493
              inherited sbExcluirDesconto: TSpeedButton
                Left = 440
                Action = aContasCompDelAcre
                ExplicitLeft = 440
              end
              inherited sbEditarDesconto: TSpeedButton
                Left = 384
                Action = aContasCompEditAcre
                ExplicitLeft = 384
              end
              inherited sbIncluirDesconto: TSpeedButton
                Left = 328
                Action = aContasCompAdicAcre
                ExplicitLeft = 328
              end
            end
          end
          inherited pCobranca: TPanel
            Width = 493
            ExplicitWidth = 493
            ExplicitHeight = 177
            inherited lCobrancas: TLabel
              Width = 487
            end
            inherited gCobranca: TDBGrid
              Width = 493
              Height = 123
              Columns = <
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorconta'
                  Title.Caption = 'Valor'
                  Width = 150
                  Visible = True
                end>
            end
            inherited pGestaoCobranca: TPanel
              Top = 152
              Width = 493
              ExplicitTop = 152
              ExplicitWidth = 493
              inherited sbIncluirCadastro: TSpeedButton
                Left = 328
                Action = aContasCompAdic
                ExplicitLeft = 328
              end
              inherited sbEditarCadastro: TSpeedButton
                Left = 384
                Action = aContasCompEdit
                ExplicitLeft = 384
              end
              inherited sbExcluirCadastro: TSpeedButton
                Left = 440
                Action = aContasCompDel
                ExplicitLeft = 440
              end
            end
          end
        end
      end
    end
  end
  inherited alAcoes: TActionList
    Images = dataImages.il16
    Left = 192
    Top = 16
    object aNovoHist: TAction
      Category = 'Historico'
      ImageIndex = 8
      OnExecute = aNovoHistExecute
    end
    object aEditHist: TAction
      Category = 'Historico'
      ImageIndex = 5
      OnExecute = aEditHistExecute
    end
    object aDelHist: TAction
      Category = 'Historico'
      ImageIndex = 6
      OnExecute = aDelHistExecute
    end
    object aContasAdic: TAction
      Category = 'Contas'
      ImageIndex = 8
      OnExecute = aContasAdicExecute
    end
    object aConfirmarPagto: TAction
      Category = 'Historico'
      ImageIndex = 9
      OnExecute = aConfirmarPagtoExecute
    end
    object aConfirmarPagtoComp: TAction
      Category = 'Historico'
      ImageIndex = 9
      OnExecute = aConfirmarPagtoCompExecute
    end
    object aContasAdicDesc: TAction
      Category = 'Contas'
      ImageIndex = 8
      OnExecute = aContasAdicDescExecute
    end
    object aContasEdit: TAction
      Category = 'Contas'
      ImageIndex = 5
      OnExecute = aContasEditExecute
    end
    object aContasEditDesc: TAction
      Category = 'Contas'
      ImageIndex = 5
      OnExecute = aContasEditDescExecute
    end
    object aContasDel: TAction
      Category = 'Contas'
      ImageIndex = 6
      OnExecute = aContasDelExecute
    end
    object aContasDelDesc: TAction
      Category = 'Contas'
      ImageIndex = 6
      OnExecute = aContasDelDescExecute
    end
    object aContasCompAdic: TAction
      Category = 'Contas'
      ImageIndex = 8
      OnExecute = aContasCompAdicExecute
    end
    object aContasCompAdicAcre: TAction
      Category = 'Contas'
      ImageIndex = 8
      OnExecute = aContasCompAdicAcreExecute
    end
    object aContasCompEdit: TAction
      Category = 'Contas'
      ImageIndex = 5
      OnExecute = aContasCompEditExecute
    end
    object aContasCompEditAcre: TAction
      Category = 'Contas'
      ImageIndex = 5
      OnExecute = aContasCompEditAcreExecute
    end
    object aContasCompDel: TAction
      Category = 'Contas'
      ImageIndex = 6
      OnExecute = aContasCompDelExecute
    end
    object aContasCompDelAcre: TAction
      Category = 'Contas'
      ImageIndex = 6
      OnExecute = aContasCompDelAcreExecute
    end
  end
end
