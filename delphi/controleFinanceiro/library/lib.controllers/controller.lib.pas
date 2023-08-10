unit controller.lib;

interface

uses
  System.Classes,
  model.lib.interfaces,
  lib.conexao.db.interfaces,
  controller.lib.interfaces;

type
  TControllerLibrary = class(TInterfacedObject, iControllerLibrary)
  private
    function Lib: iModelLibrary;
    function Conexao: IConexaoAbstract;
    function Aguarde(_AOwner: TComponent): iModelAguarde;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: iControllerLibrary;

  end;

implementation

uses
  model.lib,
  model.lib.aguarde,
  lib.conexao.factory;

{ TControllerLibrary }

constructor TControllerLibrary.Create;
begin
end;

destructor TControllerLibrary.Destroy;
begin
  inherited;
end;

function TControllerLibrary.Lib: iModelLibrary;
begin
  Result := TModelLibrary.New;
end;

class function TControllerLibrary.New: iControllerLibrary;
begin
  Result := Self.Create;
end;

function TControllerLibrary.Aguarde(_AOwner: TComponent): iModelAguarde;
begin
  Result := TModelAguarde.New(_AOwner);
end;

function TControllerLibrary.Conexao: IConexaoAbstract;
begin
  Result := TFactoryConexao.New.ObterInstanciaConexao;
end;

end.
