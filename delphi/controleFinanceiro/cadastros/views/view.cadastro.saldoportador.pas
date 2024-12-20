unit view.cadastro.saldoportador;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.cadastro.saldoportador,
  frame.cadastro.saldoportador,
  view.cadastro.template,
  System.Generics.Collections,
  Data.DB,
  System.Classes,
  System.Actions,
  FireDAC.Comp.Client,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.DBCGrids,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Controls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.WinXPanels,
  Datasnap.DBClient,
  Datasnap.Provider,
  DBRadioGroupSimNao, EditMaskMDS;
{$ENDREGION}

type
  TformCadSaldoPortador = class(TformCadastroTemplate)
    tIdSaldoPortador: TDBText;
    lIdSaldoPortador: TLabel;
    lValor: TLabel;
    eValor: TDBEdit;
    rgReservado: TDBRadioGroupSimNao;
    rgContaCapital: TDBRadioGroupSimNao;
    lId_Portador: TLabel;
    lcbId_Portador: TDBLookupComboBox;
    sbConsultaGrade: TScrollBox;
    sbTransferenciaPortador: TSpeedButton;
    aTransferenciaPortador: TAction;
    procedure aTransferenciaPortadorExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditMaskMDS1Enter(Sender: TObject);
    procedure EditMaskMDS1Exit(Sender: TObject);
    procedure EditMaskMDS1KeyPress(Sender: TObject; var Key: Char);
  private
    FListCadSaldoPortador: TList<TframeCadSaldoPortador>;

  protected
    procedure SetIControllerCadastros;      override;
    procedure AbrirConsultasLookup;         override;
    function MontarGradeConsulta: boolean;  override;
    procedure ExecutarAfterPostNaView;      override;

  public
    { Public declarations }
  end;

implementation

uses
  Dialogs,
  view.cadastro.saldoportador.transferencia,
  lib.helper.querys,
  System.SysUtils,
  System.StrUtils,
  lib.sql.lookup,
  consts.SQLs,
  lib.enum.tipoconta,
  lib.sql.contapagamento,
  lib.DAO.comandosTransacao,
  data.cadastro.template.interfaces,
  data.cadastro.template.factory,
  controller.cadastro,
  consts.nomeCadastros;

{$R *.dfm}

{ TformCadSaldoPortador }

procedure TformCadSaldoPortador.AbrirConsultasLookup;
var
  AdmPortador: idataCadastroTemplate;
begin
  inherited AbrirConsultasLookup;

  AdmPortador := TdataCadastroFactory.New.GerarDataCadastro(cadPortador);

  lcbId_Portador.ListSource := AdmPortador.PegarDSCadastro;

  AdmPortador.PegarQCadastro.SQL.Clear;
  AdmPortador.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupSaldoPortador)
        .PegarSQL
  );

  AdmPortador.PegarCDSCadastro.Active := True;
end;

procedure TformCadSaldoPortador.aTransferenciaPortadorExecute(Sender: TObject);
var
  formSaldoPortadorTransferencia: TformSaldoPortadorTransferencia;
  AframeCadSaldoPortador: TframeCadSaldoPortador;
begin
  inherited;
  formSaldoPortadorTransferencia := TformSaldoPortadorTransferencia.Create(Application);
  try
    formSaldoPortadorTransferencia.ShowModal;

    for AframeCadSaldoPortador in FListCadSaldoPortador do
      AframeCadSaldoPortador.AtualizarCDSFrame;

    FdmCadastro.PegarCDSCadastro.Refresh;
  finally
    FreeAndNil(formSaldoPortadorTransferencia);
  end;
end;

procedure TformCadSaldoPortador.EditMaskMDS1Enter(Sender: TObject);
begin
  inherited;
  //
end;

procedure TformCadSaldoPortador.EditMaskMDS1Exit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TformCadSaldoPortador.EditMaskMDS1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //
end;

procedure TformCadSaldoPortador.ExecutarAfterPostNaView;
var
  ATipoSaldo: TTypeLibEnumTipoconta;
  ADiferenca: Currency;
  ADiferencaOriginal: Currency;
begin
  ADiferencaOriginal := FdmCadastro.PegarCDSCadastro.FieldByName('VALOR').NewValue -
                        FdmCadastro.PegarCDSCadastro.FieldByName('VALOR').OldValue;

  ADiferenca := ADiferencaOriginal;

  ATipoSaldo := letNull;
  if ADiferencaOriginal > 0 then
    ATipoSaldo := letReceber
  else if ADiferencaOriginal < 0 then
  begin
    ATipoSaldo := letPagar;

    ADiferenca := ADiferenca * (-1);
  end
  else if ADiferencaOriginal = 0 then
    ATipoSaldo := letIgual;

  TdmCmdTransacao.New
    .AddCommand(
      TSQLContaPagamentos.New
          .SetEnumSQL(sqlContaPgtoUpdateSaldoExtrato)
          .PegarSQL()
        )
      .SetParamString('pTIPOSALDO', TLibEnumTipoconta.GetName(ATipoSaldo))
      .SetParamFloat('pVALOR', ADiferenca)
      .SetParamFloat('pSALDO', ADiferencaOriginal)
      .SetParamString('pDESCRICAO', string(FdmCadastro.PegarCDSCadastro.FieldByName('ID_PORTADOR').AsInteger.ToString +' - '+ FdmCadastro.PegarCDSCadastro.FieldByName('NOMEPORTADOR_PORTADOR').AsString).Substring(0, 50))
        .Executar;

  inherited;
end;

procedure TformCadSaldoPortador.FormCreate(Sender: TObject);
begin
  inherited;
  FListCadSaldoPortador := TList<TframeCadSaldoPortador>.Create;
end;

procedure TformCadSaldoPortador.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FListCadSaldoPortador) then
    FreeAndNil(FListCadSaldoPortador);
end;

function TformCadSaldoPortador.MontarGradeConsulta: boolean;
var
  AframeCadSaldoPortador: TframeCadSaldoPortador;
begin
  if FdmCadastro.PegarCDSConsultaGrade.Active then
    FdmCadastro.PegarCDSConsultaGrade.Refresh
  else
    FdmCadastro.PegarCDSConsultaGrade.Active := True;

  FdmCadastro.PegarCDSConsultaGrade.First;
  while (not FdmCadastro.PegarCDSConsultaGrade.Eof) do
  begin
    AframeCadSaldoPortador := TframeCadSaldoPortador.Create(Self);
    AframeCadSaldoPortador.Parent := sbConsultaGrade;
    AframeCadSaldoPortador.Name := 'frameCadSaldoPortador'+FdmCadastro.PegarCDSConsultaGrade.RecNo.ToString;

    AframeCadSaldoPortador.SaldoGeral := FdmCadastro.PegarCDSConsultaGrade.FieldByName('VALORTOTAL').AsCurrency;
    AframeCadSaldoPortador.IdMembroFamilia := FdmCadastro.PegarCDSConsultaGrade.FieldByName('IDMEMBROFAMILIA').AsInteger;

    AframeCadSaldoPortador.GerarSQLFrame;
    AframeCadSaldoPortador.MontarLista;

    FListCadSaldoPortador.Add(AframeCadSaldoPortador);

    FdmCadastro.PegarCDSConsultaGrade.Next;
  end;

  Result := (FdmCadastro.PegarCDSConsultaGrade.RecordCount > 0);
end;

procedure TformCadSaldoPortador.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadSaldoPortador);
end;

initialization
  RegisterClass(TformCadSaldoPortador);

finalization
  UnRegisterClass(TformCadSaldoPortador);

end.
