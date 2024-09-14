inherited formCadCredor: TformCadCredor
  ExplicitWidth = 840
  ExplicitHeight = 608
  TextHeight = 13
  inherited pGeral: TPanel
    ExplicitWidth = 824
    ExplicitHeight = 569
    inherited cpCadastros: TCardPanel
      Width = 826
      Height = 528
      ActiveCard = cCadastro
      ExplicitWidth = 824
      ExplicitHeight = 524
      inherited cConsulta: TCard
        Width = 826
        Height = 528
      end
      inherited cCadastro: TCard
        Width = 820
        Height = 515
        ExplicitWidth = 818
        ExplicitHeight = 511
        inherited pRodapeBotoesCad: TPanel
          Top = 447
          Width = 820
          ExplicitTop = 443
          ExplicitWidth = 818
          inherited sbCancelarCadastro: TSpeedButton
            Left = 655
          end
          inherited sbSalvarCadastro: TSpeedButton
            Left = 475
          end
        end
        inherited pCadastro: TPanel
          Width = 820
          Height = 447
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
