unit lib.data.splash;

interface

uses
  lib.dao.dataModel,
  lib.proc.objects,
  lib.DAO.interfaces,
  lib.DAO.comandosTransacao,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet;

type
  TdataSplash = class(TDataModule)
    qSplash: TFDQuery;
  private
    FAtualizarMensagemSplash: TAtualizarMensagemSplash;

    procedure AtualizarMensagem(_AMensagem: string);
    procedure ExecutarContaPagamentosPendentes;
    procedure ExecutarFuncoesSEMTransacao;
    procedure ExecutarFuncoesCOMTransacao;

  public
    procedure ExecutarFuncoesIniciais(_AtualizarMensagemSplash: TAtualizarMensagemSplash);
  end;

implementation

uses
  lib.helper.querys,
  lib.sql.splash,
  consts.SQLs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdataSplash }

procedure TdataSplash.AtualizarMensagem(_AMensagem: string);
begin
  if Assigned(FAtualizarMensagemSplash) then
    FAtualizarMensagemSplash(_AMensagem);
end;

procedure TdataSplash.ExecutarFuncoesIniciais(_AtualizarMensagemSplash: TAtualizarMensagemSplash);
begin
  FAtualizarMensagemSplash := _AtualizarMensagemSplash;

  ExecutarFuncoesSEMTransacao;
  ExecutarFuncoesCOMTransacao;
end;

procedure TdataSplash.ExecutarFuncoesCOMTransacao;
begin
  try
    {TdmCmdTransacao.New
      .AddCommand(getComando1)
      .AddCommand(getComando2)
        .Executar;}
  except on E: Exception do
    AtualizarMensagem('Ops. Funções em transação com falha!');
  end;
end;

procedure TdataSplash.ExecutarFuncoesSEMTransacao;
begin
  try

    ExecutarContaPagamentosPendentes;

  except on E: Exception do
    AtualizarMensagem('Ops. Não foi possível executar funções!');
  end;
end;

procedure TdataSplash.ExecutarContaPagamentosPendentes;
begin
  AtualizarMensagem('Verificando Contas Mensais');

  qSplash.
    PrepareSQL(
      TSQLSplash.New
        .SetEnumSQL(sqlSplashContaPagamentosPendentes)
          .PegarSQL)
    .Open;
end;

end.

