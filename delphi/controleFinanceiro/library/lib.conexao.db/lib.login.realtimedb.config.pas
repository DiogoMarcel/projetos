unit lib.login.realtimedb.config;

interface

uses
  lib.conexao.db.interfaces;

type
  TLibLoadConfiguracao = class(TInterfacedObject, ILibLoadConfiguracao)
  private
    FBaseURI: string;
    FSetApiKey: string;
    FEmail: string;
    FPassword: string;

    procedure BaseURI(const _BaseURI: string); overload;
    function BaseURI: string; overload;

    procedure SetApiKey(const _SetApiKey: string); overload;
    function SetApiKey: string; overload;

    procedure Email(const _Email: string); overload;
    function Email: string; overload;

    procedure Password(const _Password: string); overload;
    function Password: string; overload;

    function LoadFileConfig: ILibLoadConfiguracao;
  public
    class function New: ILibLoadConfiguracao;

  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TLibLoadConfiguracao }

class function TLibLoadConfiguracao.New: ILibLoadConfiguracao;
begin
  Result := Self.Create;
end;

function TLibLoadConfiguracao.LoadFileConfig: ILibLoadConfiguracao;
var
  LStrings: TStringList;
  AString: string;
  AArrString: TArray<string>;
begin
  Result := Self;

  LStrings := TStringList.Create;
  try
    LStrings.Loadfromfile('.\config.base.realtime.txt');

    for AString in LStrings do
    begin
      AArrString := AString.Split([':!:']);

      if AArrString[0].Equals('SetApiKey') then SetApiKey(AArrString[1]);
      if AArrString[0].Equals('Email')     then Email(AArrString[1]);
      if AArrString[0].Equals('Password')  then Password(AArrString[1]);
      if AArrString[0].Equals('BaseURI')   then BaseURI(AArrString[1]);
    end;
  finally
    FreeAndNil(LStrings);
  end;
end;

procedure TLibLoadConfiguracao.BaseURI(const _BaseURI: string);
begin
  FBaseURI := _BaseURI;
end;

function TLibLoadConfiguracao.BaseURI: string;
begin
  Result := FBaseURI;
end;

procedure TLibLoadConfiguracao.Email(const _Email: string);
begin
  FEmail := _Email;
end;

function TLibLoadConfiguracao.Email: string;
begin
  Result := FEmail;
end;

procedure TLibLoadConfiguracao.Password(const _Password: string);
begin
  FPassword := _Password;
end;

function TLibLoadConfiguracao.Password: string;
begin
  Result := FPassword;
end;

procedure TLibLoadConfiguracao.SetApiKey(const _SetApiKey: string);
begin
  FSetApiKey := _SetApiKey;
end;

function TLibLoadConfiguracao.SetApiKey: string;
begin
  Result := FSetApiKey;
end;

end.

