unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, data.geral,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.CategoryButtons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, EditMaskMDS, Vcl.Buttons;

type
  TfPrincipal = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    aFichas: TAction;
    aCaixas: TAction;
    aRetiradas: TAction;
    GridPanel1: TGridPanel;
    aMenu: TAction;
    aIncluiFichas: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel16: TPanel;
    cbMenu: TCategoryButtons;
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    panCabecalho: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    pFichas: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    editQtdFicha: TEdit;
    Button4: TButton;
    lookFichas: TDBLookupComboBox;
    Panel6: TPanel;
    gridMovFicha: TDBGrid;
    navFichas: TDBNavigator;
    Panel7: TPanel;
    lValorFichas: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lQtdFichas: TLabel;
    Panel8: TPanel;
    Label6: TLabel;
    Panel12: TPanel;
    Label10: TLabel;
    pRetiradas: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Button1: TButton;
    aIncluirRetirada: TAction;
    navRetiradas: TDBNavigator;
    gridMovRetirada: TDBGrid;
    Label11: TLabel;
    Label12: TLabel;
    lookRetiradas: TDBLookupComboBox;
    editValorRetirado: TEditMaskMDS;
    Label13: TLabel;
    Label14: TLabel;
    lValorRetirado: TLabel;
    titCaixa: TDBText;
    GridPanel2: TGridPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    Label15: TLabel;
    pFecFichas: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    editFecFicha: TEdit;
    Button2: TButton;
    lookFecFicha: TDBLookupComboBox;
    Panel18: TPanel;
    Panel20: TPanel;
    Label18: TLabel;
    lTotalFichas: TLabel;
    Panel21: TPanel;
    Label19: TLabel;
    lTotalSaldo: TLabel;
    gridFecFicha: TDBGrid;
    navFecFichas: TDBNavigator;
    pFecSaldo: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Button3: TButton;
    lookFecTipo: TDBLookupComboBox;
    editFecValor: TEditMaskMDS;
    Panel22: TPanel;
    gridFecSaldo: TDBGrid;
    navFecSaldo: TDBNavigator;
    aIncFichaFec: TAction;
    aIncRetiradaFec: TAction;
    aFechamentoGeral: TAction;
    Panel23: TPanel;
    lTotalFechamento: TLabel;
    Label23: TLabel;
    Panel17: TPanel;
    GridPanel3: TGridPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    lResumoRetirado: TLabel;
    lResumoFechamento: TLabel;
    Label29: TLabel;
    lResumoParcial: TLabel;
    Label31: TLabel;
    lResumoLancamento: TLabel;
    Label33: TLabel;
    lResumoSaldo: TLabel;
    lTipoSaldo: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lDetFechamento: TLabel;
    lDetVendas: TLabel;
    lDetCaixa: TLabel;
    lDetDiferenca: TLabel;
    bSinal: TSpeedButton;
    aEditMovto: TAction;
    Panel3: TPanel;
    lData: TLabel;
    lHora: TLabel;
    Timer1: TTimer;
    SpeedButton5: TSpeedButton;
    aImprimir: TAction;
    panTroco: TPanel;
    Label2: TLabel;
    editTroco: TDBEdit;
    SpeedButton4: TSpeedButton;
    procedure aFichasExecute(Sender: TObject);
    procedure aCaixasExecute(Sender: TObject);
    procedure aRetiradasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aMenuExecute(Sender: TObject);
    procedure aIncluiFichasExecute(Sender: TObject);
    procedure aIncluirRetiradaExecute(Sender: TObject);
    procedure aIncFichaFecExecute(Sender: TObject);
    procedure aFechamentoGeralExecute(Sender: TObject);
    procedure aIncRetiradaFecExecute(Sender: TObject);
    procedure aEditMovtoExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure aImprimirExecute(Sender: TObject);
  private
    procedure AtualizarActions;
    procedure IncluirMenusCaixas(Sender: TObject);
    procedure AtualizarMovimento(Sender: TObject);
    procedure AtualizarMovtoGeral(Sender: TObject);
    procedure CalcularFichasMovimento(Sender: TObject);
    procedure CalcularRetiradasMovimento(Sender: TObject);
    procedure CalcFechamentoFichas(Sender: TObject);
    procedure CalcFechamentoSaldos(Sender: TObject);
    procedure CalcFechamentoTotal;
    procedure CalcResumoDoCaixa(calcular: boolean);
    procedure CalcDetalhesDoCaixa(calcular: boolean);
    procedure SetValorFormatado(valor: currency; alabel: TLabel);
    procedure PosicionarCaixa(caixa: integer = 0);

    function PegarValorCaption(alabel: TLabel): currency;

  public
    { Public declarations }

  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  view.report,
  view.cad.retiradas,
  view.cad.caixas,
  view.cad.fichas;

