unit view.cadastro.template;

interface

{$REGION 'uses_interface'}
uses
  data.images,
  consts.imagens,
  lib.observer,
  lib.records,
  Datasnap.DBClient,
  Datasnap.Provider,
  controller.cadastro.interfaces,
  System.Generics.Collections,
  data.cadastro.template.interfaces,
  view.geral,
  Data.DB,
  Vcl.Menus,
  Vcl.Graphics,
  Vcl.WinXCtrls,
  Vcl.Dialogs,
  Vcl.WinXPanels,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.DBCGrids,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Controls,
  Vcl.Buttons,
  Vcl.Forms,
  Vcl.ActnList,
  Vcl.ExtCtrls,
  System.SysUtils,
  System.Classes,
  System.Actions,
  System.StrUtils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Winapi.Windows,
  DBRadioGroupSimNao;
{$ENDREGION}

type
  TformCadastroTemplate = class(TformTemplate, iMenuSubjectObserver)
    aSalvarCad: TAction;
    cpCadastros: TCardPanel;
    cConsulta: TCard;
    cCadastro: TCard;
    pCabecalhoGeral: TPanel;
    lTitulo: TLabel;
    sbSair: TSpeedButton;
    pRodapeBotoesCad: TPanel;
    sbCancelarCadastro: TSpeedButton;
    sbSalvarCadastro: TSpeedButton;
    cpConsultas: TCardPanel;
    cConsultaLista: TCard;
    dbgConsulta: TDBGrid;
    pCabecalhoConsulta: TPanel;
    cConsultaGrade: TCard;
    aAbrirLista: TAction;
    aAbrirGrade: TAction;
    sbPesquisaConsulta: TSearchBox;
    sbVisualizarConsulta: TSpeedButton;
    aIncluirCad: TAction;
    aEditarCad: TAction;
    aExcluirCad: TAction;
    pConsulta: TPanel;
    sbExcluirCadastro: TSpeedButton;
    sbIncluirCadastro: TSpeedButton;
    sbEditarCadastro: TSpeedButton;
    pCadastro: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aSalvarCadExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbPesquisaConsultaInvokeSearch(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure aSairExecute(Sender: TObject);
    procedure aAbrirListaExecute(Sender: TObject);
    procedure aAbrirGradeExecute(Sender: TObject);
    procedure aEditarCadExecute(Sender: TObject);
    procedure aIncluirCadExecute(Sender: TObject);
    procedure aExcluirCadExecute(Sender: TObject);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgConsultaTitleClick(Column: TColumn);
    procedure cpCadastrosCardChange(Sender: TObject; PrevCard,
      NextCard: TCard);
  private
    FiControllerCadastros: iControllerCadastros;

    procedure TituloTela(_ATitulo: string);

    procedure AjustarTelaCadastro;
    procedure AtivarTelaConsulta;
    procedure TratarObserver;
    procedure TratarDataModule;
    procedure AjustarComponentesRecursivo;
    procedure CriarDataModuleCadastro;
    procedure AjustarRadioGroupCadastro;
    procedure ConfigurarCardConsulta(_AAction: TAction = nil);
    procedure VisualizarModoGrade;
    procedure AjustarShortCutActions;

    function PegarRecordOnShow: TRecOnFormShow;

    {Propertys}
    function GetControllerCadastros: iControllerCadastros;
    procedure SetControllerCadastros(const Value: iControllerCadastros);

  protected
    FObservers: TList<iMenuObserver>;
    FdmCadastro: idataCadastroTemplate;

    procedure AtualizarConsultaGrade; virtual;
    procedure ConfigurarTela; virtual;
    procedure AjustarCombosSemConexao; virtual;
    procedure AbrirConsultasLookup; virtual;
    procedure SetIControllerCadastros; virtual; abstract;
    function MontarGradeConsulta: boolean; virtual;
    function ExecutarBeforePostNaView: boolean; virtual;

    function AdicionarObserver(_AObserver: iMenuObserver): iMenuSubjectObserver;
    function RemoverObserver(_AObserver: iMenuObserver): iMenuSubjectObserver;
    procedure Notificar;

  public
    property ControllerCadastros: iControllerCadastros read GetControllerCadastros write SetControllerCadastros;

  end;

implementation

{$REGION 'uses_implementation'}
uses
  view.menu,
  consts.styles,
  controller.lib,
  model.lib.interfaces,
  view.calcular,
  lib.messages,
  data.cadastro.template.factory;
{$ENDREGION}

{$R *.dfm}

{ TformCadastroTemplate }

function TformCadastroTemplate.MontarGradeConsulta: boolean; begin Result := False; end;
function TformCadastroTemplate.ExecutarBeforePostNaView: boolean; begin Result := True; end;
procedure TformCadastroTemplate.AbrirConsultasLookup; begin {} end;
procedure TformCadastroTemplate.AtualizarConsultaGrade; begin {} end;
procedure TformCadastroTemplate.AjustarCombosSemConexao; begin {} end;

procedure TformCadastroTemplate.TratarDataModule;
begin
  CriarDataModuleCadastro;

  FdmCadastro.SetNotificaObserver(Notificar);
end;

procedure TformCadastroTemplate.CriarDataModuleCadastro;
begin
  FdmCadastro := TdataCadastroFactory.New.GerarDataCadastro(ControllerCadastros.TypeCadastro);
end;

procedure TformCadastroTemplate.TratarObserver;
begin
  FObservers := TList<iMenuObserver>.Create;

  {TODO: [HINT - Cadastros] Colocar essa adição de observer em outro local...}
  AdicionarObserver(formMenu.frameMenu);
end;

procedure TformCadastroTemplate.TituloTela(_ATitulo: string);
begin
  lTitulo.Caption := _ATitulo;
  self.Caption := _ATitulo;
end;

function TformCadastroTemplate.PegarRecordOnShow: TRecOnFormShow;
begin
  Result.ProcTitulo                   := TituloTela;

  Result.gConsultaCadastro            := dbgConsulta;
  Result.mtCadastro                   := FdmCadastro.PegarMTCadastro;

  Result.dsCadastro                   := FdmCadastro.PegarDSCadastro;
  Result.dspCadastro                  := FdmCadastro.PegarDSPCadastro;
  Result.cdsCadastro                  := FdmCadastro.PegarCDSCadastro;
  Result.qCadastro                    := FdmCadastro.PegarQCadastro;

  Result.qConsultaGrade               := FdmCadastro.PegarQConsultaGrade;
  Result.ProcAtualizarConsultaGrade   := AtualizarConsultaGrade;
  Result.FuncExecutarBeforePostNaView := ExecutarBeforePostNaView;
end;

procedure TformCadastroTemplate.SetControllerCadastros(const Value: iControllerCadastros);
begin
  FiControllerCadastros := Value;
end;

function TformCadastroTemplate.GetControllerCadastros: iControllerCadastros;
begin
  if not Assigned(FiControllerCadastros) then
    SetIControllerCadastros;
  Result := FiControllerCadastros;
end;

procedure TformCadastroTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  {Action := caFree;
  Release;}
  {frmChild := nil;}
end;

procedure TformCadastroTemplate.FormCreate(Sender: TObject);
begin
  inherited;
  TratarObserver;

  TratarDataModule;

  TControllerLibrary.New
    .Lib
      .ConverteColorHexToColorDelphi(pCabecalhoGeral, COLOR_MENU_CADASTROS);
end;

procedure TformCadastroTemplate.FormDestroy(Sender: TObject);
begin
  if Assigned(FObservers) then
    FreeAndNil(FObservers);
  inherited;
end;

procedure TformCadastroTemplate.AjustarComponentesRecursivo;
var
  I: integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TSpeedButton) then
    begin
      (Components[I] as TSpeedButton).Flat := True;
      (Components[I] as TSpeedButton).Font.Color := clWindow;
    end
    else if (Components[I] is TCard) then
    begin
      (Components[I] as TCard).BorderStyle := bsNone;
    end
    else if (Components[I] is TPanel) then
    begin
      (Components[I] as TPanel).BorderStyle := bsNone;
    end;
  end;
