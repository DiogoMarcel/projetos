unit view.relatorio.abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, MidasLib,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions, model.relatorio.abastecimentos,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.DBCtrls, Vcl.ControlList;

type
  TformRelAbastecimentos = class(TformTemplate)
    clAbastecimentos: TControlList;
    dbtData: TDBText;
    dbtValor: TDBText;
    dbtObservacao: TDBText;
    dbtValorLitro: TDBText;
    pCabecalho: TPanel;
    lData: TLabel;
    lDifValorTotal: TLabel;
    lSaldoDisponivel: TLabel;
    lValorLitro: TLabel;
    lValorTotal: TLabel;
    dbtDifValor: TDBText;
    lKMCarro: TLabel;
    lDifKMCarro: TLabel;
    lQuantidadeLitros: TLabel;
    lDifQuantidadeLitros: TLabel;
    lMediaCarro: TLabel;
    dbtMedia: TDBText;
    dbtKMCarro: TDBText;
    dbtDifQuantidadeLitros: TDBText;
    dbtQuantidadeLitros: TDBText;
    dbtDifKMCarro: TDBText;
    pRodape: TPanel;
    lValorLitroGeral: TLabel;
    lMediaGeral: TLabel;
    lEspaco1: TLabel;
    lQtdLitrosGeral: TLabel;
    lEspaco2: TLabel;
    lKMRodados: TLabel;
    lEspaco3: TLabel;
    lValorTotalGeral: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clAbastecimentosBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  private
    dmAbastecimentos: TdmAbastecimentos;

    procedure CalcularValoresTotais;

  public
    class procedure AbrirRelatorio;

  end;

implementation

uses
  consts.SQLs,
  lib.sql.geral,
  lib.helper.querys;

{$R *.dfm}

{ TformRelAbastecimentos }

class procedure TformRelAbastecimentos.AbrirRelatorio;
var
  formRelAbastecimentos: TformRelAbastecimentos;
begin
  formRelAbastecimentos := TformRelAbastecimentos.Create(Application);
  try
    formRelAbastecimentos.ShowModal;
  finally
    FreeAndNil(formRelAbastecimentos);
  end;
end;

procedure TformRelAbastecimentos.CalcularValoresTotais;
var
  AValorLitroGeral: Double;
  AMediaGeral: Double;
  AQtdLitrosGeral: Double;
  AKMRodados: Integer;
  AValorTotalGeral: Double;
  AUltimoKMRodado: integer;
  AQtdRegistrosUteis: integer;
  AQtdRegistrosCalculoMensal: integer;
  AMediaMensal: Double;