const
  CATEG_MENU = 'catMenu';

{$R *.dfm}

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  datas.IncMenus := IncluirMenusCaixas;
  datas.AtualizarMovimento := AtualizarMovimento;
  datas.AtualizarMovtoGeral := AtualizarMovtoGeral;
  datas.CalcularFichasMovt := CalcularFichasMovimento;
  datas.CalcularRetiradasM := CalcularRetiradasMovimento;
  datas.CalcFechamentoFichas := CalcFechamentoFichas;
  datas.CalcFechamentoSaldos := CalcFechamentoSaldos;
  datas.ExecuteShow;
end;

procedure TfPrincipal.aMenuExecute(Sender: TObject);
begin
  PosicionarCaixa(TAction(sender).Tag);
end;

procedure TfPrincipal.aEditMovtoExecute(Sender: TObject);
begin
  if datas.tableMovimento.State in [dsEdit] then
    datas.tableMovimento.Post;

  gridMovFicha.SetFocus;
end;

procedure TfPrincipal.aFechamentoGeralExecute(Sender: TObject);
begin
  PosicionarCaixa;
end;

procedure TfPrincipal.PosicionarCaixa(caixa: integer = 0);
const
  COLUMNS_FICHA = 6;
  COLUMNS_SALDO = 5;
begin
  if Caixa = 0 then
  begin
    titCaixa.DataSource := datas.sourceMovGeral;
    editTroco.DataSource := datas.sourceMovGeral;

    gridMovFicha.DataSource := datas.sourceGeralFicha;
    gridMovRetirada.DataSource := datas.sourceGeralRetirada;
    gridFecFicha.DataSource := datas.sourceGeralFecFicha;
    gridFecSaldo.DataSource := datas.sourceGeralFecRetirada;
  end
  else
  begin
    datas.tableMovimento.Filtered := False;
    datas.tableMovimento.Filter := 'id_caixa=' + caixa.ToString;
    datas.tableMovimento.Filtered := True;

    titCaixa.DataSource := datas.sourceMovimento;
    editTroco.DataSource := datas.sourceMovimento;

    gridMovFicha.DataSource := datas.sourceMovFichas;
    gridMovRetirada.DataSource := datas.sourceMovRetirada;
    gridFecFicha.DataSource := datas.sourceFecFicha;
    gridFecSaldo.DataSource := datas.sourceFecSaldo;
  end;

  gridMovFicha.Columns[COLUMNS_FICHA].Visible := Caixa = 0;
  gridFecFicha.Columns[COLUMNS_FICHA].Visible := Caixa = 0;
  gridMovRetirada.Columns[COLUMNS_SALDO].Visible := Caixa = 0;
  gridFecSaldo.Columns[COLUMNS_SALDO].Visible := Caixa = 0;

  aIncluiFichas.Enabled := Caixa > 0;
  aIncluirRetirada.Enabled := Caixa > 0;
  aIncFichaFec.Enabled := Caixa > 0;
  aIncRetiradaFec.Enabled := Caixa > 0;

  navFichas.Enabled := Caixa > 0;
  navRetiradas.Enabled := Caixa > 0;
  navFecFichas.Enabled := Caixa > 0;
  navFecSaldo.Enabled := Caixa > 0;

  pFichas.Enabled := Caixa > 0;
  pRetiradas.Enabled := Caixa > 0;
  pFecFichas.Enabled := Caixa > 0;
  pFecSaldo.Enabled := Caixa > 0;
  panTroco.Enabled := Caixa > 0;

  calcularFichasMovimento(nil);
  calcularRetiradasMovimento(nil);
  CalcFechamentoFichas(nil);
  CalcFechamentoSaldos(nil);
