unit view.cadastro.cartao;

interface

{$REGION 'usesInterface'}
uses
  view.cadastro.template,
  data.cadastro.cartao,
  Data.DB,
  System.SysUtils,
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
  Datasnap.Provider;
{$ENDREGION}

type
  TformCadCartao = class(TformCadastroTemplate)
    tIdCartao: TDBText;
    lidConta: TLabel;
    lNome: TLabel;
    eNome: TDBEdit;
    lDiaVencimento: TLabel;
    eDiaVencimento: TDBEdit;
    lBandeira: TLabel;
    eBandeira: TDBEdit;
    lId_MembroFamilia: TLabel;
    lcbId_MembroFamilia: TDBLookupComboBox;
    procedure eDiaVencimentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  protected
    procedure SetIControllerCadastros;      override;
    procedure AbrirConsultasLookup;         override;

  public
    { Public declarations }
  end;

implementation

uses
  lib.sql.lookup,
  consts.SQLs,
  data.cadastro.template.interfaces,
  data.cadastro.template.factory,
  controller.cadastro,
  consts.nomeCadastros;

{$R *.dfm}

{ TformCadCartao }

procedure TformCadCartao.AbrirConsultasLookup;
var
  AdmMembroFamilia: idataCadastroTemplate;
begin
  inherited AbrirConsultasLookup;

  AdmMembroFamilia := TdataCadastroFactory.New.GerarDataCadastro(cadMembroFamilia);

  lcbId_MembroFamilia.ListSource  := AdmMembroFamilia.PegarDSCadastro;

  AdmMembroFamilia.PegarQCadastro.SQL.Clear;
  AdmMembroFamilia.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupMembroFamilia)
        .PegarSQL
  );

  AdmMembroFamilia.PegarCDSCadastro.Active  := True;
end;

procedure TformCadCartao.eDiaVencimentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((Ord(Key) < Ord('0')) or (Ord(Key) > Ord('9'))) and (Key <> FormatSettings.DecimalSeparator) then
  begin
    Key := Chr(0);
  end;
end;

procedure TformCadCartao.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadCartao);
end;

initialization
  RegisterClass(TformCadCartao);

finalization
  UnRegisterClass(TformCadCartao);

end.
