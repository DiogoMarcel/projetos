unit classes.template.abastecimentos;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.veiculos,
  classes.template.interfaces;

type
  TAbastecimentos = class(TInterfacedObject, IAbastecimentos)
  private
    FIdAbastecimento: integer;
    FObservacao: string;
    FDataAbastecimento: TDate;
    FTotalAbastecimento: currency;
    FKMCarro: integer;
    FQuantidadeLitros: double;
    FId_Veiculo: integer;

  public
    [TAttributeTitulo('Id Abastecimento')]
    [TAttributeFieldType(ftInteger)]
    property IdAbastecimento: integer read FIdAbastecimento write FIdAbastecimento;

    [TAttributeTitulo('Observação')]
    [TAttributeFieldType(ftString)]
    property Observacao: string read FObservacao write FObservacao;

    [TAttributeTitulo('Data Abastecimento')]
    [TAttributeFieldType(ftDate)]
    property DataAbastecimento: TDate read FDataAbastecimento write FDataAbastecimento;

    [TAttributeTitulo('R$ Total Abastecido')]
    [TAttributeMonetario]
    [TAttributeFieldType(ftCurrency)]
    property TotalAbastecimento: currency read FTotalAbastecimento write FTotalAbastecimento;

    [TAttributeTitulo('KM Carro')]
    [TAttributeFieldType(ftInteger)]
    property KMCarro: integer  read FKMCarro write FKMCarro;

    [TAttributeTitulo('Quantidade Litros')]
    [TAttributeFieldType(ftFloat)]
    property QuantidadeLitros: Double read FQuantidadeLitros write FQuantidadeLitros;

    [TAttributeTitulo('Id Veículo')]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TVeiculos)]
    property Id_Veiculo: integer read FId_Veiculo write FId_Veiculo;
  end;

implementation

end.