end;

procedure TfPrincipal.aCaixasExecute(Sender: TObject);
begin
  if not Assigned(fCadCaixas) then
    Application.CreateForm(TfCadCaixas, fCadCaixas);

  fCadCaixas.ShowModal;
end;

procedure TfPrincipal.aFichasExecute(Sender: TObject);
begin
  if not Assigned(fCadFichas) then
    Application.CreateForm(TfCadFichas, fCadFichas);

  fCadFichas.ShowModal;
end;

procedure TfPrincipal.aRetiradasExecute(Sender: TObject);
begin
  if not Assigned(fCadRetiradas) then
    Application.CreateForm(TfCadRetiradas, fCadRetiradas);

  fCadRetiradas.ShowModal;
end;

function TfPrincipal.PegarValorCaption(alabel: TLabel): currency;
begin
  Result := StrToCurrDef(String(alabel.Caption).Replace('R$', EmptyStr).Replace('.', EmptyStr).Trim, 0);
end;

procedure TfPrincipal.SetValorFormatado(valor: currency; alabel: TLabel);
begin
  aLabel.Caption := formatfloat('R$ ,0.00', valor);
end;

procedure TfPrincipal.Timer1Timer(Sender: TObject);
begin
  lData.Caption := FormatDateTime('dd - mmmm - yyyy', Now());
  lHora.Caption := FormatDateTime('HH:MM:ssss', Now());
end;

procedure TfPrincipal.AtualizarActions;
var
  gambiDesabilitar: integer;
  Act: TAction;
begin
  gambiDesabilitar := ActionList1.ActionCount;

  for var aAction in ActionList1 do
  begin
    if aAction.Category.Equals(CATEG_MENU) then
    begin
      Inc(gambiDesabilitar);
      aAction.Enabled := false;
      aAction.Category := 'desabilitado';
      aAction.Name := 'desabilitado_' + gambiDesabilitar.ToString;
    end;
  end;

  datas.tableCaixas.DisableControls;
  try
    datas.tableCaixas.First;
    while not datas.tableCaixas.Eof do
    begin
      Act := TAction.Create(self);
      Act.ActionList := ActionList1;
      Act.Name := 'aCaixa'+datas.tableCaixasid.AsInteger.ToString;
      Act.Category := CATEG_MENU;
      Act.Tag := datas.tableCaixasid.AsInteger;
      Act.Caption := datas.tableCaixasnome.AsString;
      Act.OnExecute := aMenuExecute;

      datas.tableCaixas.Next;
    end;
  finally
    datas.tableCaixas.EnableControls;
  end;
end;

procedure TfPrincipal.IncluirMenusCaixas(Sender: TObject);
begin
  if datas.tableCaixas.IsEmpty then
    Exit;

  AtualizarActions;

  cbMenu.Categories.Clear;

  with cbMenu.Categories.Add do
  begin
    Caption := 'CAIXAS';

    for var aAction in ActionList1 do
    begin
      if aAction.Category.Equals(CATEG_MENU) then
      begin
        with Items.Add do
          Action := aAction;
      end;
    end;
  end;

  with cbMenu.Categories.Add do
  begin
    Caption := 'GERAL';

    with Items.Add do
      Action := aFechamentoGeral;
  end;

  cbMenu.Refresh;
end;

procedure TfPrincipal.AtualizarMovimento(Sender: TObject);
const
  VALOR_INICIAL = 450.00;
