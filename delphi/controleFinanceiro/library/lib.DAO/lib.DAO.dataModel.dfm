object dmConexaoDB: TdmConexaoDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 151
  Width = 313
  object FDConexao: TFDConnection
    Params.Strings = (
      'CharacterSet=UTF8'
      'DriverID=PG'
      'Database=contasfamilia'
      'Password=postgres'
      'User_Name=postgres')
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDPGDriver: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\psqlODBC\1302\bin\libpq.dll'
    Left = 40
    Top = 80
  end
end
