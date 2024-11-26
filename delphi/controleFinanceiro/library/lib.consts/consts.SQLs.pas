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
    ,sqlSaldoExtrato
    ,sqlRelatorioAbastecimentos

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
    ,sqlLookupVeiculo
  );

implementation

end.
