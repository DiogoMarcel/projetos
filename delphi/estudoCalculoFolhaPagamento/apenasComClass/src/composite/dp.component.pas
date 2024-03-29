unit dp.component;

interface

type
  TExibirProcesso = procedure(_ADescricao: string) of object;

  { Component }
  {Interface / class abstract implementada no Leaf e Composite}
  {TCalculo = interface}
  TCalculo = class abstract
  protected
    FExibirProcesso: TExibirProcesso;

  public
    {*Apenas enfeite do memo inicial}
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso); virtual; abstract;

    { Operation }
    function ExecutarCalculo: double; virtual; abstract;
  end;

implementation

end.
