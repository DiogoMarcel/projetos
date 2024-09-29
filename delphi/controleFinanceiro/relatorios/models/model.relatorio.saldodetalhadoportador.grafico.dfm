object dmSaldoDetalhadoPortadorGrafico: TdmSaldoDetalhadoPortadorGrafico
  Height = 78
  Width = 622
  object qSaldoDetalhadoPortador: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    SQL.Strings = (
      
        'SELECT CAST(TRIM(TO_CHAR(DATAALTERACAO, '#39'TMMONTH'#39')) || '#39' / '#39' || ' +
        'TRIM(TO_CHAR(DATAALTERACAO, '#39'YYYY'#39')) AS VARCHAR(30)) AS DATAALTE' +
        'RACAO'
      #9',SALDOTOTAL'
      'FROM SALDODETALHADOPORTADOR'
      'ORDER BY IDSALDODETALHADOPORTADOR DESC'
      'limit 10')
    Left = 64
    Top = 16
  end
  object dspSaldoDetalhadoPortador: TDataSetProvider
    DataSet = qSaldoDetalhadoPortador
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 208
    Top = 16
  end
  object dsSaldoDetalhadoPortador: TDataSource
    DataSet = cdsSaldoDetalhadoPortador
    Left = 528
    Top = 16
  end
  object cdsSaldoDetalhadoPortador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSaldoDetalhadoPortador'
    Left = 368
    Top = 16
    object cdsSaldoDetalhadoPortadordataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      ReadOnly = True
      Size = 30
    end
    object cdsSaldoDetalhadoPortadorsaldototal: TFloatField
      FieldName = 'saldototal'
      Origin = 'saldototal'
    end
  end
end
