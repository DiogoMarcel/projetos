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
          end
          inherited cConsultaGrade: TCard
            Width = 832
            ExplicitWidth = 830
            inherited pLegendaFrames: TPanel
              inherited frameCadContaImagens1: TframeCadContaImagens
                inherited lDebitoAuto: TLabel
                  Height = 35
                end
                inherited lCalender: TLabel
                  Height = 35
                end
                inherited lPagamentoManual: TLabel
                  Height = 35
                end
                inherited lFolhaPagamento: TLabel
                  Height = 35
                end
                inherited liDebidaCartao: TLabel
                  Height = 35
                end
              end
            end
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
      end
    end
  end
end
