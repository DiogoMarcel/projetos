unit lib.enum.tipoconta;

interface

uses
  lib.types.enum;

type
  TTypeLibEnumTipoconta = (
    letNull
    ,letPagar
    ,letReceber
    ,letIgual
  );

  TLibEnumTipoconta = class(TLibEnum<TTypeLibEnumTipoconta>)
  const
    FIntTipoConta: array[TTypeLibEnumTipoconta] of integer =
      (0,
       1,
       2,
       3);

    FStrTipoConta: array[TTypeLibEnumTipoconta] of string  =
      ('N'
      ,'P'
      ,'R'
      ,'=');

  protected
    class function GetArrayValues: TArrayInteger; override;
    class function GetArrayNames: TArrayString; override;

  end;

implementation

{ TLibEnumTipoconta }

class function TLibEnumTipoconta.GetArrayNames: TArrayString;
begin
  Result := TArrayUtils.ArrayOfStringToArrayString(FStrTipoConta);
end;

class function TLibEnumTipoconta.GetArrayValues: TArrayInteger;
begin
  Result := TArrayUtils.ArrayOfIntegerToArrayInteger(FIntTipoConta);
end;

end.
