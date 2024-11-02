inherited formCadAbastecimentos: TformCadAbastecimentos
  Caption = 'formCadAbastecimentos'
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      inherited cConsulta: TCard
        inherited pConsulta: TPanel
          inherited sbExcluirCadastro: TSpeedButton
            ExplicitLeft = 671
          end
          inherited sbIncluirCadastro: TSpeedButton
            ExplicitLeft = 359
          end
          inherited sbEditarCadastro: TSpeedButton
            ExplicitLeft = 515
          end
        end
      end
      inherited cCadastro: TCard
        inherited pCadastro: TPanel
          object tidabastecimento: TDBText
            Left = 195
            Top = 29
            Width = 128
            Height = 21
            AutoSize = True
            DataField = 'idabastecimento'
            DataSource = dataCadastroAbastecimentos.dsCadastro
          end
          object lIdSaldoPortador: TLabel
            Left = 94
            Top = 29
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lValor: TLabel
            Left = 151
            Top = 132
            Width = 38
            Height = 21
            Alignment = taRightJustify
            Caption = 'Valor'
          end
          object Label1: TLabel
            Left = 102
            Top = 62
            Width = 87
            Height = 21
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o'
          end
          object Label3: TLabel
            Left = 37
            Top = 99
            Width = 152
            Height = 21
            Alignment = taRightJustify
            Caption = 'Data Abastecimento'
          end
          object Label4: TLabel
            Left = 121
            Top = 167
            Width = 68
            Height = 21
            Alignment = taRightJustify
            Caption = 'KM Carro'
          end
          object Label5: TLabel
            Left = 58
            Top = 202
            Width = 131
            Height = 21
            Alignment = taRightJustify
            Caption = 'Quantidade Litros'
          end
          object etotalabastecimento: TDBEdit
            Left = 195
            Top = 129
            Width = 250
            Height = 29
            DataField = 'totalabastecimento'
            DataSource = dataCadastroAbastecimentos.dsCadastro
            TabOrder = 2
          end
          object eObservacao: TDBEdit
            Left = 195
            Top = 59
            Width = 414
            Height = 29
            DataField = 'observacao'
            DataSource = dataCadastroAbastecimentos.dsCadastro
            TabOrder = 0
          end
          object dtpDataAbastecimento: TDateTimePicker
            Left = 195
            Top = 94
            Width = 186
            Height = 29
            Time = 0.440244837962382000
            TabOrder = 1
          end
          object ekmcarro: TDBEdit
            Left = 195
            Top = 164
            Width = 250
            Height = 29
            DataField = 'kmcarro'
            DataSource = dataCadastroAbastecimentos.dsCadastro
            TabOrder = 3
          end
          object equantidadelitros: TDBEdit
            Left = 195
            Top = 199
            Width = 250
            Height = 29
            DataField = 'quantidadelitros'
            DataSource = dataCadastroAbastecimentos.dsCadastro
            TabOrder = 4
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      inherited sbSair: TSpeedButton
        ExplicitLeft = 781
      end
    end
  end
end
