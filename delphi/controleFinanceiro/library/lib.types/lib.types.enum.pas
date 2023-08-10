unit lib.types.enum;

interface

uses
  System.TypInfo, System.Classes, Winapi.Windows, Vcl.StdCtrls, System.SysUtils, System.Rtti, Data.DB;

type
  TArrayString = TArray<String>;
  TArrayInteger = TArray<Integer>;

  TArrayUtils = class
  public
    class function ArrayOfStringToArrayString(_AArrayOfString: array of string): TArrayString;
    class function ArrayOfIntegerToArrayInteger(_AArrayOfInteger: array of Integer): TArrayInteger;
  end;

  TTypeInfo = (tiValue, tiName, tiEnumName, tiValueName);

  TLibEnum<T> = class(TInterfacedObject)
  protected
    class function GetArrayValues: TArrayInteger; virtual;
    class function GetArrayNames: TArrayString; virtual;
  public
    class function NameToEnum(_AName: string): T;
    class function ValueToEnum(_AValue: Integer): T;
    class function EnumToValue(_AEnumTipo: T): Integer;
    class function GetName(_AEnumTipo: T; _ATypeInfo: TTypeInfo = tiName): String;
    class function EstaNoArray(_AEnumTipo: T; _AArrayEnumTipo: TArray<T>): Boolean;
    class function GetInfo(_AEnumTipo: T; _AArrayEnumTipo: TArray<T> = nil; _ATypeInfo: TTypeInfo = tiName): String;
    class function Implode(_AArrayEnumTipo: TArray<T>; _ATypeInfo: TTypeInfo = tiValue; _ASeparador: String = ','): String;
    class function NamesValues(_AArrayEnumTipo: TArray<T> = nil; _ATypeInfo: TTypeInfo = tiValueName): String;
    class function GetValues: TArrayInteger;
    class function GetNames: TArrayString;
  end;

implementation

{ TLibEnum<T> }

class function TLibEnum<T>.GetName(_AEnumTipo: T; _ATypeInfo: TTypeInfo): String;
var
  AValue: Integer;
  ANames: TArrayString;
begin
  Result := '';

  ANames := GetArrayNames;

  AValue := TValue.From<T>(_AEnumTipo).AsOrdinal;

  case _ATypeInfo of
    tiValue: Result := '';

    tiName:
      if Length(ANames) > 0 then
        Result := ANames[AValue]
      else
        Result := GetEnumName(TypeInfo(T), AValue);

    tiEnumName: Result := GetEnumName(TypeInfo(T), AValue);
  end;
end;

class function TLibEnum<T>.GetValues: TArrayInteger;
begin
  Result := GetArrayValues;
end;

class function TLibEnum<T>.GetNames: TArrayString;
begin
  Result := GetArrayNames;
end;

class function TLibEnum<T>.EstaNoArray(_AEnumTipo: T; _AArrayEnumTipo: TArray<T>): Boolean;
var
  I: Integer;
  AValue: Integer;
  APosArrayValue: Integer;
begin
  Result := False;

  if Length(_AArrayEnumTipo) > 0 then
  begin
    AValue := TValue.From<T>(_AEnumTipo).AsOrdinal;

    for I := 0 to Length(_AArrayEnumTipo)-1 do
    begin
      APosArrayValue := TValue.From<T>(_AArrayEnumTipo[I]).AsOrdinal;

      if APosArrayValue = AValue then
        Exit(True);
    end;
  end;
end;

class function TLibEnum<T>.GetArrayNames: TArrayString;
begin

end;

class function TLibEnum<T>.GetArrayValues: TArrayInteger;
begin

end;

class function TLibEnum<T>.GetInfo(_AEnumTipo: T; _AArrayEnumTipo: TArray<T>; _ATypeInfo: TTypeInfo): String;
var
  AValue: Integer;
  ANames: TArrayString;
  AValues: TArrayInteger;
begin
  Result := '';

  ANames := GetArrayNames;
  AValues := GetArrayValues;

  AValue := EnumToValue(_AEnumTipo);

  case _ATypeInfo of
    tiValue:
      if Length(AValues) = 0 then
        Result := IntToStr(AValue)
      else
        Result := IntToStr(AValues[AValue]);

    tiName: Result := ANames[AValue];

    tiEnumName: Result := GetEnumName(TypeInfo(T), AValue);
  end;
end;

class function TLibEnum<T>.EnumToValue(_AEnumTipo: T): Integer;
var
  AEnumValue: Integer;
  AValues: TArrayInteger;
