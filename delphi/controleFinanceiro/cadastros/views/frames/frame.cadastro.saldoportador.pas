unit frame.cadastro.saldoportador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, data.frame.cadastro.saldoportador,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ControlList, Vcl.Imaging.pngimage, data.images, Vcl.Buttons;

type
  TframeCadSaldoPortador = class(TFrame)
    pGeral: TPanel;
    pSaldos: TPanel;
    clSaldos: TControlList;
    tPortador: TDBText;
    tConta: TDBText;
    tTipo: TDBText;
    tSaldo: TDBText;
    pCabecalho: TPanel;
    lPortador: TLabel;
    lConta: TLabel;
    lTipo: TLabel;
    lSaldo: TLabel;
    pSaldoMembro: TPanel;
    lCabMembro: TLabel;
    lMembroFamilia: TLabel;
    lCabSaldoGeral: TLabel;
    lSaldoGeral: TLabel;
    iConta: TImage;
    sbImages: TSpeedButton;
    procedure clSaldosBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  private
    FdmSaldoPortador: TdmFrameSaldoPortador;
    FIdMembroFamilia: integer;
    FSaldoGeral: currency;

    function GetIdMembroFamilia: integer;
    procedure SetIdMembroFamilia(const Value: integer);
    function GetSaldoGeral: currency;
    procedure SetSaldoGeral(const Value: currency);

  public
    property IdMembroFamilia: integer  read GetIdMembroFamilia write SetIdMembroFamilia;
    property SaldoGeral: currency read GetSaldoGeral write SetSaldoGeral;

    procedure AtualizarCDSFrame;
    procedure GerarSQLFrame;
    procedure MontarLista;

  end;

implementation

uses
  consts.SQLs,
  consts.imagens,
  lib.helper.querys,
  lib.sql.geral;

{$R *.dfm}

{ TframeCadSaldoPortador }

function TframeCadSaldoPortador.GetIdMembroFamilia: integer;
begin
  Result := FIdMembroFamilia;
end;

function TframeCadSaldoPortador.GetSaldoGeral: currency;
begin
  Result := FSaldoGeral;
end;

procedure TframeCadSaldoPortador.SetIdMembroFamilia(const Value: integer);
begin
  FIdMembroFamilia := Value;
end;

procedure TframeCadSaldoPortador.SetSaldoGeral(const Value: currency);
begin
  FSaldoGeral := Value;
end;

procedure TframeCadSaldoPortador.AtualizarCDSFrame;
begin
  if FdmSaldoPortador.cdsFrameGrade.Active then
    FdmSaldoPortador.cdsFrameGrade.Refresh
  else
    FdmSaldoPortador.cdsFrameGrade.Active := True;
end;

procedure TframeCadSaldoPortador.clSaldosBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  if FdmSaldoPortador.cdsFrameGrade.Active then
  begin
    FdmSaldoPortador.cdsFrameGrade.RecNo := AIndex +1;
    iConta.Visible := FdmSaldoPortador.cdsFrameGrade.FieldByName('RESERVADOCAPITAL').AsBoolean;

    if (not FdmSaldoPortador.cdsFrameGrade.FieldByName('IMGPORTADOR').IsNull) then
      sbImages.ImageIndex := FdmSaldoPortador.cdsFrameGrade.FieldByName('IMGPORTADOR').AsInteger
    else
      sbImages.ImageIndex := TEnumImagens54Logo.EnumToValue(ci54Logonil);
  end;
end;

procedure TframeCadSaldoPortador.GerarSQLFrame;
begin
  FdmSaldoPortador := TdmFrameSaldoPortador.Create(Application);

  FdmSaldoPortador
    .qFrameGrade
      .PrepareSQL(
        TSQLGeral.New
          .SetEnumSQL(sqlFrameSaldoPortador)
            .PegarSQL)
      .SetParamCurrency('pSaldoGeral', FSaldoGeral)
      .SetParamInteger('pIdMembroFamilia', FIdMembroFamilia);

  AtualizarCDSFrame;

  TCurrencyField(FdmSaldoPortador.cdsFrameGrade.FieldByName('SALDOGERAL')).currency := True;
  TCurrencyField(FdmSaldoPortador.cdsFrameGrade.FieldByName('VALOR')).currency := True;
end;

procedure TframeCadSaldoPortador.MontarLista;
begin
  if not FdmSaldoPortador.cdsFrameGrade.Active then
    Exit;

  tPortador.DataField      := 'NOMEPORTADOR';
  tConta.DataField         := 'CONTA';
  tTipo.DataField          := 'DESCRICAOTIPOCONTA';
  tSaldo.DataField         := 'VALOR';

  tPortador.DataSource      := FdmSaldoPortador.dsFrameGrade;
  tConta.DataSource         := FdmSaldoPortador.dsFrameGrade;
  tTipo.DataSource          := FdmSaldoPortador.dsFrameGrade;
  tSaldo.DataSource         := FdmSaldoPortador.dsFrameGrade;

  clSaldos.ItemCount := FdmSaldoPortador.cdsFrameGrade.RecordCount;

  Self.Height := Self.Height + (clSaldos.ItemHeight * (clSaldos.ItemCount-1));

  FdmSaldoPortador.cdsFrameGrade.First;
  lMembroFamilia.Caption := FdmSaldoPortador.cdsFrameGrade.FieldByName('MEMBRO').AsString;
  lSaldoGeral.Caption := FormatFloat(',0.00', FdmSaldoPortador.cdsFrameGrade.FieldByName('SALDOGERAL').AsCurrency);

end;

end.

