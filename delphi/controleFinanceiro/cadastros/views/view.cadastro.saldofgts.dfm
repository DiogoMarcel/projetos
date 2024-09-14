inherited formCadSaldoFGTS: TformCadSaldoFGTS
  ExplicitWidth = 840
  ExplicitHeight = 608
  TextHeight = 13
  inherited pGeral: TPanel
    ExplicitWidth = 824
    ExplicitHeight = 569
    inherited cpCadastros: TCardPanel
      Width = 826
      Height = 528
      ExplicitWidth = 824
      ExplicitHeight = 524
      inherited cConsulta: TCard
        Width = 826
        Height = 528
        ExplicitWidth = 824
        ExplicitHeight = 524
        inherited cpConsultas: TCardPanel
          Width = 826
          Height = 425
          ExplicitWidth = 824
          ExplicitHeight = 421
          inherited cConsultaLista: TCard
            Width = 826
            Height = 425
          end
          inherited cConsultaGrade: TCard
            Width = 826
            Height = 425
            ExplicitWidth = 824
            ExplicitHeight = 421
          end
        end
        inherited pCabecalhoConsulta: TPanel
          Width = 826
          ExplicitWidth = 824
        end
        inherited pConsulta: TPanel
          Top = 460
          Width = 826
          ExplicitTop = 456
          ExplicitWidth = 824
          inherited sbExcluirCadastro: TSpeedButton
            Left = 673
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 361
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 517
          end
        end
      end
      inherited cCadastro: TCard
        Width = 820
        Height = 515
        ExplicitWidth = 824
        ExplicitHeight = 523
        inherited pRodapeBotoesCad: TPanel
          Top = 447
          Width = 820
          ExplicitTop = 455
          ExplicitWidth = 824
        end
        inherited pCadastro: TPanel
          Width = 820
          Height = 447
          ExplicitWidth = 824
          ExplicitHeight = 455
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
      Width = 826
      ExplicitWidth = 824
      inherited lTitulo: TLabel
        Width = 774
        Height = 39
      end
      inherited sbSair: TSpeedButton
        Left = 783
      end
    end
  end
end
