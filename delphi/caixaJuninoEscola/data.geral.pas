unit data.geral;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.Stan.StorageJSON, dialogs,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TEventoLog = procedure(Mensagem: string) of object;

  Tdatas = class(TDataModule)
    sourceFichas: TDataSource;
    tableFichas: TFDMemTable;
    tableFichasid: TIntegerField;
    tableFichasnome: TStringField;
    tableFichasvalor: TCurrencyField;
    sourceCaixas: TDataSource;
    tableCaixas: TFDMemTable;
    tableCaixasid: TIntegerField;
    tableCaixasnome: TStringField;
    sourceRetiradas: TDataSource;
    tableRetiradas: TFDMemTable;
    tableRetiradasid: TIntegerField;
    tableRetiradasnome: TStringField;
    sourceMovimento: TDataSource;
    tableMovimento: TFDMemTable;
    tableMovimentoid: TIntegerField;
    tableMovimentoid_caixa: TIntegerField;
    tableMovimentotroco: TCurrencyField;
    tableMovimentonomeCaixa: TStringField;
    sourceMovFichas: TDataSource;
    tableMovFichas: TFDMemTable;
    tableMovFichasid: TIntegerField;
    tableMovFichasid_movto: TIntegerField;
    tableMovFichasquantidade: TIntegerField;
    tableMovFichasid_fichas: TIntegerField;
    tableMovFichasvalorFicha: TCurrencyField;
    tableMovFichasparcial: TCurrencyField;
    ColecaoImagens: TImageCollection;
    Imagens: TVirtualImageList;
    Imagens30: TVirtualImageList;
    Imagens10: TVirtualImageList;
    tableMovRetirada: TFDMemTable;
    sourceMovRetirada: TDataSource;
    tableMovRetiradaid_movto: TIntegerField;
    tableMovRetiradaid_retirada: TIntegerField;
    tableMovRetiradavalor: TCurrencyField;
    tableMovRetiradatipo: TStringField;
    tableMovRetiradaid: TIntegerField;
    tableFecFicha: TFDMemTable;
    sourceFecFicha: TDataSource;
    tableFecFichaid: TIntegerField;
    tableFecFichaid_movto: TIntegerField;
    tableFecFichaid_fichas: TIntegerField;
    tableFecFichavalorFicha: TCurrencyField;
    tableFecFichaquantidade: TIntegerField;
    tableFecFichaparcial: TCurrencyField;
    tableFecSaldo: TFDMemTable;
    sourceFecSaldo: TDataSource;
    tableFecSaldoid: TIntegerField;
    tableFecSaldoid_movto: TIntegerField;
    tableFecSaldoid_retirada: TIntegerField;
    tableFecSaldovalor: TCurrencyField;
    tableFecSaldotipo: TStringField;
    Imagens20: TVirtualImageList;
    tableMovFichaslog: TDateTimeField;
    tableMovRetiradalog: TDateTimeField;
    tableFecFichalog: TDateTimeField;
    tableFecSaldolog: TDateTimeField;
    tableMovGeral: TFDMemTable;
    tableGeralFicha: TFDMemTable;
    tableGeralRetirada: TFDMemTable;
    tableGeralFecFicha: TFDMemTable;
    tableGeralFecRetirada: TFDMemTable;
    sourceMovGeral: TDataSource;
    sourceGeralFicha: TDataSource;
    sourceGeralRetirada: TDataSource;
    sourceGeralFecFicha: TDataSource;
    sourceGeralFecRetirada: TDataSource;
    tableMovGeralid: TIntegerField;
    tableMovGeraltroco: TCurrencyField;
    tableMovGeralnomeCaixa: TStringField;
    tableGeralFichaid: TIntegerField;
    tableGeralFichaid_movto: TIntegerField;
    tableGeralFichaid_fichas: TIntegerField;
    tableGeralFichaquantidade: TIntegerField;
    tableGeralFichavalorFicha: TCurrencyField;
    tableGeralFichaparcial: TCurrencyField;
    tableGeralFichalog: TDateTimeField;
    tableGeralRetiradaid: TIntegerField;
    tableGeralRetiradaid_movto: TIntegerField;
    tableGeralRetiradaid_retirada: TIntegerField;
    tableGeralRetiradavalor: TCurrencyField;
    tableGeralRetiradatipo: TStringField;
    tableGeralRetiradalog: TDateTimeField;
    tableGeralFecFichaid: TIntegerField;
    tableGeralFecFichaid_movto: TIntegerField;
    tableGeralFecFichaid_fichas: TIntegerField;
    tableGeralFecFichavalorFicha: TCurrencyField;
    tableGeralFecFichaquantidade: TIntegerField;
    tableGeralFecFichaparcial: TCurrencyField;
    tableGeralFecFichalog: TDateTimeField;
    tableGeralFecRetiradaid: TIntegerField;
    tableGeralFecRetiradaid_movto: TIntegerField;
    tableGeralFecRetiradaid_retirada: TIntegerField;
    tableGeralFecRetiradavalor: TCurrencyField;
    tableGeralFecRetiradatipo: TStringField;
    tableGeralFecRetiradalog: TDateTimeField;
    tableGeralFichaid_fk: TIntegerField;
    tableGeralRetiradaid_fk: TIntegerField;
    tableGeralFecFichaid_fk: TIntegerField;
    tableGeralFecRetiradaid_fk: TIntegerField;
    tableGeralFichafk_caixa: TIntegerField;
    tableGeralFichanomeCaixa: TStringField;
    tableGeralRetiradafk_caixa: TIntegerField;
    tableGeralRetiradanomeCaixa: TStringField;
    tableGeralFecFichafk_caixa: TIntegerField;
    tableGeralFecFichanomeCaixa: TStringField;
    tableGeralFecRetiradafk_caixa: TIntegerField;
    tableGeralFecRetiradanomeCaixa: TStringField;
    tableFecFichanomeCaixa: TStringField;
    tableFecSaldonomeCaixa: TStringField;
    tableMovFichasnomeCaixa: TStringField;
    tableMovRetiradanomeCaixa: TStringField;
    procedure tableCaixasAfterPost(DataSet: TDataSet);
    procedure tableCaixasAfterDelete(DataSet: TDataSet);
    procedure tableMovFichasAfterPost(DataSet: TDataSet);
    procedure tableMovFichasAfterDelete(DataSet: TDataSet);
    procedure tableMovFichasCalcFields(DataSet: TDataSet);
    procedure tableMovRetiradaAfterPost(DataSet: TDataSet);
    procedure tableMovRetiradaAfterDelete(DataSet: TDataSet);
    procedure tableFecFichaCalcFields(DataSet: TDataSet);
    procedure tableFecFichaAfterDelete(DataSet: TDataSet);
    procedure tableFecFichaAfterPost(DataSet: TDataSet);
    procedure tableFecSaldoAfterDelete(DataSet: TDataSet);
    procedure tableFecSaldoAfterPost(DataSet: TDataSet);
    procedure tableMovFichasBeforeDelete(DataSet: TDataSet);
    procedure tableMovRetiradaBeforeDelete(DataSet: TDataSet);
    procedure tableGeralFichaCalcFields(DataSet: TDataSet);
    procedure tableGeralFecFichaCalcFields(DataSet: TDataSet);
    procedure tableFecFichaBeforeDelete(DataSet: TDataSet);
    procedure tableFecSaldoBeforeDelete(DataSet: TDataSet);
    procedure tableMovimentoAfterPost(DataSet: TDataSet);
    procedure tableMovimentoAfterDelete(DataSet: TDataSet);
    procedure tableFichasAfterDelete(DataSet: TDataSet);
    procedure tableRetiradasAfterDelete(DataSet: TDataSet);
    procedure tableGeralFecRetiradaAfterDelete(DataSet: TDataSet);
    procedure tableGeralFecFichaAfterDelete(DataSet: TDataSet);
    procedure tableGeralRetiradaAfterDelete(DataSet: TDataSet);
    procedure tableGeralFichaAfterDelete(DataSet: TDataSet);
    procedure tableGeralFichaAfterPost(DataSet: TDataSet);
    procedure tableMovGeralAfterDelete(DataSet: TDataSet);
    procedure tableFichasAfterPost(DataSet: TDataSet);
    procedure tableRetiradasAfterPost(DataSet: TDataSet);
    procedure tableGeralFecRetiradaAfterPost(DataSet: TDataSet);
    procedure tableGeralFecFichaAfterPost(DataSet: TDataSet);
    procedure tableGeralRetiradaAfterPost(DataSet: TDataSet);
    procedure tableMovGeralAfterPost(DataSet: TDataSet);
  private
    FIncMenus: TNotifyEvent;
    FAtualizarMovimento: TNotifyEvent;
    FAtualizarMovtoGeral: TNotifyEvent;
    FCalcularFichasMovt: TNotifyEvent;
    FCalcularRetiradasM: TNotifyEvent;
    FCalcFechamentoFichas: TNotifyEvent;
    FCalcFechamentoSaldos: TNotifyEvent;
    FGravarLogs: TEventoLog;

    procedure ExecutarCalculoGeralMovimento;
    procedure AtualizarCaixas;
    procedure CalcularCaixas;
    function PegarDiretorioArquivoSistema(arquivo: string): string;
    procedure GravarMemTable(table: TFDMemTable);

  public
    property IncMenus: TNotifyEvent read FIncMenus write FIncMenus;
    property AtualizarMovimento: TNotifyEvent read FAtualizarMovimento write FAtualizarMovimento;
    property AtualizarMovtoGeral: TNotifyEvent read FAtualizarMovtoGeral write FAtualizarMovtoGeral;
    property CalcularFichasMovt: TNotifyEvent read FCalcularFichasMovt write FCalcularFichasMovt;
    property CalcularRetiradasM: TNotifyEvent read FCalcularRetiradasM write FCalcularRetiradasM;
    property CalcFechamentoFichas: TNotifyEvent read FCalcFechamentoFichas write FCalcFechamentoFichas;
    property CalcFechamentoSaldos: TNotifyEvent read FCalcFechamentoSaldos write FCalcFechamentoSaldos;
    property GravarLogs: TEventoLog read FGravarLogs write FGravarLogs;

    procedure ExecuteShow;

  end;

