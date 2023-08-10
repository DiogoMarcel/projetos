unit classes.template.despesacartao;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.cartao,
  classes.template.interfaces;

type
  TDespesaCartao = class(TInterfacedObject, IDespesaCartao)
  private
    FIdDespesaCartao: integer;
    FDescricao: string;
    FValor: currency;
    FDataDespesa: TDate;
    FId_Cartao: integer;
  public
    [TAttributeTitulo('Id Despesa')]
    [TAttributeFieldType(ftInteger)]
    property IdDespesaCartao: integer  read FIdDespesaCartao write FIdDespesaCartao;

    [TAttributeTitulo('Despesa Cartão')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property Descricao      : string   read FDescricao       write FDescricao      ;

    [TAttributeTitulo('Valor')]
    [TAttributeMonetario]
    [TAttributeFieldType(ftCurrency)]
    property Valor          : currency read FValor           write FValor          ;

    [TAttributeTitulo('Data Despesa')]
    [TAttributeFieldType(ftDate)]
    property DataDespesa    : TDate    read FDataDespesa     write FDataDespesa    ;

    [TAttributeTitulo('ID Cartão')]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TCartao)]
    property Id_Cartao      : integer  read FId_Cartao       write FId_Cartao      ;
  end;

implementation

end.
