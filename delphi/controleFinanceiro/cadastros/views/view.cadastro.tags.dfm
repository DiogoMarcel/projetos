inherited formCadTags: TformCadTags
  PixelsPerInch = 96
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      ActiveCard = cCadastro
      inherited cCadastro: TCard
        inherited pCadastro: TPanel
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
  end
end