begin
  datas.tableCaixas.DisableControls;
  datas.tableMovimento.DisableControls;

  datas.tableCaixas.First;
  try
    while not datas.tableCaixas.Eof do
    begin
      datas.tableMovimento.Filtered := False;
      datas.tableMovimento.Filter := 'id_caixa=' + datas.tableCaixasid.AsInteger.ToString;
      datas.tableMovimento.Filtered := True;

      if datas.tableMovimento.IsEmpty then
      begin
        datas.tableMovimento.append;
        datas.tableMovimentoid.AsInteger := datas.tableCaixasid.AsInteger;
        datas.tableMovimentoid_caixa.AsInteger := datas.tableCaixasid.AsInteger;
        datas.tableMovimentonomeCaixa.AsString := datas.tableCaixasnome.AsString;
        datas.tablemovimentotroco.AsCurrency := VALOR_INICIAL;
        datas.tableMovimento.Post;
      end;

      datas.tableCaixas.Next;
    end;
  finally
    datas.tableCaixas.EnableControls;
    datas.tableMovimento.EnableControls;
    datas.tableMovimento.Filtered := False;
  end;
end;

procedure TfPrincipal.AtualizarMovtoGeral(Sender: TObject);
var
  mark: TBookMark;
  Total: currency;
  filtered: boolean;
begin
  Total := 0;

  filtered := editTroco.DataSource.DataSet.Filtered;
  mark := editTroco.DataSource.DataSet.GetBookmark;
  editTroco.DataSource.DataSet.DisableControls;
  try
    editTroco.DataSource.DataSet.Filtered := False;

    editTroco.DataSource.DataSet.first;
    while not editTroco.DataSource.DataSet.eof do
    begin
      total := total + editTroco.DataSource.DataSet.FieldByName('troco').AsCurrency;

      editTroco.DataSource.DataSet.Next;
    end;
  finally
    editTroco.DataSource.DataSet.Filtered := filtered;
    editTroco.DataSource.DataSet.GotoBookmark(mark);
    editTroco.DataSource.DataSet.EnableControls;
  end;

  if datas.tableMovGeral.IsEmpty then
  begin
    datas.tableMovGeral.Append;
    datas.tableMovGeralnomeCaixa.AsString := 'Caixas geral';
  end
  else
    datas.tableMovGeral.Edit;

  datas.tableMovGeraltroco.AsCurrency := Total;
  datas.tableMovGeral.Post;
end;

procedure TfPrincipal.aImprimirExecute(Sender: TObject);
begin
  fReport.IniciarVariaveis(titCaixa.DataSource = datas.sourceMovGeral);
  fReport.RLReport1.Preview();
end;

procedure TfPrincipal.aIncFichaFecExecute(Sender: TObject);
var
  log: tdatetime;
begin
  if strtointdef( editFecFicha.Text , 0) = 0 then
    raise Exception.Create('Quantidade inválida!'+ sLineBreak +'Informe uma quantidade de fichas para incluir.');

  if lookFecFicha.KeyValue <= 0 then
    raise Exception.Create('Valor da ficha inválido!'+ sLineBreak +'Informe qual o valor da ficha a ser utilizado.');

  log := now();

  datas.tableFecFicha.append;
  datas.tableFecFichaid_movto.AsInteger := datas.tableMovimentoid.AsInteger;
  datas.tableFecFichaid_fichas.AsInteger := lookFecFicha.KeyValue;
  datas.tableFecFichaquantidade.AsInteger := strtointdef( editFecFicha.Text , 0);
  datas.tableFecFichalog.asdatetime := log;
  datas.tableFecFicha.Post;

  datas.tableGeralFecFicha.Append;
  datas.tableGeralFecFichafk_caixa.asinteger := datas.tableMovimentoid.AsInteger;
  datas.tableGeralFecFichaid_fk.AsInteger := datas.tableFecFichaid.AsInteger;
  datas.tableGeralFecFichaid_fichas.AsInteger := lookFecFicha.KeyValue;
  datas.tableGeralFecFichaquantidade.AsInteger := strtointdef( editFecFicha.Text , 0);
  datas.tableGeralFecFichalog.asdatetime := log;
  datas.tableGeralFecFicha.Post;

  lookFecFicha.KeyValue := -1;
  editFecFicha.Clear;
  editFecFicha.SetFocus;
