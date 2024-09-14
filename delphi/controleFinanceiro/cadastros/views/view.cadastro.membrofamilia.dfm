inherited formCadMembroFamilia: TformCadMembroFamilia
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      ActiveCard = cCadastro
      inherited cCadastro: TCard
        ExplicitWidth = 824
        ExplicitHeight = 523
        inherited pRodapeBotoesCad: TPanel
          ExplicitTop = 455
          ExplicitWidth = 824
        end
        inherited pCadastro: TPanel
          ExplicitWidth = 824
          ExplicitHeight = 455
          object tIdMembroFamilia: TDBText
            Left = 195
            Top = 32
            Width = 134
            Height = 21
            AutoSize = True
            DataField = 'IdMembroFamilia'
            DataSource = dataCadastroMembroFamilia.dsCadastro
          end
          object lIdMembroFamilia: TLabel
            Left = 94
            Top = 32
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lNome: TLabel
            Left = 146
            Top = 67
            Width = 43
            Height = 21
            Alignment = taRightJustify
            Caption = 'Nome'
          end
          object eNome: TDBEdit
            Left = 195
            Top = 59
            Width = 250
            Height = 29
            DataField = 'Nome'
            DataSource = dataCadastroMembroFamilia.dsCadastro
            TabOrder = 0
          end
        end
      end
    end
  end
end
