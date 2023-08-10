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
  view.relatorio.saldodetalhadoportador.grafico,
  view.relatorio.saldodetalhadoportador;

{ TAbrirRelatoriosFactory }

class function TAbrirRelatoriosFactory.New: iAbrirRelatorios;
begin
  Result := Self.Create;
end;

procedure TAbrirRelatoriosFactory.AbrirRelatorio(_AAction: TAction);
begin
  if String(_AAction.Name).Equals('relSaldoDetalhado') then
  begin
    TformSaldoDetalhadoPortador.AbrirRelatorio;
  end
  else if String(_AAction.Name).Equals('relSaldoDetalhadoGrafico') then
  begin
    TformSaldoDetalhadoPortadorGrafico.AbrirRelatorio;
  end;
end;

end.
