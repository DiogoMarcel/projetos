unit view.cadastro.despesacartao;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.cadastro.despesacartao,
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
  TformCadDespesaCartao = class(TformCadastroTemplate)
    tIdDespesaCartao: TDBText;
    lIdDespesaCartao: TLabel;
    lDescricao: TLabel;
    eDescricao: TDBEdit;
    lValor: TLabel;
    eValor: TDBEdit;
    eDataDespesa: TDBEdit;
    lDataDespesa: TLabel;
    lId_Cartao: TLabel;
    lcbId_Cartao: TDBLookupComboBox;
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

{ TformCadDespesaCartao }

procedure TformCadDespesaCartao.AbrirConsultasLookup;
var
  AdmCartao: idataCadastroTemplate;
begin
  inherited AbrirConsultasLookup;

  AdmCartao := TdataCadastroFactory.New.GerarDataCadastro(cadCartao);

  lcbId_Cartao.ListSource  := AdmCartao.PegarDSCadastro;

  AdmCartao.PegarQCadastro.SQL.Clear;
  AdmCartao.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupCartao)
        .PegarSQL
  );

  AdmCartao.PegarCDSCadastro.Active  := True;
end;

procedure TformCadDespesaCartao.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadDespesaCartao);
end;

initialization
  RegisterClass(TformCadDespesaCartao);

finalization
  UnRegisterClass(TformCadDespesaCartao);

end.
