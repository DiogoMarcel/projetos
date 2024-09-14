object dataMenu: TdataMenu
  OnCreate = DataModuleCreate
  Height = 271
  Width = 223
  object qMenu: TFDQuery
    Connection = dmConexaoDB.FDConexao
    Left = 48
    Top = 24
    object qMenuvalor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ReadOnly = True
      currency = True
    end
    object qMenutitulo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'titulo'
      Origin = 'titulo'
      ReadOnly = True
      Size = 40
    end
  end
  object dsMenu: TDataSource
    DataSet = qMenu
    Left = 128
    Top = 24
  end
  object qSaldoFolha: TFDQuery
    Connection = dmConexaoDB.FDConexao
    SQL.Strings = (
      '')
    Left = 48
    Top = 88
    object qSaldoFolhavalorfolhamembro: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valorfolhamembro'
      Origin = 'valorfolhamembro'
      ReadOnly = True
      currency = True
    end
    object qSaldoFolhanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object dsSaldoFolha: TDataSource
    DataSet = qSaldoFolha
    Left = 128
    Top = 88
  end
  object qContaPagamentos: TFDQuery
    Connection = dmConexaoDB.FDConexao
    Left = 48
    Top = 144
    object qContaPagamentosdescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object qContaPagamentosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
    end
    object qContaPagamentossinal: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'sinal'
      Origin = 'sinal'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qContaPagamentosidcontapagamentos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idcontapagamentos'
      Origin = 'idcontapagamentos'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qContaPagamentosidconta: TIntegerField
      FieldName = 'idconta'
    end
  end
  object dsContaPagamentos: TDataSource
    DataSet = qContaPagamentos
    Left = 128
    Top = 144
  end
end
