unit classes.template.tags;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.interfaces;

type
  TTags = class(TInterfacedObject, ITags)
  private
    FIdTags: integer;
    FDescricao: string;
  public
    [TAttributeTitulo('Id Tag Conta')]
    [TAttributeFieldType(ftInteger)]
    property IdTags: integer read FIdTags write FIdTags;

    [TAttributeTitulo('Tag Conta')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property Descricao: string read FDescricao write FDescricao ;
  end;

implementation

end.
