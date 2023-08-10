unit model.lib;

interface

uses
  model.lib.interfaces,
  consts.styles,
  Vcl.ExtCtrls;

type
  TModelLibrary = class(TInterfacedObject, iModelLibrary)
  private
    function ConverteColorHexToColorDelphi(_Panel: TPanel; _ColorTextHex: RColorRGBConst): iModelLibrary;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: iModelLibrary;

  end;

implementation

uses
  Winapi.Windows;

{ TModelLibrary }

constructor TModelLibrary.Create;
begin
end;

destructor TModelLibrary.Destroy;
begin
  inherited;
end;

class function TModelLibrary.New: iModelLibrary;
begin
  Result := Self.Create;
end;

function TModelLibrary.ConverteColorHexToColorDelphi(_Panel: TPanel; _ColorTextHex: RColorRGBConst): iModelLibrary;
begin
  Result := Self;

  _Panel.ParentBackground := False;
  _Panel.ParentColor := False;
  _Panel.Color := RGB(_ColorTextHex.ColorR, _ColorTextHex.ColorG, _ColorTextHex.ColorB);
end;

end.

