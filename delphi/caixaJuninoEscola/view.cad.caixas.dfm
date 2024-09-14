inherited fCadCaixas: TfCadCaixas
  Caption = 'Cadastro de Caixas'
  PixelsPerInch = 96
  TextHeight = 24
  inherited Panel1: TPanel
    inherited DBGrid1: TDBGrid
      Top = 0
      Height = 327
      Align = alClient
      DataSource = datas.sourceCaixas
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
          Width = 493
          Visible = True
        end>
    end
    inherited DBNavigator1: TDBNavigator
      DataSource = datas.sourceCaixas
      Hints.Strings = ()
    end
  end
end
