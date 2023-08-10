unit lib.DAO.dataModel;

interface

{$REGION 'UsesInterface'}
uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  lib.conexao.db.interfaces;
{$ENDREGION}

type
  TdmConexaoDB = class(TDataModule, IConexaoAbstract)
    FDConexao: TFDConnection;
    FDPGDriver: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConfigurarConexao;
    function StartConexao: IConexaoAbstract;

  public
    class function ObterInstanciaConexaoDB: IConexaoAbstract;

  end;

implementation

uses
  lib.DAO.conexao.config,
  dialogs,
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

var
  FdmConexaoDB: IConexaoAbstract;

{ TdmConexaoDB }

procedure TdmConexaoDB.ConfigurarConexao;
var
  ALoadConfig: ILibConfigConexaoDB;
begin
  ALoadConfig := TLibConfigConexaoConfigDB
                   .New
                     .LoadFileConfig();

  FDConexao.Params.DriverID := ALoadConfig.DriverID;
  FDConexao.Params.DataBase := ALoadConfig.DataBase;
  FDConexao.Params.UserName := ALoadConfig.UserName;
  FDConexao.Params.Password := ALoadConfig.Password;
  FDConexao.Params.Add('Server='+ ALoadConfig.Server);
  FDConexao.Params.Add('Port='  + ALoadConfig.Port);
end;

procedure TdmConexaoDB.DataModuleCreate(Sender: TObject);
begin
  FDPGDriver.VendorLib := EmptyStr;
end;

class function TdmConexaoDB.ObterInstanciaConexaoDB: IConexaoAbstract;
begin
  if (not Assigned(FdmConexaoDB)) then
    FdmConexaoDB := Self.Create(Application);

  Result := FdmConexaoDB;
end;

function TdmConexaoDB.StartConexao: IConexaoAbstract;
begin
  Result := Self;

  FDConexao.Close;

  ConfigurarConexao;

  FDPGDriver.Release;

  {$IFDEF WIN32}
    FDPGDriver.VendorLib := 'C:\Program Files (x86)\psqlODBC\1302\bin\libpq.dll';
  {$ELSE}
    FDPGDriver.VendorLib := 'C:\Program Files\psqlODBC\1302\bin\libpq.dll';
  {$ENDIF}

  {FDPGDriver.VendorLib := ExtractFilePath(Application.ExeName)+ 'libpq.dll';}

  FDConexao.Open;
end;

end.
