unit view.relatorio.saldodetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, Vcl.ControlList, frame.menu.saldodetalhado, Data.DB, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,
  model.relatorio.saldodetalhadoportador.grafico,
  model.relatorio.saldoextrato;

type
  TformSaldoDetalhes = class(TformTemplate)
    pResumo: TPanel;
    frameResumo: TframeMenuSaldoDetalhado;
    pCorpo: TPanel;
    pSaldoExtrato: TPanel;
    pnlGeral: TPanel;
    clSaldos: TControlList;
    dbtData: TDBText;
    dbtValor: TDBText;
    dbtDescricao: TDBText;
    iPositivo: TImage;
    iNegativo: TImage;
    iEquals: TImage;
    dbtSaldo: TDBText;
    pCabecalho: TPanel;
    lData: TLabel;
    lValor: TLabel;
    lSaldoDisponivel: TLabel;
    lAcumulado: TLabel;
    pnlSaldoInicial: TPanel;
    lblSaldoFinal: TLabel;
    lblSaldoFinalTitulo: TLabel;
    DBChart2: TDBChart;
    Series2: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure clSaldosBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  private
    { Private declarations }
    dmSaldoDetalhadoPortador: TdmSaldoDetalhadoPortadorGrafico;
    dmSaldoExtrato: TdmSaldoExtrato;

  public
    class procedure AbrirRelatorio;

  end;

implementation

uses
  consts.SQLs,
  lib.sql.geral,
  lib.helper.querys;

{$R *.dfm}

{ TformSaldoDetalhes }

class procedure TformSaldoDetalhes.AbrirRelatorio;
var
  formSaldoDetalhes: TformSaldoDetalhes;
begin
  formSaldoDetalhes := TformSaldoDetalhes.Create(Application);
  try
    formSaldoDetalhes.ShowModal;
  finally
    FreeAndNil(formSaldoDetalhes);
  end;
end;

procedure TformSaldoDetalhes.clSaldosBeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  inherited;
  dmSaldoExtrato.cdsSaldoExtrato.RecNo := AIndex +1;

  iPositivo.Visible := (dmSaldoExtrato.cdsSaldoExtrato.FieldByName('TIPOSALDO').AsString.Equals('R'));
  iEquals.Visible   := (dmSaldoExtrato.cdsSaldoExtrato.FieldByName('TIPOSALDO').AsString.Equals('='));
  iNegativo.Visible := (dmSaldoExtrato.cdsSaldoExtrato.FieldByName('TIPOSALDO').AsString.Equals('P'));

  if (dmSaldoExtrato.cdsSaldoExtrato.FieldByName('EXIBIRDATA').AsInteger.ToString.Equals('1')) then
  begin
    dbtData.DataField := 'datalancamento';
  end
  else
  begin
    dbtData.DataField := '';
  end;

  if iPositivo.Visible then
    dbtvalor.Alignment := taRightJustify
  else if iEquals.Visible then
    dbtvalor.Alignment := taCenter
  else if iNegativo.Visible then
    dbtvalor.Alignment := taLeftJustify;
end;

procedure TformSaldoDetalhes.FormCreate(Sender: TObject);
begin
  inherited;

  frameResumo.onCreateMenu;

  /////////////////////////// - Gráfico

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

  /////////////////////////// - Extrato

  dmSaldoExtrato := TdmSaldoExtrato.Create(Application);

  dmSaldoExtrato
    .qSaldoExtrato
      .PrepareSQL(
        TSQLGeral.New
          .SetEnumSQL(sqlSaldoExtrato)
            .PegarSQL
      );

  dbtData.DataSource := dmSaldoExtrato.dsSaldoExtrato;
  dbtDescricao.DataSource := dmSaldoExtrato.dsSaldoExtrato;
  dbtValor.DataSource := dmSaldoExtrato.dsSaldoExtrato;
  dbtSaldo.DataSource := dmSaldoExtrato.dsSaldoExtrato;

  dmSaldoExtrato.cdsSaldoExtrato.Active := True;

  clSaldos.ItemCount := dmSaldoExtrato.cdsSaldoExtrato.RecordCount;

  TCurrencyField(dmSaldoExtrato.cdsSaldoExtrato.FieldByName('VALOR')).Currency := True;
  TCurrencyField(dmSaldoExtrato.cdsSaldoExtrato.FieldByName('SALDO')).Currency := True;

  lblSaldoFinal.Caption := FormatFloat('R$ #,0.00', dmSaldoExtrato.cdsSaldoExtrato.FieldByName('SALDO').AsCurrency);

end;

procedure TformSaldoDetalhes.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmSaldoDetalhadoPortador);
  FreeAndNil(dmSaldoExtrato);
  inherited;
end;

end.
