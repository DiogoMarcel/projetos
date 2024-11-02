unit lib.login.realtimedb;

interface

uses
  lib.conexao.db.interfaces,
  Firebase.Interfaces;

type
  TLibLoginRealtimeDB = class(TInterfacedObject, ILibLoginRealtimeDB)
  private
    FTokenRealtime: string;
    FDatabase: IFirebaseDatabase;

    procedure LoginOnLine;
    procedure AbrirConexao;

  public
    constructor Create;
    destructor Destroy; override;

    function Conexao: IFirebaseDatabase;

    class function ObterInstanciaConexaoRT: ILibLoginRealtimeDB;
  end;

implementation

uses
  System.JSON,
  Firebase.Auth,
  Firebase.Database,
  System.SysUtils,
  lib.login.realtimedb.config,
  Vcl.Dialogs;

var
  FLibLoginRealtimeDB: ILibLoginRealtimeDB;

{ TLibLoginRealtimeDB }

class function TLibLoginRealtimeDB.ObterInstanciaConexaoRT: ILibLoginRealtimeDB;
begin
  if (not Assigned(FLibLoginRealtimeDB)) then
  begin
    FLibLoginRealtimeDB := TLibLoginRealtimeDB.Create;
    FLibLoginRealtimeDB.LoginOnLine;
    FLibLoginRealtimeDB.AbrirConexao;
  end;

  Result := FLibLoginRealtimeDB;
end;

function TLibLoginRealtimeDB.Conexao: IFirebaseDatabase;
begin
  Result := FDatabase;
end;

constructor TLibLoginRealtimeDB.Create;
begin
  FLibLoginRealtimeDB := nil;
  FDatabase := nil;
end;

destructor TLibLoginRealtimeDB.Destroy;
begin
  inherited;
end;

procedure TLibLoginRealtimeDB.AbrirConexao;
begin
  if (not Assigned(FDatabase)) then
  begin
    FDatabase := TFirebaseDatabase.Create;
    FDatabase.SetBaseURI(TLibLoadConfiguracao.New.LoadFileConfig.BaseURI);
    FDatabase.SetToken(FTokenRealtime);
  end;
end;

procedure TLibLoginRealtimeDB.LoginOnLine;
var
  ALoadConfig: ILibLoadConfiguracao;
  Auth       : IFirebaseAuth;
  AResponse  : IFirebaseResponse;
  JSONResp   : TJSONValue;
  Obj        : TJSONObject;
begin
  ALoadConfig := TLibLoadConfiguracao
                   .New
                     .LoadFileConfig();

  Auth := TFirebaseAuth.Create;

  Auth.SetApiKey(ALoadConfig.SetApiKey);
  AResponse := Auth.SignInWithEmailAndPassword(ALoadConfig.Email, ALoadConfig.Password);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  try
    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
        JSONResp.Free;
      Exit;
    end;
    Obj := JSONResp as TJSONObject;
    Obj.Values['idToken'].Value;
    FTokenRealtime := Obj.Values['idToken'].Value;
  finally
    FreeAndNil(JSONResp);
  end;
end;

end.

