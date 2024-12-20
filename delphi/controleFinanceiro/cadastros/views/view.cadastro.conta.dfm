inherited formCadConta: TformCadConta
  ClientHeight = 735
  ClientWidth = 832
  ExplicitWidth = 846
  ExplicitHeight = 770
  TextHeight = 13
  inherited pGeral: TPanel
    Width = 832
    Height = 735
    ExplicitWidth = 830
    ExplicitHeight = 731
    inherited cpCadastros: TCardPanel
      Width = 832
      Height = 690
      ActiveCard = cConsulta
      ExplicitWidth = 830
      ExplicitHeight = 686
      inherited cConsulta: TCard
        Width = 832
        Height = 690
        ExplicitWidth = 832
        ExplicitHeight = 690
        inherited cpConsultas: TCardPanel
          Width = 832
          Height = 587
          ActiveCard = cConsultaGrade
          ExplicitWidth = 832
          ExplicitHeight = 587
          inherited cConsultaLista: TCard
            Width = 832
            Height = 587
            ExplicitWidth = 832
            ExplicitHeight = 587
            inherited dbgConsulta: TDBGrid
              Width = 832
              Height = 554
            end
            inherited sbPesquisaConsulta: TSearchBox
              Width = 792
              ExplicitWidth = 792
            end
          end
          inherited cConsultaGrade: TCard
            Width = 832
            Height = 587
            ExplicitWidth = 832
            ExplicitHeight = 587
            object sbConsultaGrade: TScrollBox
              Left = 0
              Top = 0
              Width = 832
              Height = 552
              HorzScrollBar.Smooth = True
              HorzScrollBar.Tracking = True
              VertScrollBar.Smooth = True
              VertScrollBar.Tracking = True
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
            end
            object pLegendaFrames: TPanel
              Left = 0
              Top = 552
              Width = 832
              Height = 35
              Align = alBottom
              BevelOuter = bvNone
              Caption = 'pLegendaFrames'
              ShowCaption = False
              TabOrder = 1
              inline frameCadContaImagens1: TframeCadContaImagens
                Left = 0
                Top = 0
                Width = 832
                Height = 35
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 832
                ExplicitHeight = 35
                inherited iPagamentoManual: TImage
                  Left = 507
                  Height = 35
                  ExplicitLeft = 507
                  ExplicitHeight = 35
                end
                inherited iFolhaPagamento: TImage
                  Left = 394
                  Height = 35
                  ExplicitLeft = 394
                  ExplicitHeight = 35
                end
                inherited iDebitoAuto: TImage
                  Left = 715
                  Height = 35
                  ExplicitLeft = 715
                  ExplicitHeight = 35
                end
                inherited iDebidaCartao: TImage
                  Left = 295
                  Height = 35
                  Proportional = True
                  ExplicitLeft = 295
                  ExplicitHeight = 35
                end
                inherited iCalender: TImage
                  Left = 624
                  Height = 35
                  ExplicitLeft = 624
                  ExplicitHeight = 35
                end
                inherited lDebitoAuto: TLabel
                  Left = 741
                  Width = 88
                  Height = 35
                  ExplicitLeft = 741
                  ExplicitWidth = 88
                  ExplicitHeight = 13
                end
                inherited lCalender: TLabel
                  Left = 650
                  Width = 59
                  Height = 35
                  ExplicitLeft = 650
                  ExplicitWidth = 59
                  ExplicitHeight = 13
                end
                inherited lPagamentoManual: TLabel
                  Left = 530
                  Width = 91
                  Height = 35
                  ExplicitLeft = 530
                  ExplicitWidth = 91
                  ExplicitHeight = 13
                end
                inherited lFolhaPagamento: TLabel
                  Left = 420
                  Width = 81
                  Height = 35
                  ExplicitLeft = 420
                  ExplicitWidth = 81
                  ExplicitHeight = 13
                end
                inherited liDebidaCartao: TLabel
                  Left = 321
                  Width = 67
                  Height = 35
                  ExplicitLeft = 321
                  ExplicitWidth = 67
                  ExplicitHeight = 13
                end
              end
            end
          end
        end
        inherited pCabecalhoConsulta: TPanel
          Width = 832
          ExplicitWidth = 832
          inherited sbVisualizarConsulta: TSpeedButton
            ExplicitLeft = 1
          end
        end
        inherited pConsulta: TPanel
          Top = 622
          Width = 832
          ExplicitTop = 622
          ExplicitWidth = 832
          inherited sbExcluirCadastro: TSpeedButton
            Left = 679
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 367
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 523
          end
        end
      end
      inherited cCadastro: TCard
        Width = 826
        Height = 677
        ExplicitWidth = 824
        ExplicitHeight = 673
        inherited pRodapeBotoesCad: TPanel
          Top = 609
          Width = 826
          ExplicitTop = 605
          ExplicitWidth = 824
          inherited sbCancelarCadastro: TSpeedButton
            Left = 661
            ExplicitLeft = 661
          end
          inherited sbSalvarCadastro: TSpeedButton
            Left = 481
            ExplicitLeft = 481
          end
        end
        inherited pCadastro: TPanel
          Width = 826
          Height = 609
          ExplicitWidth = 824
          ExplicitHeight = 605
          object tIDConta: TDBText
            Left = 195
            Top = 5
            Width = 67
            Height = 21
            AutoSize = True
            DataField = 'IdConta'
          end
          object lidConta: TLabel
            Left = 94
            Top = 5
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lDescricao: TLabel
            Left = 116
            Top = 40
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o'
          end
          object lValor: TLabel
            Left = 151
            Top = 75
            Width = 38
            Height = 21
            Alignment = taRightJustify
            Caption = 'Valor'
          end
          object lId_Credor: TLabel
            Left = 140
            Top = 500
            Width = 49
            Height = 21
            Alignment = taRightJustify
            Caption = 'Credor'
          end
          object lId_MembroFamilia: TLabel
            Left = 71
            Top = 535
            Width = 118
            Height = 21
            Alignment = taRightJustify
            Caption = 'Membro Fam'#237'lia'
          end
          object lQtdParcela: TLabel
            Left = 90
            Top = 110
            Width = 99
            Height = 21
            Alignment = taRightJustify
            Caption = 'Qtd. Parcelas'
          end
          object rgContaAnual: TDBRadioGroupSimNao
            Left = 195
            Top = 137
            Width = 300
            Height = 65
            Caption = 'Conta Anual'
            Columns = 2
            DataField = 'ContaAnual'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 3
            Values.Strings = (
              'true'
              'false')
          end
          object eDescricao: TDBEdit
            Left = 195
            Top = 32
            Width = 250
            Height = 29
            DataField = 'Descricao'
            TabOrder = 0
          end
          object eValor: TDBEdit
            Left = 195
            Top = 67
            Width = 250
            Height = 29
            DataField = 'Valor'
            TabOrder = 1
          end
          object rgPertenceAFolha: TDBRadioGroupSimNao
            Left = 195
            Top = 208
            Width = 300
            Height = 65
            Caption = 'Pertence a Folha'
            Columns = 2
            DataField = 'PertenceAFolha'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 4
            Values.Strings = (
              'true'
              'false')
          end
          object rgDebitaCartao: TDBRadioGroupSimNao
            Left = 195
            Top = 421
            Width = 300
            Height = 65
            Caption = 'Debita Cart'#227'o'
            Columns = 2
            DataField = 'DebitaCartao'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 7
            Values.Strings = (
              'true'
              'false')
          end
          object lcbId_Credor: TDBLookupComboBox
            Left = 195
            Top = 492
            Width = 270
            Height = 29
            DataField = 'Id_Credor'
            KeyField = 'IdCredor'
            ListField = 'Nome'
            NullValueKey = 8
            TabOrder = 8
          end
          object lcbId_MembroFamilia: TDBLookupComboBox
            Left = 195
            Top = 527
            Width = 270
            Height = 29
            DataField = 'Id_MembroFamilia'
            KeyField = 'IdMembroFamilia'
            ListField = 'Nome'
            NullValueKey = 8
            TabOrder = 9
          end
          object eQtdParcela: TDBEdit
            Left = 195
            Top = 102
            Width = 250
            Height = 29
            DataField = 'QtdParcela'
            TabOrder = 2
          end
          object dbdebitoauto: TDBRadioGroupSimNao
            Left = 195
            Top = 279
            Width = 300
            Height = 65
            Caption = 'D'#233'bito Autom'#225'tico'
            Columns = 2
            DataField = 'DebitoAuto'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 5
            Values.Strings = (
              'true'
              'false')
          end
          object rgPagamentoManual: TDBRadioGroupSimNao
            Left = 195
            Top = 350
            Width = 300
            Height = 65
            Caption = 'Pagamento Manual'
            Columns = 2
            DataField = 'PagamentoManual'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 6
            Values.Strings = (
              'true'
              'false')
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      Width = 832
      ExplicitWidth = 830
      inherited lTitulo: TLabel
        Width = 780
      end
      inherited sbSair: TSpeedButton
        Left = 789
        ExplicitLeft = 789
      end
    end
  end
end
