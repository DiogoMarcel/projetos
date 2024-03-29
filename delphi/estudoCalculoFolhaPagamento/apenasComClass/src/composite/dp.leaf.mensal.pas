unit dp.leaf.mensal;

interface

uses
  System.SysUtils
  ,System.Classes
  ,dp.component;

type
  { Leaf - Mensal }
  TCalculoMensal = class(TCalculo)
  public
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso); override;
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

procedure TCalculoMensal.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;

end.
