unit view.aluguel.lancamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions, data.aluguel.lancamento,
  Vcl.ActnList, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, lib.helper.querys,
  lib.sql.alugueis, consts.SQLs, frame.aluguel.lancamento, Vcl.Buttons, data.images,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TformAluguelLancamento = class(TformTemplate)
    pHistorico: TPanel;
    pLancamento: TGridPanel;
    lTituloHistorico: TLabel;
    gAluguel: TDBGrid;
    fAluguel: TframeAluguelLancamento;
    fAluguelComp: TframeAluguelLancamento;
    Panel1: TPanel;
    sbExcluirCadastro: TSpeedButton;
    sbEditarCadastro: TSpeedButton;
    sbIncluirCadastro: TSpeedButton;
    aNovoHist: TAction;
    aEditHist: TAction;
    aDelHist: TAction;
    aContasAdic: TAction;
    sbConfirmarPagtoComp: TSpeedButton;
    sbConfirmarPagto: TSpeedButton;
    aConfirmarPagto: TAction;
    aConfirmarPagtoComp: TAction;
    aContasEdit: TAction;
    aContasAdicDesc: TAction;
    aContasEditDesc: TAction;
    aContasDel: TAction;
    aContasDelDesc: TAction;
    aContasCompAdic: TAction;
    aContasCompEdit: TAction;
    aContasCompAdicAcre: TAction;
    aContasCompEditAcre: TAction;
    aContasCompDel: TAction;
    aContasCompDelAcre: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aNovoHistExecute(Sender: TObject);
    procedure aEditHistExecute(Sender: TObject);
    procedure aDelHistExecute(Sender: TObject);
    procedure aContasAdicExecute(Sender: TObject);
    procedure aConfirmarPagtoExecute(Sender: TObject);
    procedure aConfirmarPagtoCompExecute(Sender: TObject);
    procedure aContasEditExecute(Sender: TObject);
    procedure aContasAdicDescExecute(Sender: TObject);
    procedure aContasEditDescExecute(Sender: TObject);
    procedure aContasDelExecute(Sender: TObject);
    procedure aContasDelDescExecute(Sender: TObject);
    procedure aContasCompAdicExecute(Sender: TObject);
    procedure aContasCompAdicAcreExecute(Sender: TObject);
    procedure aContasCompEditExecute(Sender: TObject);
    procedure aContasCompEditAcreExecute(Sender: TObject);
    procedure aContasCompDelExecute(Sender: TObject);
    procedure aContasCompDelAcreExecute(Sender: TObject);
  private
    FdmAluguel: TdataAluguel;

    procedure CarregarData;
    procedure AtualizarCDS;
    procedure AdicionarNovoHistorico;
    procedure AbrirEditorContaAluguel(Conta, Inclusao: Boolean; Compartilhado: boolean = false);
    procedure DeletarContas(IDAluguelConta: int64);

  public
    class procedure AbrirAluguel;

  end;

implementation

uses
  lib.messages,
  view.aluguel.editor,
  lib.DAO.interfaces,
  lib.DAO.comandosTransacao;

{$R *.dfm}

{ TformAluguelLancamento }

class procedure TformAluguelLancamento.AbrirAluguel;
var
  formAluguelLancamento: TformAluguelLancamento;
begin
  formAluguelLancamento := TformAluguelLancamento.Create(Application);
  try
    formAluguelLancamento.ShowModal;
  finally
    FreeAndNil(formAluguelLancamento);
  end;
end;

procedure TformAluguelLancamento.FormCreate(Sender: TObject);
begin
  inherited;
  FdmAluguel := TdataAluguel.Create(Self);

  CarregarData;

  gAluguel.DataSource               := FdmAluguel.dsAluguel;

  fAluguel.gCobranca.DataSource     := FdmAluguel.dsAluguelCob;
  fAluguel.gDesconto.DataSource     := FdmAluguel.dsAluguelDes;


  fAluguelComp.gCobranca.DataSource := FdmAluguel.dsAluguelCompCob;
  fAluguelComp.gDesconto.DataSource := FdmAluguel.dsAluguelCompDes;


  fAluguel.VisualizarImagens(not FdmAluguel.cdsAlugueldatapagamento.IsNull
                            ,    FdmAluguel.cdsAlugueldatapagamento.IsNull
                            ,False);

  fAluguelComp.VisualizarImagens(not FdmAluguel.cdsAluguelpagamentocomp.IsNull
                                ,    FdmAluguel.cdsAluguelpagamentocomp.IsNull
                                ,True);
