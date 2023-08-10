unit view.relatorio.saldodetalhadoportador.grafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, VCLTee.Series,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, model.relatorio.saldodetalhadoportador.grafico,
  VCLTee.TeeDBCrossTab;

type
  TformSaldoDetalhadoPortadorGrafico = class(TformTemplate)
    DBChart1: TDBChart;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    dmSaldoDetalhadoPortador: TdmSaldoDetalhadoPortadorGrafico;

  public
    class procedure AbrirRelatorio;

  end;

implementation

uses
  consts.SQLs,
  lib.sql.geral,
  lib.helper.querys;

{$R *.dfm}

{ TformSaldoDetalhadoPortadorGrafico }

class procedure TformSaldoDetalhadoPortadorGrafico.AbrirRelatorio;
var
  formSaldoDetalhadoPortador: TformSaldoDetalhadoPortadorGrafico;
begin
  formSaldoDetalhadoPortador := TformSaldoDetalhadoPortadorGrafico.Create(Application);
  try
    formSaldoDetalhadoPortador.ShowModal;
  finally
    FreeAndNil(formSaldoDetalhadoPortador);
  end;
end;

procedure TformSaldoDetalhadoPortadorGrafico.FormCreate(Sender: TObject);
begin
  inherited;
  dmSaldoDetalhadoPortador := TdmSaldoDetalhadoPortadorGrafico.Create(Application);

  dmSaldoDetalhadoPortador
    .qSaldoDetalhadoPortador
      .PrepareSQL(
        TSQLGeral.New
          .SetEnumSQL(sqlSaldoDetalhadoPortadorGrafico)
            .PegarSQL
      );

  dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.Active := True;

  TCurrencyField(dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('SALDOTOTAL')).Currency := True;
end;

procedure TformSaldoDetalhadoPortadorGrafico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmSaldoDetalhadoPortador);
  inherited;
end;

end.
