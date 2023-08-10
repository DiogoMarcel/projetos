unit lib.sql.splash;

interface

uses
  consts.SQLs,
  System.SysUtils,
  lib.sql.interfaces;

type
  TSQLSplash = class(TInterfacedObject, iSQLDefinicao, iSQLResultado)
  private
    FSQLEnum: TSQLEnum;

    function ContaPagamentosPendentes: string;

  public
    function SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
    function PegarSQL: string;

    class function New: iSQLDefinicao;
  end;

implementation

{ TSQLSplash }

class function TSQLSplash.New: iSQLDefinicao;
begin
  Result := Self.Create;
end;

function TSQLSplash.SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
begin
  Result := Self;

  FSQLEnum := _ASQLEnum;
end;

function TSQLSplash.PegarSQL: string;
begin
  case FSQLEnum of
    sqlSplashContaPagamentosPendentes: Result := ContaPagamentosPendentes;
    else
      raise Exception.Create('SQL Inválido para a classe Splash!');
  end;
end;

function TSQLSplash.ContaPagamentosPendentes: string;
begin
  Result := 'SELECT public.contapagamentos_func()';
end;

end.
