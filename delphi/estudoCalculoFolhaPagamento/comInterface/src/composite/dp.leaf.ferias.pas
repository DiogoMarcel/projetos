unit dp.leaf.ferias;

interface

uses
  System.SysUtils
  ,dp.component
  ,dp.leaf.abstract;

type
  { Leaf - Ferias }
  TCalculoFerias = class(TCalculoAbstract)
  public
    { Operation }
    function ExecutarCalculo: double; override;
  end;

implementation

{ TCalculoFerias }

function TCalculoFerias.ExecutarCalculo: double;
begin
  //  APLICAR REGRA
  Result := 5000.00;

  if Assigned(FExibirProcesso) then
    FExibirProcesso('Cálculo Férias <TCalculoFerias>'+ sLineBreak +' - Result: '+ FormatFloat(',0.00', Result));
end;

end.
