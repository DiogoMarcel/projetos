unit dp.leaf.rescisao;

interface

uses
  System.SysUtils
  ,System.Classes
  ,dp.component;

type
  { Leaf - Mensal Rescisao }
  TCalculoRescisao = class(TCalculo)
  public
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso); override;
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

procedure TCalculoRescisao.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;

end.
