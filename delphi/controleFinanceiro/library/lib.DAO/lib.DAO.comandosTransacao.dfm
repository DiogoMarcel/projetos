object dmCmdTransacao: TdmCmdTransacao
  Height = 108
  Width = 222
  object daoCommand: TFDCommand
    Connection = dmConexaoDB.FDConexao
    Transaction = daoTransacao
    Left = 135
    Top = 24
  end
  object daoTransacao: TFDTransaction
    Connection = dmConexaoDB.FDConexao
    Left = 40
    Top = 24
  end
end
