unit view.cadastro.veiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cadastro.template, Data.DB, data.cadastro.veiculos,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TformCadVeiculos = class(TformCadastroTemplate)
    tidVeiculo: TDBText;
    lIdSaldoPortador: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    eModelo: TDBEdit;
    dtpDataVenda: TDateTimePicker;
    eValorCompra: TDBEdit;
    lValor: TLabel;
    Label2: TLabel;
    eMarca: TDBEdit;
    Label4: TLabel;
    eCor: TDBEdit;
    Label5: TLabel;
    dtpDataCompra: TDateTimePicker;
    eValorVenda: TDBEdit;
    Label6: TLabel;
  private
    { Private declarations }

  protected
    procedure SetIControllerCadastros; override;
    function ExecutarBeforePostNaView: boolean; override;
    procedure AjustarCombosSemConexao; override;

  public
    { Public declarations }

  end;

implementation

uses
  controller.cadastro,
  consts.nomeCadastros;

{$R *.dfm}

{ TformCadVeiculos }

procedure TformCadVeiculos.AjustarCombosSemConexao;
begin
  inherited;
  dtpDataCompra.DateTime := Now();
  if (FdmCadastro.PegarCDSCadastro.State in [dsEdit]) then
    dtpDataCompra.DateTime := FdmCadastro.PegarCDSCadastro.FieldByName('datacompra').AsDateTime;

  dtpDataVenda.DateTime := Now();
  if (FdmCadastro.PegarCDSCadastro.State in [dsEdit]) then
    dtpDataVenda.DateTime := FdmCadastro.PegarCDSCadastro.FieldByName('datavenda').AsDateTime;
end;

function TformCadVeiculos.ExecutarBeforePostNaView: boolean;
begin
  Result := True;
  FdmCadastro.PegarCDSCadastro.FieldByName('datacompra').AsDateTime := dtpDataCompra.DateTime;
  FdmCadastro.PegarCDSCadastro.FieldByName('datavenda').AsDateTime := dtpDataVenda.DateTime;
end;

procedure TformCadVeiculos.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadVeiculos);
end;

initialization
  RegisterClass(TformCadVeiculos);

finalization
  UnRegisterClass(TformCadVeiculos);

end.
