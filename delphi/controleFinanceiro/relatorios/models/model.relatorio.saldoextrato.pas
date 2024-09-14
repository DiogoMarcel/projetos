unit model.relatorio.saldoextrato;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Data.DB, Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmSaldoExtrato = class(TDataModule)
    qSaldoExtrato: TFDQuery;
    dspSaldoExtrato: TDataSetProvider;
    dsSaldoExtrato: TDataSource;
    cdsSaldoExtrato: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