end;

procedure TformAluguelLancamento.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FdmAluguel) then
    FreeAndNil(FdmAluguel);
end;

procedure TformAluguelLancamento.aContasAdicDescExecute(Sender: TObject);
begin
  inherited;
  AbrirEditorContaAluguel(False, True);
end;

procedure TformAluguelLancamento.aContasAdicExecute(Sender: TObject);
begin
  inherited;

  if not FdmAluguel.qAluguelCob.IsEmpty then
    AbrirEditorContaAluguel(True, True)
  else
  begin
    TdmCmdTransacao.New
      .AddCommand(TSQLAlugueis.New
                    .SetEnumSQL(sqlAluguelInserirContas)
                      .PegarSQL)
      .SetParamInteger('pIDALUGUEL', FdmAluguel.cdsAluguelidaluguel.AsInteger)
      .Executar;

    AtualizarCDS;
  end;
end;

procedure TformAluguelLancamento.aContasDelDescExecute(Sender: TObject);
begin
  inherited;
  DeletarContas(FdmAluguel.qAluguelDesidaluguelconta.AsInteger);
end;

procedure TformAluguelLancamento.aContasDelExecute(Sender: TObject);
begin
  inherited;
  DeletarContas(FdmAluguel.qAluguelCobidaluguelconta.AsInteger);
end;

procedure TformAluguelLancamento.aContasEditDescExecute(Sender: TObject);
begin
  inherited;
  AbrirEditorContaAluguel(False, False);
end;

procedure TformAluguelLancamento.aContasEditExecute(Sender: TObject);
begin
  inherited;
  AbrirEditorContaAluguel(True, False);
end;

procedure TformAluguelLancamento.aDelHistExecute(Sender: TObject);
begin
  inherited;

  if (not TLibMessages.New.Confirmar('Deseja realmente excluir o registro?')) then
    Exit;

  FdmAluguel.cdsAluguel.Delete;
  FdmAluguel.cdsAluguel.ApplyUpdates(0);

  AtualizarCDS;

  TLibMessages.New.Informar('Histórico alterado com sucesso!');
end;

procedure TformAluguelLancamento.AdicionarNovoHistorico;
begin
  TdmCmdTransacao.New
    .AddCommand(TSQLAlugueis.New
                  .SetEnumSQL(sqlAluguelInsertHistorico)
                    .PegarSQL)
    .Executar;

  AtualizarCDS;

  TLibMessages.New.Informar('Novo histórico incluso com sucesso!');
end;

procedure TformAluguelLancamento.aEditHistExecute(Sender: TObject);
begin
  inherited;

  case FdmAluguel.cdsAluguel.State of
    dsEdit
    , dsInsert: begin
      FdmAluguel.cdsAluguel.Post;
      FdmAluguel.cdsAluguel.ApplyUpdates(0);

      AtualizarCDS;

      TLibMessages.New.Informar('Histórico alterado com sucesso!');
    end;
    else
      FdmAluguel.cdsAluguel.Edit;
  end;

end;

procedure TformAluguelLancamento.aNovoHistExecute(Sender: TObject);
begin
  inherited;
  AdicionarNovoHistorico;
end;

