unit lib.sql.resumomenu;

interface

uses
  consts.SQLs,
  System.SysUtils,
  lib.sql.interfaces;

type
  TSQLResumoMenu = class(TInterfacedObject, iSQLDefinicao, iSQLResultado)
  private
    FSQLEnum: TSQLEnum;

    function PegarSQLMenuResumo: string;
    function PegarSQLSaldoFolhaMenu: string;
    function PegarSQLContaPagamentos: string;

  public
    function SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
    function PegarSQL: string;

    class function New: iSQLDefinicao;
  end;

implementation

{ TSQLResumoMenu }

function TSQLResumoMenu.PegarSQL: string;
begin
  case FSQLEnum of
    sqlMenuResumo         : Result := PegarSQLMenuResumo;
    sqlMenuSaldoFolha     : Result := PegarSQLSaldoFolhaMenu;
    sqlMenuContaPagamentos: Result := PegarSQLContaPagamentos;
    else
      raise Exception.Create('SQL Inválido para a classe Resumo Menu!');
  end;
end;

class function TSQLResumoMenu.New: iSQLDefinicao;
begin
  Result := Self.Create;
end;

function TSQLResumoMenu.SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
begin
  Result := Self;

  FSQLEnum := _ASQLEnum;
end;

function TSQLResumoMenu.PegarSQLMenuResumo: string;
const
  TAMANHO_CP_CHAR = 40;

  SQL_UNION          = ' UNION ';
  TIT_SALDOBANCARIO  = '''Saldo Bancário¹''';      ORD_SALDOBANCARIO  = 1;
  TIT_SALDOMENSAL    = '''Saldo Mensal''';         ORD_SALDOMENSAL    = 2;
  TIT_RECEITA        = '''Receita''';              ORD_RECEITA        = 3;
  TIT_DESPESA        = '''Despesa''';              ORD_DESPESA        = 4;
  TIT_SALDOFGTS      = '''Saldo FGTS''';           ORD_SALDOFGTS      = 5;
  TIT_VALORRESERVADO = '''Valor Reservado''';      ORD_VALORRESERVADO = 6;
  TIT_DIVATUALANUAL  = '''Dívida Atual/Anual''';   ORD_DIVATUALANUAL  = 7;
  TIT_DIFRESERVADO   = '''Diferença Reservado²'''; ORD_DIFRESERVADO   = 8;
  TIT_SALDOGERALTOT  = '''Saldo Geral com FGTS'''; ORD_SALDOGERALTOT  = 9;
  TIT_SALDOTOTAL     = '''Saldo Total (1+2)''';    ORD_SALDOTOTAL     = 10;

  function SQL_SaldoBancario: string;
  begin
    Result := 'SELECT CAST('+ TIT_SALDOBANCARIO +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '        COALESCE(SUM(S.VALOR), 0.0) AS VALOR,                                              '+
              '        '+ ORD_SALDOBANCARIO.ToString +' AS ORDEM                                          '+
              'FROM SALDOPORTADOR S                                                                       '+
              'WHERE NOT COALESCE(S.CONTACAPITAL, FALSE)                                                  '+
              '  AND NOT COALESCE(S.RESERVADO, FALSE)                                                     ';
  end;

  function SQL_SaldoMensal: string;
  begin
    Result := 'SELECT CAST('+ TIT_SALDOMENSAL +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO,  '+
              '        COALESCE((SUM(CASE WHEN C.TIPOCONTA = :pRECEITA THEN C.VALOR ELSE 0.0 END)-       '+
              '         SUM(CASE WHEN C.TIPOCONTA = :pDESPESA THEN C.VALOR ELSE 0.0 END)), 0.0) AS VALOR,'+
              '        '+ ORD_SALDOMENSAL.ToString +' AS ORDEM                                           '+
              'FROM CONTA C                                                                              '+
              'WHERE NOT COALESCE(C.CONTAANUAL, FALSE)                                                   '+
              '  AND NOT COALESCE(C.DEBITACARTAO , FALSE)                                                ';
  end;

  function SQL_Receita: string;
  begin
    Result := 'SELECT CAST('+ TIT_RECEITA +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '        COALESCE(SUM(C.VALOR), 0.0) AS VALOR,                                        '+
              '        '+ ORD_RECEITA.ToString +' AS ORDEM                                          '+
              'FROM CONTA C                                                                         '+
              'WHERE C.TIPOCONTA = :pRECEITA                                                        '+
              'AND NOT COALESCE(C.CONTAANUAL, FALSE)                                                '+
              'AND NOT COALESCE(C.DEBITACARTAO , FALSE)                                             ';
  end;

  function SQL_Despesa: string;
  begin
    Result := 'SELECT CAST('+ TIT_DESPESA +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '        COALESCE(SUM(C.VALOR), 0.0) AS VALOR,                                        '+
              '        '+ ORD_DESPESA.ToString +' AS ORDEM                                          '+
              'FROM CONTA C                                                                         '+
              'WHERE C.TIPOCONTA = :pDESPESA                                                        '+
              'AND NOT COALESCE(C.CONTAANUAL, FALSE)                                                '+
              'AND NOT COALESCE(C.DEBITACARTAO , FALSE)                                             ';
  end;

  function SQL_SaldoFGTS: string;
  begin
    Result := 'SELECT CAST('+ TIT_SALDOFGTS +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '        COALESCE(SUM(S.SALDO), 0.0) AS VALOR,                                          '+
              '        '+ ORD_SALDOFGTS.ToString +' AS ORDEM                                          '+
              'FROM SALDOFGTS S                                                                       ';
  end;

  function SQL_ValorReservado: string;
  begin
    Result := 'SELECT CAST('+ TIT_VALORRESERVADO +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '        COALESCE(SUM(S.VALOR), 0.0) AS VALOR,                                               '+
              '        '+ ORD_VALORRESERVADO.ToString +' AS ORDEM                                          '+
              'FROM SALDOPORTADOR S                                                                        '+
              'WHERE COALESCE(S.RESERVADO, FALSE)                                                          ';
  end;

  function SQL_DivAtualAnual: string;
  begin
    Result := 'SELECT CAST('+ TIT_DIVATUALANUAL +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '        COALESCE((SUM(VALOR)/12) * EXTRACT(MONTH FROM CURRENT_DATE), 0.0) AS VALOR,        '+
              '        '+ ORD_DIVATUALANUAL.ToString +' AS ORDEM                                          '+
              'FROM CONTA C                                                                               '+
              'WHERE C.TIPOCONTA = :pDESPESA                                                              '+
              'AND COALESCE(C.CONTAANUAL, FALSE)                                                          ';
  end;

  function SQL_DifReservado: string;
  begin
    Result := 'SELECT CAST('+ TIT_DIFRESERVADO +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '        COALESCE(SUM(VALOR) - (                                                           '+
              '        (                                                                                 '+
              '         SELECT (SUM(VALOR)/12) AS TOTAL                                                  '+
              '         FROM CONTA                                                                       '+
              '         WHERE (COALESCE(CONTAANUAL, FALSE))                                              '+
              '        ) * EXTRACT(MONTH FROM CURRENT_DATE)                                              '+
              '        ), 0.0) AS VALOR,                                                                 '+
              '        '+ ORD_DIFRESERVADO.ToString +' AS ORDEM                                          '+
              'FROM SALDOPORTADOR                                                                        '+
              'WHERE (COALESCE(RESERVADO, FALSE))                                                        ';
  end;

  function SQL_SaldoTotal: string;
  begin
    Result := 'SELECT CAST('+ TIT_SALDOTOTAL +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '       COALESCE((S.VALOR + D.VALOR), 0.0) AS VALOR,                                     '+
              '       '+ ORD_SALDOTOTAL.ToString +' AS ORDEM                                           '+
              ' FROM ('+ SQL_SaldoBancario +') S                                                       '+
              ' JOIN ('+ SQL_DifReservado +') D ON TRUE                                                ';
  end;

  function SQL_SaldoGeralTot: string;
  begin
    Result := 'SELECT CAST('+ TIT_SALDOGERALTOT +' AS VARCHAR('+ TAMANHO_CP_CHAR.ToString +')) AS TITULO, '+
              '       COALESCE(F.VALOR + T.VALOR, 0.0) AS VALOR,                                          '+
              '        '+ ORD_SALDOGERALTOT.ToString +' AS ORDEM                                          '+
              ' FROM ('+ SQL_SaldoFGTS  +') F                                                             '+
              ' JOIN ('+ SQL_SaldoTotal +') T ON TRUE                                                     ';
  end;

