unit lib.sql.contapagamento;

interface

uses
  consts.SQLs,
  System.SysUtils,
  lib.sql.interfaces;

type
  TSQLContaPagamentos = class(TInterfacedObject, iSQLDefinicao, iSQLResultado)
  private
    FSQLEnum: TSQLEnum;

    function PegarSQLUpdateBaixaEfetuada: string;

  public
    function SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
    function PegarSQL: string;

    class function New: iSQLDefinicao;
  end;

implementation

{ TSQLContaPagamentos }

function TSQLContaPagamentos.PegarSQL: string;
begin
  case FSQLEnum of
    sqlContaPgtoUpdateBaixaEfetuada : Result := PegarSQLUpdateBaixaEfetuada;
    else
      raise Exception.Create('SQL Inválido para a classe Conta Pagamentos!');
  end;
end;

class function TSQLContaPagamentos.New: iSQLDefinicao;
begin
  Result := Self.Create;
end;

function TSQLContaPagamentos.SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
begin
  Result := Self;

  FSQLEnum := _ASQLEnum;
end;

function TSQLContaPagamentos.PegarSQLUpdateBaixaEfetuada: string;
begin
  Result := ' UPDATE CONTAPAGAMENTOS                       '+
            ' SET DATABAIXA= :pDATABAIXA                   '+
            ' WHERE IDCONTAPAGAMENTOS= :pIDCONTAPAGAMENTOS ';
end;

end.
