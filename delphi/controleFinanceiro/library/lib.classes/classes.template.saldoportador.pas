unit classes.template.saldoportador;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.portador,
  classes.template.interfaces;

type
  TSaldoPortador = class(TInterfacedObject, ISaldoPortador)
  private
    FIdSaldoPortador: integer;
    FValor: currency;
    FDataInclusao: TDate;
    FReservado: boolean;
    FContaCapital: boolean;
    FId_Portador: integer;
  public

    [TAttributeTitulo('Id Saldo Portador')]
    [TAttributeFieldType(ftInteger)]
    property IdSaldoPortador: integer  read FIdSaldoPortador write FIdSaldoPortador;

    [TAttributeTitulo('Saldo Portador')]
    [TAttributeMonetario]
    [TAttributeFieldType(ftCurrency)]
    [TAttributeDescricaoPesquisa]
    property Valor          : currency read FValor           write FValor          ;

    [TAttributeTitulo('Data Inclusão')]
    [TAttributeFieldType(ftDate)]
    property DataInclusao   : TDate    read FDataInclusao    write FDataInclusao   ;

    [TAttributeTitulo('Reservado')]
    [TAttributeFieldType(ftBoolean)]
    property Reservado      : boolean  read FReservado       write FReservado      ;

    [TAttributeTitulo('Conta Capital')]
    [TAttributeFieldType(ftBoolean)]
    property ContaCapital   : boolean  read FContaCapital    write FContaCapital   ;

    [TAttributeTitulo('Id Portador')]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TPortador)]
    property Id_Portador    : integer  read FId_Portador     write FId_Portador    ;
  end;

implementation

end.
