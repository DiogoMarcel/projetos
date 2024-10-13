unit classes.template.abastecimentos;

interface

uses
  Data.DB,
  attributes.custom,
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

  end;

implementation

end.
