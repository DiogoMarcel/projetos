unit lib.sql.alugueis;

interface

uses
  dialogs,
  consts.SQLs,
  System.SysUtils,
  lib.sql.interfaces;

type
  TSQLAlugueis = class(TInterfacedObject, iSQLDefinicao, iSQLResultado)
  private
    FSQLEnum: TSQLEnum;

    function PegarSQLAluguelHistorico: string;
    function PegarSQLAluguelReceberPagar: string;
    function PegarSQLAluguelTotalReceberPagar: string;
    function PegarSQLAluguelCompReceberPagar: string;
    function PegarSQLAluguelTotalCompReceberPagar: string;
    function PegarSQLInsertHistorico: string;
    function PegarSQLInsertAluguelContas: string;
    function PegarSQLAluguelDeleteCobranca: string;
    function PegarSQLAluguelUpdatePagamento: string;
    function PegarSQLAluguelUpdatePagamentoComp: string;

    function PegarSQLAluguelContaIncluir: string;
    function PegarSQLAluguelContaEditar: string;

  public
    function SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
    function PegarSQL: string;

    class function New: iSQLDefinicao;

  end;

implementation

{ TSQLAlugueis }

class function TSQLAlugueis.New: iSQLDefinicao;
begin
  Result := Self.Create;
end;

function TSQLAlugueis.PegarSQL: string;
begin
  case FSQLEnum of
    sqlAluguelHistorico              : Result := PegarSQLAluguelHistorico;
    sqlAluguelReceberPagar           : Result := PegarSQLAluguelReceberPagar;
    sqlAluguelTotalReceberPagar      : Result := PegarSQLAluguelTotalReceberPagar;
    sqlAluguelCompReceberPagar       : Result := PegarSQLAluguelCompReceberPagar;
    sqlAluguelTotalCompReceberPagar  : Result := PegarSQLAluguelTotalCompReceberPagar;
    sqlAluguelInsertHistorico        : Result := PegarSQLInsertHistorico;
    sqlAluguelInserirContas          : Result := PegarSQLInsertAluguelContas;
    sqlAluguelDeleteCobranca         : Result := PegarSQLAluguelDeleteCobranca;
    sqlAluguelUpdatePagamento        : Result := PegarSQLAluguelUpdatePagamento;
    sqlAluguelUpdatePagamentoComp    : Result := PegarSQLAluguelUpdatePagamentoComp;
    sqlAluguelContaIncluir           : Result := PegarSQLAluguelContaIncluir;
    sqlAluguelContaEditar            : Result := PegarSQLAluguelContaEditar;

    else
      raise Exception.Create('SQL Inválido para a classe Geral!');
  end;
end;

function TSQLAlugueis.SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
begin
  Result := Self;

  FSQLEnum := _ASQLEnum;
end;

function TSQLAlugueis.PegarSQLAluguelHistorico: string;
begin
  Result := ' SELECT CAST(TRIM(TO_CHAR(A.DATAALUGUEL, ''TMMonth'')) || '' / '' || '+
            '             TRIM(TO_CHAR(A.DATAALUGUEL, ''YYYY''))                  '+
            '        AS VARCHAR(30)) DATAALUGUEL                                  '+
            '       ,A.DATAPAGAMENTO                                              '+
            '       ,C.DATAPAGAMENTO PAGAMENTOCOMP                                '+
            '       ,A.IDALUGUEL                                                  '+
            '       ,A.VALORALUGUEL                                               '+
            ' FROM public.aluguel          A                                      '+
            ' LEFT JOIN public.aluguelcomp C ON A.IDALUGUEL=C.ID_ALUGUEL          '+
            ' ORDER BY A.DATAALUGUEL DESC                                         ';
end;

