object dataCadastroSaldoPortadorTransferencia: TdataCadastroSaldoPortadorTransferencia
  OldCreateOrder = False
  Height = 95
  Width = 510
  object dsCadastro: TDataSource
    DataSet = cdsCadastro
    Left = 79
    Top = 31
  end
  object qCadastro: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    SQL.Strings = (
      'select cast(0 AS INTEGER) Id_Portador_Origem'
      '      ,cast(0 AS INTEGER) Id_Portador_Destino')
    Left = 185
    Top = 31
  end
  object dspCadastro: TDataSetProvider
    DataSet = qCadastro
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 292
    Top = 31
  end
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    Left = 399
    Top = 31
  end
end
