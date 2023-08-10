unit view.calcular;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions, Data.Images,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.ButtonGroup, Vcl.StdCtrls, Vcl.Mask,
  EditMaskMDS, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TEnumTipoCalc = (etcNil, etcResult, etcSomar, etcSubtrair, etcDividir, etcMultiplicar);

  TformCalcular = class(TformTemplate)
    aSomar: TAction;
    aSubtrair: TAction;
    aMultiplicar: TAction;
    aDividir: TAction;
    aConfirmar: TAction;
    sourceCalc: TDataSource;
    tableCalc: TFDMemTable;
    tableCalcvalor: TCurrencyField;
    tableCalctipo: TStringField;
    tableCalctotal: TCurrencyField;
    ButtonGroup2: TButtonGroup;
    aLimpar: TAction;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    aMemory: TAction;
    tableMemory: TFDMemTable;
    sourceMemory: TDataSource;
    tableMemoryseq: TIntegerField;
    aResult: TAction;
    tableMemorytotal: TCurrencyField;
    Panel1: TPanel;
    Label1: TLabel;
    editValor: TEditMaskMDS;
    procedure aSomarExecute(Sender: TObject);
    procedure aSubtrairExecute(Sender: TObject);
    procedure aMultiplicarExecute(Sender: TObject);
    procedure aDividirExecute(Sender: TObject);
    procedure aConfirmarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aLimparExecute(Sender: TObject);
    procedure aMemoryExecute(Sender: TObject);
    procedure aResultExecute(Sender: TObject);
    procedure editValorKeyPress(Sender: TObject; var Key: Char);
  private
    const
      CALC_RESULT = '=';
      CALC_SUBTRAIR = '-';
      CALC_SOMAR = '+';
      CALC_DIVIDIR = '/';
      CALC_MULTIPLICAR = '*';
  private
    { Private declarations }
    procedure AdicionarCalculo(TipoCalc: TEnumTipoCalc);
    function PegarTipoCalculo(TipoCalc: TEnumTipoCalc): string;
    function pegarTotalCalculado(total: currency; TipoCalc: TEnumTipoCalc): currency;
    function PegarValorInformado: currency;
    function PegarTipoCalcAnterior(TipoCalcAnt: string): TEnumTipoCalc;

  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

procedure TformCalcular.aConfirmarExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TformCalcular.aDividirExecute(Sender: TObject);
begin
  inherited;
  AdicionarCalculo(etcDividir);
end;

procedure TformCalcular.aLimparExecute(Sender: TObject);
begin
  inherited;
  tableCalc.Close;
  tableCalc.Open;
end;

procedure TformCalcular.aMemoryExecute(Sender: TObject);
begin
  inherited;
  if tablecalc.IsEmpty then
    raise Exception.Create('Nenhum calculo para memorizar.');

  tableMemory.append;
  tableMemorytotal.AsCurrency := tablecalctotal.AsCurrency;
  tableMemory.Post;
end;

procedure TformCalcular.aMultiplicarExecute(Sender: TObject);
begin
  inherited;
  AdicionarCalculo(etcMultiplicar);
end;

procedure TformCalcular.aResultExecute(Sender: TObject);
begin
  inherited;
  AdicionarCalculo(etcResult);
end;

procedure TformCalcular.aSomarExecute(Sender: TObject);
begin
  inherited;
  AdicionarCalculo(etcSomar);
end;

procedure TformCalcular.aSubtrairExecute(Sender: TObject);
begin
  inherited;
  AdicionarCalculo(etcSubtrair);
end;

procedure TformCalcular.editValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

//       if String(Key).Equals(CALC_SOMAR) then Result := etcSomar
//  else if String(Key).Equals(CALC_SUBTRAIR) then Result := etcSubtrair
//  else if String(Key).Equals(CALC_DIVIDIR) then Result := etcDividir
//  else if String(Key).Equals(CALC_MULTIPLICAR) then Result := etcMultiplicar;

end;

procedure TformCalcular.AdicionarCalculo(TipoCalc: TEnumTipoCalc);
var
  total: currency;
  tipoCalcAnt: TEnumTipoCalc;
begin
  if (string(editValor.Text).IsEmpty) or (PegarValorInformado = 0) then
  begin
    if TipoCalc <> etcResult then
      raise Exception.Create('Valor inválido.');
  end;

  total := tablecalctotal.AsCurrency;
  tipoCalcAnt := PegarTipoCalcAnterior(tableCalctipo.AsString);

  tablecalc.append;
  tableCalcvalor.AsCurrency := PegarValorInformado;
  tableCalctipo.AsString := PegarTipoCalculo(TipoCalc);
  tablecalctotal.AsCurrency := pegarTotalCalculado(total, tipoCalcAnt);
  tablecalc.post;

  if TipoCalc = etcResult then
  begin
    aMemory.Execute;
    aLimpar.Execute;
  end;

  editvalor.Clear;
  editvalor.SetFocus;
end;

function TformCalcular.pegarTotalCalculado(total: currency; TipoCalc: TEnumTipoCalc): currency;
begin
  if Total = 0 then
  begin
    Result := PegarValorInformado;

    if TipoCalc = etcSubtrair then
      Result := Result * (-1);

  end
  else
  begin
    case TipoCalc of
      etcSomar: Result := Total + PegarValorInformado;
      etcSubtrair: Result := Total - PegarValorInformado;
      etcDividir: Result := Total / PegarValorInformado;
      etcMultiplicar: Result := Total * PegarValorInformado;
      else
        Result := 0;
    end;
  end;
end;

function TformCalcular.PegarValorInformado: currency;
begin
  Result := StrToCurrDef(editvalor.Text, 0);
end;

procedure TformCalcular.FormCreate(Sender: TObject);
begin
  inherited;
  tableCalc.open;
  tableMemory.open;
end;

function TformCalcular.PegarTipoCalcAnterior(TipoCalcAnt: string): TEnumTipoCalc;
begin
  Result := etcNil;

       if TipoCalcAnt.Equals(CALC_SOMAR) then Result := etcSomar
  else if TipoCalcAnt.Equals(CALC_SUBTRAIR) then Result := etcSubtrair
  else if TipoCalcAnt.Equals(CALC_DIVIDIR) then Result := etcDividir
  else if TipoCalcAnt.Equals(CALC_MULTIPLICAR) then Result := etcMultiplicar;
end;

function TformCalcular.PegarTipoCalculo(TipoCalc: TEnumTipoCalc): string;
begin
  case TipoCalc of
    etcResult: Result := CALC_RESULT;
    etcSomar: Result := CALC_SOMAR;
    etcSubtrair: Result := CALC_SUBTRAIR;
    etcDividir: Result := CALC_DIVIDIR;
    etcMultiplicar: Result := CALC_MULTIPLICAR;
  end;
end;

end.

