inherited formCadCartao: TformCadCartao
  ClientHeight = 577
  ClientWidth = 828
  ExplicitWidth = 842
  ExplicitHeight = 612
  TextHeight = 13
  inherited pGeral: TPanel
    Width = 828
    Height = 577
    ExplicitWidth = 826
    ExplicitHeight = 573
    inherited cpCadastros: TCardPanel
      Width = 828
      Height = 532
      ExplicitWidth = 826
      ExplicitHeight = 528
      inherited cConsulta: TCard
        Width = 828
        Height = 532
        inherited cpConsultas: TCardPanel
          Width = 828
          Height = 429
          inherited cConsultaLista: TCard
            Width = 828
            Height = 429
            inherited dbgConsulta: TDBGrid
              Width = 828
              Height = 396
            end
            inherited sbPesquisaConsulta: TSearchBox
              Width = 788
            end
          end
          inherited cConsultaGrade: TCard
            Width = 828
            Height = 429
          end
        end
        inherited pCabecalhoConsulta: TPanel
          Width = 828
        end
        inherited pConsulta: TPanel
          Top = 464
          Width = 828
        end
      end
      inherited cCadastro: TCard
        Width = 822
        Height = 519
        inherited pRodapeBotoesCad: TPanel
          Top = 451
          Width = 822
          inherited sbCancelarCadastro: TSpeedButton
            Left = 657
          end
          inherited sbSalvarCadastro: TSpeedButton
            Left = 477
          end
        end
        inherited pCadastro: TPanel
          Width = 822
          Height = 451
          object tIdCartao: TDBText
            Left = 195
            Top = 28
            Width = 70
            Height = 21
            AutoSize = True
            DataField = 'IdCartao'
            DataSource = dataCadastroCartao.dsCadastro
          end
          object lidConta: TLabel
            Left = 94
            Top = 28
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lNome: TLabel
            Left = 146
            Top = 63
            Width = 43
            Height = 21
            Alignment = taRightJustify
            Caption = 'Nome'
          end
          object lDiaVencimento: TLabel
            Left = 49
            Top = 98
            Width = 140
            Height = 21
            Alignment = taRightJustify
            Caption = 'Dia do Vencimento'
          end
          object lBandeira: TLabel
            Left = 124
            Top = 133
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Caption = 'Bandeira'
          end
          object lId_MembroFamilia: TLabel
            Left = 71
            Top = 168
            Width = 118
            Height = 21
            Alignment = taRightJustify
            Caption = 'Membro Fam'#237'lia'
          end
          object eNome: TDBEdit
            Left = 195
            Top = 55
            Width = 250
            Height = 29
            DataField = 'Nome'
            DataSource = dataCadastroCartao.dsCadastro
            TabOrder = 0
          end
          object eDiaVencimento: TDBEdit
            Left = 195
            Top = 90
            Width = 46
            Height = 29
            DataField = 'DiaVencimento'
            DataSource = dataCadastroCartao.dsCadastro
            TabOrder = 1
            OnKeyPress = eDiaVencimentoKeyPress
          end
          object eBandeira: TDBEdit
            Left = 195
            Top = 125
            Width = 250
            Height = 29
            DataField = 'Bandeira'
            DataSource = dataCadastroCartao.dsCadastro
            TabOrder = 2
          end
          object lcbId_MembroFamilia: TDBLookupComboBox
            Left = 195
            Top = 160
            Width = 270
            Height = 29
            DataField = 'Id_MembroFamilia'
            DataSource = dataCadastroCartao.dsCadastro
            KeyField = 'IdMembroFamilia'
            ListField = 'Nome'
            NullValueKey = 8
            TabOrder = 3
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      Width = 828
      ExplicitWidth = 826
      inherited lTitulo: TLabel
        Width = 776
      end
      inherited sbSair: TSpeedButton
        Left = 785
      end
    end
  end
end
