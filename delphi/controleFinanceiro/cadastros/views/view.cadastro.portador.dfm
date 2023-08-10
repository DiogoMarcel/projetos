inherited formCadPortador: TformCadPortador
  Caption = 'formCadPortador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      inherited cCadastro: TCard
        inherited pCadastro: TPanel
          ExplicitTop = -3
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
      inherited lTitulo: TLabel
        Width = 780
        Height = 39
      end
    end
  end
end
