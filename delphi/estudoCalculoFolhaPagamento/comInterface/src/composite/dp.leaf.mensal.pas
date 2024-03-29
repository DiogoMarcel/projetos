unit dp.leaf.mensal;

interface

uses
  System.SysUtils
  ,dp.component
  ,dp.leaf.abstract;

type
  { Leaf - Mensal }
  TCalculoMensal = class(TCalculoAbstract)
  public
    { Operation }
    function ExecutarCalculo: double; override;
  end;

implementation

{ TCalculoMensal }

function TCalculoMensal.ExecutarCalculo: double;
begin
  //  APLICAR REGRA
  Result := 20000.00;

  if Assigned(FExibirProcesso) then
    FExibirProcesso('Cálculo Mensal <TCalculoMensal>'+ sLineBreak +' - Result: '+ FormatFloat(',0.00', Result));
end;

end.
