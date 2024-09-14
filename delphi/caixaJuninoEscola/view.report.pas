unit view.report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  FireDAC.Comp.Client, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, data.geral,
  Vcl.Imaging.pngimage;

type
  TfReport = class(TForm)
    RLReport1: TRLReport;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLSubDetail1: TRLSubDetail;
    RLSubDetail2: TRLSubDetail;
    RLBand3: TRLBand;
    RLBand5: TRLBand;
    dbCaixa: TRLDBText;
    dbVlrFichas: TRLDBText;
    RLSubDetail3: TRLSubDetail;
    RLSubDetail4: TRLSubDetail;
    RLSubDetail5: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand2: TRLBand;
    RLDBResult2: TRLDBResult;
    RLBand6: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLBand7: TRLBand;
    lRetiradasValor: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLBand8: TRLBand;
    RLDBResult1: TRLDBResult;
    RLBand9: TRLBand;
    RLLabel8: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLBand10: TRLBand;
    dbFechaFichaParcial: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLBand11: TRLBand;
    totalFecFicha: TRLDBResult;
    RLBand12: TRLBand;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLBand13: TRLBand;
    dbFecSaldoValor: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLBand14: TRLBand;
    totalFecRetirada: TRLDBResult;
    RLBand15: TRLBand;
    lTotalFechamento: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    lResRetirado: TRLLabel;
    lResFechamento: TRLLabel;
    RLLabel27: TRLLabel;
    lResParcial: TRLLabel;
    lResTroco: TRLLabel;
    lResSaldo: TRLLabel;
    lStatusCaixa: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    lResRetSaldo: TRLLabel;
    lResVendaFicha: TRLLabel;
    lResValorFinal: TRLLabel;
    lResDiferenca: TRLLabel;
    RLLabel40: TRLLabel;
    iSaldoCaixa: TRLImage;
    RLDBText1: TRLDBText;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText13: TRLDBText;
    procedure lTotalFechamentoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResRetiradoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResFechamentoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResParcialBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure dbCaixaBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResTrocoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResSaldoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lStatusCaixaBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResRetSaldoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResVendaFichaBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResDiferencaBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lResValorFinalBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure iSaldoCaixaBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLDBResult2BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBResult1BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure totalFecRetiradaBeforePrint(Sender: TObject;
      var AText: string; var PrintIt: Boolean);
    procedure totalFecFichaBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    FTrocoCaixa: currency;
    FTotalFecFichas: currency;
    FTotalFecSaldos: currency;
    FTotalRetidados: currency;
    FTotalVlrFichas: currency;
    FSaldoCaixa: currency;
    FTotalFechamento: currency;

    function PegarValordoText(Texto: string): currency;
    function SetValorFormatado(valor: currency): string;

  public
    procedure IniciarVariaveis(geral: boolean);

  end;

var
  fReport: TfReport;

implementation

{$R *.dfm}

function TfReport.SetValorFormatado(valor: currency): string;
begin
  Result := formatfloat('R$ ,0.00', valor);
end;

procedure TfReport.totalFecFichaBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  FTotalFecFichas := PegarValordoText(AText);
end;

procedure TfReport.totalFecRetiradaBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  FTotalFecSaldos := PegarValordoText(AText);
end;

procedure TfReport.dbCaixaBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  FTrocoCaixa := dbCaixa.DataSet.FieldByName('troco').AsCurrency;
end;

procedure TfReport.IniciarVariaveis(geral: boolean);
begin
  FTrocoCaixa := 0;
  FSaldoCaixa := 0;
  FTotalFechamento := 0;
  FTotalFecFichas := 0;
  FTotalFecSaldos := 0;
  FTotalRetidados := 0;
  FTotalVlrFichas := 0;

  RLLabel25.Visible := geral;
  RLDBText2.Visible := geral;
  RLLabel26.Visible := geral;
  RLDBText6.Visible := geral;
  RLLabel28.Visible := geral;
  RLDBText7.Visible := geral;
  RLLabel29.Visible := geral;
  RLDBText13.Visible := geral;

  if geral then
  begin
    RLReport1.DataSource := datas.sourceMovGeral;
    dbCaixa.DataSource := datas.sourceMovGeral;
    RLDBText1.DataSource := datas.sourceMovGeral;
    RLSubDetail1.DataSource := datas.sourceMovGeral;

    RLSubDetail2.DataSource := datas.sourceGeralFicha;
    RLDBText4.DataSource := datas.sourceGeralFicha;
    RLDBText3.DataSource := datas.sourceGeralFicha;
    dbVlrFichas.DataSource := datas.sourceGeralFicha;
    RLDBText5.DataSource := datas.sourceGeralFicha;
    RLDBResult2.DataSource := datas.sourceGeralFicha;

    RLSubDetail3.DataSource := datas.sourceGeralRetirada;
    RLDBText8.DataSource := datas.sourceGeralRetirada;
    lRetiradasValor.DataSource := datas.sourceGeralRetirada;
    RLDBText9.DataSource := datas.sourceGeralRetirada;
    RLDBResult1.DataSource := datas.sourceGeralRetirada;

    RLSubDetail4.DataSource := datas.sourceGeralFecFicha;
    RLDBText11.DataSource := datas.sourceGeralFecFicha;
    RLDBText10.DataSource := datas.sourceGeralFecFicha;
    dbFechaFichaParcial.DataSource := datas.sourceGeralFecFicha;
    RLDBText12.DataSource := datas.sourceGeralFecFicha;
    totalFecFicha.DataSource := datas.sourceGeralFecFicha;

    RLSubDetail5.DataSource := datas.sourceGeralFecRetirada;
    RLDBText14.DataSource := datas.sourceGeralFecRetirada;
    dbFecSaldoValor.DataSource := datas.sourceGeralFecRetirada;
    RLDBText15.DataSource := datas.sourceGeralFecRetirada;
    totalFecRetirada.DataSource := datas.sourceGeralFecRetirada;
  end
  else
  begin
    RLReport1.DataSource := datas.sourceMovimento;
    dbCaixa.DataSource := datas.sourceMovimento;
    RLDBText1.DataSource := datas.sourceMovimento;
    RLSubDetail1.DataSource := datas.sourceMovimento;

    RLSubDetail2.DataSource := datas.sourceMovFichas;
    RLDBText4.DataSource := datas.sourceMovFichas;
    RLDBText3.DataSource := datas.sourceMovFichas;
    dbVlrFichas.DataSource := datas.sourceMovFichas;
    RLDBText5.DataSource := datas.sourceMovFichas;
    RLDBResult2.DataSource := datas.sourceMovFichas;

    RLSubDetail3.DataSource := datas.sourceMovRetirada;
    RLDBText8.DataSource := datas.sourceMovRetirada;
    lRetiradasValor.DataSource := datas.sourceMovRetirada;
    RLDBText9.DataSource := datas.sourceMovRetirada;
    RLDBResult1.DataSource := datas.sourceMovRetirada;

    RLSubDetail4.DataSource := datas.sourceFecFicha;
    RLDBText11.DataSource := datas.sourceFecFicha;
    RLDBText10.DataSource := datas.sourceFecFicha;
    dbFechaFichaParcial.DataSource := datas.sourceFecFicha;
    RLDBText12.DataSource := datas.sourceFecFicha;
    totalFecFicha.DataSource := datas.sourceFecFicha;

    RLSubDetail5.DataSource := datas.sourceFecSaldo;
    RLDBText14.DataSource := datas.sourceFecSaldo;
    dbFecSaldoValor.DataSource := datas.sourceFecSaldo;
    RLDBText15.DataSource := datas.sourceFecSaldo;
    totalFecRetirada.DataSource := datas.sourceFecSaldo;
  end;
