inherited fCadRetiradas: TfCadRetiradas
  Caption = 'Cadastro de Retiradas'
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
      DataSource = datas.sourceRetiradas
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
          Width = 480
          Visible = True
        end>
    end
    inherited DBNavigator1: TDBNavigator
      DataSource = datas.sourceRetiradas
      Hints.Strings = ()
      ExplicitLeft = 0
      ExplicitTop = 327
    end
  end
end
