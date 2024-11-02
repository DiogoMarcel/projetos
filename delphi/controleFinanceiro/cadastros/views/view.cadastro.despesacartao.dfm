inherited formCadDespesaCartao: TformCadDespesaCartao
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      inherited cConsulta: TCard
        ExplicitWidth = 826
        ExplicitHeight = 528
      end
      inherited cCadastro: TCard
        ExplicitWidth = 818
        ExplicitHeight = 511
        inherited pRodapeBotoesCad: TPanel
          ExplicitTop = 443
          ExplicitWidth = 818
          inherited sbCancelarCadastro: TSpeedButton
            ExplicitLeft = 655
          end
          inherited sbSalvarCadastro: TSpeedButton
            ExplicitLeft = 475
          end
        end
        inherited pCadastro: TPanel
          ExplicitWidth = 818
          ExplicitHeight = 443
          object tIdDespesaCartao: TDBText
            Left = 195
            Top = 32
            Width = 134
            Height = 21
            AutoSize = True
            DataField = 'IdDespesaCartao'
            DataSource = dataCadastroDespesaCartao.dsCadastro
          end
          object lIdDespesaCartao: TLabel
            Left = 94
            Top = 32
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lDescricao: TLabel
            Left = 116
            Top = 67
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o'
          end
          object lValor: TLabel
            Left = 151
            Top = 102
            Width = 38
            Height = 21
            Alignment = taRightJustify
            Caption = 'Valor'
          end
          object lDataDespesa: TLabel
            Left = 84
            Top = 137
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Caption = 'Data Despesa'
          end
          object lId_Cartao: TLabel
            Left = 140
            Top = 172
            Width = 49
            Height = 21
            Alignment = taRightJustify
            Caption = 'Cart'#227'o'
          end
          object eDescricao: TDBEdit
            Left = 195
            Top = 59
            Width = 250
            Height = 29
            DataField = 'Descricao'
            DataSource = dataCadastroDespesaCartao.dsCadastro
            TabOrder = 0
          end
          object eValor: TDBEdit
            Left = 195
            Top = 94
            Width = 250
            Height = 29
            DataField = 'Valor'
            DataSource = dataCadastroDespesaCartao.dsCadastro
            TabOrder = 1
          end
          object eDataDespesa: TDBEdit
            Left = 195
            Top = 129
            Width = 250
            Height = 29
            DataField = 'DataDespesa'
            DataSource = dataCadastroDespesaCartao.dsCadastro
            TabOrder = 2
          end
          object lcbId_Cartao: TDBLookupComboBox
            Left = 195
            Top = 164
            Width = 250
            Height = 29
            DataField = 'Id_Cartao'
            DataSource = dataCadastroDespesaCartao.dsCadastro
            KeyField = 'IdCartao'
            ListField = 'Nome'
            NullValueKey = 8
            TabOrder = 3
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      inherited sbSair: TSpeedButton
        ExplicitLeft = 783
      end
    end
  end
end
