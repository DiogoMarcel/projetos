unit view.cadastro.conta;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.images,
  view.cadastro.template,
  Data.DB,
  System.Classes,
  System.Actions,
  FireDAC.Comp.Client,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.Graphics,
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
  Vcl.ControlList,
  Datasnap.DBClient,
  Datasnap.Provider,
  DBRadioGroupSimNao,
  System.Generics.Collections,
  Winapi.Windows,
  Vcl.ComCtrls, frame.cadastro.conta.imgs;
{$ENDREGION}

type
  TformCadConta = class(TformCadastroTemplate)
    rgContaAnual: TDBRadioGroupSimNao;
    tIDConta: TDBText;
    eDescricao: TDBEdit;
    eValor: TDBEdit;
    lQtdParcela: TLabel;
    eQtdParcela: TDBEdit;
    rgPertenceAFolha: TDBRadioGroupSimNao;
    rgDebitaCartao: TDBRadioGroupSimNao;
    lcbId_Credor: TDBLookupComboBox;
    lcbId_MembroFamilia: TDBLookupComboBox;
    lidConta: TLabel;
    lDescricao: TLabel;
    lValor: TLabel;
    lId_Credor: TLabel;
    lId_MembroFamilia: TLabel;
    sbConsultaGrade: TScrollBox;
    dbdebitoauto: TDBRadioGroupSimNao;
    pLegendaFrames: TPanel;
    frameCadContaImagens1: TframeCadContaImagens;
    rgPagamentoManual: TDBRadioGroupSimNao;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FFramesList: TDictionary<integer, TFrame>;
    
  protected
    procedure SetIControllerCadastros;      override;
    procedure AbrirConsultasLookup;         override;
    procedure AtualizarConsultaGrade;       override;
    function MontarGradeConsulta: boolean;  override;

  public
    { Public declarations }
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  lib.messages,
  consts.SQLs,
  lib.sql.lookup,
  frame.cadastro.conta,
  data.cadastro.template.interfaces,
  data.cadastro.template.factory,
  controller.cadastro,
  consts.nomeCadastros;

{$R *.dfm}

{ TformCadConta }

procedure TformCadConta.AbrirConsultasLookup;
var
  AdmCredor: idataCadastroTemplate;
  AdmMembroFamilia: idataCadastroTemplate;
begin
  inherited AbrirConsultasLookup;

  AdmCredor        := TdataCadastroFactory.New.GerarDataCadastro(cadCredor);
  AdmMembroFamilia := TdataCadastroFactory.New.GerarDataCadastro(cadMembroFamilia);

  lcbId_Credor.ListSource         := AdmCredor.PegarDSCadastro;
  lcbId_MembroFamilia.ListSource  := AdmMembroFamilia.PegarDSCadastro;

  AdmCredor.PegarQCadastro.SQL.Clear;
  AdmCredor.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupCredor)
        .PegarSQL
  );

  AdmMembroFamilia.PegarQCadastro.SQL.Clear;
  AdmMembroFamilia.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupMembroFamilia)
        .PegarSQL
  );

  AdmCredor.PegarCDSCadastro.Active         := True;
  AdmMembroFamilia.PegarCDSCadastro.Active  := True;
end;

procedure TformCadConta.FormCreate(Sender: TObject);
begin
  inherited;
  FFramesList := TDictionary<integer, TFrame>.Create;
end;

procedure TformCadConta.FormDestroy(Sender: TObject);
begin
  inherited;
  if (Assigned(FFramesList)) then
    FreeAndNil(FFramesList);
end;

procedure TformCadConta.AtualizarConsultaGrade;
var
  ARecNo: integer;
  AframeCadConta: TframeCadConta;
begin
  inherited;

  if (not Assigned(FFramesList)) or (FFramesList.Count = 0) then
    Exit;

  if FdmCadastro.PegarCDSConsultaGrade.Active then
    FdmCadastro.PegarCDSConsultaGrade.Refresh
  else
    FdmCadastro.PegarCDSConsultaGrade.Active := True;

  FdmCadastro.PegarCDSConsultaGrade.First;
  while (not FdmCadastro.PegarCDSConsultaGrade.Eof) do
  begin
    ARecNo := FdmCadastro.PegarCDSConsultaGrade.RecNo;

    if (FFramesList.ContainsKey(ARecNo)) and (Assigned(FFramesList.Items[ARecNo])) then
    begin
      AframeCadConta := TframeCadConta(FFramesList.Items[ARecNo]);
      AframeCadConta.ValorTotal      := FdmCadastro.PegarCDSConsultaGrade.FieldByName('VALORTOTAL').AsCurrency;
      AframeCadConta.Nome            := FdmCadastro.PegarCDSConsultaGrade.FieldByName('NOME').AsString;
      AframeCadConta.TipoConta       := FdmCadastro.PegarCDSConsultaGrade.FieldByName('TIPOCONTA').AsString;
      AframeCadConta.IdMembroFamilia := FdmCadastro.PegarCDSConsultaGrade.FieldByName('ID_MEMBROFAMILIA').AsInteger;
      AframeCadConta.AtualizarLista;
      AframeCadConta.MontarLista;
    end;

    FdmCadastro.PegarCDSConsultaGrade.Next;
  end;
end;

function TformCadConta.MontarGradeConsulta: boolean;
var
  AframeCadConta: TframeCadConta;
begin
  if FdmCadastro.PegarCDSConsultaGrade.Active then
    FdmCadastro.PegarCDSConsultaGrade.Refresh
  else
    FdmCadastro.PegarCDSConsultaGrade.Active := True;

  FdmCadastro.PegarCDSConsultaGrade.First;
  while (not FdmCadastro.PegarCDSConsultaGrade.Eof) do
  begin
    AframeCadConta := TframeCadConta.Create(Self);
    AframeCadConta.Parent := sbConsultaGrade;
    AframeCadConta.Name := 'frameCadConta'+FdmCadastro.PegarCDSConsultaGrade.RecNo.ToString;
    AframeCadConta.OnCreate;

    AframeCadConta.ValorTotal      := FdmCadastro.PegarCDSConsultaGrade.FieldByName('VALORTOTAL').AsCurrency;
    AframeCadConta.Nome            := FdmCadastro.PegarCDSConsultaGrade.FieldByName('NOME').AsString;
    AframeCadConta.TipoConta       := FdmCadastro.PegarCDSConsultaGrade.FieldByName('TIPOCONTA').AsString;
    AframeCadConta.IdMembroFamilia := FdmCadastro.PegarCDSConsultaGrade.FieldByName('ID_MEMBROFAMILIA').AsInteger;

    AframeCadConta.GerarSQLFrame;
    AframeCadConta.MontarLista;

    FFramesList.Add(FdmCadastro.PegarCDSConsultaGrade.RecNo, AframeCadConta);

    FdmCadastro.PegarCDSConsultaGrade.Next;
  end;

  Result := (FdmCadastro.PegarCDSConsultaGrade.RecordCount > 0);
end;

procedure TformCadConta.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadConta);
end;

initialization
  System.Classes.RegisterClass(TformCadConta);

finalization
  System.Classes.UnRegisterClass(TformCadConta);

end.
