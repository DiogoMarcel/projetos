unit classes.template.credor;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.interfaces;

type
  TCredor = class(TInterfacedObject, ICredorClass)
  private
  	FIdCredor: Integer;
    FNome: string;

  public
    [TAttributeTitulo('Id Credor')]
    [TAttributeFieldType(ftInteger)]
    property IdCredor: integer read FIdCredor write FIdCredor;

    [TAttributeTitulo('Nome Credor')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property Nome: string read FNome write FNome;

  end;

implementation

{ TCredor }

end.
