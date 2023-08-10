unit lib.DAO.conexao;

interface

uses
  lib.conexao.db.interfaces;

type
  TLibConexaoDB = class(TInterfacedObject, IConexaoAbstract)
  private
    function StartConexao: IConexaoAbstract;

  public
    Constructor Create;
    Destructor Destroy; override;

    class function New: IConexaoAbstract;

  end;

implementation

uses
  Vcl.Forms,
  model.lib.aguarde,
  lib.DAO.dataModel;

{ TLibConfigConexaoDB }

constructor TLibConexaoDB.Create;
begin
end;

destructor TLibConexaoDB.Destroy;
begin
  inherited;
end;

class function TLibConexaoDB.New: IConexaoAbstract;
begin
  Result := Self.Create;
end;

function TLibConexaoDB.StartConexao: IConexaoAbstract;
begin
  Result := Self;

  TModelAguarde.New(Application).ExibirAguarde;

  TdmConexaoDB.ObterInstanciaConexaoDB.StartConexao;
end;

end.