function TSQLAlugueis.PegarSQLAluguelCompReceberPagar: string;
begin
  Result := ' SELECT T.ID_ALUGUEL                                                 '+
            '       ,CAST(TRIM(TO_CHAR(A.DATAALUGUEL, ''TMMonth'')) || '' / '' || '+
            '             TRIM(TO_CHAR(A.DATAALUGUEL, ''YYYY''))                  '+
            '        AS VARCHAR(30)) DATAALUGUEL                                  '+
            '       ,C.DATAPAGAMENTO                                              '+
            '       ,(A.VALORALUGUEL/2) VALORALUGUEL                              '+
            '       ,T.DESCRICAO                                                  '+
            '       ,(CASE WHEN T.COMPARTILHADO=''V''                             '+
            '              THEN T.VALOR/2                                         '+
            '              ELSE T.VALOR END) VALORCONTA                           '+
            '       ,A.IDALUGUEL                                                  '+
            '       ,T.IDALUGUELCONTA                                             '+
            '       ,T.VALOR                                                      '+
            '       ,T.COMPARTILHADO                                              '+
            '       ,T.TIPOCONTA                                                  '+
            ' FROM public.aluguel 		  A                                         '+
            ' LEFT JOIN public.aluguelcomp 	C ON A.IDALUGUEL=C.ID_ALUGUEL         '+
            ' LEFT JOIN public.aluguelconta	T ON A.IDALUGUEL=T.ID_ALUGUEL         '+
            ' WHERE T.COMPARTILHADO IN (:pSomente, :pVerdadeiro)                  '+
            '   AND T.TIPOCONTA= :pTipoConta                                      '+
            ' ORDER BY T.DESCRICAO                                                ';
end;

function TSQLAlugueis.PegarSQLAluguelReceberPagar: string;
begin
  Result := ' SELECT T.ID_ALUGUEL                                                 '+
            '       ,CAST(TRIM(TO_CHAR(A.DATAALUGUEL, ''TMMonth'')) || '' / '' || '+
            '             TRIM(TO_CHAR(A.DATAALUGUEL, ''YYYY''))                  '+
            '        AS VARCHAR(30)) DATAALUGUEL                                  '+
            '       ,A.DATAPAGAMENTO                                              '+
            '       ,A.VALORALUGUEL                                               '+
            '       ,T.DESCRICAO                                                  '+
            '       ,(CASE WHEN T.COMPARTILHADO=''V''                             '+
            '              THEN T.VALOR/2                                         '+
            '              ELSE T.VALOR END) VALORCONTA                           '+
            '       ,A.IDALUGUEL                                                  '+
            '       ,T.IDALUGUELCONTA                                             '+
            '       ,T.VALOR                                                      '+
            '       ,T.COMPARTILHADO                                              '+
            '       ,T.TIPOCONTA                                                  '+
            ' FROM public.aluguel 		  A                                         '+
            ' LEFT JOIN public.aluguelconta	T ON A.IDALUGUEL=T.ID_ALUGUEL         '+
            ' WHERE T.COMPARTILHADO <> :pSomente                                  '+
            '   AND T.TIPOCONTA= :pTipoConta                                      '+
            ' ORDER BY T.DESCRICAO                                                ';
end;

function TSQLAlugueis.PegarSQLAluguelTotalCompReceberPagar: string;
begin
  Result := ' SELECT (A.VALORALUGUEL/2)-SUM(CASE WHEN T.COMPARTILHADO=''V''                                   '+
				    '        THEN (CASE WHEN T.TIPOCONTA=''R'' THEN (T.VALOR/2) ELSE (T.VALOR/2) * (-1) END)          '+
			      '        ELSE T.VALOR END) TOTAL                                                                  '+
            '       ,A.IDALUGUEL                                                                              '+
            ' FROM public.aluguel      A                                                                      '+
            ' LEFT JOIN public.aluguelconta T ON A.IDALUGUEL=T.ID_ALUGUEL                                     '+
            ' WHERE T.COMPARTILHADO IN (:pSomente, :pVerdadeiro)                                              '+
            ' GROUP BY A.VALORALUGUEL,A.IDALUGUEL                                                             ';
end;

