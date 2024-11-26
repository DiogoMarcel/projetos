unit classes.template.unified;

interface

uses
  System.JSON,
  REST.Json.Types,
  pkg.json.template,
  System.Generics.Collections,
  lib.conexao.db.interfaces,
  classes.template.interfaces,
  classes.template.portador,
  classes.template.membrofamilia,
  classes.template.conta,
  classes.template.credor,
  classes.template.tags,
  classes.template.saldofgts,
  classes.template.cartao,
  classes.template.despesacartao,
  classes.template.saldoportador,
  classes.template.abastecimentos,
  classes.template.veiculos;

type
  TUnifiedClasses = class(TJsonPkgTemplate, IUnifiedClass)
  private
    {TODO: [HINT - Cadastros] Adicionar JSON do cadastro - E métodos}

    [JSONName('portadores')]
    FPortadoresArray: TArray<TPortador>;
    [TGenericListReflect]
    FPortadores: TObjectList<TPortador>;

    [JSONName('membrofamilia')]
    FMembroFamiliaArray: TArray<TMembroFamilia>;
    [TGenericListReflect]
    FMembroFamilia: TObjectList<TMembroFamilia>;

    [JSONName('conta')]
    FContaArray: TArray<TConta>;
    [TGenericListReflect]
    FConta: TObjectList<TConta>;

    [JSONName('credor')]
    FCredorArray: TArray<TCredor>;
    [TGenericListReflect]
    FCredor: TObjectList<TCredor>;

    [JSONName('tags')]
    FTagsArray: TArray<TTags>;
    [TGenericListReflect]
    FTags: TObjectList<TTags>;

    [JSONName('saldofgts')]
    FSaldoFGTSArray: TArray<TSaldoFGTS>;
    [TGenericListReflect]
    FSaldoFGTS: TObjectList<TSaldoFGTS>;

    [JSONName('cartao')]
    FCartaoArray: TArray<TCartao>;
    [TGenericListReflect]
    FCartao: TObjectList<TCartao>;

    [JSONName('despesacartao')]
    FDespesaCartaoArray: TArray<TDespesaCartao>;
    [TGenericListReflect]
    FDespesaCartao: TObjectList<TDespesaCartao>;

    [JSONName('saldoportador')]
    FSaldoPortadorArray: TArray<TSaldoPortador>;
    [TGenericListReflect]
    FSaldoPortador: TObjectList<TSaldoPortador>;

    [JSONName('abastecimentos')]
    FAbastecimentosArray: TArray<TAbastecimentos>;
    [TGenericListReflect]
    FAbastecimentos: TObjectList<TAbastecimentos>;

    [JSONName('veiculos')]
    FVeiculosArray: TArray<TVeiculos>;
    [TGenericListReflect]
    FVeiculos : TObjectList<TVeiculos>;

    function GetPortadores: TObjectList<TPortador>;
    function GetMembroFamilia: TObjectList<TMembroFamilia>;
    function GetConta: TObjectList<TConta>;
    function GetCredor: TObjectList<TCredor>;
    function GetTags: TObjectList<TTags>;
    function GetSaldoFGTS: TObjectList<TSaldoFGTS>;
    function GetCartao: TObjectList<TCartao>;
    function GetDespesaCartao: TObjectList<TDespesaCartao>;
    function GetSaldoPortador: TObjectList<TSaldoPortador>;
    function GetAbastecimentos: TObjectList<TAbastecimentos>;
    function GetVeiculos: TObjectList<TVeiculos>;

  public
    destructor Destroy; override;

    class function ObterInstancia: TUnifiedClasses;

    {function StartConexao: IConexaoAbstract;}
    procedure SetAsJson(_JSONResp: TJSONValue);

    {TODO: [HINT - Cadastros] Adicionar propriedades dos cadastros}
    property Portadores: TObjectList<TPortador> read GetPortadores;
    property MembrosFamilia: TObjectList<TMembroFamilia> read GetMembroFamilia;
    property Conta: TObjectList<TConta> read GetConta;
    property Credor: TObjectList<TCredor> read GetCredor;
    property Tags: TObjectList<TTags> read GetTags;
    property SaldoFGTS: TObjectList<TSaldoFGTS> read GetSaldoFGTS;
    property Cartao: TObjectList<TCartao> read GetCartao;
    property DespesaCartao: TObjectList<TDespesaCartao> read GetDespesaCartao;
    property SaldoPortador: TObjectList<TSaldoPortador> read GetSaldoPortador;
    property Abastecimentos: TObjectList<TAbastecimentos> read GetAbastecimentos;
    property Veiculos: TObjectList<TVeiculos> read GetVeiculos;

  end;

implementation

uses
  {Dialogs,
  Firebase.Interfaces,
  lib.login.realtimedb;}
  System.SysUtils;

var
  FUnifiedClasses: TUnifiedClasses;

{ TUnifiedClasses }

class function TUnifiedClasses.ObterInstancia: TUnifiedClasses;
begin

  {TODO: Acho que aqui é um ponto que deve ser revisado}

  if not Assigned(FUnifiedClasses) then
    FUnifiedClasses := TUnifiedClasses.Create;

  Result := FUnifiedClasses;