end;

procedure TformCadastroTemplate.AjustarRadioGroupCadastro;
var
  I: Integer;
  AFieldName: string;
  radio: TDBRadioGroupSimNao;
begin
  for I := pCadastro.ControlCount -1 downto 0 do
  begin
    if (pCadastro.Controls[i] is TDBRadioGroupSimNao) then
    begin
      radio := (pCadastro.Controls[i] as TDBRadioGroupSimNao);

      AFieldName := radio.DataField.ToUpper;

      if (radio.Field.DataType = ftBoolean) then
        radio.Value := IfThen(FdmCadastro.PegarCDSCadastro.FieldByName(AFieldName).AsBoolean, 'true', 'false')
      else if (radio.Field.DataType = ftString) then
        radio.Value := FdmCadastro.PegarCDSCadastro.FieldByName(AFieldName).AsString;
    end;
  end;
end;

procedure TformCadastroTemplate.AjustarTelaCadastro;
begin
  AjustarRadioGroupCadastro;
  AbrirConsultasLookup;
  AjustarCombosSemConexao;
end;

procedure TformCadastroTemplate.ConfigurarCardConsulta(_AAction: TAction = nil);
var
  AConstImagens24: TConstImagens24;
begin
  if (_AAction = nil) then
  begin
    if pCabecalhoConsulta.Visible then
      _AAction := aAbrirGrade
    else
      _AAction := aAbrirLista;
  end;

  sbVisualizarConsulta.Action := _AAction;

  if (sbVisualizarConsulta.Action = aAbrirLista) then
  begin
    cpConsultas.ActiveCard := cConsultaLista;
    AConstImagens24 := ci24GradeBranco;
  end
  else
  begin
    cpConsultas.ActiveCard := cConsultaGrade;
    AConstImagens24 := ci24ListaBranco;
  end;

  TdataImages
    .ObterInstanciaDataImagens
      .PegarImagem24(sbVisualizarConsulta, AConstImagens24);
