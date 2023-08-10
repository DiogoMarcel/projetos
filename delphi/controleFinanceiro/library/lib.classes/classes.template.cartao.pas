unit classes.template.cartao;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.membrofamilia,
  classes.template.interfaces;

type
  TCartao = class(TInterfacedObject, ICartao)
  private
    FIdCartao: integer;
    FNome: string;
    FDiaVencimento: SmallInt;
    FBandeira: string;
    FId_MembroFamilia: integer;
  public
    [TAttributeTitulo('Id Cartão')]
    [TAttributeFieldType(ftInteger)]
    property IdCartao        : integer  read FIdCartao         write FIdCartao        ;

    [TAttributeTitulo('Nome Cartão')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property Nome            : string   read FNome             write FNome            ;

    [TAttributeTitulo('Dia Vencimento')]
    [TAttributeFieldType(ftSmallint)]
    property DiaVencimento   : SmallInt read FDiaVencimento    write FDiaVencimento   ;

    [TAttributeTitulo('Bandeira')]
    [TAttributeFieldType(ftString)]
    property Bandeira        : string   read FBandeira         write FBandeira        ;

    [TAttributeTitulo('ID Membro Família')]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TMembroFamilia)]
    property Id_MembroFamilia: integer  read FId_MembroFamilia write FId_MembroFamilia;

  end;

implementation

end.
