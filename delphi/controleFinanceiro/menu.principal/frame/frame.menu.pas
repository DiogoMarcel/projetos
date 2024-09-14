unit frame.menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, lib.observer,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCGrids, data.menu, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.CategoryButtons, Vcl.ControlList;

type
  TframeMenu = class(TFrame, iMenuObserver)
    pResumo: TPanel;
    clResumo: TControlList;
    sResumo: TShape;
    dbtValor: TDBText;
    dbtTitulo: TDBText;
    pAdicionais: TPanel;
    sAdicionais: TShape;
    clSaldoFolha: TControlList;
    lAdicionais: TLabel;
    dbtSaldoFolhaNOME: TDBText;
    dbtSaldoFolhaVALOR: TDBText;
    lResumo: TLabel;
    sDivAdicionais: TShape;
    pSaldoGeralMembros: TPanel;
    lSaldoFolha: TLabel;
    lValorSaldoGeral: TLabel;
    clContaPagamentos: TControlList;
    dbtDESCRICAO: TDBText;
    dbtVALORcp: TDBText;
    pContaPagamentos: TPanel;
    sContaPagamentos: TShape;
    lContaPagamentos: TLabel;
    sDivContaPagamentos: TShape;
    dbtSINAL: TDBText;
    procedure clResumoBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure clSaldoFolhaBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure clContaPagamentosBeforeDrawItem(AIndex: Integer;
      ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
    procedure clContaPagamentosDblClick(Sender: TObject);
  private
    FdmMenu: TdataMenu;
    FValorSaldoGeral: currency;
    procedure ConfigurarControlsList;
    procedure AdicionarTotalSaldoFolha;
    procedure VisualizarPaineis;

  protected
    procedure AtualizarObserver(_ANotificacao: TNotificacao);

  public
    procedure onCreateMenu;

  end;

implementation

uses
  lib.DAO.comandosTransacao,
  consts.nomeCadastros,
  lib.sql.contapagamento,
  consts.SQLs,
  lib.messages,
  lib.helper.querys;

{$R *.dfm}

{ TframeMenu }
procedure TframeMenu.AtualizarObserver(_ANotificacao: TNotificacao);
begin
  case _ANotificacao.TypeCadastros of
    cadConta,
    cadContaPagar,
    cadContaReceber,
    cadSaldoFGTS,
    cadSaldoPortador: begin
      FdmMenu.qMenu.AtivarQuery;
      clResumo.Repaint;
    end;
  end;
end;

procedure TframeMenu.VisualizarPaineis;
begin
  pResumo.Visible := (clResumo.ItemCount > 0);
  pAdicionais.Visible := (clSaldoFolha.ItemCount > 0);
  pContaPagamentos.Visible := (clContaPagamentos.ItemCount > 0);

  Self.Visible := pResumo.Visible or
                  pAdicionais.Visible or
                  pContaPagamentos.Visible;
end;

procedure TframeMenu.ConfigurarControlsList;
const
  IHEIGHT_RESUMO = 30;
begin
  clResumo.ItemCount := FdmMenu.qMenu.RecordCount;
  clResumo.ItemHeight := IHEIGHT_RESUMO;
  clResumo.Height := clResumo.ItemCount * IHEIGHT_RESUMO;

  clSaldoFolha.ItemCount := FdmMenu.qSaldoFolha.RecordCount;
  clSaldoFolha.ItemHeight := IHEIGHT_RESUMO;
  clSaldoFolha.Height := clSaldoFolha.ItemCount * IHEIGHT_RESUMO;

  clContaPagamentos.ItemCount := FdmMenu.qContaPagamentos.RecordCount;
  clContaPagamentos.ItemHeight := IHEIGHT_RESUMO;
  clContaPagamentos.Height := clContaPagamentos.ItemCount * IHEIGHT_RESUMO;
end;

procedure TframeMenu.AdicionarTotalSaldoFolha;
begin
  FdmMenu.qSaldoFolha.First;
  while (not FdmMenu.qSaldoFolha.Eof) do
  begin
    FValorSaldoGeral := FValorSaldoGeral + FdmMenu.qSaldoFolha.FieldByName('VALORFOLHAMEMBRO').AsCurrency;

    FdmMenu.qSaldoFolha.Next;
  end;

  lValorSaldoGeral.Caption := FormatFloat('R$ ,0.00', FValorSaldoGeral);
end;

procedure TframeMenu.clContaPagamentosBeforeDrawItem(AIndex: Integer;
                                                     ACanvas: TCanvas;
                                                     ARect: TRect;
                                                     AState: TOwnerDrawState);
begin
  FdmMenu.qContaPagamentos.RecNo := AIndex +1;
end;

procedure TframeMenu.clResumoBeforeDrawItem(AIndex: Integer;
                                            ACanvas: TCanvas;
                                            ARect: TRect;
                                            AState: TOwnerDrawState);
begin
  FdmMenu.qMenu.RecNo := AIndex +1;
end;

procedure TframeMenu.clSaldoFolhaBeforeDrawItem(AIndex: Integer;
                                                ACanvas: TCanvas;
                                                ARect: TRect;
                                                AState: TOwnerDrawState);
begin
  FdmMenu.qSaldoFolha.RecNo := AIndex +1;
end;

procedure TframeMenu.onCreateMenu;
begin
  FValorSaldoGeral := 0;

  FdmMenu := TdataMenu.Create(Self);
  FdmMenu.qMenu.AtivarQuery;
  FdmMenu.qSaldoFolha.AtivarQuery;
  FdmMenu.qContaPagamentos.AtivarQuery;

  ConfigurarControlsList;
  AdicionarTotalSaldoFolha;
  VisualizarPaineis;
end;

procedure TframeMenu.clContaPagamentosDblClick(Sender: TObject);
var
  AIdContaPagamentos: Integer;
  AIdConta: integer;
begin
  if (not TLibMessages.New.Confirmar('Confirmar o pagamento da conta?')) then
    Exit;

  FdmMenu.qContaPagamentos.RecNo := clContaPagamentos.ItemIndex+1;
  AIdContaPagamentos := FdmMenu.qContaPagamentos.FieldByName('IDCONTAPAGAMENTOS').AsInteger;
  AIdConta := FdmMenu.qContaPagamentos.FieldByName('IDCONTA').AsInteger;

  TdmCmdTransacao.New
    .AddCommand(
        TSQLContaPagamentos.New
          .SetEnumSQL(sqlContaPgtoUpdateBaixaEfetuada)
          .PegarSQL()
        )
      .SetParamDateTime('pDATABAIXA', Now())
      .SetParamInteger('pIDCONTAPAGAMENTOS', AIdContaPagamentos)
        .Executar;

  TdmCmdTransacao.New
    .AddCommand(
      TSQLContaPagamentos.New
          .SetEnumSQL(sqlContaPgtoInsertSaldoExtratoConta)
          .PegarSQL()
        )
      .SetParamInteger('pIDCONTA', AIdConta)
        .Executar;

  FdmMenu.qContaPagamentos.AtivarQuery;
  ConfigurarControlsList;
  VisualizarPaineis;
end;

end.

