inherited formCadContaPagar: TformCadContaPagar
  Caption = 'formCadContaPagar'
  ClientHeight = 735
  ClientWidth = 832
  TextHeight = 13
  inherited pGeral: TPanel
    Width = 832
    Height = 735
    ExplicitWidth = 830
    inherited cpCadastros: TCardPanel
      ExplicitWidth = 830
      inherited cConsulta: TCard
        ExplicitWidth = 830
        inherited cpConsultas: TCardPanel
          Width = 832
          ExplicitWidth = 830
          inherited cConsultaLista: TCard
            Width = 832
            ExplicitWidth = 830
            ExplicitHeight = 583
            inherited dbgConsulta: TDBGrid
              Width = 832
            end
            inherited sbPesquisaConsulta: TSearchBox
              Width = 792
              ExplicitWidth = 790
            end
          end
          inherited cConsultaGrade: TCard
            Width = 832
            ExplicitWidth = 830
          end
        end
        inherited pCabecalhoConsulta: TPanel
          Width = 832
          ExplicitWidth = 830
        end
        inherited pConsulta: TPanel
          Width = 832
          ExplicitWidth = 830
          inherited sbExcluirCadastro: TSpeedButton
            Left = 679
            ExplicitLeft = 679
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 367
            ExplicitLeft = 367
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 523
            ExplicitLeft = 523
          end
        end
      end
      inherited cCadastro: TCard
        inherited pRodapeBotoesCad: TPanel
          inherited sbCancelarCadastro: TSpeedButton
            Left = 661
          end
          inherited sbSalvarCadastro: TSpeedButton
            Left = 481
          end
        end
        inherited pCadastro: TPanel
          inherited rgContaAnual: TDBRadioGroupSimNao
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited eDescricao: TDBEdit
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited eValor: TDBEdit
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited rgPertenceAFolha: TDBRadioGroupSimNao
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited rgDebitaCartao: TDBRadioGroupSimNao
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited lcbId_Credor: TDBLookupComboBox
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited lcbId_MembroFamilia: TDBLookupComboBox
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited eQtdParcela: TDBEdit
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited dbdebitoauto: TDBRadioGroupSimNao
            DataSource = dataCadastroContaPagar.dsCadastro
          end
          inherited rgPagamentoManual: TDBRadioGroupSimNao
            DataSource = dataCadastroContaPagar.dsCadastro
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      ExplicitWidth = 830
      inherited lTitulo: TLabel
        Width = 780
        Height = 39
      end
      inherited sbSair: TSpeedButton
        Left = 789
        ExplicitLeft = 789
      end
    end
  end
end
