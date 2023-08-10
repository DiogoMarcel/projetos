object dmSaldoDetalhadoPortadorGrafico: TdmSaldoDetalhadoPortadorGrafico
  OldCreateOrder = False
  Height = 78
  Width = 622
  object qSaldoDetalhadoPortador: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    SQL.Strings = (
      
        'SELECT CAST(TRIM(TO_CHAR(DATAALTERACAO, '#39'TMMONTH'#39')) || '#39' / '#39' || ' +
        'TRIM(TO_CHAR(DATAALTERACAO, '#39'YYYY'#39')) AS VARCHAR(30)) AS DATAALTE' +
        'RACAO'#13#10#9',SALDOTOTAL'#13#10'FROM SALDODETALHADOPORTADOR'#13#10'ORDER BY IDSAL' +
        'DODETALHADOPORTADOR DESC'#13#10)
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
