unit frame.menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, lib.observer,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCGrids, data.menu, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.CategoryButtons, Vcl.ControlList,
  System.Actions, Vcl.ActnList, data.images;

type
  TframeMenu = class(TFrame, iMenuObserver)
    ActionList: TActionList;
    aCalcularProjecao: TAction;
    sbFrame: TScrollBox;
    pResumo: TPanel;
    sResumo: TShape;
    lResumo: TLabel;
    clResumo: TControlList;
    dbtValor: TDBText;
    dbtTitulo: TDBText;
    pAdicionais: TPanel;
    sAdicionais: TShape;
    lAdicionais: TLabel;
    sDivAdicionais: TShape;
    pSaldoGeralMembros: TPanel;
    lSaldoFolha: TLabel;
    lValorSaldoGeral: TLabel;
    clSaldoFolha: TControlList;
    dbtSaldoFolhaNOME: TDBText;
    dbtSaldoFolhaVALOR: TDBText;
    clContaPagamentos: TControlList;
    dbtDESCRICAO: TDBText;
    dbtVALORcp: TDBText;
    dbtSINAL: TDBText;
    pContaPagamentos: TPanel;
    sContaPagamentos: TShape;
    lContaPagamentos: TLabel;
    sDivContaPagamentos: TShape;
    pProjecao: TPanel;
    sProjecao: TShape;
    lProjecao: TLabel;
    pQtdMeses: TPanel;
    lMeses: TLabel;
    eQtdMeses: TEdit;
    bCalcular: TButton;
    clProjecao: TControlList;
    dbtValorProjecao: TDBText;
    dbtTituloProjecao: TDBText;
    procedure clResumoBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure clSaldoFolhaBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure clContaPagamentosBeforeDrawItem(AIndex: Integer;
      ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
    procedure clContaPagamentosDblClick(Sender: TObject);
    procedure clProjecaoBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure aCalcularProjecaoExecute(Sender: TObject);
  private
    FdmMenuModulo: TdataMenu;
    FValorSaldoGeral: currency;
    procedure ConfigurarControlsList;
    procedure AdicionarTotalSaldoFolha;
    procedure VisualizarPaineis;

  protected
    procedure AtualizarObserver(_ANotificacao: TNotificacao);

  public
    procedure onCreateMenu;

    function PegarValorEditorFrameMenu: integer;

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
      FdmMenuModulo.qMenu.AtivarQuery;
      clResumo.Repaint;

      FdmMenuModulo.qProjecao.AtivarQuery;
      clProjecao.Repaint;
    end;
  end;
end;

procedure TframeMenu.VisualizarPaineis;
begin
  pResumo.Visible := (clResumo.ItemCount > 0);
  pAdicionais.Visible := (clSaldoFolha.ItemCount > 0);
  pContaPagamentos.Visible := (clContaPagamentos.ItemCount > 0);
  pProjecao.Visible := (clProjecao.ItemCount > 0);

  Self.Visible := pResumo.Visible or
                  pAdicionais.Visible or
                  pContaPagamentos.Visible or
                  pProjecao.Visible;
end;

procedure TframeMenu.ConfigurarControlsList;
const
  IHEIGHT_RESUMO = 30;
begin
  clResumo.ItemCount := FdmMenuModulo.qMenu.RecordCount;
  clResumo.ItemHeight := IHEIGHT_RESUMO;
  clResumo.Height := clResumo.ItemCount * IHEIGHT_RESUMO;

  clSaldoFolha.ItemCount := FdmMenuModulo.qSaldoFolha.RecordCount;
  clSaldoFolha.ItemHeight := IHEIGHT_RESUMO;
  clSaldoFolha.Height := clSaldoFolha.ItemCount * IHEIGHT_RESUMO;

  clContaPagamentos.ItemCount := FdmMenuModulo.qContaPagamentos.RecordCount;
  clContaPagamentos.ItemHeight := IHEIGHT_RESUMO;
  clContaPagamentos.Height := clContaPagamentos.ItemCount * IHEIGHT_RESUMO;

  clProjecao.ItemCount := FdmMenuModulo.qProjecao.RecordCount;
  clProjecao.ItemHeight := IHEIGHT_RESUMO;
  clProjecao.Height := clProjecao.ItemCount * IHEIGHT_RESUMO;
end;

procedure TframeMenu.aCalcularProjecaoExecute(Sender: TObject);
begin
  FdmMenuModulo.CalcularProjecao;

  FdmMenuModulo.qProjecao.AtivarQuery;
  clProjecao.Repaint;

  VisualizarPaineis;
end;

procedure TframeMenu.AdicionarTotalSaldoFolha;
begin
  FdmMenuModulo.qSaldoFolha.First;
  while (not FdmMenuModulo.qSaldoFolha.Eof) do
  begin
    FValorSaldoGeral := FValorSaldoGeral + FdmMenuModulo.qSaldoFolha.FieldByName('VALORFOLHAMEMBRO').AsCurrency;

    FdmMenuModulo.qSaldoFolha.Next;
  end;

  lValorSaldoGeral.Caption := FormatFloat('R$ ,0.00', FValorSaldoGeral);
end;

procedure TframeMenu.clContaPagamentosBeforeDrawItem(AIndex: Integer;
                                                     ACanvas: TCanvas;
                                                     ARect: TRect;
                                                     AState: TOwnerDrawState);
begin
  FdmMenuModulo.qContaPagamentos.RecNo := AIndex +1;
end;

procedure TframeMenu.clResumoBeforeDrawItem(AIndex: Integer;
                                            ACanvas: TCanvas;
                                            ARect: TRect;
                                            AState: TOwnerDrawState);
begin
  FdmMenuModulo.qMenu.RecNo := AIndex +1;
end;

procedure TframeMenu.clProjecaoBeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  FdmMenuModulo.qProjecao.RecNo := AIndex +1;
end;

procedure TframeMenu.clSaldoFolhaBeforeDrawItem(AIndex: Integer;
                                                ACanvas: TCanvas;
                                                ARect: TRect;
                                                AState: TOwnerDrawState);
begin
  FdmMenuModulo.qSaldoFolha.RecNo := AIndex +1;
end;

procedure TframeMenu.onCreateMenu;
begin
  FValorSaldoGeral := 0;

  FdmMenuModulo := TdataMenu.Create(Self, PegarValorEditorFrameMenu);

  FdmMenuModulo.qMenu.AtivarQuery;
  FdmMenuModulo.qSaldoFolha.AtivarQuery;
  FdmMenuModulo.qContaPagamentos.AtivarQuery;
  FdmMenuModulo.qProjecao.AtivarQuery;

  ConfigurarControlsList;
  AdicionarTotalSaldoFolha;
  VisualizarPaineis;

  clResumo.Repaint;
end;

function TframeMenu.PegarValorEditorFrameMenu: integer;
begin
  Result := StrToIntDef(eQtdMeses.Text, 0);
end;

procedure TframeMenu.clContaPagamentosDblClick(Sender: TObject);
var
  AIdContaPagamentos: Integer;
//  AIdConta: integer;
begin
  if (not TLibMessages.New.Confirmar('Confirmar o pagamento da conta?')) then
    Exit;

  FdmMenuModulo.qContaPagamentos.RecNo := clContaPagamentos.ItemIndex+1;
  AIdContaPagamentos := FdmMenuModulo.qContaPagamentos.FieldByName('IDCONTAPAGAMENTOS').AsInteger;
//  AIdConta := FdmMenuModulo.qContaPagamentos.FieldByName('IDCONTA').AsInteger;

  TdmCmdTransacao.New
    .AddCommand(
        TSQLContaPagamentos.New
          .SetEnumSQL(sqlContaPgtoUpdateBaixaEfetuada)
          .PegarSQL()
        )
      .SetParamDateTime('pDATABAIXA', Now())
      .SetParamInteger('pIDCONTAPAGAMENTOS', AIdContaPagamentos)
        .Executar;

//  TdmCmdTransacao.New
//    .AddCommand(
//      TSQLContaPagamentos.New
//          .SetEnumSQL(sqlContaPgtoInsertSaldoExtratoConta)
//          .PegarSQL()
//        )
//      .SetParamInteger('pIDCONTA', AIdConta)
//        .Executar;

  FdmMenuModulo.qContaPagamentos.AtivarQuery;
  ConfigurarControlsList;
  VisualizarPaineis;
end;

end.