function TSQLAlugueis.PegarSQLAluguelTotalReceberPagar: string;
begin
  Result := ' SELECT A.VALORALUGUEL+SUM(CASE WHEN T.COMPARTILHADO=''V''                                       '+
            '        THEN (CASE WHEN T.TIPOCONTA=''R'' THEN T.VALOR/2 ELSE (T.VALOR/2) * (-1) END)            '+
            '        ELSE (CASE WHEN T.TIPOCONTA=''R'' THEN T.VALOR   ELSE (T.VALOR)   * (-1) END) END) TOTAL '+
            '       ,A.IDALUGUEL                                                                              '+
            ' FROM public.aluguel      A                                                                      '+
            ' LEFT JOIN public.aluguelconta T ON A.IDALUGUEL=T.ID_ALUGUEL                                     '+
            ' WHERE T.COMPARTILHADO<> :pSomente                                                               '+
            ' GROUP BY A.VALORALUGUEL,A.IDALUGUEL                                                             ';
end;

function TSQLAlugueis.PegarSQLInsertHistorico: string;
begin
  Result := ' INSERT INTO public.aluguel (              '+
            '   DATAALUGUEL                             '+
            '   ,VALORALUGUEL                           '+
            '   )                                       '+
            ' SELECT DATAALUGUEL + interval ''1 month'' '+
            '   ,VALORALUGUEL                           '+
            ' FROM public.aluguel                       '+
            ' ORDER BY IDALUGUEL DESC LIMIT 1           ';
end;

function TSQLAlugueis.PegarSQLInsertAluguelContas: string;
begin
  Result := ' INSERT INTO PUBLIC.ALUGUELCONTA ('+
            '   ID_ALUGUEL                     '+
            '   ,TIPOCONTA                     '+
            '   ,VALOR                         '+
            '   ,DESCRICAO                     '+
            '   ,COMPARTILHADO                 '+
            '   )                              '+
            ' SELECT :pIDALUGUEL               '+
            '   ,TIPOCONTA                     '+
            '   ,VALOR                         '+
            '   ,DESCRICAO                     '+
            '   ,COMPARTILHADO                 '+
            ' FROM PUBLIC.ALUGUELCONTA         '+
            ' WHERE IDALUGUELCONTA IN (        '+
            '     1                            '+
            '     ,2                           '+
            '     ,3                           '+
            '     )                            ';
end;

function TSQLAlugueis.PegarSQLAluguelDeleteCobranca: string;
begin
  Result := 'DELETE FROM PUBLIC.ALUGUELCONTA WHERE IDALUGUELCONTA= :pIDALUGUELCONTA';
end;

function TSQLAlugueis.PegarSQLAluguelUpdatePagamento: string;
begin
  Result := 'UPDATE PUBLIC.ALUGUEL SET DATAPAGAMENTO=NOW() WHERE IDALUGUEL= :pIDALUGUEL';
end;

function TSQLAlugueis.PegarSQLAluguelUpdatePagamentoComp: string;
begin
  Result := 'INSERT INTO public.aluguelcomp (ID_ALUGUEL, DATAPAGAMENTO) VALUES (:pIDALUGUEL, NOW())';
end;

function TSQLAlugueis.PegarSQLAluguelContaIncluir: string;
begin
  Result := ' INSERT INTO PUBLIC.ALUGUELCONTA ('+
            '   ID_ALUGUEL                     '+
            '   ,TIPOCONTA                     '+
            '   ,VALOR                         '+
            '   ,DESCRICAO                     '+
            '   ,COMPARTILHADO                 '+
            '   )                              '+
            ' VALUES                           '+
            '   (:pIDALUGUEL                   '+
            '   ,:pTIPOCONTA                   '+
            '   ,:pVALOR                       '+
            '   ,:pDESCRICAO                   '+
            '   ,:pCOMPARTILHADO               '+
            ')                                 ';
end;

function TSQLAlugueis.PegarSQLAluguelContaEditar: string;
begin
  Result := ' UPDATE PUBLIC.ALUGUELCONTA  SET        '+
            '   TIPOCONTA =      :pTIPOCONTA         '+
            '   ,VALOR =         :pVALOR             '+
            '   ,DESCRICAO =     :pDESCRICAO         '+
            '   ,COMPARTILHADO = :pCOMPARTILHADO     '+
            ' WHERE IDALUGUELCONTA = :pIDALUGUELCONTA';
end;

end.
