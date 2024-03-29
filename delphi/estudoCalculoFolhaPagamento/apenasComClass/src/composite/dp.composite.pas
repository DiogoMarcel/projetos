unit dp.composite;

interface

uses
  System.SysUtils
  ,System.Generics.Collections
  ,Classes
  ,dp.component
  ,dp.leaf.complementar
  ,dp.leaf.mensal
  ,dp.leaf.ferias
  ,dp.leaf.rescisao
  ,dp.leaf.decSalario;

type
  { Composite }
  TPacoteCalculo = class(TCalculo)
  private
    {Lista de cálculos para executar}
    FCalculos: TObjectList<TCalculo>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso); override;

    { Operation }
    function ExecutarCalculo: double; override;

    function AdicionarCalculo(_ACalculo: TCalculo): TPacoteCalculo;
    function LimparLista: TPacoteCalculo;
  end;


implementation

{ TPacoteCalculo }

function TPacoteCalculo.AdicionarCalculo(_ACalculo: TCalculo): TPacoteCalculo;
begin
  Result := Self;

  FCalculos.Add(_ACalculo);
end;

procedure TPacoteCalculo.AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);
begin
  FExibirProcesso := _AProcesso;
end;

constructor TPacoteCalculo.Create;
begin
  FCalculos := TObjectList<TCalculo>.Create;
end;

destructor TPacoteCalculo.Destroy;
begin
  FreeAndNil(FCalculos);
  inherited;
end;

function TPacoteCalculo.ExecutarCalculo: double;
var
  ACalculo: TCalculo;
begin
  if Assigned(FExibirProcesso) then
    FExibirProcesso('Iniciando execução da lista de cálculo...');

  result := 0;
  for ACalculo in FCalculos do
  begin
    // Chama o Operation do Leaf

    {Problema de não ser uma interface - CAST e mais linhas de código - Interface iria apenas criar antes de chegar aqui}
    if ACalculo is TCalculoMensal       then result := result + (ACalculo as TCalculoMensal).ExecutarCalculo;
    if ACalculo is TCalculoFerias       then result := result + (ACalculo as TCalculoFerias).ExecutarCalculo;
    if ACalculo is TCalculoRescisao     then result := result + (ACalculo as TCalculoRescisao).ExecutarCalculo;
    if ACalculo is TCalculo13Salario    then result := result + (ACalculo as TCalculo13Salario).ExecutarCalculo;
    if ACalculo is TCalculoComplementar then result := result + (ACalculo as TCalculoComplementar).ExecutarCalculo;
  end;

  if Assigned(FExibirProcesso) then
    FExibirProcesso('Cálculo finalizado!');
end;

function TPacoteCalculo.LimparLista: TPacoteCalculo;
begin
  Result := Self;

  FCalculos.Clear;
end;

end.
