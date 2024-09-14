object dmSaldoExtrato: TdmSaldoExtrato
  Height = 172
  Width = 623
  object qSaldoExtrato: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    Left = 64
    Top = 16
  end
  object dspSaldoExtrato: TDataSetProvider
    DataSet = qSaldoExtrato
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 208
    Top = 16
  end
  object dsSaldoExtrato: TDataSource
    DataSet = cdsSaldoExtrato
    Left = 528
    Top = 16
  end
  object cdsSaldoExtrato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSaldoExtrato'
    Left = 368
    Top = 16
  end
end
