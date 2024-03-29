unit dp.leaf.complementar;

interface

uses
  System.SysUtils
  ,System.Classes
  ,dp.component;

type
  { Leaf - Complementar }
  TCalculoComplementar = class(TCalculo)
  public
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso); override;
    { Operation }
    function ExecutarCalculo: double; override;
  end;

implementation


{ TCalculoComplementar }

function TCalculoComplementar.ExecutarCalculo: double;
begin
  //  APLICAR REGRA
  Result := 8000.00;

  if Assigned(FExibirProcesso) then
    FExibirProcesso('Cálculo Complementar <TCalculoComplementar>'+ sLineBreak +' - Result: '+ FormatFloat(',0.00', Result));
end;

procedure TCalculoComplementar.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;

end.
