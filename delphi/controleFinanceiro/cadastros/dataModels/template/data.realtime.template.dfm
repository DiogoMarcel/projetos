object dataRealTimeTemplate: TdataRealTimeTemplate
  OldCreateOrder = False
  Height = 150
  Width = 215
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
  object dsDadosRealtime: TDataSource
    Left = 104
    Top = 24
  end
end
