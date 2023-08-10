unit classes.template.membrofamilia;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.interfaces;

type
  TMembroFamilia = class(TInterfacedObject, IMembroFamiliaClass)
  private
    FIdMembroFamilia: integer;
    FNome: string;
  public
    [TAttributeTitulo('Id Membro Família')]
    [TAttributeFieldType(ftInteger)]
    property IdMembroFamilia: integer read FIdMembroFamilia write FIdMembroFamilia;

    [TAttributeTitulo('Nome Membro Família')]
    [TAttributeFieldType(ftString)]
    [TAttributeDescricaoPesquisa]
    property Nome: string read FNome write FNome;
  end;

implementation

end.
