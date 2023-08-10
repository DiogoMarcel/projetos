unit lib.DAO.conexao.config;

interface

uses
  lib.conexao.db.interfaces;

type
  TLibConfigConexaoConfigDB = class(TInterfacedObject, ILibConfigConexaoDB)
  private
    FServer: string;
    FDataBase: string;
    FUserName: string;
    FPassword: string;
    FPort: string;
    FDriverID: string;

    function LoadFileConfig: ILibConfigConexaoDB;

    function Server(_ALocalHost: string): string; overload;
    function Server: string; overload;
    function DataBase: string; overload;
    function DataBase(_ADataBase: string): string; overload;
    function UserName: string; overload;
    function UserName(_AUserName: string): string; overload;
    function Password: string; overload;
    function Password(_APassword: string): string; overload;
    function Port: string; overload;
    function Port(_APort: string): string; overload;
    function DriverID(_ADriverID: string): string; overload;
    function DriverID: string; overload;

  public
    Constructor Create;
    Destructor Destroy; override;

    class function New: ILibConfigConexaoDB;

  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TLibConfigConexaoDB }

class function TLibConfigConexaoConfigDB.New: ILibConfigConexaoDB;
begin
  Result := Self.Create;
end;

constructor TLibConfigConexaoConfigDB.Create;
begin
end;

destructor TLibConfigConexaoConfigDB.Destroy;
begin
  inherited;
end;

function TLibConfigConexaoConfigDB.DriverID: string;
begin
  if FDriverID.IsEmpty then
    Result := 'PG'
  else
    Result := FDriverID;
end;

function TLibConfigConexaoConfigDB.DriverID(_ADriverID: string): string;
begin
  FDriverID := _ADriverID;
end;

function TLibConfigConexaoConfigDB.Server: string;
begin
  if FServer.IsEmpty then
    Result := 'localhost'
  else
    Result := FServer;
end;

function TLibConfigConexaoConfigDB.Server(_ALocalHost: string): string;
begin
  FServer := _ALocalHost;
end;

function TLibConfigConexaoConfigDB.DataBase: string;
begin
  Result := FDataBase
end;

function TLibConfigConexaoConfigDB.DataBase(_ADataBase: string): string;
begin
  FDataBase := _ADataBase;
end;

function TLibConfigConexaoConfigDB.UserName: string;
begin
  if FUserName.IsEmpty then
    Result := 'postgres'
  else
    Result := FUserName;
end;

function TLibConfigConexaoConfigDB.UserName(_AUserName: string): string;
begin
  FUserName := _AUserName;
end;

function TLibConfigConexaoConfigDB.Password: string;
begin
  if FPassword.IsEmpty then
    Result := 'postgres'
  else
    Result := FPassword;
end;

function TLibConfigConexaoConfigDB.Password(_APassword: string): string;
begin
  FPassword := _APassword;
end;

function TLibConfigConexaoConfigDB.Port: string;
begin
  if FPort.IsEmpty then
    Result := '5432'
  else
    Result := FPort;
end;

function TLibConfigConexaoConfigDB.Port(_APort: string): string;
begin
  FPort := _APort;
end;

function TLibConfigConexaoConfigDB.LoadFileConfig: ILibConfigConexaoDB;
var
  LStrings: TStringList;
  AString: string;
  AArrString: TArray<string>;
begin
  Result := Self;

  LStrings := TStringList.Create;
  try
    LStrings.Loadfromfile('.\config.base.DB.txt');

    for AString in LStrings do
    begin
      AArrString := AString.Split([':!:']);

      if AArrString[0].Equals('DataBase') then DataBase(AArrString[1]);
      if AArrString[0].Equals('UserName') then UserName(AArrString[1]);
      if AArrString[0].Equals('Password') then Password(AArrString[1]);
      if AArrString[0].Equals('Port')     then     Port(AArrString[1]);
      if AArrString[0].Equals('Server')   then   Server(AArrString[1]);
      if AArrString[0].Equals('DriverID') then DriverID(AArrString[1]);

    end;
  finally
    FreeAndNil(LStrings);
  end;
end;

end.

