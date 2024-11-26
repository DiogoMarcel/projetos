inherited formCadVeiculos: TformCadVeiculos
  Caption = 'Ve'#237'culos'
  ExplicitWidth = 838
  ExplicitHeight = 604
  TextHeight = 13
  inherited pGeral: TPanel
    ExplicitWidth = 822
    ExplicitHeight = 565
    inherited cpCadastros: TCardPanel
      Width = 824
      Height = 524
      ActiveCard = cCadastro
      ExplicitWidth = 822
      ExplicitHeight = 520
      inherited cConsulta: TCard
        Width = 824
        Height = 524
        ExplicitWidth = 822
        ExplicitHeight = 520
        inherited cpConsultas: TCardPanel
          Width = 824
          Height = 421
          ExplicitWidth = 822
          ExplicitHeight = 417
          inherited cConsultaLista: TCard
            Width = 824
            Height = 421
            ExplicitWidth = 822
            ExplicitHeight = 417
            inherited dbgConsulta: TDBGrid
              Width = 824
              Height = 388
            end
            inherited sbPesquisaConsulta: TSearchBox
              Width = 784
              ExplicitWidth = 782
            end
          end
          inherited cConsultaGrade: TCard
            Width = 824
            Height = 421
            ExplicitWidth = 824
            ExplicitHeight = 421
          end
        end
        inherited pCabecalhoConsulta: TPanel
          Width = 824
          ExplicitWidth = 822
        end
        inherited pConsulta: TPanel
          Top = 456
          Width = 824
          ExplicitTop = 452
          ExplicitWidth = 822
          inherited sbExcluirCadastro: TSpeedButton
            Left = 671
            ExplicitLeft = 671
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 359
            ExplicitLeft = 359
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 515
            ExplicitLeft = 515
          end
        end
      end
      inherited cCadastro: TCard
        Width = 818
        Height = 511
        inherited pRodapeBotoesCad: TPanel
          Top = 443
          Width = 818
          inherited sbCancelarCadastro: TSpeedButton
            Left = 653
            ExplicitLeft = 653
          end
          inherited sbSalvarCadastro: TSpeedButton
            Left = 473
            ExplicitLeft = 473
          end
        end
        inherited pCadastro: TPanel
          Width = 818
          Height = 443
          ExplicitLeft = -46
          ExplicitTop = -216
          object tidVeiculo: TDBText
            Left = 195
            Top = 29
            Width = 72
            Height = 21
            AutoSize = True
            DataField = 'idVeiculo'
            DataSource = dataCadastroVeiculos.dsCadastro
          end
          object lIdSaldoPortador: TLabel
            Left = 94
            Top = 29
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object Label1: TLabel
            Left = 136
            Top = 62
            Width = 53
            Height = 21
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object Label3: TLabel
            Left = 102
            Top = 204
            Width = 87
            Height = 21
            Alignment = taRightJustify
            Caption = 'Data Venda'
          end
          object lValor: TLabel
            Left = 89
            Top = 237
            Width = 100
            Height = 21
            Alignment = taRightJustify
            Caption = 'Valor Compra'
          end
          object Label2: TLabel
            Left = 144
            Top = 97
            Width = 45
            Height = 21
            Alignment = taRightJustify
            Caption = 'Marca'
          end
          object Label4: TLabel
            Left = 164
            Top = 132
            Width = 25
            Height = 21
            Alignment = taRightJustify
            Caption = 'Cor'
          end
          object Label5: TLabel
            Left = 91
            Top = 169
            Width = 98
            Height = 21
            Alignment = taRightJustify
            Caption = 'Data Compra'
          end
          object Label6: TLabel
            Left = 100
            Top = 272
            Width = 89
            Height = 21
            Alignment = taRightJustify
            Caption = 'Valor Venda'
          end
          object eModelo: TDBEdit
            Left = 195
            Top = 59
            Width = 414
            Height = 29
            DataField = 'Modelo'
            DataSource = dataCadastroVeiculos.dsCadastro
            TabOrder = 0
          end
          object dtpDataVenda: TDateTimePicker
            Left = 195
            Top = 199
            Width = 186
            Height = 29
            Date = 45621.000000000000000000
            Time = 0.440244837962382000
            TabOrder = 4
          end
          object eValorCompra: TDBEdit
            Left = 195
            Top = 234
            Width = 250
            Height = 29
            DataField = 'ValorCompra'
            DataSource = dataCadastroVeiculos.dsCadastro
            TabOrder = 5
          end
          object eMarca: TDBEdit
            Left = 195
            Top = 94
            Width = 414
            Height = 29
            DataField = 'Marca'
            DataSource = dataCadastroVeiculos.dsCadastro
            TabOrder = 1
          end
          object eCor: TDBEdit
            Left = 195
            Top = 129
            Width = 414
            Height = 29
            DataField = 'Cor'
            DataSource = dataCadastroVeiculos.dsCadastro
            TabOrder = 2
          end
          object dtpDataCompra: TDateTimePicker
            Left = 195
            Top = 164
            Width = 186
            Height = 29
            Date = 45621.000000000000000000
            Time = 0.440244837962382000
            TabOrder = 3
          end
          object eValorVenda: TDBEdit
            Left = 195
            Top = 269
            Width = 250
            Height = 29
            DataField = 'ValorVenda'
            DataSource = dataCadastroVeiculos.dsCadastro
            TabOrder = 6
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      Width = 824
      ExplicitWidth = 822
      inherited lTitulo: TLabel
        Width = 772
        Height = 39
      end
      inherited sbSair: TSpeedButton
        Left = 781
        ExplicitLeft = 781
      end
    end
  end
end
