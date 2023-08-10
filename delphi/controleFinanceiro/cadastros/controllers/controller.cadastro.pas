unit controller.cadastro;

interface

uses
  consts.nomeCadastros,
  model.cadastro.interfaces,
  controller.cadastro.interfaces;

type
  TControllerCadastro = class(TInterfacedObject, iControllerCadastros)
  private
    FTypeCadastro: TTypeCadastros;

    function Cadastro: iCadastros;
    function TypeCadastro(_TypeCadastro: TTypeCadastros): iControllerCadastros; overload;
    function TypeCadastro: TTypeCadastros; overload;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: iControllerCadastros;

  end;

implementation

uses
  model.cadastro.factory;

{ TControllerPessoa }
constructor TControllerCadastro.Create;
begin
end;

destructor TControllerCadastro.Destroy;
begin
  inherited;
end;

function TControllerCadastro.Cadastro: iCadastros;
begin
  Result := TModelCadastroFactory
              .New
                .GerarCadastro(FTypeCadastro);
end;

class function TControllerCadastro.New: iControllerCadastros;
begin
  Result := Self.Create;
end;

function TControllerCadastro.TypeCadastro(_TypeCadastro: TTypeCadastros): iControllerCadastros;
begin
  Result := Self;
  FTypeCadastro := _TypeCadastro;
end;

function TControllerCadastro.TypeCadastro: TTypeCadastros;
begin
  Result := FTypeCadastro;
end;

end.

