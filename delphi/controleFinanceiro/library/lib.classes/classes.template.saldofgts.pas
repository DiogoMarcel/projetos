unit classes.template.saldofgts;

interface

uses
  Data.DB,
  attributes.custom,
  classes.template.membrofamilia,
  classes.template.interfaces;

type
  TSaldoFGTS = class(TInterfacedObject, ISaldoFGTS)
  private
    FIdSaldoFGTS: integer;
    FNroPIS: string;
    FSaldo: currency;
    FSenha: string;
    FId_MembroFamilia: integer;
  public
    [TAttributeTitulo('Id Saldo FGTS')]
    [TAttributeFieldType(ftInteger)]
    property IdSaldoFGTS      : integer  read FIdSaldoFGTS      write FIdSaldoFGTS     ;

    [TAttributeTitulo('Nro. PIS')]
    [TAttributeFieldType(ftString)]
    property NroPIS           : string   read FNroPIS           write FNroPIS          ;

    [TAttributeTitulo('Saldo FGTS')]
    [TAttributeMonetario]
    [TAttributeFieldType(ftCurrency)]
    [TAttributeDescricaoPesquisa]
    property Saldo            : currency read FSaldo            write FSaldo           ;

    [TAttributeTitulo('Senha')]
    [TAttributeFieldType(ftString)]
    [TAttributeInvisible]
    property Senha            : string   read FSenha            write FSenha           ;

    [TAttributeTitulo('ID Membro Família')]
    [TAttributeFieldType(ftInteger)]
    [TAttributeFK(TMembroFamilia)]
    property Id_MembroFamilia : integer  read FId_MembroFamilia write FId_MembroFamilia;
  end;

implementation

end.
