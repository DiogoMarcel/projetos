inherited formCadCredor: TformCadCredor
  PixelsPerInch = 96
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      ActiveCard = cCadastro
      inherited cCadastro: TCard
        inherited pCadastro: TPanel
          object tIdCredor: TDBText
            Left = 195
            Top = 32
            Width = 70
            Height = 21
            AutoSize = True
            DataField = 'IdCredor'
            DataSource = dataCadastroCredor.dsCadastro
          end
          object lIdCredor: TLabel
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
            DataSource = dataCadastroCredor.dsCadastro
            TabOrder = 0
          end
        end
      end
    end
  end
end
