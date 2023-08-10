unit classes.template.portador;

interface

uses
  Data.DB,
  attributes.custom,
  System.Generics.Collections,
  lib.helper.dictionary,
  classes.template.membrofamilia,
  classes.template.interfaces;

type
  TPortador = class(TInterfacedObject, IPortadorClass)
  private
    FNomePortador: string;
    FIdPortador: Integer;
    FTipoConta: string;
    FAgencia: string;
    FNumeroConta: string;
    FDigitoConta: string;
    FIDMembroFamilia: integer;
    FImgPortador: SmallInt;

  public
    [TAttributeTitulo('Id do Portador')]
    [TAttributeFieldType(ftInteger)]
    property IdPortador: Integer read FIdPortador write FIdPortador;

    [TAttributeTitulo('Portador')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property NomePortador: string read FNomePortador write FNomePortador;

    {[TAttributeIsValid(lib.helper.dictionary.TDictHelper<integer, string>.Make([P(1, 'one'), P(2, 'two')]))]}
    [TAttributeTitulo('Tipo Conta')]
    [TAttributeFieldType(ftString)]
    [TAttributeWidth(65)]
    property TipoConta: string read FTipoConta write FTipoConta;

    [TAttributeTitulo('Agência')]
    [TAttributeFieldType(ftString)]
    property Agencia: string read FAgencia write FAgencia;

    [TAttributeTitulo('Número Conta')]
    [TAttributeFieldType(ftString)]
    property NumeroConta: string read FNumeroConta write FNumeroConta;

    [TAttributeTitulo('Dígito')]
    [TAttributeFieldType(ftString)]
    [TAttributeWidth(40)]
    property DigitoConta: string read FDigitoConta write FDigitoConta;

    [TAttributeTitulo('Img. Portador')]
    [TAttributeFieldType(ftSmallint)]
    [TAttributeInvisible]
    property ImgPortador: SmallInt read FImgPortador write FImgPortador;

    [TAttributeTitulo('Id Membro')]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TMembroFamilia)]
    property ID_MembroFamilia: integer read FIDMembroFamilia write FIDMembroFamilia;

  end;

implementation

end.