begin
  Result :=          SQL_SaldoBancario  + SQL_UNION;
  Result := Result + SQL_SaldoMensal    + SQL_UNION;
  Result := Result + SQL_Receita        + SQL_UNION;
  Result := Result + SQL_Despesa        + SQL_UNION;
  Result := Result + SQL_SaldoFGTS      + SQL_UNION;
  Result := Result + SQL_ValorReservado + SQL_UNION;
  Result := Result + SQL_DivAtualAnual  + SQL_UNION;
  Result := Result + SQL_DifReservado   + SQL_UNION;
  Result := Result + SQL_SaldoTotal     + SQL_UNION;
  Result := Result + SQL_SaldoGeralTot;

  Result := 'SELECT TITULO,VALOR,ORDEM FROM ('+ Result +') S WHERE (VALOR>0.0) ORDER BY 3 ';
end;

function TSQLResumoMenu.PegarSQLSaldoFolhaMenu: string;
begin
  Result := ' SELECT SUM(VALORFOLHAMEMBRO) AS VALORFOLHAMEMBRO, M.NOME     '+
            ' FROM (                                                       '+
            '   SELECT C.ID_MEMBROFAMILIA                                  '+
            '     ,CASE                                                    '+
            '       WHEN C.TIPOCONTA = ''R'' THEN                          '+
            '         SUM(C.VALOR)                                         '+
            '       WHEN C.TIPOCONTA = ''P'' THEN                          '+
            '         SUM(C.VALOR) * (-1)                                  '+
            '     END AS VALORFOLHAMEMBRO                                  '+
            '   FROM CONTA C                                               '+
            '   WHERE COALESCE(C.PERTENCEAFOLHA, FALSE)                    '+
            '   GROUP BY C.ID_MEMBROFAMILIA, C.TIPOCONTA                   '+
            '   ORDER BY 1, 2                                              '+
            ' ) C                                                          '+
            ' JOIN MEMBROFAMILIA M ON M.IDMEMBROFAMILIA=C.ID_MEMBROFAMILIA '+
            ' GROUP BY M.NOME                                              ';
end;

function TSQLResumoMenu.PegarSQLContaPagamentos: string;
begin
  Result := 'SELECT C.DESCRICAO                         '+
            '      ,C.VALOR                             '+
            '      ,CAST(                               '+
            '         CASE WHEN C.TIPOCONTA= :pTIPOCONTA'+
            '              THEN ''-''                   '+
            '              ELSE ''+'' END AS CHAR) SINAL'+
            '      ,CP.IDCONTAPAGAMENTOS                '+
            '      ,C.IDCONTA                           '+
            ' FROM CONTAPAGAMENTOS CP                   '+
            ' JOIN CONTA C ON C.IDCONTA=CP.ID_CONTA     '+
            ' WHERE CP.DATABAIXA IS NULL                '+
            ' ORDER BY C.TIPOCONTA                      ';
end;

end.