end;

procedure TfPrincipal.aIncluiFichasExecute(Sender: TObject);
var
  log: tdatetime;
begin
  if strtointdef( editQtdFicha.Text , 0) = 0 then
    raise Exception.Create('Quantidade inválida!'+ sLineBreak +'Informe uma quantidade de fichas para incluir.');

  if lookFichas.KeyValue <= 0 then
    raise Exception.Create('Valor da ficha inválido!'+ sLineBreak +'Informe qual o valor da ficha a ser utilizado.');

  log := now();

  datas.tableMovFichas.append;
  datas.tableMovFichasid_movto.AsInteger := datas.tableMovimentoid.AsInteger;
  datas.tableMovFichasid_fichas.AsInteger := lookFichas.KeyValue;
  datas.tableMovFichasquantidade.AsInteger := strtointdef( editQtdFicha.Text , 0);
  datas.tableMovFichaslog.asdatetime := log;
  datas.tableMovFichas.Post;

  datas.tableGeralFicha.Append;
  datas.tableGeralFichafk_caixa.asinteger := datas.tableMovimentoid.AsInteger;
  datas.tableGeralFichaid_fk.AsInteger := datas.tableMovFichasid.AsInteger;
  datas.tableGeralFichaid_fichas.AsInteger := lookFichas.KeyValue;
  datas.tableGeralFichaquantidade.AsInteger := strtointdef( editQtdFicha.Text , 0);
  datas.tableGeralFichalog.asdatetime := log;
  datas.tableGeralFicha.Post;

  lookFichas.KeyValue := -1;
  editQtdFicha.Clear;
  editQtdFicha.SetFocus;
end;

procedure TfPrincipal.aIncluirRetiradaExecute(Sender: TObject);
var
  log: tdatetime;
begin
  if StrToCurrDef(editValorRetirado.Text, 0) = 0 then
    raise Exception.Create('Valor inválido!'+ sLineBreak + 'Informe o valor da retirada para incluir.');

  if lookRetiradas.KeyValue <= 0 then
    raise Exception.Create('Tipo de retirada inválido!'+ sLineBreak +'Informe o tipo da retirada a ser utilizada.');

  log := now();

  datas.tableMovRetirada.Append;
  datas.tableMovRetiradaid_movto.AsInteger := datas.tableMovimentoid.AsInteger;
  datas.tableMovRetiradaid_retirada.AsInteger := lookRetiradas.KeyValue;
  datas.tableMovRetiradavalor.AsCurrency := StrToCurrDef(editValorRetirado.Text, 0);
  datas.tableMovRetiradalog.asdatetime := log;
  datas.tableMovRetirada.Post;

  datas.tableGeralRetirada.Append;
  datas.tableGeralRetiradafk_caixa.asinteger := datas.tableMovimentoid.AsInteger;
  datas.tableGeralRetiradaid_fk.AsInteger := datas.tableMovRetiradaid.AsInteger;
  datas.tableGeralRetiradaid_retirada.AsInteger := lookRetiradas.KeyValue;
  datas.tableGeralRetiradavalor.AsCurrency := StrToCurrDef(editValorRetirado.Text, 0);
  datas.tableGeralRetiradalog.asdatetime := log;
  datas.tableGeralRetirada.Post;

  lookRetiradas.KeyValue := -1;
  editValorRetirado.Clear;
  editValorRetirado.SetFocus;
end;

procedure TfPrincipal.aIncRetiradaFecExecute(Sender: TObject);
var
  log: tdatetime;
