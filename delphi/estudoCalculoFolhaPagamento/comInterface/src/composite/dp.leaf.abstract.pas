unit dp.leaf.abstract;

interface

uses
  dp.component;

type
  { Leaf - Abstract }
  TCalculoAbstract = class abstract (TInterfacedObject, ICalculo)
  protected
    FExibirProcesso: TExibirProcesso;

  public
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);

    { Operation }
    function ExecutarCalculo: double; virtual; abstract;
  end;

implementation

{ TCalculoAbstract }

procedure TCalculoAbstract.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;

end.
