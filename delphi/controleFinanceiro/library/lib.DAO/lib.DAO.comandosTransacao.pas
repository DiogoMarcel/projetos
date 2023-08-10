unit lib.DAO.comandosTransacao;

interface

uses
  Data.DB,
  Vcl.Forms,
  lib.DAO.interfaces,
  lib.dao.dataModel,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client;

type
  TdmCmdTransacao = class(TDataModule, iCMDTransacao)
    daoCommand: TFDCommand;
    daoTransacao: TFDTransaction;
  private
    { Private declarations }

    procedure SetParams(_AParamName: string; _AValue: Variant; _ADataType: TFieldType);

  public
    { Public declarations }

    function AddCommand(_ACommand: string): iCMDTransacao;
    function SetParamString(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamBoolean(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamInteger(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamCurrency(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamFloat(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamDateTime(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function Executar: iCMDTransacao;

    class function New: iCMDTransacao;

  end;

implementation

uses
  System.Variants;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCmdTransacao }

class function TdmCmdTransacao.New: iCMDTransacao;
begin
  Result := Self.Create(Application);
end;

procedure TdmCmdTransacao.SetParams(_AParamName: string; _AValue: Variant; _ADataType: TFieldType);
begin
  if not Assigned(daoCommand.FindParam(_AParamName)) then
    Exit;

  if (VarIsNull(daoCommand.ParamByName(_AParamName).Value)) or (daoCommand.ParamByName(_AParamName).Value <> _AValue) then
  begin
    daoCommand.ParamByName(_AParamName).DataType := _ADataType;
    daoCommand.ParamByName(_AParamName).Value    := _AValue;
  end;
end;

function TdmCmdTransacao.SetParamBoolean(_AParamName: string; _AValue: Variant): iCMDTransacao;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftBoolean);
end;

function TdmCmdTransacao.SetParamCurrency(_AParamName: string; _AValue: Variant): iCMDTransacao;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftCurrency);
end;

function TdmCmdTransacao.SetParamDateTime(_AParamName: string; _AValue: Variant): iCMDTransacao;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftDateTime);
end;

function TdmCmdTransacao.SetParamFloat(_AParamName: string; _AValue: Variant): iCMDTransacao;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftFloat);
end;

function TdmCmdTransacao.SetParamInteger(_AParamName: string; _AValue: Variant): iCMDTransacao;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftInteger);
end;

function TdmCmdTransacao.SetParamString(_AParamName: string; _AValue: Variant): iCMDTransacao;
begin
  Result := Self;
  SetParams(_AParamName, _AValue, ftString);
end;

function TdmCmdTransacao.AddCommand(_ACommand: string): iCMDTransacao;
begin
  Result := Self;
  daoCommand.CommandText.Add(_ACommand);
end;

function TdmCmdTransacao.Executar: iCMDTransacao;
begin
  Result := Self;
  daoTransacao.StartTransaction;
  try

    if (daoCommand.CommandText.Count > 0) then
      daoCommand.Execute();

    daoTransacao.Commit;
  except on E: Exception do
    begin
      daoTransacao.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
end;

end.
