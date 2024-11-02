unit lib.sql.geral;

interface

uses
  dialogs,
  consts.SQLs,
  System.SysUtils,
  lib.sql.interfaces;

type
  TSQLGeral = class(TInterfacedObject, iSQLDefinicao, iSQLResultado)
  private
    FSQLEnum: TSQLEnum;

    function PegarSQLFrameConta: string;
    function PegarSQLFrameSaldoPortador: string;
    function PegarSQLConsultaGradeConta: string;
    function PegarSQLGradeSaldoPortador: string;
    function PegarSQLSaldoDetalhadoPortador: string;
    function PegarSQLSaldoDetalhadoPortadorGrafico: string;
    function PegarSQLSaldoExtrato: string;
    function PegarSQLRelatorioAbastecimentos: string;

  public
    function SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
    function PegarSQL: string;

    class function New: iSQLDefinicao;
  end;

implementation

{ TSQLGeral }

function TSQLGeral.PegarSQL: string;
begin
  case FSQLEnum of
    sqlFrameConta                    : Result := PegarSQLFrameConta;
    sqlFrameSaldoPortador            : Result := PegarSQLFrameSaldoPortador;
    sqlConsultaGradeConta            : Result := PegarSQLConsultaGradeConta;
    sqlConsultaGradeSaldoPortador    : Result := PegarSQLGradeSaldoPortador;
    sqlSaldoDetalhadoPortador        : Result := PegarSQLSaldoDetalhadoPortador;
    sqlSaldoDetalhadoPortadorGrafico : Result := PegarSQLSaldoDetalhadoPortadorGrafico;
    sqlSaldoExtrato                  : Result := PegarSQLSaldoExtrato;
    sqlRelatorioAbastecimentos       : Result := PegarSQLRelatorioAbastecimentos;
    else
      raise Exception.Create('SQL Inválido para a classe Geral!');
  end;
end;

class function TSQLGeral.New: iSQLDefinicao;
begin
  Result := Self.Create;
end;

function TSQLGeral.SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
begin
  Result := Self;

  FSQLEnum := _ASQLEnum;
end;

function TSQLGeral.PegarSQLFrameConta: string;
begin
  Result := 'SELECT C.IDCONTA                                           '+
            '      ,C.DESCRICAO                                         '+
            '      ,C.VALOR                                             '+
            '      ,C.CONTAANUAL                                        '+
            '      ,C.PERTENCEAFOLHA                                    '+
            '      ,C.DEBITACARTAO                                      '+
            '      ,C.DEBITOAUTO                                        '+
            '      ,C.PAGAMENTOMANUAL                                   '+
            '      ,COALESCE(C.ID_MEMBROFAMILIA, 0) AS ID_MEMBROFAMILIA '+
            '      ,:pValorTotal as VALORTOTAL                          '+
            '      ,:pNome as NOME                                      '+
            ' FROM CONTA C                                              '+
            ' WHERE C.TIPOCONTA = :pTipoConta                           '+
            '   AND COALESCE(C.ID_MEMBROFAMILIA, 0)= :pMembroFamilia    '+
            ' ORDER BY COALESCE(C.ID_MEMBROFAMILIA, 0) DESC             '+
            '         ,C.IDCONTA                                        ';
end;

