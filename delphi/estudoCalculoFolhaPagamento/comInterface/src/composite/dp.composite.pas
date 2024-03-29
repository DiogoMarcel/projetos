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
  TPacoteCalculo = class(TInterfacedObject, ICalculo)
  private
    {Lista de cálculos para executar}
    FCalculos: TList<ICalculo>;

    FExibirProcesso: TExibirProcesso;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarExibicaoDeQualCalculo(_AProcesso: TExibirProcesso);

    { Operation }
    function ExecutarCalculo: double;

    function AdicionarCalculo(_ACalculo: ICalculo): TPacoteCalculo;
    function LimparLista: TPacoteCalculo;
  end;


implementation

{ TPacoteCalculo }

function TPacoteCalculo.AdicionarCalculo(_ACalculo: ICalculo): TPacoteCalculo;
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
  FCalculos := TList<ICalculo>.Create;
end;

destructor TPacoteCalculo.Destroy;
begin
  FreeAndNil(FCalculos);
  inherited;
end;

function TPacoteCalculo.ExecutarCalculo: double;
var
  ACalculo: ICalculo;
begin
  if Assigned(FExibirProcesso) then
    FExibirProcesso('Iniciando execução da lista de cálculo...');

  result := 0;
  for ACalculo in FCalculos do // Chama o Operation do Leaf
    result := result + ACalculo.ExecutarCalculo;

  if Assigned(FExibirProcesso) then
    FExibirProcesso('Cálculo finalizado!');
end;

function TPacoteCalculo.LimparLista: TPacoteCalculo;
begin
  Result := Self;

  FCalculos.Clear;
end;

end.
