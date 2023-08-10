unit lib.conexao.factory;

interface

uses
  lib.conexao.db.interfaces;

type
  TFactoryConexao = class(TInterfacedObject, IFactoryConexaoInterface)
  private
    function ObterInstanciaConexao: IConexaoAbstract;

  public
    class function New: IFactoryConexaoInterface;

  end;

implementation

uses
  System.SysUtils,
  lib.DAO.conexao,
  lib.RT.conexao;

{ TFactoryConexao }

class function TFactoryConexao.New: IFactoryConexaoInterface;
begin
  Result := Self.Create;
end;

function TFactoryConexao.ObterInstanciaConexao: IConexaoAbstract;
var
  _AQualConexao : integer;
begin

  _AQualConexao := 0;

  case _AQualConexao of
    0: Result := TLibConexaoDB.New;
    1: Result := TLibConexaoRT.New;
    else
      raise Exception.Create('Conexão informada é inválida!');
  end;
end;

end.
