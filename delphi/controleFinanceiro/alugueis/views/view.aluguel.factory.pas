unit view.aluguel.factory;

interface

uses
  Vcl.ActnList,
  System.SysUtils;

type
  iAbrirAlugueis = interface
    ['{025BFF0F-1BCA-466C-96C5-6A1EED2B34BC}']
    procedure AbrirAluguel(_AAction: TAction);
  end;

type
  TAbrirAlugueisFactory = class(TInterfacedObject, iAbrirAlugueis)
  private
    procedure AbrirAluguel(_AAction: TAction);
  public
    class function New: iAbrirAlugueis;
  end;

implementation

uses
  view.aluguel.lancamento;

{ TAbrirAlugueisFactory }

class function TAbrirAlugueisFactory.New: iAbrirAlugueis;
begin
  Result := Self.Create;
end;

procedure TAbrirAlugueisFactory.AbrirAluguel(_AAction: TAction);
begin
  if String(_AAction.Name).Equals('algCasa') then
  begin
    TformAluguelLancamento.AbrirAluguel;
  end;
end;

end.
