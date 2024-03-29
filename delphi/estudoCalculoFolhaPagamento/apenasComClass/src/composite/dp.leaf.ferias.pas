unit dp.leaf.ferias;

interface

uses
  System.SysUtils
  ,System.Classes
  ,dp.component;

type
  { Leaf - Ferias }
  TCalculoFerias = class(TCalculo)
  public
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso); override;
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

procedure TCalculoFerias.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;

end.
