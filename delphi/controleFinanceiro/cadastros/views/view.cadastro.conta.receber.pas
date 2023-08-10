unit view.cadastro.conta.receber;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  view.cadastro.template,
  data.cadastro.conta.receber,
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
  view.cadastro.conta,
  DBRadioGroupSimNao, frame.cadastro.conta.imgs;
{$ENDREGION}

type
  TformCadContaReceber = class(TformCadConta)
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

{ TformCadContaReceber }

procedure TformCadContaReceber.SetIControllerCadastros;
begin
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadContaReceber);
end;

initialization
  RegisterClass(TformCadContaReceber);

finalization
  UnRegisterClass(TformCadContaReceber);

end.