end;

procedure TformCadastroTemplate.VisualizarModoGrade;
begin
  pCabecalhoConsulta.Visible := MontarGradeConsulta;
end;

procedure TformCadastroTemplate.ConfigurarTela;
begin
  AjustarComponentesRecursivo;
  VisualizarModoGrade;
  ConfigurarCardConsulta;

  sbSair.Action := aSair;
  sbSair.Caption := EmptyStr;

  sbSalvarCadastro.Action := aSalvarCad;
  sbSalvarCadastro.Caption := 'Salvar';

  sbCancelarCadastro.Action := aSair;
  sbCancelarCadastro.Caption := 'Cancelar';

  TdataImages
    .ObterInstanciaDataImagens
      .PegarImagem40(sbSair,              ci40Sair)
      .PegarImagem40(sbSalvarCadastro,    ci40Salvar,           ci40SalvarDesabilitado)
      .PegarImagem40(sbCancelarCadastro,  ci40Cancelar,         ci40CancelarDesabilitaado)
      .PegarImagem40(sbEditarCadastro,    ci40EditarCadastro,   ci40EditarCadastroDesabilitaado)
      .PegarImagem40(sbExcluirCadastro,   ci40ExcluirCadastro,  ci40ExcluirCadastroDesabilitaado)
      .PegarImagem40(sbIncluirCadastro,   ci40IncluirCadastro,  ci40IncluirCadastroDesabilitaado);
end;

procedure TformCadastroTemplate.AjustarShortCutActions;
begin
  if (cpCadastros.ActiveCard = cCadastro) or (cpConsultas.ActiveCard = cConsultaGrade) then
    aExcluirCad.ShortCut := TextToShortCut('')
  else
    aExcluirCad.ShortCut := TextToShortCut('Del');
end;

procedure TformCadastroTemplate.cpCadastrosCardChange(Sender: TObject; PrevCard, NextCard: TCard);
begin
  inherited;
  AjustarShortCutActions;
end;

procedure TformCadastroTemplate.FormShow(Sender: TObject);
begin
  inherited;

  ControllerCadastros
    .Cadastro
      .onFormShow(PegarRecordOnShow);

  ConfigurarTela;

  AtivarTelaConsulta;
end;

procedure TformCadastroTemplate.dbgConsultaDblClick(Sender: TObject);
var
  formCalcular: TformCalcular;
begin
  inherited;


  formCalcular := TformCalcular.Create(Application);
  try
    formCalcular.ShowModal;
  finally
    FreeAndNil(formCalcular);
  end;


end;

procedure TformCadastroTemplate.dbgConsultaDrawColumnCell(Sender: TObject;
                                                          const Rect: TRect;
                                                          DataCol: Integer;
                                                          Column: TColumn;
                                                          State: TGridDrawState);
var
  AIndiceImagem: integer;
  ALinha: integer;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // obtém o número do registro (linha)
  ALinha := TDBGrid(Sender).DataSource.DataSet.RecNo;

  // verifica se o número da linha é par ou ímpar, aplicando as cores
  if Odd(ALinha) then
    TDBGrid(Sender).Canvas.Brush.Color := clMenu
  else
    TDBGrid(Sender).Canvas.Brush.Color := clInactiveCaption;

  // pinta a linha
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Rect.Top = TStringGrid(TDBGrid(Sender)).CellRect(0, TStringGrid(TDBGrid(Sender)).Row).Top then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Font.Color := clWhite;
    TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
    TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State)
  end;

  if (Column.Field is TBooleanField) then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    AIndiceImagem := 2;
    if (TDBGrid(Sender).DataSource.DataSet.FieldByName(Column.FieldName.ToLower).AsBoolean) then
      AIndiceImagem := 1;

    TdataImages
      .ObterInstanciaDataImagens
        .PegarImageList(qil16)
          .Draw(TDBGrid(Sender).Canvas, Rect.Left + 24, Rect.Top + 1, AIndiceImagem);
  end;
