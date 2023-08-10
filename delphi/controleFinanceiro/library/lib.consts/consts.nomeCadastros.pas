unit consts.nomeCadastros;

interface

uses
  lib.types.enum;

type
  {TODO: [HINT - Cadastros] Adicionar typeCadastro}
  TTypeCadastros = (
     cadPortador
    ,cadConta
    ,cadContaPagar
    ,cadContaReceber
    ,cadMembroFamilia
    ,cadCredor
    ,cadTags
    ,cadSaldoFGTS
    ,cadCartao
    ,cadDespesaCartao
    ,cadSaldoPortador
  );

  TEnumCadastros = class(TLibEnum<TTypeCadastros>)
  const
    FIntCadastros: array[TTypeCadastros] of integer =
      (0,
       1,
       2,
       3,
       4,
       5,
       6,
       7,
       8,
       9,
       10);
    FStrCadastros: array[TTypeCadastros] of string  =
      ('Portador',
       'Conta',
       'ContaPagar',
       'ContaReceber',
       'MembroFamilia',
       'Credor',
       'Tags',
       'SaldoFGTS',
       'Cartao',
       'DespesaCartao',
       'SaldoPortador');

  protected
    class function GetArrayValues: TArrayInteger; override;
    class function GetArrayNames: TArrayString; override;

  end;

implementation

{ TEnumCadastros }

class function TEnumCadastros.GetArrayNames: TArrayString;
begin
  Result := TArrayUtils.ArrayOfStringToArrayString(FStrCadastros);
end;

class function TEnumCadastros.GetArrayValues: TArrayInteger;
begin
  Result := TArrayUtils.ArrayOfIntegerToArrayInteger(FIntCadastros);
end;

end.
