unit data.menu;

interface

uses
  lib.DAO.dataModel,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Datasnap.Provider;

type
  TdataMenu = class(TDataModule)
    qMenu: TFDQuery;
    dsMenu: TDataSource;
    qMenuvalor: TFloatField;
    qMenutitulo: TWideStringField;
    qSaldoFolha: TFDQuery;
    dsSaldoFolha: TDataSource;
    qSaldoFolhavalorfolhamembro: TFloatField;
    qSaldoFolhanome: TWideStringField;
    qContaPagamentos: TFDQuery;
    dsContaPagamentos: TDataSource;
    qContaPagamentosdescricao: TWideStringField;
    qContaPagamentosvalor: TFloatField;
    qContaPagamentossinal: TWideStringField;
    qContaPagamentosidcontapagamentos: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

implementation

uses
  consts.SQLs,
  lib.sql.resumomenu,
  lib.helper.querys;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdataMenu }

procedure TdataMenu.DataModuleCreate(Sender: TObject);
begin
  qMenu
    .PrepareSQL(
      TSQLResumoMenu.New
        .SetEnumSQL(sqlMenuResumo)
        .PegarSQL
    )
    .SetParamString('pRECEITA', 'R')
    .SetParamString('pDESPESA', 'P');

  qSaldoFolha
    .PrepareSQL(
      TSQLResumoMenu.New
        .SetEnumSQL(sqlMenuSaldoFolha)
        .PegarSQL
    );

  qContaPagamentos
    .PrepareSQL(
      TSQLResumoMenu.New
        .SetEnumSQL(sqlMenuContaPagamentos)
        .PegarSQL
    )
    .SetParamString('pTIPOCONTA', 'P');
end;

end.

