unit view.relatorio.saldoextrato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions, model.relatorio.saldoextrato,
  Data.DB, Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, Vcl.ControlList;

type
  TformSaldoExtrato = class(TformTemplate)
    pnlGeral: TPanel;
    clSaldos: TControlList;
    dbtData: TDBText;
    dbtValor: TDBText;
    dbtDescricao: TDBText;
    iPositivo: TImage;
    iNegativo: TImage;
    iEquals: TImage;
    pCabecalho: TPanel;
    lData: TLabel;
    lValor: TLabel;
    lSaldoDisponivel: TLabel;
    lAcumulado: TLabel;
    pnlSaldoInicial: TPanel;
    lblSaldoFinal: TLabel;
    dbtSaldo: TDBText;
    lblSaldoFinalTitulo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure clSaldosBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  private
    dmSaldoExtrato: TdmSaldoExtrato;

  public
    class procedure AbrirRelatorio;

  end;

var
  formSaldoExtrato: TformSaldoExtrato;

implementation

uses
  consts.SQLs,
  lib.sql.geral,
  lib.helper.querys,
  model.relatorio.saldodetalhadoportador;

{$R *.dfm}

{ TformSaldoExtrato }

class procedure TformSaldoExtrato.AbrirRelatorio;
var
  formSaldoExtrato: TformSaldoExtrato;
begin
  formSaldoExtrato := TformSaldoExtrato.Create(Application);
  try
    formSaldoExtrato.ShowModal;
  finally
    FreeAndNil(formSaldoExtrato);
  end;
end;

procedure TformSaldoExtrato.clSaldosBeforeDrawItem(AIndex: Integer;
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

procedure TformSaldoExtrato.FormCreate(Sender: TObject);
begin
  inherited;
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

procedure TformSaldoExtrato.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmSaldoExtrato);
  inherited;
end;

end.