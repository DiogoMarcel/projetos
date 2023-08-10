unit lib.RT.conexao;

interface

uses
  lib.conexao.db.interfaces,
  classes.template.unified;

type
  TLibConexaoRT = class(TInterfacedObject, IConexaoAbstract)
  private
    {FUnifiedClasses: TUnifiedClasses;}

    function StartConexao: IConexaoAbstract;

  public
    Constructor Create;
    Destructor Destroy; override;

    class function ObterInstancia: IConexaoAbstract;

    class function New: IConexaoAbstract;

  end;

var
  FLibConexaoRT: IConexaoAbstract;

implementation

uses
  System.JSON,
  Dialogs,
  System.SysUtils,
  Firebase.Interfaces,
  lib.login.realtimedb,
  Vcl.Forms,
  model.lib.aguarde,
  System.Generics.Collections;

{ TLibConexaoRT }

constructor TLibConexaoRT.Create;
begin
end;

destructor TLibConexaoRT.Destroy;
begin
  {if Assigned(FUnifiedClasses) then
    FreeAndNil(FUnifiedClasses);}

  inherited;
end;

class function TLibConexaoRT.New: IConexaoAbstract;
begin
  Result := Self.Create;
end;

class function TLibConexaoRT.ObterInstancia: IConexaoAbstract;
begin
  if not Assigned(FLibConexaoRT) then
    FLibConexaoRT := TLibConexaoRT.New;

  Result := FLibConexaoRT;
end;

function TLibConexaoRT.StartConexao: IConexaoAbstract;
var
  AResponse: IFirebaseResponse;
  JSONResp: TJSONValue;
  J, I: integer;

begin
  Result := Self;

  TModelAguarde.New(Application).ExibirAguarde;

  //TUnifiedClasses.ObterInstancia.StartConexao;

  Result := Self;

  AResponse := TLibLoginRealtimeDB.ObterInstanciaConexaoRT.Conexao.Get(['.json']);

  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  try
    {if (JSONResp is TJSONArray) then
      RemoverJSONNull(JSONResp)
    else
    begin}
      for I := 0 to (JSONResp as TJsonObject).Count - 1 do
        for J := (((JSONResp as TJsonObject).Pairs[I].JsonValue) as TJSONArray).Count-1 downto 0 do
          if (((JSONResp as TJsonObject).Pairs[I].JsonValue) as TJSONArray).Items[J].Null then
            (((JSONResp as TJsonObject).Pairs[I].JsonValue) as TJSONArray).Remove(J).Free;
      {RemoverJSONNull((JSONResp as TJsonObject).Pairs[I].JsonValue);
    end;}

    {TODO: ver se é aqui o problema de memória}
    TUnifiedClasses.ObterInstancia.SetAsJson(JSONResp);
    {FUnifiedClasses := TUnifiedClasses.Create;
    FUnifiedClasses.SetAsJson(JSONResp);}

  finally
    JSONResp.Free;
  end;
end;

{initialization

finalization
  if Assigned(FLibConexaoRT) then
    FreeAndNil(FLibConexaoRT);}

{
  Update routine

  Result := Self;

  TModelAguarde.New(Application).ExibirAguarde;

  ShowMessage('Atualizar tela dos cadastrinho aqui....'+ _ANodeCad);
}
end.
