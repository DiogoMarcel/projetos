unit view.cadastro.saldofgts;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.cadastro.saldofgts,
  view.cadastro.template,
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
  Datasnap.Provider;
{$ENDREGION}

type
  TformCadSaldoFGTS = class(TformCadastroTemplate)
    tIdSaldoFGTS: TDBText;
    lIdSaldoFGTS: TLabel;
    lNroPIS: TLabel;
    eNroPIS: TDBEdit;
    lSaldo: TLabel;
    eSaldo: TDBEdit;
    lSenha: TLabel;
    eSenha: TDBEdit;
    lId_MembroFamilia: TLabel;
    lcbId_MembroFamilia: TDBLookupComboBox;
  private
    { Private declarations }

  protected
    procedure SetIControllerCadastros;           override;
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

{ TformCadSaldoFGTS }

procedure TformCadSaldoFGTS.AbrirConsultasLookup;
var
  AdmMembroFamilia: idataCadastroTemplate;
begin
  inherited AbrirConsultasLookup;

  AdmMembroFamilia := TdataCadastroFactory.New.GerarDataCadastro(cadMembroFamilia);

  lcbId_MembroFamilia.ListSource := AdmMembroFamilia.PegarDSCadastro;

  AdmMembroFamilia.PegarQCadastro.SQL.Clear;
  AdmMembroFamilia.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupMembroFamilia)
        .PegarSQL
  );

  AdmMembroFamilia.PegarCDSCadastro.Active  := True;
end;

procedure TformCadSaldoFGTS.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadSaldoFGTS);
end;

initialization
  RegisterClass(TformCadSaldoFGTS);

finalization
  UnRegisterClass(TformCadSaldoFGTS);

end.
