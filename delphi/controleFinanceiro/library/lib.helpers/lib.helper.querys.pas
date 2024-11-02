unit lib.helper.querys;

interface

uses
  Data.DB,
  lib.proc.objects,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client;

type
  TFDQueryHelper = class helper for TFDQuery
  private
    procedure SetParams(_AParamName: string; _AValue: Variant; _ADataType: TFieldType);

  public
    function AtivarQuery: TFDQuery;
    function PrepareSQL(_ASQL: string): TFDQuery;
    function SetParamString(_AParamName: string; _AValue: Variant): TFDQuery;
    function SetParamInteger(_AParamName: string; _AValue: Variant): TFDQuery;
    function SetParamCurrency(_AParamName: string; _AValue: Variant): TFDQuery;
    function ForEach(_AProcForEach: TForEachHelperDataSet): TFDQuery;

  end;

implementation

uses
  Dialogs,
  System.Variants,
  System.SysUtils;

{ TFDQueryHelper }

function TFDQueryHelper.AtivarQuery: TFDQuery;
begin
  Result := Self;

  if (Self.Active) then
    Self.Active := False;

  if (Self.SQL.Text.IsEmpty) then
    Exit;

//  ShowMessage(Self.SQL.Text);

  Self.Active := True;
end;

function TFDQueryHelper.ForEach(_AProcForEach: TForEachHelperDataSet): TFDQuery;
begin
  Result := Self;

  Self.First;
  while not Self.Eof do
  begin
    _AProcForEach;
    Self.Next;
  end;
end;

function TFDQueryHelper.PrepareSQL(_ASQL: string): TFDQuery;
begin
  Result := Self;

  Self.SQL.Clear;
  Self.SQL.Add(_ASQL)
end;

procedure TFDQueryHelper.SetParams(_AParamName: string; _AValue: Variant; _ADataType: TFieldType);
begin
  if (VarIsNull(Self.ParamByName(_AParamName).Value)) or (Self.ParamByName(_AParamName).Value <> _AValue) then
  begin
    Self.ParamByName(_AParamName).DataType := _ADataType;
    Self.ParamByName(_AParamName).Value    := _AValue;
  end;
end;

function TFDQueryHelper.SetParamCurrency(_AParamName: string; _AValue: Variant): TFDQuery;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftCurrency);
end;

function TFDQueryHelper.SetParamInteger(_AParamName: string; _AValue: Variant): TFDQuery;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftInteger);
end;

function TFDQueryHelper.SetParamString(_AParamName: string; _AValue: Variant): TFDQuery;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftString);
end;

end.