begin
  if StrToCurrDef(editFecValor.Text, 0) = 0 then
    raise Exception.Create('Valor inválido!'+ sLineBreak + 'Informe o valor da retirada para incluir.');

  if lookFecTipo.KeyValue <= 0 then
    raise Exception.Create('Tipo de retirada inválido!'+ sLineBreak +'Informe o tipo da retirada a ser utilizada.');

  log := now();

  datas.tableFecSaldo.Append;
  datas.tableFecSaldoid_movto.AsInteger := datas.tableMovimentoid.AsInteger;
  datas.tableFecSaldoid_retirada.AsInteger := lookFecTipo.KeyValue;
  datas.tableFecSaldovalor.AsCurrency := StrToCurrDef(editFecValor.Text, 0);
  datas.tableFecSaldolog.asdatetime := log;
  datas.tableFecSaldo.Post;

  datas.tableGeralFecRetirada.Append;
  datas.tableGeralFecRetiradafk_caixa.asinteger := datas.tableMovimentoid.AsInteger;
  datas.tableGeralFecRetiradaid_fk.AsInteger := datas.tableFecSaldoid.AsInteger;
  datas.tableGeralFecRetiradaid_retirada.AsInteger := lookFecTipo.KeyValue;
  datas.tableGeralFecRetiradavalor.AsCurrency := StrToCurrDef(editFecValor.Text, 0);
  datas.tableGeralFecRetiradalog.asdatetime := log;
  datas.tableGeralFecRetirada.Post;

  lookFecTipo.KeyValue := -1;
  editFecValor.Clear;
  editFecValor.SetFocus;
end;

procedure TfPrincipal.CalcFechamentoFichas(Sender: TObject);
var
  mark: TBookmark;
  total: currency;
begin
  total := 0;

  mark := gridFecFicha.DataSource.DataSet.GetBookmark;
  gridFecFicha.DataSource.DataSet.DisableControls;
  try
    gridFecFicha.DataSource.DataSet.first;
    while not gridFecFicha.DataSource.DataSet.eof do
    begin
      total := total + gridFecFicha.DataSource.DataSet.FieldByName('parcial').AsCurrency;

      gridFecFicha.DataSource.DataSet.Next;
    end;
  finally
    gridFecFicha.DataSource.DataSet.GotoBookmark(mark);
    gridFecFicha.DataSource.DataSet.EnableControls;
  end;

  SetValorFormatado(total, lTotalFichas);

  CalcFechamentoTotal;
end;

procedure TfPrincipal.CalcFechamentoSaldos(Sender: TObject);
var
  mark: TBookMark;
  total: currency;
begin
  total := 0;

  mark := gridFecSaldo.DataSource.DataSet.GetBookmark;
  gridFecSaldo.DataSource.DataSet.DisableControls;
  try
    gridFecSaldo.DataSource.DataSet.first;
    while not gridFecSaldo.DataSource.DataSet.eof do
    begin
      total := total + gridFecSaldo.DataSource.DataSet.FieldByName('valor').AsCurrency;

      gridFecSaldo.DataSource.DataSet.Next;
    end;
  finally
    gridFecSaldo.DataSource.DataSet.GotoBookmark(mark);
    gridFecSaldo.DataSource.DataSet.EnableControls;
  end;

  SetValorFormatado(total, lTotalSaldo);

  CalcFechamentoTotal;
end;

procedure TfPrincipal.calcularFichasMovimento(Sender: TObject);
var
  mark: TBookmark;
  quantidade: largeint;
  total: currency;
begin
  quantidade := 0;
  total := 0;

  mark := gridMovFicha.DataSource.DataSet.GetBookmark;
  gridMovFicha.DataSource.DataSet.DisableControls;
  try
    gridMovFicha.DataSource.DataSet.first;
    while not gridMovFicha.DataSource.DataSet.eof do
    begin
      quantidade := quantidade + gridMovFicha.DataSource.DataSet.FieldByName('quantidade').AsInteger;
      total := total + gridMovFicha.DataSource.DataSet.FieldByName('parcial').AsCurrency;

      gridMovFicha.DataSource.DataSet.Next;
    end;
  finally
    gridMovFicha.DataSource.DataSet.GotoBookmark(mark);
    gridMovFicha.DataSource.DataSet.EnableControls;
  end;

  lQtdFichas.Caption := quantidade.ToString;
  SetValorFormatado(total, lValorFichas);
