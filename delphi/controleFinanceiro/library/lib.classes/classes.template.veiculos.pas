unit classes.template.veiculos;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.interfaces;

type
  TVeiculos = class(TInterfacedObject, IVeiculos)
  private
    FIdVeiculo: integer;
    FModelo: string;
    FMarca: string;
    FCor: string;
    FDataCompra: TDate;
    FDataVenda: TDate;
    FValorCompra: currency;
    FValorVenda: currency;

  public
    [TAttributeTitulo('Id Veículo')]
    [TAttributeFieldType(ftInteger)]
    property IdVeiculo : integer read FIdVeiculo write FIdVeiculo;

    [TAttributeTitulo('Modelo')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property Modelo: string read FModelo write FModelo;

    [TAttributeTitulo('Marca')]
    [TAttributeFieldType(ftString)]
    property Marca: string read FMarca write FMarca;

    [TAttributeTitulo('Cor')]
    [TAttributeFieldType(ftString)]
    property Cor: string read FCor write FCor;

    [TAttributeTitulo('Data Compra')]
    [TAttributeFieldType(ftDate)]
    property DataCompra: TDate read FDataCompra write FDataCompra;

    [TAttributeTitulo('Data Venda')]
    [TAttributeFieldType(ftDate)]
    property DataVenda: TDate read FDataVenda write FDataVenda;

    [TAttributeTitulo('R$ Valor Compra')]
    [TAttributeMonetario]
    [TAttributeFieldType(ftCurrency)]
    property ValorCompra: currency read FValorCompra write FValorCompra;

    [TAttributeTitulo('R$ Valor Venda')]
    [TAttributeMonetario]
    [TAttributeFieldType(ftCurrency)]
    property ValorVenda: currency read FValorVenda write FValorVenda;
  end;

implementation

end.
