unit dp.leaf.rescisao;

interface

uses
  System.SysUtils
  ,dp.component
  ,dp.leaf.abstract;

type
  { Leaf - Mensal Rescisao }
  TCalculoRescisao = class(TCalculoAbstract)
  public
    { Operation }
    function ExecutarCalculo: double; override;
  end;

implementation

{ TCalculoRescisao }

function TCalculoRescisao.ExecutarCalculo: double;
begin
  //  APLICAR REGRA
  Result := 200000.00;

  if Assigned(FExibirProcesso) then
    FExibirProcesso('Cálculo Rescisão <TCalculoRescisao>'+ sLineBreak +' - Result: '+ FormatFloat(',0.00', Result));
end;

end.
