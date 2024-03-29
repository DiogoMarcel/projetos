unit view.menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls, consts.nomeCadastros,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, System.TypInfo,
  Vcl.ActnMenus, System.Generics.Collections, frame.menu, Vcl.StdCtrls, data.images,
  Vcl.ExtCtrls, Vcl.WinXCtrls, consts.imagens, Vcl.CategoryButtons,
  Vcl.AppAnalytics;

type
  TformMenu = class(TForm)
    aListaAcoes: TActionList;
    aAbrirRelatorios: TAction;
    aSair: TAction;
    aAbrirCadastros: TAction;
    cadCartao: TAction;
    cadConta: TAction;
    cadCredor: TAction;
    cadDespesaCartao: TAction;
    cadMembroFamilia: TAction;
    cadPortador: TAction;
    cadSaldoFGTS: TAction;
    cadSaldoPortador: TAction;
    cadTags: TAction;
    cadContaPagar: TAction;
    cadContaReceber: TAction;
    svMenu: TSplitView;
    cbMenu: TCategoryButtons;
    frameMenu: TframeMenu;
    relSaldoDetalhado: TAction;
    relSaldoDetalhadoGrafico: TAction;
    algCasa: TAction;
    aAbrirAluguel: TAction;
    procedure aAbrirCadastrosExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aAbrirRelatoriosExecute(Sender: TObject);
    procedure aAbrirAluguelExecute(Sender: TObject);
  private
    FFormsList: TDictionary<string, TForm>;

    function PegarFormClassCadastro(_TypeCadastros: TTypeCadastros): TFormClass;
    function PegarTypeCad(Sender: TObject): TTypeCadastros;
    procedure AbrirCadastro(_TypeCadastros: TTypeCadastros);
    procedure AbrirRelatorios(_AAction: TAction);
    procedure AbrirAlugueis(_AAction: TAction);

  public
    { Public declarations }
  end;

var
  formMenu: TformMenu;

implementation

uses
  view.aluguel.factory,
  view.relatorio.factory,
  controller.lib,
  controller.cadastro;

{$R *.dfm}

procedure TformMenu.aAbrirAluguelExecute(Sender: TObject);
begin
  AbrirAlugueis(Sender as TAction);
end;

procedure TformMenu.aAbrirCadastrosExecute(Sender: TObject);
begin
  AbrirCadastro( PegarTypeCad(Sender) );
end;

procedure TformMenu.aAbrirRelatoriosExecute(Sender: TObject);
begin
  AbrirRelatorios(Sender as TAction);
end;

procedure TformMenu.AbrirCadastro(_TypeCadastros: TTypeCadastros);
var
  AFormClass: TFormClass;
  AForm: TForm;
begin
  TControllerLibrary.New
    .Aguarde(Self)
      .ExibirAguarde;

//  if (svMenu.Opened) then
//    svMenu.Close;

  LockWindowUpdate(Handle);
  try
    AFormClass := PegarFormClassCadastro(_TypeCadastros);

    if (FFormsList.Count > 0) then
    begin
      if (FFormsList.ContainsKey(AFormClass.ClassName)) and (Assigned(FFormsList.Items[AFormClass.ClassName])) then
      begin
        FFormsList.Items[AFormClass.ClassName].WindowState := TWindowState.wsMaximized;
        FFormsList.Items[AFormClass.ClassName].Show;
        Exit;
      end;
    end;

    AForm := AFormClass.Create(Application);
    AForm.Show;

    FFormsList.Add(AFormClass.ClassName, AForm);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TformMenu.AbrirRelatorios(_AAction: TAction);
begin
  TAbrirRelatoriosFactory.New.AbrirRelatorio(_AAction);
end;

procedure TformMenu.AbrirAlugueis(_AAction: TAction);
begin
  TAbrirAlugueisFactory.New.AbrirAluguel(_AAction);
end;

procedure TformMenu.aSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TformMenu.FormCreate(Sender: TObject);
begin
  FFormsList := TDictionary<string, TForm>.Create;

  frameMenu.onCreateMenu;
end;

