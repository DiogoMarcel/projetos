unit view.cadastro.credor;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.cadastro.credor,
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
  Datasnap.Provider,
  view.cadastro.conta;
{$ENDREGION}

type
  TformCadCredor = class(TformCadastroTemplate)
    tIdCredor: TDBText;
    lIdCredor: TLabel;
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

{ TformCadCredor }

procedure TformCadCredor.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadCredor);
end;

initialization
  RegisterClass(TformCadCredor);

finalization
  UnRegisterClass(TformCadCredor);

end.
