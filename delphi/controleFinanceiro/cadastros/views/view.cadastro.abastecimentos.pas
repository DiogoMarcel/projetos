unit view.cadastro.abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cadastro.template, Data.DB, data.cadastro.abastecimentos,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCtrls,
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
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    ekmcarro: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    equantidadelitros: TDBEdit;
  private
    { Private declarations }
  protected
    procedure SetIControllerCadastros; override;
    function ExecutarBeforePostNaView: boolean; override;
  public
    { Public declarations }
  end;

implementation

uses
  controller.cadastro,
  consts.nomeCadastros;

{$R *.dfm}

{ TformCadAbastecimentos }

function TformCadAbastecimentos.ExecutarBeforePostNaView: boolean;
begin
  Result := True;
  FdmCadastro.PegarCDSCadastro.FieldByName('dataabastecimento').AsDateTime := DateTimePicker1.DateTime;
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
