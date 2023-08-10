unit model.cadastro.jsonstring;

interface

uses
  System.JSON,
  model.cadastro.interfaces;

type
  TModelJSONCadString = class(TInterfacedObject, iJSONCadastroToString)
  private
    FJSONValue: TJSONValue;

    function ParseJSON(_Object: TObject): iJSONCadastroToString;
    function GetValue: TJSONValue;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: iJSONCadastroToString;

  end;

implementation

uses
  REST.Json,
  System.SysUtils;

{ TModelJSONCadString }
constructor TModelJSONCadString.Create;
begin
end;

destructor TModelJSONCadString.Destroy;
begin
  if Assigned(FJSONValue) then
    FreeAndNil(FJSONValue);

  inherited;
end;

function TModelJSONCadString.GetValue: TJSONValue;
begin
  Result := FJSONValue.GetValue<TJSONArray>('listHelper') as TJSONValue;
end;

class function TModelJSONCadString.New: iJSONCadastroToString;
begin
  Result := Self.Create;
end;

function TModelJSONCadString.ParseJSON(_Object: TObject): iJSONCadastroToString;
var
  AObjToString: string;
begin
  Result := Self;

  AObjToString := TJson.ObjectToJsonString(_Object);

  FJSONValue := TJSONObject.ParseJSONValue(AObjToString) as TJSONValue;
end;

end.
