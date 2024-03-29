unit dp.leaf.decSalario;

interface

uses
  System.SysUtils
  ,System.Classes
  ,dp.component;

type
  { Leaf - 13Salario }
  TCalculo13Salario = class(TCalculo)
  public
    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso); override;
    { Operation }
    function ExecutarCalculo: double; override;
  end;

implementation

{ TCalculo13Salario }

function TCalculo13Salario.ExecutarCalculo: double;
begin
  //  APLICAR REGRA
  Result := 40000.00;

  if Assigned(FExibirProcesso) then
    FExibirProcesso('Cálculo 13° Salário <TCalculo13Salario>'+ sLineBreak +' - Result: '+ FormatFloat(',0.00', Result));
end;

procedure TCalculo13Salario.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;

end.
