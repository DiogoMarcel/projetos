unit view.cadastro.membrofamilia;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.cadastro.membrofamilia,
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
  TformCadMembroFamilia = class(TformCadastroTemplate)
    tIdMembroFamilia: TDBText;
    lIdMembroFamilia: TLabel;
    lNome: TLabel;
    eNome: TDBEdit;
  private
    { Private declarations }

  protected
    procedure SetIControllerCadastros;           override;

  public
    { Public declarations }
  end;

implementation

uses
  controller.cadastro,
  consts.nomeCadastros;

{$R *.dfm}

{ TformCadMembroFamilia }

procedure TformCadMembroFamilia.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadMembroFamilia);
end;

initialization
  RegisterClass(TformCadMembroFamilia);

finalization
  UnRegisterClass(TformCadMembroFamilia);

end.
