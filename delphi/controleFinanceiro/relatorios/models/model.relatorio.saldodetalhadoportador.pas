unit model.relatorio.saldodetalhadoportador;

interface

uses
  lib.DAO.dataModel,
  System.SysUtils,
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmSaldoDetalhadoPortador = class(TDataModule)
    qSaldoDetalhadoPortador: TFDQuery;
    dspSaldoDetalhadoPortador: TDataSetProvider;
    dsSaldoDetalhadoPortador: TDataSource;
    cdsSaldoDetalhadoPortador: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
