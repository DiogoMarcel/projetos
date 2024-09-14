unit data.cadastro.template;

interface

uses
  lib.DAO.dataModel, data.cadastro.template.interfaces,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, lib.observer, FireDAC.Comp.DataSet, Datasnap.DBClient,
  Datasnap.Provider;

type
  TdataCadastroTemplate = class(TDataModule, idataCadastroTemplate)
    mtDados: TFDMemTable;

    dsCadastro: TDataSource;
    qCadastro: TFDQuery;
    dspCadastro: TDataSetProvider;
    cdsCadastro: TClientDataSet;
    dsConsultaGrade: TDataSource;
    qConsultaGrade: TFDQuery;
    dspConsultaGrade: TDataSetProvider;
    cdsConsultaGrade: TClientDataSet;

    procedure qCadastroAfterPost(DataSet: TDataSet);
    procedure qCadastroAfterDelete(DataSet: TDataSet);
    procedure dspCadastroAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    FNotificaObserver: TNotificaObserver;
  public
    function PegarMTCadastro: TFDMemTable;

    function PegarDSCadastro: TDataSource;
    function PegarQCadastro: TFDQuery;
    function PegarDSPCadastro: TDataSetProvider;
    function PegarCDSCadastro: TClientDataSet;

    function PegarDSConsultaGrade: TDataSource;
    function PegarQConsultaGrade: TFDQuery;
    function PegarDSPConsultaGrade: TDataSetProvider;
    function PegarCDSConsultaGrade: TClientDataSet;

    procedure SetNotificaObserver(const _ANotificaObserver: TNotificaObserver);
  end;

implementation

uses
  Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdataCadastroTemplate }

function TdataCadastroTemplate.PegarMTCadastro: TFDMemTable; begin Result := mtDados; end;

procedure TdataCadastroTemplate.dspCadastroAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  //
  showMessage('aqui');
end;

function TdataCadastroTemplate.PegarCDSCadastro: TClientDataSet;      begin Result := cdsCadastro; end;
function TdataCadastroTemplate.PegarCDSConsultaGrade: TClientDataSet; begin Result := cdsConsultaGrade; end;

function TdataCadastroTemplate.PegarDSCadastro: TDataSource;      begin Result := dsCadastro; end;
function TdataCadastroTemplate.PegarDSConsultaGrade: TDataSource; begin Result := dsConsultaGrade; end;

function TdataCadastroTemplate.PegarDSPCadastro: TDataSetProvider;      begin Result := dspCadastro; end;
function TdataCadastroTemplate.PegarDSPConsultaGrade: TDataSetProvider; begin Result := dspConsultaGrade; end;

function TdataCadastroTemplate.PegarQCadastro: TFDQuery;      begin Result := qCadastro; end;
function TdataCadastroTemplate.PegarQConsultaGrade: TFDQuery; begin Result := qConsultaGrade; end;

procedure TdataCadastroTemplate.qCadastroAfterDelete(DataSet: TDataSet);
begin
  if Assigned(FNotificaObserver) then
    FNotificaObserver;
end;

procedure TdataCadastroTemplate.qCadastroAfterPost(DataSet: TDataSet);
begin
  if Assigned(FNotificaObserver) then
    FNotificaObserver;
end;

procedure TdataCadastroTemplate.SetNotificaObserver(const _ANotificaObserver: TNotificaObserver);
begin
  FNotificaObserver := _ANotificaObserver;
end;

end.
