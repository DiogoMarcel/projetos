unit view.cadastro.abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cadastro.template, Data.DB, data.cadastro.abastecimentos,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCtrls, data.cadastro.veiculos,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls;

type
  TformCadAbastecimentos = class(TformCadastroTemplate)
    tidabastecimento: TDBText;
    lIdSaldoPortador: TLabel;
    lValor: TLabel;
    etotalabastecimento: TDBEdit;
    eObservacao: TDBEdit;
    Label1: TLabel;
    dtpDataAbastecimento: TDateTimePicker;
    Label3: TLabel;
    ekmcarro: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    equantidadelitros: TDBEdit;
    lcbId_Veiculo: TDBLookupComboBox;
    lId_Veiculo: TLabel;
  private
    { Private declarations }
  protected
    procedure SetIControllerCadastros; override;
    function ExecutarBeforePostNaView: boolean; override;
    procedure AjustarCombosSemConexao; override;
    procedure AbrirConsultasLookup; override;
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

{ TformCadAbastecimentos }

procedure TformCadAbastecimentos.AbrirConsultasLookup;
var
  AdmVeiculos: idataCadastroTemplate;
begin
  inherited AbrirConsultasLookup;

  AdmVeiculos := TdataCadastroFactory.New.GerarDataCadastro(cadVeiculos);

  lcbId_Veiculo.ListSource := AdmVeiculos.PegarDSCadastro;

  AdmVeiculos.PegarQCadastro.SQL.Clear;
  AdmVeiculos.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupVeiculo)
        .PegarSQL
  );

  AdmVeiculos.PegarCDSCadastro.Active  := True;
end;

procedure TformCadAbastecimentos.AjustarCombosSemConexao;
begin
  inherited;
  dtpDataAbastecimento.DateTime := Now();
  if (FdmCadastro.PegarCDSCadastro.State in [dsEdit]) then
    dtpDataAbastecimento.DateTime := FdmCadastro.PegarCDSCadastro.FieldByName('dataabastecimento').AsDateTime;
end;

function TformCadAbastecimentos.ExecutarBeforePostNaView: boolean;
begin
  Result := True;
  FdmCadastro.PegarCDSCadastro.FieldByName('dataabastecimento').AsDateTime := dtpDataAbastecimento.DateTime;
end;

procedure TformCadAbastecimentos.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadAbastecimentos);
end;

initialization
  RegisterClass(TformCadAbastecimentos);

finalization
  UnRegisterClass(TformCadAbastecimentos);

end.
