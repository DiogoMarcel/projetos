unit view.cadastro.tags;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.cadastro.tags,
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
  TformCadTags = class(TformCadastroTemplate)
    tIdTags: TDBText;
    lIdTags: TLabel;
    lDescricao: TLabel;
    eDescricao: TDBEdit;
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

{ TformCadTags }

procedure TformCadTags.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadTags);
end;

initialization
  RegisterClass(TformCadTags);

finalization
  UnRegisterClass(TformCadTags);

end.