procedure TformMenu.FormDestroy(Sender: TObject);
begin
  if Assigned(FFormsList) then
    FreeAndNil(FFormsList);
end;

procedure TformMenu.FormShow(Sender: TObject);
const
  {Cadastros}
  ITEM_MENU_PAGAR           = 01; ITEM_MENU_RECEBER         = 02;
  ITEM_MENU_SALDOPORTADOR   = 03; ITEM_MENU_PORTADOR        = 04;
  ITEM_MENU_DESPESACARTAO   = 05; ITEM_MENU_CARTAO          = 06;
  ITEM_MENU_CREDOR          = 07; ITEM_MENU_MEMBROFAMILIA   = 08;
  ITEM_MENU_SALDOFGTS       = 09; ITEM_MENU_TAGS            = 10;
  {Relatórios}
  ITEM_MENU_REL_SALDO_DETAL = 01; ITEM_MENU_REL_SALDO_DETAL_GRAFICO = 02;
  {Aluguel}
  ITEM_MENU_ALUGUEL = 01;
begin
  aListaAcoes.Images := TdataImages
                            .ObterInstanciaDataImagens
                              .PegarImageList(qil32);

  cbMenu.Images := aListaAcoes.Images;

  with cbMenu.Categories[0] do
  begin
    Items[ITEM_MENU_PAGAR        -1].ImageIndex := TEnumImagens32.EnumToValue(ci32Pagar);
    Items[ITEM_MENU_RECEBER      -1].ImageIndex := TEnumImagens32.EnumToValue(ci32Receber);
    Items[ITEM_MENU_SALDOPORTADOR-1].ImageIndex := TEnumImagens32.EnumToValue(ci32SaldoPortador);
    Items[ITEM_MENU_PORTADOR     -1].ImageIndex := TEnumImagens32.EnumToValue(ci32Portador);
    Items[ITEM_MENU_DESPESACARTAO-1].ImageIndex := TEnumImagens32.EnumToValue(ci32DespesaCartao);
    Items[ITEM_MENU_CARTAO       -1].ImageIndex := TEnumImagens32.EnumToValue(ci32Cartao);
    Items[ITEM_MENU_CREDOR       -1].ImageIndex := TEnumImagens32.EnumToValue(ci32Credor);
    Items[ITEM_MENU_MEMBROFAMILIA-1].ImageIndex := TEnumImagens32.EnumToValue(ci32MembroFamilia);
    Items[ITEM_MENU_SALDOFGTS    -1].ImageIndex := TEnumImagens32.EnumToValue(ci32SaldoFGTS);
    Items[ITEM_MENU_TAGS         -1].ImageIndex := TEnumImagens32.EnumToValue(ci32Tag);
  end;

  with cbMenu.Categories[1] do
  begin
    Items[ITEM_MENU_REL_SALDO_DETAL -1].ImageIndex        := TEnumImagens32.EnumToValue(ci32RelSaldoDetalhado);
    Items[ITEM_MENU_REL_SALDO_DETAL_GRAFICO-1].ImageIndex := TEnumImagens32.EnumToValue(ci32RelSaldoDetalhado);
  end;

  with cbMenu.Categories[2] do
  begin
    Items[ITEM_MENU_ALUGUEL-1].ImageIndex := TEnumImagens32.EnumToValue(ci32Rent);
  end;
end;

function TformMenu.PegarFormClassCadastro(_TypeCadastros: TTypeCadastros): TFormClass;
begin
  Result := TControllerCadastro.New
              .TypeCadastro(_TypeCadastros)
                .Cadastro
                  .PegarFormCadastro;
end;

function TformMenu.PegarTypeCad(Sender: TObject): TTypeCadastros;
var
  AEnumValue    : integer;
  ATypeInfo     : PTypeInfo;
  AComponentName: TComponentName;
begin
  ATypeInfo := TypeInfo(TTypeCadastros);

  AComponentName := TAction(Sender).Name;

  AEnumValue := GetEnumValue(ATypeInfo, AComponentName);

  Result := TTypeCadastros(AEnumValue);




end;

end.

