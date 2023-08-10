inherited formCadCartao: TformCadCartao
  PixelsPerInch = 96
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      ActiveCard = cCadastro
      inherited cCadastro: TCard
        inherited pCadastro: TPanel
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
  end
end
