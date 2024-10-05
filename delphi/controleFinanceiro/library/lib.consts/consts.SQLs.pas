unit consts.SQLs;

interface

type
  TSQLEnum = (
     sqlNull

    {Menu - Resumo}
    ,sqlMenuResumo
    ,sqlMenuSaldoFolha
    ,sqlMenuContaPagamentos
    ,sqlMenuProjecao

    {Splash - Início Sistema}
    ,sqlSplashContaPagamentosPendentes

    {Geral}
    ,sqlFrameConta
    ,sqlFrameSaldoPortador
    ,sqlConsultaGradeConta
    ,sqlConsultaGradeSaldoPortador

    {Relatórios}
    ,sqlSaldoDetalhadoPortador
    ,sqlSaldoDetalhadoPortadorGrafico
    ,sqlSaldoExtrato

    {Conta Pagamentos - Comandos}
    ,sqlContaPgtoUpdateBaixaEfetuada
    ,sqlContaPgtoExcRegAuxContaPagamentos
    ,sqlContaPgtoUpdateSaldoExtrato
    ,sqlContaPgtoInsertSaldoExtratoConta

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
