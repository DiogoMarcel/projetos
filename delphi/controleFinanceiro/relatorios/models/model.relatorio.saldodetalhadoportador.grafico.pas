unit model.relatorio.saldodetalhadoportador.grafico;

interface

uses
  lib.DAO.dataModel,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Data.DB, Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmSaldoDetalhadoPortadorGrafico = class(TDataModule)
    qSaldoDetalhadoPortador: TFDQuery;
    dspSaldoDetalhadoPortador: TDataSetProvider;
    dsSaldoDetalhadoPortador: TDataSource;
    cdsSaldoDetalhadoPortador: TClientDataSet;
    cdsSaldoDetalhadoPortadordataalteracao: TWideStringField;
    cdsSaldoDetalhadoPortadorsaldototal: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
