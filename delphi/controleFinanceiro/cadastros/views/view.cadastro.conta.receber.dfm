inherited formCadContaReceber: TformCadContaReceber
  Caption = 'formCadContaReceber'
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      inherited cConsulta: TCard
        inherited cpConsultas: TCardPanel
          inherited cConsultaLista: TCard
            Width = 832
          end
          inherited cConsultaGrade: TCard
            Width = 832
          end
        end
        inherited pConsulta: TPanel
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
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited eDescricao: TDBEdit
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited eValor: TDBEdit
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited rgPertenceAFolha: TDBRadioGroupSimNao
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited rgDebitaCartao: TDBRadioGroupSimNao
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited lcbId_Credor: TDBLookupComboBox
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited lcbId_MembroFamilia: TDBLookupComboBox
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited eQtdParcela: TDBEdit
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited dbdebitoauto: TDBRadioGroupSimNao
            DataSource = dataCadastroContaReceber.dsCadastro
          end
          inherited rgPagamentoManual: TDBRadioGroupSimNao
            DataSource = dataCadastroContaReceber.dsCadastro
          end
        end
      end
    end
  end
  inherited alAcoes: TActionList
    Left = 608
  end
end
