unit lib.helper.dictionary;

interface

uses
  SysUtils,
  System.Generics.Collections;

type
  TDictHelper<Key, Value> = class
  public
    class function P(const K:Key; const V:Value): TPair<Key, Value>;
    class function Make(init: array of TPair<Key, Value>): TDictionary<Key, Value>; overload;
    class function Make(KeyArray: array of Key; ValueArray: array of Value): TDictionary<Key, Value>; overload;
  end;

implementation

{ TDictHelper<Key, Value> }

class function TDictHelper<Key, Value>.Make(init: array of TPair<Key, Value>): TDictionary<Key, Value>;
var
  P: TPair<Key, Value>;
begin
  Result := TDictionary<Key, Value>.Create;

  for P in init do
    Result.AddOrSetValue(P.Key, P.Value);
end;

class function TDictHelper<Key, Value>.Make(KeyArray: array of Key;
                                            ValueArray: array of Value): TDictionary<Key, Value>;
var
  i: Integer;
begin
  if Length(KeyArray) <> Length(ValueArray) then
    raise Exception.Create('Number of keys does not match number of values.');

  Result := TDictionary<Key, Value>.Create;

  for i := 0 to High(KeyArray) do
    Result.AddOrSetValue(KeyArray[i], ValueArray[i]);
end;

class function TDictHelper<Key, Value>.P(const K: Key; const V: Value): TPair<Key, Value>;
begin
  Result := TPair<Key, Value>.Create(K, V);
end;

(* Example : https://stackoverflow.com/questions/14490275/tdictionary-populated-during-create-example-code

var
  Dict: TDictionary<Integer, string>;
  Pair: TPair<Integer, string>;
begin
  try
    try
      // Nice-looking but requires "with" and you can't work with two kinds of DictHelper at once
      with TDictHelper<Integer, string> do
        Dict := Make([P(1, 'one'), P(2, 'two')]);
      // Use the array
      for Pair in Dict do
        WriteLn(Pair.Key, ' = ', Pair.Value);
      Dict.Free;

      // Passing the Keys and the Values in separate arrays; Works without "with" but it would
      // be difficult to maintain for larger number of key/value pairs
      Dict := TDictHelper<Integer, string>.Make([1, 2], ['one', 'two']);
      // Use the array
      for Pair in Dict do
        WriteLn(Pair.Key, ' = ', Pair.Value);
      Dict.Free;

    except on E:Exception do
      WriteLn(E.ClassName, #13#10, E.Message);
    end;
  finally
    ReadLn;
  end;
end.
*)

end.