end;

procedure TfPrincipal.CalcularRetiradasMovimento(Sender: TObject);
var
  mark: TBookMark;
  total: currency;
begin
  total := 0;

  mark := gridMovRetirada.DataSource.DataSet.GetBookmark;
  gridMovRetirada.DataSource.DataSet.DisableControls;
  try
    gridMovRetirada.DataSource.DataSet.first;
    while not gridMovRetirada.DataSource.DataSet.eof do
    begin
      total := total + gridMovRetirada.DataSource.DataSet.FieldByName('valor').AsCurrency;

      gridMovRetirada.DataSource.DataSet.Next;
    end;
  finally
    gridMovRetirada.DataSource.DataSet.GotoBookmark(mark);
    gridMovRetirada.DataSource.DataSet.EnableControls;
  end;

  SetValorFormatado(total, lValorRetirado);
end;

procedure TfPrincipal.CalcFechamentoTotal;
var
  totalFichas: currency;
  totalSaldos: currency;
begin
  totalFichas := PegarValorCaption(lTotalFichas);
  totalSaldos := PegarValorCaption(lTotalSaldo);

  SetValorFormatado((totalFichas + totalSaldos), lTotalFechamento);

  CalcResumoDoCaixa((totalFichas + totalSaldos) > 0);
  CalcDetalhesDoCaixa((totalFichas + totalSaldos) > 0);
end;

procedure TfPrincipal.CalcResumoDoCaixa(calcular: boolean);
var
  Retirado: currency;
  Fechamento: currency;
  Parcial: currency;
  Caixa: currency;
  Saldo: currency;
begin
  Retirado := 0;
  Fechamento := 0;
  Parcial := 0;
  Caixa := 0;
  Saldo := 0;

  if calcular then
  begin
    Retirado := PegarValorCaption(lValorRetirado);
    Fechamento := PegarValorCaption(lTotalFechamento);
    Parcial := Retirado+Fechamento;
    Caixa := PegarValorCaption(lValorFichas) + editTroco.DataSource.DataSet.FieldByName('troco').AsCurrency;
    Saldo := Parcial - Caixa;
  end;

  SetValorFormatado(Retirado, lResumoRetirado);
  SetValorFormatado(Fechamento, lResumoFechamento);
  SetValorFormatado(Parcial, lResumoParcial);
  SetValorFormatado(Caixa, lResumoLancamento);
  SetValorFormatado(Saldo, lResumoSaldo);

  if saldo = 0 then
  begin
    lTipoSaldo.Caption := 'O caixa está com valores consistentes';
    bSinal.ImageIndex := 8;
  end
  else if saldo > 0 then
  begin
    lTipoSaldo.Caption := 'O saldo do caixa está acima do esperado';
    bSinal.ImageIndex := 5;
  end
  else
  begin
    lTipoSaldo.Caption := 'O caixa está negativo!';
    bSinal.ImageIndex := 9;
  end;
end;

procedure TfPrincipal.CalcDetalhesDoCaixa(calcular: boolean);
var
  Fechamento: currency;
  Vendas: currency;
  Caixa: currency;
begin
  Fechamento := 0;
  Vendas := 0;
  Caixa := 0;

  if calcular then
  begin
    Fechamento := PegarValorCaption(lValorRetirado) + PegarValorCaption(lTotalSaldo);
    Vendas := PegarValorCaption(lValorFichas) - PegarValorCaption(lTotalFichas);
    Caixa := Fechamento - editTroco.DataSource.DataSet.FieldByName('troco').AsCurrency;
  end;

  SetValorFormatado(Fechamento, lDetFechamento);
  SetValorFormatado(Vendas, lDetVendas);
  SetValorFormatado(Caixa, lDetCaixa);

  lDetDiferenca.Caption := lResumoSaldo.Caption;
end;

end.
