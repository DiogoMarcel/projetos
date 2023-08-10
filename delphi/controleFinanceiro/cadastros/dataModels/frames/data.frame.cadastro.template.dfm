object dmFrameGrade: TdmFrameGrade
  OldCreateOrder = False
  Height = 87
  Width = 438
  object dsFrameGrade: TDataSource
    DataSet = cdsFrameGrade
    Left = 48
    Top = 16
  end
  object qFrameGrade: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert]
    Left = 160
    Top = 16
  end
  object dspFrameGrade: TDataSetProvider
    DataSet = qFrameGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 264
    Top = 16
  end
  object cdsFrameGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFrameGrade'
    Left = 368
    Top = 16
  end
end
