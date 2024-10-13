inherited formCadTags: TformCadTags
  ClientHeight = 573
  ClientWidth = 826
  TextHeight = 13
  inherited pGeral: TPanel
    Width = 826
    Height = 573
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
            inherited dbgConsulta: TDBGrid
              Width = 828
              Height = 396
            end
            inherited sbPesquisaConsulta: TSearchBox
              Width = 788
              ExplicitWidth = 788
            end
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
            ExplicitLeft = 673
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 361
            ExplicitLeft = 361
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 517
            ExplicitLeft = 517
          end
        end
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
            ExplicitLeft = 655
          end
          inherited sbSalvarCadastro: TSpeedButton
            Left = 475
            ExplicitLeft = 475
          end
        end
        inherited pCadastro: TPanel
          Width = 820
          Height = 447
          ExplicitWidth = 818
          ExplicitHeight = 443
          object tIdTags: TDBText
            Left = 195
            Top = 32
            Width = 57
            Height = 21
            AutoSize = True
            DataField = 'IdTags'
            DataSource = dataCadastroTags.dsCadastro
          end
          object lIdTags: TLabel
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
          object eDescricao: TDBEdit
            Left = 195
            Top = 59
            Width = 250
            Height = 29
            DataField = 'Descricao'
            DataSource = dataCadastroTags.dsCadastro
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
        ExplicitLeft = 783
      end
    end
  end
end
