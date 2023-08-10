unit view.cadastro.conta.pagar;

interface

{$REGION 'usesInterface'}
uses
  Data.DB,
  data.cadastro.conta.pagar,
  view.cadastro.template,
  System.StrUtils,
  System.Classes,
  System.Actions,
  FireDAC.Comp.Client,
  Vcl.Forms,
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
  TformCadContaPagar = class(TformCadConta)
  private
    { Private declarations }

  protected
    procedure SetIControllerCadastros;      override;

  public
    { Public declarations }
  end;

implementation

uses
  controller.cadastro,
  consts.nomeCadastros,
  System.SysUtils;

{$R *.dfm}

{ TformCadContaPagar }

procedure TformCadContaPagar.SetIControllerCadastros;
begin
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadContaPagar);
end;

initialization
  RegisterClass(TformCadContaPagar);

finalization
  UnRegisterClass(TformCadContaPagar);

end.