begin
  AValorLitroGeral := 0.0;
  AMediaGeral := 0.0;
  AQtdLitrosGeral := 0.0;
  AValorTotalGeral := 0.0;

  lValorLitroGeral.Caption := EmptyStr;
  lMediaGeral.Caption := EmptyStr;
  lQtdLitrosGeral.Caption := EmptyStr;
  lKMRodados.Caption := EmptyStr;
  lValorTotalGeral.Caption := EmptyStr;

  dmAbastecimentos.cdsAbastecimentos.First;

  AMediaMensal := 0;
  AQtdRegistrosUteis := 0;
  AQtdRegistrosCalculoMensal := 0;
  AUltimoKMRodado := 0;
  AKMRodados := dmAbastecimentos.cdsAbastecimentoskmcarro.AsInteger;

  while not dmAbastecimentos.cdsAbastecimentos.Eof do
  begin
    if dmAbastecimentos.cdsAbastecimentosorigemdado.AsInteger = 1 then
    begin
      AMediaMensal := AMediaMensal / AQtdRegistrosCalculoMensal;

      dmAbastecimentos.cdsAbastecimentos.Edit;
      dmAbastecimentos.cdsAbastecimentosmedia.AsFloat := AMediaMensal;
      dmAbastecimentos.cdsAbastecimentos.Post;

      AQtdRegistrosCalculoMensal := 0;
      AMediaMensal := 0;
    end
    else
    begin
      Inc(AQtdRegistrosUteis);
      AValorTotalGeral := AValorTotalGeral + dmAbastecimentos.cdsAbastecimentostotalabastecimento.AsFloat;

      if dmAbastecimentos.cdsAbastecimentosmedia.AsFloat > 0 then
      begin
        Inc(AQtdRegistrosCalculoMensal);

        AMediaGeral := AMediaGeral + dmAbastecimentos.cdsAbastecimentosmedia.AsFloat;

        AMediaMensal := AMediaMensal + dmAbastecimentos.cdsAbastecimentosmedia.AsFloat;
      end;

      AQtdLitrosGeral := AQtdLitrosGeral + dmAbastecimentos.cdsAbastecimentosquantidadelitros.AsFloat;

      AValorLitroGeral := AValorLitroGeral + dmAbastecimentos.cdsAbastecimentosvalorlitro.AsFloat;

      AUltimoKMRodado := dmAbastecimentos.cdsAbastecimentoskmcarro.AsInteger;
    end;

    dmAbastecimentos.cdsAbastecimentos.Next;
  end;

  AKMRodados := (AUltimoKMRodado - AKMRodados) * -1;

  lValorLitroGeral.Caption := FormatFloat('R$ ,0.00',AValorLitroGeral/AQtdRegistrosUteis);
  lMediaGeral.Caption := FormatFloat(',0.00',AMediaGeral/(AQtdRegistrosUteis -1));
  lQtdLitrosGeral.Caption := FormatFloat(',0.00',AQtdLitrosGeral);
  lKMRodados.Caption := AKMRodados.ToString;
  lValorTotalGeral.Caption := FormatFloat('R$ ,0.00',AValorTotalGeral);

  dmAbastecimentos.cdsAbastecimentos.First;
end;

procedure TformRelAbastecimentos.clAbastecimentosBeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  inherited;
  dmAbastecimentos.cdsAbastecimentos.RecNo := AIndex +1;

  if dmAbastecimentos.cdsAbastecimentosorigemdado.AsInteger = 1 then
  begin
    dbtObservacao.Font.Style := [TFontStyle.fsBold];
    dbtValor.Font.Style := [TFontStyle.fsBold];
    dbtQuantidadeLitros.Font.Style := [TFontStyle.fsBold];

    dbtValor.Alignment := taCenter;
    dbtQuantidadeLitros.Alignment := taCenter;
    dbtMedia.Alignment := taCenter;
  end
  else
  begin
    dbtObservacao.Font.Style := [];
    dbtValor.Font.Style := [];
    dbtQuantidadeLitros.Font.Style := [];

    dbtValor.Alignment := taRightJustify;
    dbtQuantidadeLitros.Alignment := taRightJustify;
    dbtMedia.Alignment := taRightJustify;
  end;
end;

procedure TformRelAbastecimentos.FormCreate(Sender: TObject);
begin
  inherited;
  dmAbastecimentos := TdmAbastecimentos.Create(Application);

  dmAbastecimentos
    .qAbastecimentos
      .PrepareSQL(
        TSQLGeral.New
          .SetEnumSQL(sqlRelatorioAbastecimentos)
            .PegarSQL
      );

  dmAbastecimentos.cdsAbastecimentos.Active := True;

  clAbastecimentos.ItemCount := dmAbastecimentos.cdsAbastecimentos.RecordCount;

  TCurrencyField(dmAbastecimentos.cdsAbastecimentostotalabastecimento).Currency := True;
  TCurrencyField(dmAbastecimentos.cdsAbastecimentosdiftotalabastecimento).Currency := True;
  TCurrencyField(dmAbastecimentos.cdsAbastecimentosvalorlitro).Currency := True;

  CalcularValoresTotais;
end;

procedure TformRelAbastecimentos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmAbastecimentos);
  inherited;
end;

end.
