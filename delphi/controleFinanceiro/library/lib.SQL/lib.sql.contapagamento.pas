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
    function PegarSQLExcluirRegistroAuxiliarContaPagamentos: string;
    function PegarSQLContaPgtoUpdateSaldoExtrato: string;
    function PegarSQLContaPgtoInsertSaldoExtratoConta: string;

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
    sqlContaPgtoExcRegAuxContaPagamentos : Result := PegarSQLExcluirRegistroAuxiliarContaPagamentos;
    sqlContaPgtoUpdateSaldoExtrato : Result := PegarSQLContaPgtoUpdateSaldoExtrato;
    sqlContaPgtoInsertSaldoExtratoConta : Result := PegarSQLContaPgtoInsertSaldoExtratoConta;
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

function TSQLContaPagamentos.PegarSQLExcluirRegistroAuxiliarContaPagamentos: string;
begin
  Result := ' DELETE FROM PUBLIC.CONTAPAGAMENTOS '+
            ' WHERE ID_CONTA= :pID_CONTA';
end;

function TSQLContaPagamentos.PegarSQLContaPgtoUpdateSaldoExtrato: string;
begin
  Result := ' INSERT INTO SALDOEXTRATO('+
                'TIPOSALDO, VALOR, SALDO, DESCRICAO) '+
            ' VALUES (:pTIPOSALDO'+
                   ', :pVALOR'+
                   ', :pSALDO + '+
                       ' (SELECT SALDO '+
                       '    FROM public.saldoextrato '+
                       '   ORDER BY IDSALDOEXTRATO DESC '+
                       '   LIMIT 1) '+
                   ', :pDESCRICAO) ';
end;

function TSQLContaPagamentos.PegarSQLContaPgtoInsertSaldoExtratoConta: string;
begin
  Result := ' INSERT INTO SALDOEXTRATO(  TIPOSALDO,   VALOR,   SALDO,   DESCRICAO, ID_CONTA) '+
            '  SELECT TIPOCONTA                        '+
            '        ,VALOR                            '+
            '        ,((CASE WHEN TIPOCONTA=''R''      '+
            '                THEN VALOR                '+
            '                ELSE VALOR*(-1) END) +    '+
            '          (SELECT SALDO                   '+
            '             FROM public.saldoextrato     '+
            '            ORDER BY IDSALDOEXTRATO DESC  '+
            '            LIMIT 1)                      '+
            '        ) SALDO                           '+
            '        ,DESCRICAO                        '+
            '        ,IDCONTA                          '+
            '  FROM public.conta                       '+
            '  WHERE IDCONTA= :pIDCONTA                ';
end;

end.
