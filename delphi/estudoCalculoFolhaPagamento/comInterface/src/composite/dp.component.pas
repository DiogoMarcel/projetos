unit dp.component;

interface

type
  TExibirProcesso = procedure(_ADescricao: string) of object;

type
  { Component }
  {Interface / class abstract implementada no Leaf e Composite}
  ICalculo = interface
  ['{421C2A45-5283-42F8-8B3E-BCADFEE87868}']

    {*Apenas enfeite do memo inicial}
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);

    { Operation }
    function ExecutarCalculo: double;
  end;

implementation

end.
