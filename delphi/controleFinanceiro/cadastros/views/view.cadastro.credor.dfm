inherited formCadCredor: TformCadCredor
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
    inherited pCabecalhoGeral: TPanel
      inherited sbSair: TSpeedButton
        ExplicitLeft = 783
      end
    end
  end
end