begin
  AValues := GetArrayValues;

  AEnumValue := TValue.From<T>(_AEnumTipo).AsOrdinal;

  if Length(AValues) = 0 then
    Result := AEnumValue
  else
    Result := AValues[AEnumValue];
end;

class function TLibEnum<T>.Implode(_AArrayEnumTipo: TArray<T>; _ATypeInfo: TTypeInfo; _ASeparador: String): String;
var
  I: Integer;
  AInfo: string;
  AValue: Integer;
  ASeparador: String;
begin
  Result := EmptyStr;
  ASeparador := _ASeparador + ' ';

  for I := 0 to Length(_AArrayEnumTipo)-1 do
  begin
    AValue := EnumToValue(_AArrayEnumTipo[I]);

    case _ATypeInfo of
      tiValue: AInfo := IntToStr(AValue);

      tiName: AInfo := GetEnumName(TypeInfo(T), AValue);
    end;

    Result := Result + ASeparador + AInfo;
  end;

  Result := Copy(Result, 3, Length(Result));
end;

class function TLibEnum<T>.NamesValues(_AArrayEnumTipo: TArray<T>; _ATypeInfo: TTypeInfo): String;
const
  QUEBRA_LINHA = #13#10;
var
  I: Integer;
  AName: string;
  AValue: Integer;
  ALength: Integer;
  ANewValue: String;
  ANames: TArrayString;
  AValues: TArrayInteger;
begin
  if Not (_ATypeInfo in [tiName, tiValueName]) then
    raise Exception.Create('Utilize somente TINAME ou TIVALUENAME para o evento NamesValues. Revise o código.');

  if _AArrayEnumTipo <> nil then
    ALength := Length(_AArrayEnumTipo) - 1
  else
    ALength := Length(AValues) - 1;

  for I := 0 to ALength do
  begin
    if _AArrayEnumTipo = nil then
    begin
      AName := AName[I];
      AValue := AValues[I];
    end
    else
    begin
      AValue := TValue.From<T>(_AArrayEnumTipo[I]).AsOrdinal;

      AName := ANames[AValue];
      AValue := AValues[AValue];
    end;

    if AValue < 10 then
      ANewValue := '0';

    ANewValue := ANewValue + IntToStr(AValue);

    case _ATypeInfo of
      tiName: ANewValue := AName + '=' + ANewValue;

      tiValueName: ANewValue := ANewValue + ' - ' + AName + '=' + ANewValue;
    end;

    Result := Result + ANewValue + QUEBRA_LINHA;
  end;
end;

class function TLibEnum<T>.NameToEnum(_AName: string): T;
var
  I: Integer;
  APointer: ^T;
  AInvalid: Integer;
  ANames: TArrayString;
begin
  AInvalid := -1;
  APointer := @AInvalid;

  try
    ANames := GetArrayNames;

    if (_AName = EmptyStr) or (Length(ANames) = 0) then
      Exit(APointer^);

    for I := 0 to Length(ANames)-1 do
      if _AName = ANames[I] then
      begin
        APointer := @I;

        Break;
      end;

    Result := APointer^;
  except
    raise EConvertError.Create('O Parâmetro "' + _AName + '" passado não ' + sLineBreak + ' corresponde a um Tipo Enumerado');
  end;
end;

class function TLibEnum<T>.ValueToEnum(_AValue: Integer): T;
var
  I: Integer;
  APointer: ^T;
  AValues: TArrayInteger;
begin
  try
    if _AValue = -1 then
      abort;

    AValues := GetArrayValues;

    if Length(AValues) = 0 then
      APointer := @_AValue
    else
      for I := 0 to Length(AValues)-1 do
        if _AValue = AValues[I] then
        begin
          APointer := @I;
          Break;
        end;

    result := APointer^;
  except
    raise EConvertError.Create('O Parâmetro "' + IntToStr(_AValue) + '" passado não ' + sLineBreak + ' corresponde a um Tipo Enumerado');
  end;
end;

{ TnArrayUtils }

class function TArrayUtils.ArrayOfIntegerToArrayInteger(_AArrayOfInteger: array of Integer): TArrayInteger;
var
  I: Integer;
begin
  Result := TArrayInteger.create();

  SetLength(Result, Length(_AArrayOfInteger));

  for I := 0 to Length(_AArrayOfInteger)-1 do
    Result[I] := _AArrayOfInteger[I];
end;

class function TArrayUtils.ArrayOfStringToArrayString(_AArrayOfString: array of string): TArrayString;
var
  I: Integer;
begin
  Result := TArrayString.create();
  SetLength(Result, Length(_AArrayOfString));

  for I := 0 to Length(_AArrayOfString)-1 do
    Result[I] := _AArrayOfString[I];
end;

end.
