unit view.cadastro.saldoportador.transferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions, data.cadastro.template.interfaces,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  data.cadastro.saldoportador.transferencia;

type
  TformSaldoPortadorTransferencia = class(TformTemplate)
    lId_Portador_Origem: TLabel;
    lcbId_Portador_Origem: TDBLookupComboBox;
    lId_Portador_Destino: TLabel;
    lcbId_Portador_Destino: TDBLookupComboBox;
    lValor: TLabel;
    pRodapeBotoesCad: TPanel;
    sbCancelarCadastro: TSpeedButton;
    sbSalvarCadastro: TSpeedButton;
    eValorTransferencia: TEdit;
    aTransferir: TAction;
    procedure FormCreate(Sender: TObject);
    procedure aTransferirExecute(Sender: TObject);
    procedure eValorTransferenciaKeyPress(Sender: TObject; var Key: Char);
  private
    FdmPortador_Origem: idataCadastroTemplate;
    FdmPortador_Destino: idataCadastroTemplate;

  public
    { Public declarations }

  end;

implementation

uses
  lib.messages,
  lib.helper.querys,
  consts.nomeCadastros,
  data.cadastro.template.factory,
  lib.DAO.comandosTransacao,
  lib.sql.contapagamento,
  lib.sql.lookup,
  consts.SQLs;

{$R *.dfm}

procedure TformSaldoPortadorTransferencia.aTransferirExecute(Sender: TObject);
var
  aSQLOrigem,
  aSQLDestino: string;
begin
  inherited;

  if VarIsNull(lcbId_Portador_Origem.KeyValue) then
  begin
    TLibMessages.New.Erro('Campo Portador Origem é obrigatório!');
    Abort;
  end;

  if VarIsNull(lcbId_Portador_Destino.KeyValue) then
  begin
    TLibMessages.New.Erro('Campo Portador Destino é obrigatório!');
    Abort;
  end;

  aSQLOrigem  := Format('UPDATE SALDOPORTADOR SET VALOR=(VALOR - %0:s) WHERE ID_PORTADOR= %1:d', [(String(eValorTransferencia.Text).Replace(',', '.', [rfReplaceAll])), Integer(lcbId_Portador_Origem.KeyValue) ]  );
  aSQLDestino := Format('UPDATE SALDOPORTADOR SET VALOR=(VALOR + %0:s) WHERE ID_PORTADOR= %1:d', [(String(eValorTransferencia.Text).Replace(',', '.', [rfReplaceAll])), Integer(lcbId_Portador_Destino.KeyValue) ] );

  TdmCmdTransacao.New
    .AddCommand(aSQLOrigem)
    .Executar;

  TdmCmdTransacao.New
    .AddCommand(aSQLDestino)
    .Executar;

  TdmCmdTransacao.New
    .AddCommand(
      TSQLContaPagamentos.New
          .SetEnumSQL(sqlContaPgtoUpdateSaldoExtrato)
          .PegarSQL()
        )
      .SetParamString('pTIPOSALDO', '=')
      .SetParamFloat('pVALOR', String(eValorTransferencia.Text).Replace('.', '', [rfReplaceAll]))
      .SetParamFloat('pSALDO', 0.0)
      .SetParamString('pDESCRICAO', string('Transf.: '+ Integer(lcbId_Portador_Origem.KeyValue).ToString +' - '+ lcbId_Portador_Origem.Text).Substring(0, 50))
        .Executar;

  TdmCmdTransacao.New
    .AddCommand(
      TSQLContaPagamentos.New
          .SetEnumSQL(sqlContaPgtoUpdateSaldoExtrato)
          .PegarSQL()
        )
      .SetParamString('pTIPOSALDO', '=')
      .SetParamFloat('pVALOR', String(eValorTransferencia.Text).Replace('.', '', [rfReplaceAll]))
      .SetParamFloat('pSALDO', 0.0)
      .SetParamString('pDESCRICAO', string('Transf.: '+ Integer(lcbId_Portador_Destino.KeyValue).ToString +' - '+ lcbId_Portador_Destino.Text).Substring(0, 50))
        .Executar;

  TLibMessages.New.Informar('Transferência concluída!');

  Close;
end;

procedure TformSaldoPortadorTransferencia.eValorTransferenciaKeyPress(Sender: TObject; var Key: Char);
  function ValidaNumeros: boolean;
  begin
    Result := CharInSet(Key, [#8, '0'..'9', '-', FormatSettings.DecimalSeparator]);
  end;

  function ValidaCharDuplicado: boolean;
  begin
    Result := ((Key = FormatSettings.DecimalSeparator) or (Key = '-')) and
              (Pos(Key, eValorTransferencia.Text) > 0);
  end;

  function ValidaCharInicial: boolean;
  begin
    Result := (Key = '-') and (eValorTransferencia.SelStart <> 0);
  end;
begin
  inherited;

  if (not ValidaNumeros) or (ValidaCharDuplicado) or (ValidaCharInicial) then
    Key := #0;
end;

procedure TformSaldoPortadorTransferencia.FormCreate(Sender: TObject);
begin
  inherited;
  FdmPortador_Origem  := TdataCadastroFactory.New.GerarDataCadastro(cadPortador);
  FdmPortador_Destino := TdataCadastroFactory.New.GerarDataCadastro(cadPortador);

  lcbId_Portador_Origem.ListSource  := FdmPortador_Origem.PegarDSCadastro;
  lcbId_Portador_Destino.ListSource := FdmPortador_Destino.PegarDSCadastro;

  FdmPortador_Origem.PegarQCadastro.SQL.Clear;
  FdmPortador_Destino.PegarQCadastro.SQL.Clear;

  FdmPortador_Origem.PegarQCadastro.SQL.Add(TSQLLookup.New.SetEnumSQL(sqlLookupSaldoPortador).PegarSQL);
  FdmPortador_Destino.PegarQCadastro.SQL.Add(TSQLLookup.New.SetEnumSQL(sqlLookupSaldoPortador).PegarSQL);

  FdmPortador_Origem.PegarCDSCadastro.Active := True;
  FdmPortador_Destino.PegarCDSCadastro.Active := True;
end;

end.

