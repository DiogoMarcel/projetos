unit lib.sql.lookup;

interface

uses
  consts.SQLs,
  System.SysUtils,
  lib.sql.interfaces;

type
  TSQLLookup = class(TInterfacedObject, iSQLDefinicao, iSQLResultado)
  private
    FSQLEnum: TSQLEnum;

    function PegarSQLLookupMembroFamilia: string;
    function PegarSQLLookupCredor: string;
    function PegarSQLLookupCartao: string;
    function PegarSQLLookupSaldoPortador: string;
    function PegarSQLLookupVeiculo: string;

  public
    function SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
    function PegarSQL: string;

    class function New: iSQLDefinicao;
  end;

implementation

{ TSQLLookup }

class function TSQLLookup.New: iSQLDefinicao;
begin
  Result := Self.Create;
end;

function TSQLLookup.SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
begin
  Result := Self;

  FSQLEnum := _ASQLEnum;
end;

function TSQLLookup.PegarSQL: string;
begin
  case FSQLEnum of
    sqlLookupMembroFamilia : Result := PegarSQLLookupMembroFamilia;
    sqlLookupCredor        : Result := PegarSQLLookupCredor;
    sqlLookupCartao        : Result := PegarSQLLookupCartao;
    sqlLookupSaldoPortador : Result := PegarSQLLookupSaldoPortador;
    sqlLookupVeiculo       : Result := PegarSQLLookupVeiculo;
    else
      raise Exception.Create('SQL Inválido para a classe Lookup!');
  end;
end;

function TSQLLookup.PegarSQLLookupCartao: string;
begin
  Result := 'SELECT IDCARTAO,NOME FROM CARTAO';
end;

function TSQLLookup.PegarSQLLookupCredor: string;
begin
  Result := 'SELECT IDCREDOR,NOME FROM CREDOR';
end;

function TSQLLookup.PegarSQLLookupMembroFamilia: string;
begin
  Result := 'SELECT IDMEMBROFAMILIA,NOME FROM MEMBROFAMILIA';
end;

function TSQLLookup.PegarSQLLookupSaldoPortador: string;
begin
  Result := 'SELECT P.IDPORTADOR'+
            '      ,CAST(P.NOMEPORTADOR || CASE WHEN COALESCE(P.AGENCIA, '''') <> '''' THEN '' - '' ELSE '''' END '+
            '      || COALESCE(P.AGENCIA, '''') '+
            '      || CASE WHEN COALESCE(P.NUMEROCONTA, '''') <> '''' THEN '' / '' ELSE '''' END '+
            '      || COALESCE(P.NUMEROCONTA, '''') '+
            '      || CASE WHEN COALESCE(P.DIGITOCONTA, '''') <> '''' THEN ''-''   ELSE '''' END '+
            '      || COALESCE(P.DIGITOCONTA, '''') '+
            '      || '' ('' || P.TIPOCONTA || '') '' '+
            '      || COALESCE(M.NOME, '''') AS VARCHAR(80)) AS NOMEPORTADOR '+
            ' FROM PORTADOR P '+
            ' JOIN MEMBROFAMILIA M ON P.ID_MEMBROFAMILIA = M.IDMEMBROFAMILIA '+
            ' ORDER BY 1';
end;

function TSQLLookup.PegarSQLLookupVeiculo: string;
begin
  Result := 'SELECT V.IDVEICULO,CAST(V.MODELO || '' - '' || V.MARCA AS VARCHAR(80)) MODELO'+
            '  FROM VEICULOS V'+
            ' ORDER BY V.DATACOMPRA DESC';
end;

end.