procedure TformAluguelLancamento.AtualizarCDS;
begin
  if FdmAluguel.cdsAluguel.Active then
  begin
    FdmAluguel.cdsAluguel.Refresh;
    FdmAluguel.qAluguelCob.Refresh;
    FdmAluguel.qAluguelDes.Refresh;
    FdmAluguel.qAluguelTotal.Refresh;
    FdmAluguel.qAluguelCompCob.Refresh;
    FdmAluguel.qAluguelCompDes.Refresh;
    FdmAluguel.qAluguelTotalComp.Refresh;
  end
  else
  begin
    FdmAluguel.cdsAluguel.Active        := True;
    FdmAluguel.qAluguelCob.Active       := True;
    FdmAluguel.qAluguelDes.Active       := True;
    FdmAluguel.qAluguelTotal.Active     := True;
    FdmAluguel.qAluguelCompCob.Active   := True;
    FdmAluguel.qAluguelCompDes.Active   := True;
    FdmAluguel.qAluguelTotalComp.Active := True;
  end;
end;

procedure TformAluguelLancamento.CarregarData;
begin
  FdmAluguel
    .qAluguel
      .PrepareSQL(
        TSQLAlugueis.New
          .SetEnumSQL(sqlAluguelHistorico)
            .PegarSQL);

  FdmAluguel
    .qAluguelCob
      .PrepareSQL(
        TSQLAlugueis.New
          .SetEnumSQL(sqlAluguelReceberPagar)
            .PegarSQL)
      .SetParamString('pSomente', 'S')
      .SetParamString('pTipoConta', 'R');

  FdmAluguel
    .qAluguelDes
      .PrepareSQL(
        TSQLAlugueis.New
          .SetEnumSQL(sqlAluguelReceberPagar)
            .PegarSQL)
      .SetParamString('pSomente', 'S')
      .SetParamString('pTipoConta', 'P');

  FdmAluguel
    .qAluguelCompCob
      .PrepareSQL(
        TSQLAlugueis.New
          .SetEnumSQL(sqlAluguelCompReceberPagar)
            .PegarSQL)
      .SetParamString('pSomente', 'S')
      .SetParamString('pVerdadeiro', 'V')
      .SetParamString('pTipoConta', 'R');

  FdmAluguel
    .qAluguelCompDes
      .PrepareSQL(
        TSQLAlugueis.New
          .SetEnumSQL(sqlAluguelCompReceberPagar)
            .PegarSQL)
      .SetParamString('pSomente', 'S')
      .SetParamString('pVerdadeiro', 'V')
      .SetParamString('pTipoConta', 'P');

  FdmAluguel
    .qAluguelTotal
      .PrepareSQL(
        TSQLAlugueis.New
          .SetEnumSQL(sqlAluguelTotalReceberPagar)
            .PegarSQL)
      .SetParamString('pSomente', 'S');

  FdmAluguel
    .qAluguelTotalComp
      .PrepareSQL(
        TSQLAlugueis.New
          .SetEnumSQL(sqlAluguelTotalCompReceberPagar)
            .PegarSQL)
      .SetParamString('pSomente',    'S')
      .SetParamString('pVerdadeiro', 'V');

  AtualizarCDS;
end;

procedure TformAluguelLancamento.DeletarContas(IDAluguelConta: int64);
begin
  TdmCmdTransacao.New
    .AddCommand(TSQLAlugueis.New
                  .SetEnumSQL(sqlAluguelDeleteCobranca)
                    .PegarSQL)
    .SetParamInteger('pIDALUGUELCONTA', IDAluguelConta)
    .Executar;

  AtualizarCDS;
end;

procedure TformAluguelLancamento.aConfirmarPagtoCompExecute(Sender: TObject);
begin
  inherited;
  TdmCmdTransacao.New
    .AddCommand(TSQLAlugueis.New
                  .SetEnumSQL(sqlAluguelUpdatePagamentoComp)
                    .PegarSQL)
    .SetParamInteger('pIDALUGUEL', FdmAluguel.cdsAluguelidaluguel.AsInteger)
    .Executar;

  AtualizarCDS;
end;

