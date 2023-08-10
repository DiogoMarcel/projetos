unit view.relatorio.saldodetalhadoportador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, lib.sql.geral,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions, model.relatorio.saldodetalhadoportador,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ControlList, Vcl.StdCtrls, lib.helper.querys, Vcl.DBCtrls, Data.DB,
  Vcl.Imaging.pngimage;

type
  TformSaldoDetalhadoPortador = class(TformTemplate)
    clSaldos: TControlList;
    pCabecalho: TPanel;
    dbtData: TDBText;
    dbtSaldoTotal: TDBText;
    dbtSaldoDisponivel: TDBText;
    dbtDiferenca: TDBText;
    dbtAcumulado: TDBText;
    lData: TLabel;
    lSaldoTotal: TLabel;
    lSaldoDisponivel: TLabel;
    lDiferenca: TLabel;
    lAcumulado: TLabel;
    iPositivo: TImage;
    iNegativo: TImage;
    iEquals: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure clSaldosBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  private
    dmSaldoDetalhadoPortador: TdmSaldoDetalhadoPortador;
  public
    class procedure AbrirRelatorio;
  end;

implementation

uses
  consts.SQLs;

{$R *.dfm}

{ TformSaldoDetalhadoPortador }

class procedure TformSaldoDetalhadoPortador.AbrirRelatorio;
var
  formSaldoDetalhadoPortador: TformSaldoDetalhadoPortador;
begin
  formSaldoDetalhadoPortador := TformSaldoDetalhadoPortador.Create(Application);
  try
    formSaldoDetalhadoPortador.ShowModal;
  finally
    FreeAndNil(formSaldoDetalhadoPortador);
  end;
end;

procedure TformSaldoDetalhadoPortador.clSaldosBeforeDrawItem(
  AIndex: Integer; ACanvas: TCanvas; ARect: TRect;
  AState: TOwnerDrawState);
begin
  inherited;
  dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.RecNo := AIndex +1;

  iPositivo.Visible := (dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('diferenca').AsCurrency > 0);
  iEquals.Visible   := (dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('diferenca').AsCurrency = 0);
  iNegativo.Visible := (dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('diferenca').AsCurrency < 0);
end;

procedure TformSaldoDetalhadoPortador.FormCreate(Sender: TObject);
begin
  inherited;
  dmSaldoDetalhadoPortador := TdmSaldoDetalhadoPortador.Create(Application);

  dmSaldoDetalhadoPortador
    .qSaldoDetalhadoPortador
      .PrepareSQL(
        TSQLGeral.New
          .SetEnumSQL(sqlSaldoDetalhadoPortador)
            .PegarSQL
      );

  dbtData.DataSource := dmSaldoDetalhadoPortador.dsSaldoDetalhadoPortador;
  dbtSaldoTotal.DataSource := dmSaldoDetalhadoPortador.dsSaldoDetalhadoPortador;
  dbtSaldoDisponivel.DataSource := dmSaldoDetalhadoPortador.dsSaldoDetalhadoPortador;
  dbtDiferenca.DataSource := dmSaldoDetalhadoPortador.dsSaldoDetalhadoPortador;
  dbtAcumulado.DataSource := dmSaldoDetalhadoPortador.dsSaldoDetalhadoPortador;

  dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.Active := True;

  clSaldos.ItemCount := dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.RecordCount;

  TCurrencyField(dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('SALDOTOTAL')).Currency := True;
  TCurrencyField(dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('SALDODISPONIVEL')).Currency := True;
  TCurrencyField(dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('DIFERENCA')).Currency := True;
  TCurrencyField(dmSaldoDetalhadoPortador.cdsSaldoDetalhadoPortador.FieldByName('ACUMULADO')).Currency := True;
end;

procedure TformSaldoDetalhadoPortador.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmSaldoDetalhadoPortador);
  inherited;
end;

end.