function TSQLGeral.PegarSQLFrameSaldoPortador: string;
begin
  Result := 'SELECT	M.IDMEMBROFAMILIA                                                               '+
            '      ,M.NOME AS MEMBRO                                                                '+
            '      ,P.NOMEPORTADOR                                                                  '+
            '      ,CAST(                                                                           '+
            '      COALESCE(P.AGENCIA, '''')                                                        '+
            '      || CASE WHEN COALESCE(P.NUMEROCONTA, '''') <> '''' THEN '' / '' ELSE '''' END || '+
            '      COALESCE(P.NUMEROCONTA, '''')                                                    '+
            '      || CASE WHEN COALESCE(P.DIGITOCONTA, '''') <> '''' THEN ''-'' ELSE '''' END ||   '+
            '      COALESCE(P.DIGITOCONTA, '''') AS VARCHAR(50)) AS CONTA                           '+
            '      ,T.DESCRICAOTIPOCONTA                                                            '+
            '      ,S.VALOR                                                                         '+
            '      ,COALESCE(S.RESERVADO OR S.CONTACAPITAL, FALSE) AS RESERVADOCAPITAL              '+
            '      ,P.IMGPORTADOR                                                                   '+
            '      ,:pSaldoGeral as SALDOGERAL                                                      '+
            ' FROM SALDOPORTADOR S                                                                  '+
            ' JOIN PORTADOR P ON S.ID_PORTADOR = P.IDPORTADOR                                       '+
            ' JOIN MEMBROFAMILIA M ON P.ID_MEMBROFAMILIA = M.IDMEMBROFAMILIA                        '+
            ' JOIN TIPOCONTAPORTADOR T ON T.TIPOCONTA = P.TIPOCONTA                                 '+
            ' WHERE M.IDMEMBROFAMILIA = :PIDMEMBROFAMILIA                                           '+
            ' ORDER BY M.IDMEMBROFAMILIA DESC                                                       '+
            '   ,COALESCE(S.RESERVADO, FALSE)                                                       '+
            '   ,COALESCE(S.CONTACAPITAL, FALSE)                                                    '+
            '   ,P.IDPORTADOR                                                                       ';
end;

function TSQLGeral.PegarSQLGradeSaldoPortador: string;
begin
  Result := 'SELECT SUM(S.VALOR) AS VALORTOTAL                               '+
            '      ,M.IDMEMBROFAMILIA                                        '+
            '      ,M.NOME                                                   '+
            ' FROM SALDOPORTADOR S                                           '+
            ' JOIN PORTADOR P ON S.ID_PORTADOR = P.IDPORTADOR                '+
            ' JOIN MEMBROFAMILIA M ON P.ID_MEMBROFAMILIA = M.IDMEMBROFAMILIA '+
            ' WHERE NOT COALESCE(S.RESERVADO, FALSE)                         '+
            '   AND NOT COALESCE(S.CONTACAPITAL, FALSE)                      '+
            ' GROUP BY M.IDMEMBROFAMILIA                                     ';
end;

function TSQLGeral.PegarSQLSaldoDetalhadoPortador: string;
begin
  Result := 'SELECT IDSALDODETALHADOPORTADOR                         '+
            '       ,CAST( TRIM(TO_CHAR(DATAALTERACAO, ''TMMonth'')) '+
            '              || '' / '' ||                             '+
            '              TRIM(TO_CHAR(DATAALTERACAO, ''YYYY''))    '+
            '        AS VARCHAR(30)) AS DATAALTERACAO                '+
            '       ,SALDOTOTAL                                      '+
            '       ,SALDODISPONIVEL                                 '+
            '       ,DIFERENCA                                       '+
            '       ,ACUMULADO                                       '+
            ' FROM SALDODETALHADOPORTADOR                            '+
            ' ORDER BY 1 DESC                                        ';
end;

function TSQLGeral.PegarSQLSaldoDetalhadoPortadorGrafico: string;
begin
  Result := 'SELECT DATAALTERACAO                                                                      '+
            '      ,SALDOTOTAL                                                                         '+
            'FROM (                                                                                    '+
            '  SELECT SDP.IDSALDODETALHADOPORTADOR                                                     '+
            '        ,CAST(TRIM(TO_CHAR(SDP.DATAALTERACAO, ''TMMonth'')) || '' / ''                    '+
            '           || TRIM(TO_CHAR(SDP.DATAALTERACAO, ''YYYY'')) AS VARCHAR(30)) AS DATAALTERACAO '+
            '        ,SALDOTOTAL                                                                       '+
            '  FROM SALDODETALHADOPORTADOR SDP                                                         '+
            '  JOIN (                                                                                  '+
            '    SELECT MAX(DATAALTERACAO) AS DATAALTERACAO                                            '+
            '          ,MAX(IDSALDODETALHADOPORTADOR) AS IDSALDODETALHADOPORTADOR                      '+
            '    FROM SALDODETALHADOPORTADOR                                                           '+
            '    GROUP BY EXTRACT(MONTH FROM DATAALTERACAO)                                            '+
            '            ,EXTRACT(YEAR FROM DATAALTERACAO)                                             '+
            '    ORDER BY EXTRACT(YEAR FROM DATAALTERACAO) DESC                                        '+
            '            ,EXTRACT(MONTH FROM DATAALTERACAO) DESC                                       '+
            '  ) AS SUBSDP ON SUBSDP.DATAALTERACAO=SDP.DATAALTERACAO                                   '+
            '             AND SUBSDP.IDSALDODETALHADOPORTADOR=SDP.IDSALDODETALHADOPORTADOR             '+
            '  ORDER BY SDP.IDSALDODETALHADOPORTADOR DESC                                              '+
            '  LIMIT 13                                                                                '+
            ') SB ORDER BY SB.IDSALDODETALHADOPORTADOR                                                 ';
end;

function TSQLGeral.PegarSQLConsultaGradeConta: string;
begin
  Result := ' SELECT SUM(                                                         '+
            '           CASE WHEN ((COALESCE(C.DEBITACARTAO, FALSE))              '+
            '                       OR                                            '+
            '                      (COALESCE(C.CONTAANUAL, FALSE)))               '+
            '                THEN 0.0                                             '+
            '                ELSE COALESCE(C.VALOR, 0) END                        '+
            '        ) AS VALORTOTAL                                              '+
            '       ,COALESCE(C.ID_MEMBROFAMILIA, 0) AS ID_MEMBROFAMILIA          '+
            '       ,COALESCE(M.NOME, ''Compartilhado'') AS NOME                  '+
            '       ,C.TIPOCONTA                                                  '+
            ' FROM CONTA C                                                        '+
            ' LEFT JOIN MEMBROFAMILIA M ON C.ID_MEMBROFAMILIA = M.IDMEMBROFAMILIA '+
            ' WHERE C.TIPOCONTA= :pTipoConta                                      '+
            ' GROUP BY C.ID_MEMBROFAMILIA                                         '+
            '         ,M.NOME                                                     '+
            '         ,C.TIPOCONTA                                                ';
end;

function TSQLGeral.PegarSQLSaldoExtrato: string;
begin
  Result := 'SELECT SE.IDSALDOEXTRATO                                              '+
            '     , CAST(TRIM(TO_CHAR(SE.DATALANCAMENTO, ''DD''))      ||'' - ''|| '+
            '            TRIM(TO_CHAR(SE.DATALANCAMENTO, ''TMMonth'')) ||'' - ''|| '+
            '            TRIM(TO_CHAR(SE.DATALANCAMENTO, ''YYYY'')) AS VARCHAR(30) '+
            '       ) AS DATALANCAMENTO                                            '+
            '     , SE.DESCRICAO                                                   '+
            '     , SE.TIPOSALDO                                                   '+
            '     , SE.VALOR                                                       '+
            '     , SE.SALDO                                                       '+
            '     , ROW_NUMBER() OVER(                                             '+
            '       PARTITION BY SE.DATALANCAMENTO                                 '+
            '       ORDER BY SE.DATALANCAMENTO DESC) EXIBIRDATA                    '+
            ' FROM SALDOEXTRATO SE                                                 '+
            ' ORDER BY SE.IDSALDOEXTRATO DESC                                      ';
end;

function TSQLGeral.PegarSQLRelatorioAbastecimentos: string;
begin
  Result := ' SELECT SQLUN.IDABASTECIMENTO '+
            '    ,SQLUN.OBSERVACAO '+
            '    ,CAST(CASE WHEN ORIGEMDADO = 1 '+
            '               THEN CAST(TRIM(TO_CHAR(SQLUN.DATAABASTECIMENTO, ''TMMonth'')) || '' / '' || ' +
            '                         TRIM(TO_CHAR(SQLUN.DATAABASTECIMENTO, ''YYYY'')) AS VARCHAR(30)) '+
            '               ELSE CAST(TO_CHAR(SQLUN.DATAABASTECIMENTO, ''DD-MM-YYYY'') AS VARCHAR(30)) '+
            '          END AS VARCHAR(30)) AS DATAABASTECIMENTO ' +
            '    ,SQLUN.TOTALABASTECIMENTO ' +
            '    ,SQLUN.DIFTOTALABASTECIMENTO ' +
            '    ,SQLUN.KMCARRO ' +
            '    ,SQLUN.DIFKMCARRO ' +
            '    ,SQLUN.QUANTIDADELITROS ' +
            '    ,SQLUN.DIFQUANTIDADELITROS ' +
            '    ,SQLUN.MEDIA ' +
            '    ,SQLUN.VALORLITRO ' +
            '    ,SQLUN.ANO ' +
            '    ,SQLUN.MES ' +
            '    ,SQLUN.ORIGEMDADO ' +
            '  FROM ( ' +
            '    SELECT A1.IDABASTECIMENTO ' +
            '      ,A1.OBSERVACAO ' +
            '      ,A1.DATAABASTECIMENTO ' +
            '      ,A1.TOTALABASTECIMENTO ' +
            '      ,CAST(A1.TOTALABASTECIMENTO - A2.TOTALABASTECIMENTO AS NUMERIC(18, 4)) AS DIFTOTALABASTECIMENTO ' +
            '      ,A1.KMCARRO ' +
            '      ,CAST(A1.KMCARRO - A2.KMCARRO AS NUMERIC(18, 4)) AS DIFKMCARRO ' +
            '      ,A1.QUANTIDADELITROS ' +
            '      ,CAST(A1.QUANTIDADELITROS - A2.QUANTIDADELITROS AS NUMERIC(18, 4)) AS DIFQUANTIDADELITROS ' +
            '      ,CAST(((A1.KMCARRO - A2.KMCARRO) / A1.QUANTIDADELITROS) AS NUMERIC(18, 4)) AS MEDIA ' +
            '      ,CAST(A1.TOTALABASTECIMENTO / A1.QUANTIDADELITROS AS NUMERIC(18, 4)) AS VALORLITRO ' +
            '      ,CAST(EXTRACT(YEAR FROM A1.DATAABASTECIMENTO) AS INTEGER) ANO ' +
            '      ,CAST(EXTRACT(MONTH FROM A1.DATAABASTECIMENTO) AS INTEGER) MES ' +
            '      ,CAST(0 AS SMALLINT) ORIGEMDADO ' +
            '    FROM ( ' +
            '      SELECT *,ROW_NUMBER() OVER (ORDER BY 1) AS SERIAL_NUMBER ' +
            '      FROM ( ' +
            '        SELECT IDABASTECIMENTO ' +
            '              ,OBSERVACAO ' +
            '              ,DATAABASTECIMENTO ' +
            '              ,TOTALABASTECIMENTO ' +
            '              ,KMCARRO ' +
            '              ,QUANTIDADELITROS ' +
            '        FROM ABASTECIMENTOS ' +
            '        ORDER BY IDABASTECIMENTO ' +
            '        ) SQ ' +
            '      ) A1 ' +
            '    LEFT JOIN ( ' +
            '      SELECT *,(ROW_NUMBER() OVER (ORDER BY 1) + 1) AS SERIAL_NUMBER ' +
            '      FROM ( ' +
            '        SELECT IDABASTECIMENTO ' +
            '              ,OBSERVACAO ' +
            '              ,DATAABASTECIMENTO ' +
            '              ,TOTALABASTECIMENTO ' +
            '              ,KMCARRO ' +
            '              ,QUANTIDADELITROS ' +
            '        FROM ABASTECIMENTOS ' +
            '        ORDER BY IDABASTECIMENTO ' +
            '        ) SQ ' +
            '      ) A2 ON A1.SERIAL_NUMBER = A2.SERIAL_NUMBER ' +
            '    UNION ALL ' +
            '    SELECT CAST(0 AS BIGINT) IDABASTECIMENTO ' +
            '          ,CAST('' - Totais mensal'' AS VARCHAR(80)) OBSERVACAO ' +
            '          ,CAST(TO_DATE(EXTRACT(YEAR  FROM DATAABASTECIMENTO) || ''-'' || ' +
            '                        EXTRACT(MONTH FROM DATAABASTECIMENTO) || ' +
            '                        ''-01'', ''YYYY-MM-DD'') AS DATE) DATAABASTECIMENTO ' +
            '          ,SUM(TOTALABASTECIMENTO) AS TOTALABASTECIMENTO ' +
            '          ,CAST(NULL AS NUMERIC(18, 4)) DIFTOTALABASTECIMENTO ' +
            '          ,CAST(NULL AS INTEGER) KMCARRO ' +
            '          ,CAST(NULL AS NUMERIC(18, 4)) DIFKMCARRO ' +
            '          ,SUM(QUANTIDADELITROS) AS QUANTIDADELITROS ' +
            '          ,CAST(NULL AS NUMERIC(18, 4)) DIFQUANTIDADELITROS ' +
            '          ,CAST(NULL AS NUMERIC(18, 4)) MEDIA ' +
            '          ,CAST(NULL AS NUMERIC(18, 4)) VALORLITRO ' +
            '          ,CAST(EXTRACT(YEAR FROM DATAABASTECIMENTO) AS INTEGER) ANO ' +
            '          ,CAST(EXTRACT(MONTH FROM DATAABASTECIMENTO) AS INTEGER) MES ' +
            '          ,CAST(1 AS SMALLINT) ORIGEMDADO ' +
            '    FROM ABASTECIMENTOS ' +
            '    GROUP BY EXTRACT(YEAR FROM DATAABASTECIMENTO) ' +
            '            ,EXTRACT(MONTH FROM DATAABASTECIMENTO) ' +
            '    ORDER BY ANO DESC ' +
            '            ,MES DESC ' +
            '            ,IDABASTECIMENTO DESC ' +
            ' ) SQLUN ' ;
end;

end.
