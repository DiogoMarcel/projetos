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
    qContaPagamentosidconta: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

implementation

uses
  Dialogs,
  System.Threading,


  consts.SQLs,
  lib.sql.resumomenu,
  lib.helper.querys;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdataMenu }

procedure TdataMenu.DataModuleCreate(Sender: TObject);
var
//  Inicio: TDateTime;
//  Fim: TDateTime;
  Tasks: array [0..2] of ITask;

begin

//  Inicio := Now;

  Tasks[0] := TTask.Create(
    procedure
    begin
      qMenu
        .PrepareSQL(
          TSQLResumoMenu.New
            .SetEnumSQL(sqlMenuResumo)
            .PegarSQL
        )
        .SetParamString('pRECEITA', 'R')
        .SetParamString('pDESPESA', 'P');

//        sleep(2000);
    end
  );
  Tasks[0].Start;

  Tasks[1] := TTask.Create(
    procedure
    begin
      qSaldoFolha
        .PrepareSQL(
          TSQLResumoMenu.New
            .SetEnumSQL(sqlMenuSaldoFolha)
            .PegarSQL
        );

//        sleep(3000);

    end
  );
  Tasks[1].Start;

  Tasks[2] := TTask.Create(
    procedure
    begin
      qContaPagamentos
        .PrepareSQL(
          TSQLResumoMenu.New
            .SetEnumSQL(sqlMenuContaPagamentos)
            .PegarSQL
        )
        .SetParamString('pTIPOCONTA', 'P');

//        sleep(1000);
    end
  );
  Tasks[2].Start;

  TTask.WaitForAll(Tasks);

//  Fim := Now;

//  ShowMessage(Format('Consultas realizadas em %s segundos.', [FormatDateTime('ss', Fim - Inicio)]));

end;

end.

