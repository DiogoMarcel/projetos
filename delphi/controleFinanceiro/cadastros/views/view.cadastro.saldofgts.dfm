inherited formCadSaldoFGTS: TformCadSaldoFGTS
  ExplicitWidth = 838
  ExplicitHeight = 604
  TextHeight = 13
  inherited pGeral: TPanel
    ExplicitWidth = 822
    ExplicitHeight = 565
    inherited cpCadastros: TCardPanel
      Width = 824
      Height = 524
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
            ExplicitLeft = 673
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 359
            ExplicitLeft = 361
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 515
            ExplicitLeft = 517
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
          object tIdSaldoFGTS: TDBText
            Left = 195
            Top = 32
            Width = 100
            Height = 21
            AutoSize = True
            DataField = 'IdSaldoFGTS'
            DataSource = dataCadastroSaldoFGTS.dsCadastro
          end
          object lIdSaldoFGTS: TLabel
            Left = 94
            Top = 32
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lNroPIS: TLabel
            Left = 129
            Top = 67
            Width = 60
            Height = 21
            Alignment = taRightJustify
            Caption = 'Nro. PIS'
          end
          object lSaldo: TLabel
            Left = 149
            Top = 102
            Width = 40
            Height = 21
            Alignment = taRightJustify
            Caption = 'Saldo'
          end
          object lSenha: TLabel
            Left = 144
            Top = 137
            Width = 45
            Height = 21
            Alignment = taRightJustify
            Caption = 'Senha'
          end
          object lId_MembroFamilia: TLabel
            Left = 71
            Top = 172
            Width = 118
            Height = 21
            Alignment = taRightJustify
            Caption = 'Membro Fam'#237'lia'
          end
          object eNroPIS: TDBEdit
            Left = 195
            Top = 59
            Width = 250
            Height = 29
            DataField = 'NroPIS'
            DataSource = dataCadastroSaldoFGTS.dsCadastro
            TabOrder = 0
          end
          object eSaldo: TDBEdit
            Left = 195
            Top = 94
            Width = 166
            Height = 29
            DataField = 'Saldo'
            DataSource = dataCadastroSaldoFGTS.dsCadastro
            TabOrder = 1
          end
          object eSenha: TDBEdit
            Left = 195
            Top = 129
            Width = 166
            Height = 29
            DataField = 'Senha'
            DataSource = dataCadastroSaldoFGTS.dsCadastro
            PasswordChar = '*'
            TabOrder = 2
          end
          object lcbId_MembroFamilia: TDBLookupComboBox
            Left = 195
            Top = 164
            Width = 270
            Height = 29
            DataField = 'Id_MembroFamilia'
            DataSource = dataCadastroSaldoFGTS.dsCadastro
            KeyField = 'IdMembroFamilia'
            ListField = 'Nome'
            NullValueKey = 8
            TabOrder = 3
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
        ExplicitLeft = 783
      end
    end
  end
end
