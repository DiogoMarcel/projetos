unit data.menu;

interface

uses
  lib.DAO.dataModel,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Datasnap.Provider, lib.proc.objects;

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
    qProjecao: TFDQuery;
    qProjecaovalor: TFloatField;
    qProjecaotitulo: TWideStringField;
    dsProjecao: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    FPegarValorEditorFrameMenu: TPegarValorEditorFrameMenu;

    function PegarValorEditorFrame: integer;

  public
    constructor Create(AOwner: TComponent; _APegarValorEditorFrameMenu: TPegarValorEditorFrameMenu); reintroduce;

    procedure CalcularProjecao;
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

constructor TdataMenu.Create(AOwner: TComponent; _APegarValorEditorFrameMenu: TPegarValorEditorFrameMenu);
begin
  inherited Create(AOwner);

  FPegarValorEditorFrameMenu := _APegarValorEditorFrameMenu;
end;

procedure TdataMenu.DataModuleCreate(Sender: TObject);
var
//  Inicio: TDateTime;
//  Fim: TDateTime;
  Tasks: array [0..3] of ITask;

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

  Tasks[3] := TTask.Create(CalcularProjecao);
  Tasks[3].Start;

  TTask.WaitForAll(Tasks);

//  Fim := Now;

//  ShowMessage(Format('Consultas realizadas em %s segundos.', [FormatDateTime('ss', Fim - Inicio)]));
end;

function TdataMenu.PegarValorEditorFrame: integer;
begin
  Result := 0;
  if Assigned(FPegarValorEditorFrameMenu) then
    Result := FPegarValorEditorFrameMenu;
end;

procedure TdataMenu.CalcularProjecao;
begin
  if (qProjecao.Active) then
    qProjecao.Active := False;

  qProjecao
    .PrepareSQL(
      TSQLResumoMenu.New
        .SetEnumSQL(sqlMenuProjecao)
        .PegarSQL
    )
    .SetParamInteger('pMULTIPLICAR', PegarValorEditorFrame)
    .SetParamString('pRECEITA', 'R')
    .SetParamString('pDESPESA', 'P');
end;

end.
