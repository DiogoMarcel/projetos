inherited fCadFichas: TfCadFichas
  Caption = 'Cadastro de fichas'
  Font.Height = -20
  PixelsPerInch = 96
  TextHeight = 24
  inherited Panel1: TPanel
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 687
    ExplicitHeight = 356
    inherited DBGrid1: TDBGrid
      Top = 0
      Height = 327
      Align = alClient
      DataSource = datas.sourceFichas
      TitleFont.Height = -20
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 308
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Width = 198
          Visible = True
        end>
    end
    inherited DBNavigator1: TDBNavigator
      DataSource = datas.sourceFichas
      Hints.Strings = ()
      ExplicitLeft = -8
      ExplicitTop = 327
    end
  end
end
