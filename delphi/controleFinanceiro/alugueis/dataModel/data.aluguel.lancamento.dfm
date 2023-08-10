object dataAluguel: TdataAluguel
  OldCreateOrder = False
  Height = 263
  Width = 534
  object dsAluguel: TDataSource
    DataSet = cdsAluguel
    Left = 40
    Top = 24
  end
  object qAluguel: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    Left = 127
    Top = 24
  end
  object dspAluguel: TDataSetProvider
    DataSet = qAluguel
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 199
    Top = 24
  end
  object cdsAluguel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAluguel'
    Left = 271
    Top = 24
    object cdsAlugueldataaluguel: TWideStringField
      FieldName = 'dataaluguel'
      Origin = 'dataaluguel'
      ReadOnly = True
      Size = 30
    end
    object cdsAlugueldatapagamento: TDateField
      FieldName = 'datapagamento'
      Origin = 'datapagamento'
    end
    object cdsAluguelpagamentocomp: TDateField
      FieldName = 'pagamentocomp'
      Origin = 'pagamentocomp'
    end
    object cdsAluguelidaluguel: TIntegerField
      FieldName = 'idaluguel'
      Origin = 'idaluguel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsAluguelvaloraluguel: TCurrencyField
      FieldName = 'valoraluguel'
    end
  end
  object dsAluguelTotal: TDataSource
    DataSet = qAluguelTotal
    Left = 40
    Top = 208
  end
  object qAluguelTotal: TFDQuery
    IndexFieldNames = 'idaluguel'
    MasterSource = dsAluguel
    MasterFields = 'idaluguel'
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    Left = 127
    Top = 208
    object qAluguelTotaltotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      currency = True
    end
    object qAluguelTotalidaluguel: TIntegerField
      FieldName = 'idaluguel'
      Origin = 'idaluguel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object dsAluguelTotalComp: TDataSource
    DataSet = qAluguelTotalComp
    Left = 336
    Top = 208
  end
  object qAluguelTotalComp: TFDQuery
    IndexFieldNames = 'idaluguel'
    MasterSource = dsAluguel
    MasterFields = 'idaluguel'
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    Left = 456
    Top = 208
    object qAluguelTotalComptotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      currency = True
    end
    object qAluguelTotalCompidaluguel: TIntegerField
      FieldName = 'idaluguel'
      Origin = 'idaluguel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object dsAluguelCob: TDataSource
    DataSet = qAluguelCob
    Left = 40
    Top = 80
  end
  object qAluguelCob: TFDQuery
    IndexFieldNames = 'id_aluguel'
    MasterSource = dsAluguel
    MasterFields = 'idaluguel'
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    SQL.Strings = (
      'SELECT T.ID_ALUGUEL'
      
        #9',CAST(TRIM(TO_CHAR(A.DATAALUGUEL, '#39'TMMonth'#39')) || '#39' / '#39' || TRIM(' +
        'TO_CHAR(A.DATAALUGUEL, '#39'YYYY'#39')) AS VARCHAR(30)) DATAALUGUEL'
      #9',A.DATAPAGAMENTO'
      #9',A.VALORALUGUEL'
      #9',T.DESCRICAO'
      #9',('
      #9#9'CASE '
      #9#9#9'WHEN T.COMPARTILHADO = '#39'V'#39
      #9#9#9#9'THEN T.VALOR / 2'
      #9#9#9'ELSE T.VALOR'
      #9#9#9'END'
      #9#9') VALORCONTA'
      #9',A.IDALUGUEL'
      #9',T.IDALUGUELCONTA'
      #9',T.VALOR'
      #9',T.COMPARTILHADO'
      #9',T.TIPOCONTA'
      'FROM PUBLIC.aluguel A'
      'LEFT JOIN PUBLIC.aluguelconta T ON A.IDALUGUEL = T.ID_ALUGUEL'
      'ORDER BY T.DESCRICAO')
    Left = 127
    Top = 88
    object qAluguelCobid_aluguel: TIntegerField
      FieldName = 'id_aluguel'
      Origin = 'id_aluguel'
    end
    object qAluguelCobdataaluguel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dataaluguel'
      Origin = 'dataaluguel'
      ReadOnly = True
      Size = 30
    end
    object qAluguelCobdatapagamento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'datapagamento'
      Origin = 'datapagamento'
    end
    object qAluguelCobvaloraluguel: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valoraluguel'
      Origin = 'valoraluguel'
      currency = True
    end
    object qAluguelCobdescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object qAluguelCobvalorconta: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valorconta'
      Origin = 'valorconta'
      ReadOnly = True
      currency = True
    end
    object qAluguelCobidaluguelconta: TIntegerField
      FieldName = 'idaluguelconta'
    end
    object qAluguelCobidaluguel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idaluguel'
      Origin = 'idaluguel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAluguelCobvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
    end
    object qAluguelCobcompartilhado: TWideStringField
      FieldName = 'compartilhado'
      Origin = 'compartilhado'
      FixedChar = True
      Size = 1
    end
    object qAluguelCobtipoconta: TWideStringField
      FieldName = 'tipoconta'
      Origin = 'tipoconta'
      FixedChar = True
      Size = 1
    end
  end
  object dsAluguelDes: TDataSource
    DataSet = qAluguelDes
    Left = 40
    Top = 144
  end
  object qAluguelDes: TFDQuery
    IndexFieldNames = 'id_aluguel'
    MasterSource = dsAluguel
    MasterFields = 'idaluguel'
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    SQL.Strings = (
      'SELECT T.ID_ALUGUEL'
      
        #9',CAST(TRIM(TO_CHAR(A.DATAALUGUEL, '#39'TMMonth'#39')) || '#39' / '#39' || TRIM(' +
        'TO_CHAR(A.DATAALUGUEL, '#39'YYYY'#39')) AS VARCHAR(30)) DATAALUGUEL'
      #9',A.DATAPAGAMENTO'
      #9',A.VALORALUGUEL'
      #9',T.DESCRICAO'
      #9',('
      #9#9'CASE '
      #9#9#9'WHEN T.COMPARTILHADO = '#39'V'#39
      #9#9#9#9'THEN T.VALOR / 2'
      #9#9#9'ELSE T.VALOR'
      #9#9#9'END'
      #9#9') VALORCONTA'
      #9',A.IDALUGUEL'
      #9',T.IDALUGUELCONTA'
      #9',T.VALOR'
      #9',T.COMPARTILHADO'
      #9',T.TIPOCONTA'
      'FROM PUBLIC.aluguel A'
      'LEFT JOIN PUBLIC.aluguelconta T ON A.IDALUGUEL = T.ID_ALUGUEL'
      'ORDER BY T.DESCRICAO'
      '')
    Left = 127
    Top = 144
    object IntegerField1: TIntegerField
      FieldName = 'id_aluguel'
      Origin = 'id_aluguel'
    end
    object WideStringField1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dataaluguel'
      Origin = 'dataaluguel'
      ReadOnly = True
      Size = 30
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'datapagamento'
      Origin = 'datapagamento'
    end
    object FloatField1: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valoraluguel'
      Origin = 'valoraluguel'
      currency = True
    end
    object WideStringField2: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object FloatField2: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valorconta'
      Origin = 'valorconta'
      ReadOnly = True
      currency = True
    end
    object qAluguelDesidaluguel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idaluguel'
      Origin = 'idaluguel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAluguelDesidaluguelconta: TIntegerField
      FieldName = 'idaluguelconta'
      Origin = 'idaluguelconta'
    end
    object qAluguelDesvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
    end
    object qAluguelDescompartilhado: TWideStringField
      FieldName = 'compartilhado'
      Origin = 'compartilhado'
      FixedChar = True
      Size = 1
    end
    object qAluguelDestipoconta: TWideStringField
      FieldName = 'tipoconta'
      Origin = 'tipoconta'
      FixedChar = True
      Size = 1
    end
  end
  object dsAluguelCompCob: TDataSource
    DataSet = qAluguelCompCob
    Left = 336
    Top = 80
  end
  object qAluguelCompCob: TFDQuery
    IndexFieldNames = 'id_aluguel'
    MasterSource = dsAluguel
    MasterFields = 'idaluguel'
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    SQL.Strings = (
      'SELECT T.ID_ALUGUEL'
      
        #9',CAST(TRIM(TO_CHAR(A.DATAALUGUEL, '#39'TMMonth'#39')) || '#39' / '#39' || TRIM(' +
        'TO_CHAR(A.DATAALUGUEL, '#39'YYYY'#39')) AS VARCHAR(30)) DATAALUGUEL'
      #9',C.DATAPAGAMENTO'
      #9',(A.VALORALUGUEL / 2) VALORALUGUEL'
      #9',T.DESCRICAO'
      #9',('
      #9#9'CASE '
      #9#9#9'WHEN T.COMPARTILHADO = '#39'V'#39
      #9#9#9#9'THEN T.VALOR / 2'
      #9#9#9'ELSE T.VALOR'
      #9#9#9'END'
      #9#9') VALORCONTA'
      #9',A.IDALUGUEL'
      #9',T.IDALUGUELCONTA'
      #9',T.VALOR'
      #9',T.COMPARTILHADO'
      #9',T.TIPOCONTA'
      'FROM PUBLIC.aluguel A'
      'LEFT JOIN PUBLIC.aluguelcomp C ON A.IDALUGUEL = C.ID_ALUGUEL'
      'LEFT JOIN PUBLIC.aluguelconta T ON A.IDALUGUEL = T.ID_ALUGUEL'
      'ORDER BY T.DESCRICAO')
    Left = 456
    Top = 80
    object IntegerField2: TIntegerField
      FieldName = 'id_aluguel'
      Origin = 'id_aluguel'
    end
    object WideStringField3: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dataaluguel'
      Origin = 'dataaluguel'
      ReadOnly = True
      Size = 30
    end
    object DateField2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'datapagamento'
      Origin = 'datapagamento'
    end
    object FloatField3: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valoraluguel'
      Origin = 'valoraluguel'
      currency = True
    end
    object WideStringField4: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object FloatField4: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valorconta'
      Origin = 'valorconta'
      ReadOnly = True
      currency = True
    end
    object qAluguelCompCobidaluguel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idaluguel'
      Origin = 'idaluguel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAluguelCompCobidaluguelconta: TIntegerField
      FieldName = 'idaluguelconta'
      Origin = 'idaluguelconta'
    end
    object qAluguelCompCobvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
    end
    object qAluguelCompCobcompartilhado: TWideStringField
      FieldName = 'compartilhado'
      Origin = 'compartilhado'
      FixedChar = True
      Size = 1
    end
    object qAluguelCompCobtipoconta: TWideStringField
      FieldName = 'tipoconta'
      Origin = 'tipoconta'
      FixedChar = True
      Size = 1
    end
  end
  object dsAluguelCompDes: TDataSource
    DataSet = qAluguelCompDes
    Left = 336
    Top = 144
  end
  object qAluguelCompDes: TFDQuery
    IndexFieldNames = 'id_aluguel'
    MasterSource = dsAluguel
    MasterFields = 'idaluguel'
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    SQL.Strings = (
      'SELECT T.ID_ALUGUEL'
      
        #9',CAST(TRIM(TO_CHAR(A.DATAALUGUEL, '#39'TMMonth'#39')) || '#39' / '#39' || TRIM(' +
        'TO_CHAR(A.DATAALUGUEL, '#39'YYYY'#39')) AS VARCHAR(30)) DATAALUGUEL'
      #9',C.DATAPAGAMENTO'
      #9',(A.VALORALUGUEL / 2) VALORALUGUEL'
      #9',T.DESCRICAO'
      #9',('
      #9#9'CASE '
      #9#9#9'WHEN T.COMPARTILHADO = '#39'V'#39
      #9#9#9#9'THEN T.VALOR / 2'
      #9#9#9'ELSE T.VALOR'
      #9#9#9'END'
      #9#9') VALORCONTA'
      #9',A.IDALUGUEL'
      #9',T.IDALUGUELCONTA'
      #9',T.VALOR'
      #9',T.COMPARTILHADO'
      #9',T.TIPOCONTA'
      'FROM PUBLIC.aluguel A'
      'LEFT JOIN PUBLIC.aluguelcomp C ON A.IDALUGUEL = C.ID_ALUGUEL'
      'LEFT JOIN PUBLIC.aluguelconta T ON A.IDALUGUEL = T.ID_ALUGUEL'
      'ORDER BY T.DESCRICAO')
    Left = 456
    Top = 144
    object IntegerField3: TIntegerField
      FieldName = 'id_aluguel'
      Origin = 'id_aluguel'
    end
    object WideStringField5: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dataaluguel'
      Origin = 'dataaluguel'
      ReadOnly = True
      Size = 30
    end
    object DateField3: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'datapagamento'
      Origin = 'datapagamento'
    end
    object FloatField5: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valoraluguel'
      Origin = 'valoraluguel'
      currency = True
    end
    object WideStringField6: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object FloatField6: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valorconta'
      Origin = 'valorconta'
      ReadOnly = True
      currency = True
    end
    object qAluguelCompDesidaluguel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idaluguel'
      Origin = 'idaluguel'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAluguelCompDesidaluguelconta: TIntegerField
      FieldName = 'idaluguelconta'
      Origin = 'idaluguelconta'
    end
    object qAluguelCompDesvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
    end
    object qAluguelCompDescompartilhado: TWideStringField
      FieldName = 'compartilhado'
      Origin = 'compartilhado'
      FixedChar = True
      Size = 1
    end
    object qAluguelCompDestipoconta: TWideStringField
      FieldName = 'tipoconta'
      Origin = 'tipoconta'
      FixedChar = True
      Size = 1
    end
  end
end