end;

procedure TUnifiedClasses.SetAsJson(_JSONResp: TJSONValue);
begin
  Self.AsJson := _JSONResp.ToString;
end;

(*function TUnifiedClasses.StartConexao: IConexaoAbstract;
var
  AResponse: IFirebaseResponse;
  JSONResp: TJSONValue;
  J, I: integer;
begin
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

    SetAsJson(JSONResp);

  finally
    JSONResp.Free;
  end;
end;*)

destructor TUnifiedClasses.Destroy;
begin
  GetPortadores.Free;
  GetMembroFamilia.Free;
  GetConta.Free;
  GetCredor.Free;
  GetTags.Free;
  GetSaldoFGTS.Free;
  GetCartao.Free;
  GetDespesaCartao.Free;
  GetSaldoPortador.Free;
  GetAbastecimentos.Free;
  GetVeiculos.Free;

  {TODO: [HINT - Cadastros] Adicionar liberação de memória do cadastro}
  inherited;
end;

function TUnifiedClasses.GetConta: TObjectList<TConta>;
begin
  if not Assigned(FConta) then
  begin
    FConta := TObjectList<TConta>.Create;
    FConta.AddRange(FContaArray);
    SetLength(FContaArray, 0);
  end;

  Result := FConta;
end;

function TUnifiedClasses.GetCredor: TObjectList<TCredor>;
begin
  if not Assigned(FCredor) then
  begin
    FCredor := TObjectList<TCredor>.Create;
    FCredor.AddRange(FCredorArray);
    SetLength(FCredorArray, 0);
  end;

  Result := FCredor;
end;

function TUnifiedClasses.GetMembroFamilia: TObjectList<TMembroFamilia>;
begin
  if not Assigned(FMembroFamilia) then
  begin
    FMembroFamilia := TObjectList<TMembroFamilia>.Create;
    FMembroFamilia.AddRange(FMembroFamiliaArray);
    SetLength(FMembroFamiliaArray, 0);
  end;

  Result := FMembroFamilia;
end;

function TUnifiedClasses.GetPortadores: TObjectList<TPortador>;
begin
  if not Assigned(FPortadores) then
  begin
    FPortadores := TObjectList<TPortador>.Create;
    FPortadores.AddRange(FPortadoresArray);
    SetLength(FPortadoresArray, 0);
  end;

  Result := FPortadores;
end;

function TUnifiedClasses.GetTags: TObjectList<TTags>;
begin
  if not Assigned(FTags) then
  begin
    FTags := TObjectList<TTags>.Create;
    FTags.AddRange(FTagsArray);
    SetLength(FTagsArray, 0);
  end;

  Result := FTags;
end;

function TUnifiedClasses.GetSaldoFGTS: TObjectList<TSaldoFGTS>;
begin
  if not Assigned(FSaldoFGTS) then
  begin
    FSaldoFGTS := TObjectList<TSaldoFGTS>.Create;
    FSaldoFGTS.AddRange(FSaldoFGTSArray);
    SetLength(FSaldoFGTSArray, 0);
  end;

  Result := FSaldoFGTS;
end;

function TUnifiedClasses.GetCartao: TObjectList<TCartao>;
begin
  if not Assigned(FCartao) then
  begin
    FCartao := TObjectList<TCartao>.Create;
    FCartao.AddRange(FCartaoArray);
    SetLength(FCartaoArray, 0);
  end;

  Result := FCartao;
end;

function TUnifiedClasses.GetDespesaCartao: TObjectList<TDespesaCartao>;
begin
  if not Assigned(FDespesaCartao) then
  begin
    FDespesaCartao := TObjectList<TDespesaCartao>.Create;
    FDespesaCartao.AddRange(FDespesaCartaoArray);
    SetLength(FDespesaCartaoArray, 0);
  end;

  Result := FDespesaCartao;
end;

function TUnifiedClasses.GetSaldoPortador: TObjectList<TSaldoPortador>;
begin
  if not Assigned(FSaldoPortador) then
  begin
    FSaldoPortador := TObjectList<TSaldoPortador>.Create;
    FSaldoPortador.AddRange(FSaldoPortadorArray);
    SetLength(FSaldoPortadorArray, 0);
  end;

  Result := FSaldoPortador;
end;

function TUnifiedClasses.GetAbastecimentos: TObjectList<TAbastecimentos>;
begin
  if not Assigned(FAbastecimentos) then
  begin
    FAbastecimentos := TObjectList<TAbastecimentos>.Create;
    FAbastecimentos.AddRange(FAbastecimentosArray);
    SetLength(FAbastecimentosArray, 0);
  end;

  Result := FAbastecimentos;
end;

function TUnifiedClasses.GetVeiculos: TObjectList<TVeiculos>;
begin
  if not Assigned(FVeiculos) then
  begin
    FVeiculos := TObjectList<TVeiculos>.Create;
    FVeiculos.AddRange(FVeiculosArray);
    SetLength(FVeiculosArray, 0);
  end;

  Result := FVeiculos;
end;

initialization

finalization
  if Assigned(FUnifiedClasses) then
    FreeAndNil(FUnifiedClasses);

end.
