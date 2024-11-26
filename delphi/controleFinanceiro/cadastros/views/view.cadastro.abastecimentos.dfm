inherited formCadAbastecimentos: TformCadAbastecimentos
  Caption = 'Abastecimentos'
  ClientWidth = 826
  TextHeight = 13
  inherited pGeral: TPanel
    Width = 826
    inherited cpCadastros: TCardPanel
      Height = 524
      ActiveCard = cCadastro
      inherited cConsulta: TCard
        Height = 524
        inherited cpConsultas: TCardPanel
          Height = 421
          inherited cConsultaLista: TCard
            Height = 421
            inherited dbgConsulta: TDBGrid
              Height = 388
            end
          end
          inherited cConsultaGrade: TCard
            Height = 421
          end
        end
        inherited pConsulta: TPanel
          Top = 456
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
        Height = 511
        inherited pRodapeBotoesCad: TPanel
          Top = 443
        end
        inherited pCadastro: TPanel
          Height = 443
          ExplicitLeft = 216
          ExplicitTop = 56
          ExplicitWidth = 820
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
          object lId_Veiculo: TLabel
            Left = 136
            Top = 238
            Width = 53
            Height = 21
            Alignment = taRightJustify
            Caption = 'Ve'#237'culo'
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
            Date = 45621.000000000000000000
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
          object lcbId_Veiculo: TDBLookupComboBox
            Left = 195
            Top = 234
            Width = 270
            Height = 29
            DataField = 'Id_Veiculo'
            DataSource = dataCadastroAbastecimentos.dsCadastro
            KeyField = 'IdVeiculo'
            ListField = 'Modelo'
            NullValueKey = 8
            TabOrder = 5
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      inherited lTitulo: TLabel
        Width = 774
        Height = 39
      end
      inherited sbSair: TSpeedButton
        ExplicitLeft = 781
      end
    end
  end
end
