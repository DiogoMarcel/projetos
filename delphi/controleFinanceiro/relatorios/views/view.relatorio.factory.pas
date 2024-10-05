unit view.relatorio.factory;

interface

uses
  Vcl.ActnList,
  System.SysUtils;

type
  iAbrirRelatorios = interface
    ['{025BFF0F-1BCA-466C-96C5-6A1EED2B34BC}']
    procedure AbrirRelatorio(_AAction: TAction);
  end;

type
  TAbrirRelatoriosFactory = class(TInterfacedObject, iAbrirRelatorios)
  private
    procedure AbrirRelatorio(_AAction: TAction);
  public
    class function New: iAbrirRelatorios;
  end;

implementation

uses
  view.relatorio.saldoextrato,
  view.relatorio.saldodetalhes,
  view.relatorio.saldodetalhadoportador.grafico,
  view.relatorio.saldodetalhadoportador;

{ TAbrirRelatoriosFactory }

const
  RELATORIO_SALDO_DETALHADO = 'relSaldoDetalhadoPortador';
  RELATORIO_SALDO_DETALHADO_GRAFICO = 'relSaldoDetalhadoGrafico';
  RELATORIO_SALDO_EXTRATO = 'relSaldoExtrato';
  RELATORIO_SALDO_DETALHE = 'relSaldoDetalhes';

class function TAbrirRelatoriosFactory.New: iAbrirRelatorios;
begin
  Result := Self.Create;
end;

procedure TAbrirRelatoriosFactory.AbrirRelatorio(_AAction: TAction);
begin
  if String(_AAction.Name).Equals(RELATORIO_SALDO_DETALHADO) then
    TformSaldoDetalhadoPortador.AbrirRelatorio
  else if String(_AAction.Name).Equals(RELATORIO_SALDO_DETALHADO_GRAFICO) then
    TformSaldoDetalhadoPortadorGrafico.AbrirRelatorio
  else if String(_AAction.Name).Equals(RELATORIO_SALDO_EXTRATO) then
    TformSaldoExtrato.AbrirRelatorio
  else if String(_AAction.Name).Equals(RELATORIO_SALDO_DETALHE) then
    TformSaldoDetalhes.AbrirRelatorio;
end;

end.