end;

procedure TfReport.iSaldoCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  Imagem: integer;
begin
  iSaldoCaixa.Picture.Assign(nil);

       if FSaldoCaixa = 0 then Imagem := 8
  else if FSaldoCaixa > 0 then Imagem := 5
  else                         Imagem := 9;

  datas.Imagens20.GetBitmap(Imagem, iSaldoCaixa.Picture.Bitmap);
end;

procedure TfReport.lTotalFechamentoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  AText := 'Total Fechamento: '+ SetValorFormatado(FTotalFecFichas + FTotalFecSaldos);
end;

function TfReport.PegarValordoText(Texto: string): currency;
begin
  Result := strtocurr(Texto.Substring(Texto.IndexOf('R$'), Texto.Length).Replace('R$', EmptyStr).Replace('.', emptystr).Trim);
end;

procedure TfReport.RLDBResult1BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  FTotalRetidados := PegarValordoText(AText);
end;

procedure TfReport.RLDBResult2BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  FTotalVlrFichas := PegarValordoText(AText);
end;

procedure TfReport.lResDiferencaBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  AText := SetValorFormatado(FSaldoCaixa);

       if FSaldoCaixa = 0 then lResDiferenca.font.Color := clGreen
  else if FSaldoCaixa > 0 then lResDiferenca.font.Color := clNavy
  else                         lResDiferenca.font.Color := clRed;
end;

procedure TfReport.lResFechamentoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  FTotalFechamento := FTotalFecFichas + FTotalFecSaldos;
  AText := SetValorFormatado(FTotalFechamento);
end;

procedure TfReport.lResParcialBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  AText := SetValorFormatado(FTotalRetidados + (FTotalFecFichas + FTotalFecSaldos));
end;

procedure TfReport.lResRetiradoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  AText := SetValorFormatado(FTotalRetidados);
end;

procedure TfReport.lResSaldoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  if FTotalFechamento > 0 then
    FSaldoCaixa := (FTotalRetidados + (FTotalFecFichas + FTotalFecSaldos)) - (FTotalVlrFichas + FTrocoCaixa);
  AText := SetValorFormatado(FSaldoCaixa);

       if FSaldoCaixa = 0 then lResSaldo.font.Color := clGreen
  else if FSaldoCaixa > 0 then lResSaldo.font.Color := clNavy
  else                         lResSaldo.font.Color := clRed;
end;

procedure TfReport.lResTrocoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  if FTotalFechamento > 0 then
    AText := SetValorFormatado(FTotalVlrFichas + FTrocoCaixa)
  else
    AText := SetValorFormatado(0.0);
end;

procedure TfReport.lStatusCaixaBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
       if FSaldoCaixa = 0 then AText := 'O caixa está com valores consistentes'
  else if FSaldoCaixa > 0 then AText := 'O saldo do caixa está acima do esperado'
  else                         AText := 'O caixa está negativo!';
end;

procedure TfReport.lResRetSaldoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  AText := SetValorFormatado(FTotalRetidados + FTotalFecSaldos);
end;

procedure TfReport.lResValorFinalBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  if FTotalFechamento > 0 then
    AText := SetValorFormatado((FTotalRetidados + FTotalFecSaldos) - FTrocoCaixa)
  else
    AText := SetValorFormatado(0.0);
end;

procedure TfReport.lResVendaFichaBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  if FTotalFechamento > 0 then
    AText := SetValorFormatado(FTotalVlrFichas - FTotalFecFichas)
  else
    AText := SetValorFormatado(0.0);
end;

end.
