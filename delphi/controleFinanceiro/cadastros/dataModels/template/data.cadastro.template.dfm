object dataCadastroTemplate: TdataCadastroTemplate
  OldCreateOrder = False
  Height = 131
  Width = 524
  object mtDados: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 32
    Top = 24
  end
  object dsCadastro: TDataSource
    DataSet = cdsCadastro
    Left = 120
    Top = 24
  end
  object qCadastro: TFDQuery
    AfterPost = qCadastroAfterPost
    AfterDelete = qCadastroAfterDelete
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    Left = 232
    Top = 24
  end
  object dspCadastro: TDataSetProvider
    DataSet = qCadastro
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 336
    Top = 24
  end
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    Left = 440
    Top = 24
  end
  object dsConsultaGrade: TDataSource
    DataSet = cdsConsultaGrade
    Left = 120
    Top = 72
  end
  object qConsultaGrade: TFDQuery
    AfterPost = qCadastroAfterPost
    AfterDelete = qCadastroAfterDelete
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    Left = 232
    Top = 72
  end
  object dspConsultaGrade: TDataSetProvider
    DataSet = qConsultaGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 336
    Top = 72
  end
  object cdsConsultaGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaGrade'
    Left = 440
    Top = 72
  end
end