end;

procedure TformCadastroTemplate.dbgConsultaTitleClick(Column: TColumn);
var
  sIndexName: string;
  oOrdenacao: TIndexOptions;
  i: smallint;
begin
  // retira a formatação em negrito de todas as colunas
  for i := 0 to dbgConsulta.Columns.Count - 1 do
    dbgConsulta.Columns[i].Title.Font.Style := [];

  // configura a ordenação ascendente ou descendente
  if FdmCadastro.PegarCDSCadastro.IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    oOrdenacao := [ixDescending];
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    oOrdenacao := [];
  end;

  // adiciona a ordenação no DataSet, caso não exista
  if FdmCadastro.PegarCDSCadastro.IndexDefs.IndexOf(sIndexName) < 0 then
    FdmCadastro.PegarCDSCadastro.AddIndex(sIndexName, Column.FieldName, oOrdenacao);

  FdmCadastro.PegarCDSCadastro.IndexDefs.Update;

  // formata o título da coluna em negrito
  Column.Title.Font.Style := [fsBold];

  // atribui a ordenação selecionada
  FdmCadastro.PegarCDSCadastro.IndexName := sIndexName;

  FdmCadastro.PegarCDSCadastro.First;
end;

procedure TformCadastroTemplate.lTituloMouseDown(Sender: TObject;
                                                 Button: TMouseButton;
                                                 Shift: TShiftState;
                                                 X, Y: Integer);
begin
  inherited;
  MoveWindowFromButton(Button);
end;

procedure TformCadastroTemplate.aAbrirGradeExecute(Sender: TObject);
begin
  inherited;
  ConfigurarCardConsulta(aAbrirLista);
end;

procedure TformCadastroTemplate.aAbrirListaExecute(Sender: TObject);
begin
  inherited;
  ConfigurarCardConsulta(aAbrirGrade);
end;

function TformCadastroTemplate.AdicionarObserver(_AObserver: iMenuObserver): iMenuSubjectObserver;
begin
  Result := Self;

  FObservers.Add(_AObserver);
end;

procedure TformCadastroTemplate.Notificar;
var
  ANotificacao: TNotificacao;
  AObserver: iMenuObserver;
begin
  ANotificacao.TypeCadastros := ControllerCadastros.TypeCadastro;

  for AObserver in FObservers do
    AObserver.AtualizarObserver(ANotificacao);
end;

function TformCadastroTemplate.RemoverObserver(_AObserver: iMenuObserver): iMenuSubjectObserver;
begin
  Result := Self;

  FObservers.Delete(FObservers.IndexOf(_AObserver));
end;

procedure TformCadastroTemplate.sbPesquisaConsultaInvokeSearch(Sender: TObject);
begin
  inherited;
  TLibMessages.New.Informar('SearchBoxInvokeSearch');
end;

procedure TformCadastroTemplate.aEditarCadExecute(Sender: TObject);
begin
  inherited;
  cpCadastros.ActiveCard := cCadastro;
  FdmCadastro.PegarCDSCadastro.Edit;
  AjustarTelaCadastro;
end;

procedure TformCadastroTemplate.aExcluirCadExecute(Sender: TObject);
begin
  inherited;
  ControllerCadastros.Cadastro.ExcluirCadastro;
end;

procedure TformCadastroTemplate.aIncluirCadExecute(Sender: TObject);
begin
  inherited;
  cpCadastros.ActiveCard := cCadastro;
  FdmCadastro.PegarCDSCadastro.Insert;
  AjustarTelaCadastro;
end;

procedure TformCadastroTemplate.aSairExecute(Sender: TObject);
begin
  if (cpCadastros.ActiveCard = cCadastro) then
  begin
    ControllerCadastros.Cadastro.CancelarInserirEditarCadastro;
    AtivarTelaConsulta;
  end
  else
    inherited;
end;

procedure TformCadastroTemplate.aSalvarCadExecute(Sender: TObject);
begin
  inherited;
  ControllerCadastros.Cadastro.GravarCadastro;
  AtivarTelaConsulta;
end;

procedure TformCadastroTemplate.AtivarTelaConsulta;
begin
  cpCadastros.ActiveCard := cConsulta;
  ControllerCadastros.Cadastro.AtualizarRegistros;
end;

end.

