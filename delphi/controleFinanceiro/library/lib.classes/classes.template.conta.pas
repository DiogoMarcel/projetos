unit classes.template.conta;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.credor,
  classes.template.membrofamilia,
  classes.template.interfaces;

type
  {TODO: [HINT - Cadastros] Criar uma classe da tabela}
  TConta = class(TInterfacedObject, IContaClass)
  private
    FIdConta            : integer;
    FDescricao          : string;
    FValor              : currency;
    FTipoConta          : string;
    FContaAnual         : boolean;
    FPertenceAFolha     : boolean;
    FDebitaCartao       : boolean;
    FPagamentoManual    : boolean;
    FQTDParcela         : integer;
    FDebitoAuto         : boolean;
    FId_Credor          : integer;
    FId_MembroFamilia   : integer;

  public
    [TAttributeTitulo('Id Conta')]
    [TAttributeFieldType(ftInteger)]
    property IdConta         : integer    read FIdConta          write FIdConta         ;

    [TAttributeTitulo('Descrição Conta')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property Descricao       : string     read FDescricao        write FDescricao       ;

    [TAttributeTitulo('Valor')]
    [TAttributeMonetario]
    [TAttributeFieldType(ftCurrency)]
    property Valor           : currency   read FValor            write FValor           ;

    [TAttributeTitulo('Tipo Conta')]
    [TAttributeInvisible]
    [TAttributeFieldType(ftString)]
    property TipoConta       : string     read FTipoConta        write FTipoConta       ;

    [TAttributeTitulo('Conta Anual')]
    [TAttributeFieldType(ftBoolean)]
    property ContaAnual      : boolean    read FContaAnual       write FContaAnual      ;

    [TAttributeTitulo('Pertence a Folha')]
    [TAttributeFieldType(ftBoolean)]
    property PertenceAFolha  : boolean    read FPertenceAFolha   write FPertenceAFolha  ;

    [TAttributeTitulo('Debita Cartão')]
    [TAttributeFieldType(ftBoolean)]
    property DebitaCartao    : boolean    read FDebitaCartao     write FDebitaCartao    ;

    [TAttributeTitulo('Débito Automático')]
    [TAttributeFieldType(ftBoolean)]
    property DebitoAuto: boolean          read FDebitoAuto       write FDebitoAuto      ;

    [TAttributeTitulo('Pagamento Manual')]
    [TAttributeFieldType(ftBoolean)]
    property PagamentoManual : boolean    read FPagamentoManual  write FPagamentoManual ;

    [TAttributeTitulo('QTD Parcelas')]
    [TAttributeFieldType(ftInteger)]
    property QTDParcela      : integer    read FQTDParcela       write FQTDParcela      ;

    [TAttributeTitulo('Id Credor')]
    [TAttributeInvisible]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TCredor)]
    property Id_Credor       : integer    read FId_Credor        write FId_Credor       ;

    [TAttributeTitulo('Id Membro Familia')]
    [TAttributeInvisible]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TMembroFamilia)]
    property Id_MembroFamilia: integer    read FId_MembroFamilia write FId_MembroFamilia;

  end;

implementation

end.
