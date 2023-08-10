object dmSaldoDetalhadoPortador: TdmSaldoDetalhadoPortador
  OldCreateOrder = False
  Height = 86
  Width = 629
  object qSaldoDetalhadoPortador: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
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
  end
end
