unit view.aluguel.editor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, EditMaskMDS,
  Vcl.Buttons;

type
  TInfosEditor = record
    IDAluguel: Int64;
    IDAluguelConta: Int64;
    Descricao: string;
    Valor: Currency;
    TipoConta: string;
    Compartilhado: string;
  end;

  TformAluguelEditor = class(TformTemplate)
    lDescricao: TLabel;
    lValor: TLabel;
    lQtdParcela: TLabel;
    editDescricao: TEdit;
    lIDAluguel: TLabel;
    Label2: TLabel;
    boxTipoConta: TComboBox;
    Label1: TLabel;
    boxCompartilhado: TComboBox;
    Panel1: TPanel;
    sbSalvarCadastro: TSpeedButton;
    sbCancelarCadastro: TSpeedButton;
    aSalvar: TAction;
    editValor: TEditMaskMDS;
    procedure aSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aSairExecute(Sender: TObject);
  private
    { Private declarations }
    const
      TIPOCONTA_PAGAR = 'P';
      TIPOCONTA_PAGAR_INDEX = 0;
      TIPOCONTA_RECEBER = 'R';
      TIPOCONTA_RECEBER_INDEX = 1;

      COMPARTILHADO_VERDADEIRO = 'V';
      COMPARTILHADO_VERDADEIRO_INDEX = 0;
      COMPARTILHADO_FALSE = 'F';
      COMPARTILHADO_FALSE_INDEX = 1;
      COMPARTILHADO_SOMENTE = 'S';
      COMPARTILHADO_SOMENTE_INDEX = 2;

  private
    InfosEditor: TInfosEditor;

    procedure AdicionarInfoEditor;
  public
    { Public declarations }
    class function New: TformAluguelEditor;

    property Infos: TInfosEditor read InfosEditor write InfosEditor;

  end;

implementation

{$R *.dfm}

{ TformAluguelEditor }

procedure TformAluguelEditor.AdicionarInfoEditor;
begin
  InfosEditor.Descricao := editDescricao.Text;
  InfosEditor.Valor := StrToCurrDef(editValor.Text, 0);

  if boxTipoConta.ItemIndex = TIPOCONTA_PAGAR_INDEX then
    InfosEditor.TipoConta := TIPOCONTA_PAGAR
  else
    InfosEditor.TipoConta := TIPOCONTA_RECEBER;

  if boxCompartilhado.ItemIndex = COMPARTILHADO_VERDADEIRO_INDEX then
    InfosEditor.Compartilhado := COMPARTILHADO_VERDADEIRO
  else if boxCompartilhado.ItemIndex = COMPARTILHADO_FALSE_INDEX then
    InfosEditor.Compartilhado := COMPARTILHADO_FALSE
  else
    InfosEditor.Compartilhado := COMPARTILHADO_SOMENTE;
end;

procedure TformAluguelEditor.aSairExecute(Sender: TObject);
begin
  InfosEditor.Descricao := EmptyStr;
  inherited;
end;

procedure TformAluguelEditor.aSalvarExecute(Sender: TObject);
begin
  inherited;

  if String(editDescricao.Text).IsEmpty then
    raise Exception.Create('Campo descrição deve ser preenchido!');

  if StrToCurrDef(editValor.Text, 0) = 0 then
    raise Exception.Create('Campo valor deve ser preenchido!');

  AdicionarInfoEditor;

  Close;
end;

procedure TformAluguelEditor.FormCreate(Sender: TObject);
begin
  inherited;
  lIDAluguel.Caption := EmptyStr;

  editDescricao.Text := EmptyStr;
  editValor.Text := EmptyStr;
  boxTipoConta.ItemIndex := 1;
  boxCompartilhado.ItemIndex := 1;

  AdicionarInfoEditor;
end;

procedure TformAluguelEditor.FormShow(Sender: TObject);
begin
  inherited;
  lIDAluguel.Caption := infos.IDAluguel.ToString;

  if not InfosEditor.Descricao.IsEmpty then
  begin
    editDescricao.Text := InfosEditor.Descricao;
    editValor.Text := CurrToStr(InfosEditor.Valor);

    if InfosEditor.TipoConta.Equals(TIPOCONTA_PAGAR) then
      boxTipoConta.ItemIndex := TIPOCONTA_PAGAR_INDEX
    else
      boxTipoConta.ItemIndex := TIPOCONTA_RECEBER_INDEX;

    if InfosEditor.Compartilhado.Equals(COMPARTILHADO_VERDADEIRO) then
      boxCompartilhado.ItemIndex := COMPARTILHADO_VERDADEIRO_INDEX
    else if InfosEditor.Compartilhado.Equals(COMPARTILHADO_FALSE) then
      boxCompartilhado.ItemIndex := COMPARTILHADO_FALSE_INDEX
    else
      boxCompartilhado.ItemIndex := COMPARTILHADO_SOMENTE_INDEX;
  end;
end;

class function TformAluguelEditor.New: TformAluguelEditor;
begin
  Result := Self.Create(Application);
end;

end.