var
  datas: Tdatas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdatas.tableCaixasAfterDelete(DataSet: TDataSet);
begin
  AtualizarCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableCaixasAfterPost(DataSet: TDataSet);
begin
  AtualizarCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableFecFichaAfterDelete(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableFecFichaAfterPost(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableFecFichaBeforeDelete(DataSet: TDataSet);
begin
  if tableGeralFecFicha.Locate('id_fk', tableFecFichaid.AsInteger, []) then
    tableGeralFecFicha.Delete;
end;

procedure Tdatas.tableFecFichaCalcFields(DataSet: TDataSet);
var
  Parcial: Currency;
begin
  Parcial := tableFecFichaquantidade.AsInteger * tableFecFichavalorFicha.AsCurrency;
  tableFecFichaparcial.AsCurrency := Parcial;
end;

procedure Tdatas.tableFecSaldoAfterDelete(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableFecSaldoAfterPost(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableFecSaldoBeforeDelete(DataSet: TDataSet);
begin
  if tableGeralFecRetirada.Locate('id_fk', tableFecSaldoid.AsInteger, []) then
    tableGeralFecRetirada.Delete;
end;

procedure Tdatas.tableFichasAfterDelete(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableFichasAfterPost(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralFecFichaAfterDelete(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralFecFichaAfterPost(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralFecFichaCalcFields(DataSet: TDataSet);
var
  Parcial: Currency;
begin
  Parcial := tableGeralFecFichaquantidade.AsInteger * tableGeralFecFichavalorFicha.AsCurrency;
  tableGeralFecFichaparcial.AsCurrency := Parcial;
end;

procedure Tdatas.tableGeralFecRetiradaAfterDelete(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralFecRetiradaAfterPost(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralFichaAfterDelete(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralFichaAfterPost(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralFichaCalcFields(DataSet: TDataSet);
var
  Parcial: Currency;
begin
  Parcial := tableGeralFichaquantidade.AsInteger * tableGeralFichavalorFicha.AsCurrency;
  tableGeralFichaparcial.AsCurrency := Parcial;
end;

procedure Tdatas.tableGeralRetiradaAfterDelete(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableGeralRetiradaAfterPost(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovFichasAfterDelete(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovFichasAfterPost(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovFichasBeforeDelete(DataSet: TDataSet);
begin
  if tableGeralFicha.Locate('id_fk', tableMovFichasid.AsInteger, []) then
    tableGeralFicha.Delete;
end;

procedure Tdatas.tableMovFichasCalcFields(DataSet: TDataSet);
var
  Parcial: Currency;
begin
  Parcial := tableMovFichasquantidade.AsInteger * tableMovFichasvalorFicha.AsCurrency;
  tableMovFichasparcial.AsCurrency := Parcial;
end;

procedure Tdatas.tableMovGeralAfterDelete(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovGeralAfterPost(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovimentoAfterDelete(DataSet: TDataSet);
begin
  ExecutarCalculoGeralMovimento;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovimentoAfterPost(DataSet: TDataSet);
begin
  ExecutarCalculoGeralMovimento;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovRetiradaAfterDelete(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovRetiradaAfterPost(DataSet: TDataSet);
begin
  CalcularCaixas;
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableMovRetiradaBeforeDelete(DataSet: TDataSet);
begin
  if tableGeralRetirada.Locate('id_fk', tableMovRetiradaid.AsInteger, []) then
    tableGeralRetirada.Delete;
end;

procedure Tdatas.tableRetiradasAfterDelete(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.tableRetiradasAfterPost(DataSet: TDataSet);
begin
  GravarMemTable(TFDMemTable(DataSet));
end;

procedure Tdatas.AtualizarCaixas;
begin
  if Assigned(FIncMenus) then
    FIncMenus(nil);

  if Assigned(FAtualizarMovimento) then
    FAtualizarMovimento(nil);

  ExecutarCalculoGeralMovimento;
  CalcularCaixas;
end;

procedure Tdatas.CalcularCaixas;
begin
  if Assigned(FCalcularFichasMovt) then
    FCalcularFichasMovt(nil);

  if Assigned(CalcularRetiradasM) then
    CalcularRetiradasM(nil);

  if Assigned(FCalcFechamentoFichas) then
    FCalcFechamentoFichas(nil);

  if Assigned(FCalcFechamentoSaldos) then
    FCalcFechamentoSaldos(nil);
end;

procedure Tdatas.ExecutarCalculoGeralMovimento;
begin
  if Assigned(FAtualizarMovimento) then
    FAtualizarMovimento(nil);

  if Assigned(FAtualizarMovtoGeral) then
    FAtualizarMovtoGeral(nil);

  CalcularCaixas;
end;

function Tdatas.PegarDiretorioArquivoSistema(arquivo: string): string;
begin
  Result := ExtractFileDir(GetCurrentDir) + '\fileGRD_'+arquivo+'.json';
end;

procedure Tdatas.ExecuteShow;
begin
  for var I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TFDMemTable) then
    begin
      if FileExists(PegarDiretorioArquivoSistema(TFDMemTable(Components[I]).Name)) then
        TFDMemTable(Components[I]).LoadFromFile(PegarDiretorioArquivoSistema(TFDMemTable(Components[I]).Name))
      else
        TFDMemTable(Components[I]).Open;
    end;
  end;

  AtualizarCaixas;
end;

procedure Tdatas.GravarMemTable(table: TFDMemTable);
begin
  if Assigned(FGravarLogs) then
    FGravarLogs('Gravando arquivo '+ string(table.Name).Replace('table', EmptyStr, [rfReplaceAll]) + sLineBreak);

  table.SaveToFile(PegarDiretorioArquivoSistema(table.Name));
end;

end.
