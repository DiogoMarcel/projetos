unit consts.SQLs;

interface

type
  TSQLEnum = (
     sqlNull

    {Menu - Resumo}
    ,sqlMenuResumo
    ,sqlMenuSaldoFolha
    ,sqlMenuContaPagamentos

    {Splash - In�cio Sistema}
    ,sqlSplashContaPagamentosPendentes

    {Geral}
    ,sqlFrameConta
    ,sqlFrameSaldoPortador
    ,sqlConsultaGradeConta
    ,sqlConsultaGradeSaldoPortador

    {Relat�rios}
    ,sqlSaldoDetalhadoPortador
    ,sqlSaldoDetalhadoPortadorGrafico

    {Conta Pagamentos - Comandos}
    ,sqlContaPgtoUpdateBaixaEfetuada

    {Aluguel}
    ,sqlAluguelHistorico
    ,sqlAluguelReceberPagar
    ,sqlAluguelTotalReceberPagar
    ,sqlAluguelCompReceberPagar
    ,sqlAluguelTotalCompReceberPagar
    ,sqlAluguelInsertHistorico
    ,sqlAluguelInserirContas
    ,sqlAluguelDeleteCobranca
    ,sqlAluguelUpdatePagamento
    ,sqlAluguelUpdatePagamentoComp
    ,sqlAluguelContaIncluir
    ,sqlAluguelContaEditar

    {Lookups}
    ,sqlLookupMembroFamilia
    ,sqlLookupCredor
    ,sqlLookupCartao
    ,sqlLookupSaldoPortador
  );

implementation

end.