procedure TformAluguelLancamento.aConfirmarPagtoExecute(Sender: TObject);
begin
  inherited;
  TdmCmdTransacao.New
    .AddCommand(TSQLAlugueis.New
                  .SetEnumSQL(sqlAluguelUpdatePagamento)
                    .PegarSQL)
    .SetParamInteger('pIDALUGUEL', FdmAluguel.cdsAluguelidaluguel.AsInteger)
    .Executar;

  AtualizarCDS;
end;

procedure TformAluguelLancamento.AbrirEditorContaAluguel(Conta, Inclusao: Boolean; Compartilhado: boolean = false);
var
  editor: TformAluguelEditor;
  QueryDados: TFDQuery;
  Infos: TInfosEditor;
  SQLEnum: TSQLEnum;
begin
  editor := TformAluguelEditor.New;
  try
    Infos.IDAluguel := FdmAluguel.cdsAluguelidaluguel.AsInteger;

    QueryDados := nil;
    if not Inclusao then
    begin
      if Compartilhado then
      begin
        if Conta then
          QueryDados := FdmAluguel.qAluguelCompCob
        else
          QueryDados := FdmAluguel.qAluguelCompDes;
      end
      else
      begin
        if Conta then
          QueryDados := FdmAluguel.qAluguelCob
        else
          QueryDados := FdmAluguel.qAluguelDes;
      end;
    end;

    if Assigned(QueryDados) then
    begin
      if (QueryDados.IsEmpty) then
        raise Exception.Create('Não tem registro para editar!');

      Infos.IDAluguelConta := QueryDados.FieldByName('IDALUGUELCONTA').AsLargeInt;
      Infos.Descricao := QueryDados.FieldByName('DESCRICAO').AsString;
      Infos.Valor := QueryDados.FieldByName('VALOR').AsCurrency;
      Infos.TipoConta := QueryDados.FieldByName('TIPOCONTA').AsString;
      Infos.Compartilhado := QueryDados.FieldByName('COMPARTILHADO').AsString;
    end;

    editor.Infos := Infos;
    editor.showModal;

    if editor.Infos.Descricao.IsEmpty then
      Exit;

    if Inclusao then
      SQLEnum := sqlAluguelContaIncluir
    else
      SQLEnum := sqlAluguelContaEditar;

    TdmCmdTransacao.New
      .AddCommand(TSQLAlugueis.New.SetEnumSQL(SQLEnum).PegarSQL)
        .SetParamInteger('pIDALUGUEL', editor.Infos.IDAluguel)
        .SetParamInteger('pIDALUGUELCONTA', editor.Infos.IDAluguelConta)
        .SetParamString('pDESCRICAO', editor.Infos.Descricao)
        .SetParamFloat('pVALOR', editor.Infos.Valor)
        .SetParamString('pTIPOCONTA', editor.Infos.TipoConta)
        .SetParamString('pCOMPARTILHADO', editor.Infos.Compartilhado)
      .Executar;

    AtualizarCDS;
  finally
    FreeAndNil(editor);
  end;
end;

procedure TformAluguelLancamento.aContasCompAdicAcreExecute(
  Sender: TObject);
begin
  inherited;
  AbrirEditorContaAluguel(False, True, True);
end;

procedure TformAluguelLancamento.aContasCompAdicExecute(Sender: TObject);
begin
  inherited;
  AbrirEditorContaAluguel(True, True, True);
end;

procedure TformAluguelLancamento.aContasCompDelAcreExecute(Sender: TObject);
begin
  inherited;
  DeletarContas(FdmAluguel.qAluguelCompDesidaluguelconta.AsInteger);
end;

procedure TformAluguelLancamento.aContasCompDelExecute(Sender: TObject);
begin
  inherited;
  DeletarContas(FdmAluguel.qAluguelCompCobidaluguelconta.AsInteger);
end;

procedure TformAluguelLancamento.aContasCompEditAcreExecute(
  Sender: TObject);
begin
  inherited;
  AbrirEditorContaAluguel(False, False, True);
end;

procedure TformAluguelLancamento.aContasCompEditExecute(Sender: TObject);
begin
  inherited;
  AbrirEditorContaAluguel(True, False, True);
end;

end.
