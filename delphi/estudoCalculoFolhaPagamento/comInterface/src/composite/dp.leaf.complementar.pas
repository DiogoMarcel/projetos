unit dp.leaf.complementar;

interface

uses
  System.SysUtils
  ,dp.component
  ,dp.leaf.abstract;

type
  { Leaf - Complementar }
  {TCalculoComplementar = class(TInterfacedObject, ICalculo)
    - Op��o para n�o usar o abstract
    - Demais c�digos abaixo comentados devem ser replicados nos demais leaf!}
  TCalculoComplementar = class(TCalculoAbstract)
  {private
    FExibirProcesso: TExibirProcesso;

  public
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);}

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
    FExibirProcesso('C�lculo Complementar <TCalculoComplementar>'+ sLineBreak +' - Result: '+ FormatFloat(',0.00', Result));
end;

{procedure TCalculoComplementar.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;}

end.
