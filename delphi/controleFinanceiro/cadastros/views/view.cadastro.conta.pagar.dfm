inherited formCadContaPagar: TformCadContaPagar
  Caption = 'formCadContaPagar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
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
  end
end
