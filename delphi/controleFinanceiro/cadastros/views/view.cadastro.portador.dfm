inherited formCadPortador: TformCadPortador
  Caption = 'formCadPortador'
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
        ExplicitWidth = 826
        ExplicitHeight = 528
        inherited cpConsultas: TCardPanel
          Width = 828
          Height = 429
          ExplicitWidth = 826
          ExplicitHeight = 425
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
            ExplicitWidth = 828
            ExplicitHeight = 429
          end
        end
        inherited pCabecalhoConsulta: TPanel
          Width = 828
          ExplicitWidth = 826
        end
        inherited pConsulta: TPanel
          Top = 464
          Width = 828
          ExplicitTop = 460
          ExplicitWidth = 826
          inherited sbExcluirCadastro: TSpeedButton
            Left = 675
            ExplicitLeft = 673
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 363
            ExplicitLeft = 361
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 519
            ExplicitLeft = 517
          end
        end
      end
      inherited cCadastro: TCard
        Width = 822
        Height = 519
        ExplicitWidth = 822
        ExplicitHeight = 519
        inherited pRodapeBotoesCad: TPanel
          Top = 451
          Width = 822
          ExplicitTop = 451
          ExplicitWidth = 822
          inherited sbCancelarCadastro: TSpeedButton
            Left = 657
            ExplicitLeft = 657
          end
          inherited sbSalvarCadastro: TSpeedButton
            Left = 477
            ExplicitLeft = 477
          end
        end
        inherited pCadastro: TPanel
          Width = 822
          Height = 451
          ExplicitWidth = 822
          ExplicitHeight = 451
          object tIdPortador: TDBText
            Left = 195
            Top = 32
            Width = 84
            Height = 21
            AutoSize = True
            DataField = 'IdPortador'
            DataSource = dataCadastroPortador.dsCadastro
          end
          object lIdPortador: TLabel
            Left = 94
            Top = 32
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lNomePortador: TLabel
            Left = 78
            Top = 67
            Width = 111
            Height = 21
            Alignment = taRightJustify
            Caption = 'Nome Portador'
          end
          object lAgencia: TLabel
            Left = 130
            Top = 102
            Width = 59
            Height = 21
            Alignment = taRightJustify
            Caption = 'Ag'#234'ncia'
          end
          object lNumeroConta: TLabel
            Left = 83
            Top = 137
            Width = 106
            Height = 21
            Alignment = taRightJustify
            Caption = 'N'#250'mero Conta'
          end
          object lDigitoConta: TLabel
            Left = 97
            Top = 172
            Width = 92
            Height = 21
            Alignment = taRightJustify
            Caption = 'D'#237'gito Conta'
          end
          object lId_MembroFamilia: TLabel
            Left = 71
            Top = 207
            Width = 118
            Height = 21
            Alignment = taRightJustify
            Caption = 'Membro Fam'#237'lia'
          end
          object iLogos: TImage
            Left = 471
            Top = 209
            Width = 54
            Height = 54
            Center = True
            Transparent = True
          end
          object lImgPortador: TLabel
            Left = 60
            Top = 242
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Caption = 'Imagem Portador'
          end
          object eNomePortador: TDBEdit
            Left = 195
            Top = 59
            Width = 250
            Height = 29
            DataField = 'NomePortador'
            DataSource = dataCadastroPortador.dsCadastro
            TabOrder = 0
          end
          object rgTipoConta: TDBRadioGroupSimNao
            Left = 195
            Top = 269
            Width = 382
            Height = 143
            Caption = 'Tipo da Conta'
            Columns = 2
            DataField = 'TipoConta'
            DataSource = dataCadastroPortador.dsCadastro
            Items.Strings = (
              'Dinheiro'
              'Conta Corrente'
              'Conta Poupan'#231'a'
              'Conta Investimento')
            TabOrder = 6
            Values.Strings = (
              'D'
              'C'
              'P'
              'I')
          end
          object eAgencia: TDBEdit
            Left = 195
            Top = 94
            Width = 118
            Height = 29
            DataField = 'Agencia'
            DataSource = dataCadastroPortador.dsCadastro
            TabOrder = 1
          end
          object eNumeroConta: TDBEdit
            Left = 195
            Top = 129
            Width = 118
            Height = 29
            DataField = 'NumeroConta'
            DataSource = dataCadastroPortador.dsCadastro
            TabOrder = 2
          end
          object eDigitoConta: TDBEdit
            Left = 195
            Top = 164
            Width = 46
            Height = 29
            DataField = 'DigitoConta'
            DataSource = dataCadastroPortador.dsCadastro
            TabOrder = 3
          end
          object lcbId_MembroFamilia: TDBLookupComboBox
            Left = 195
            Top = 199
            Width = 270
            Height = 29
            DataField = 'Id_MembroFamilia'
            DataSource = dataCadastroPortador.dsCadastro
            KeyField = 'IdMembroFamilia'
            ListField = 'Nome'
            NullValueKey = 8
            TabOrder = 4
          end
          object cbImgPortador: TComboBox
            Left = 195
            Top = 234
            Width = 270
            Height = 29
            TabOrder = 5
            Text = 'cbImgPortador'
            OnChange = cbImgPortadorChange
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      Width = 828
      ExplicitWidth = 826
      inherited lTitulo: TLabel
        Width = 776
        Height = 39
      end
      inherited sbSair: TSpeedButton
        Left = 785
        ExplicitLeft = 783
      end
    end
  end
end
