unit frame.aluguel.lancamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, data.aluguel.lancamento,
  Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, data.images,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TframeAluguelLancamento = class(TFrame)
    pAluguel: TPanel;
    pTotal: TPanel;
    lTotal: TLabel;
    dbtTotal: TDBText;
    gCorpo: TGridPanel;
    pDesconto: TPanel;
    lDescontos: TLabel;
    gAluguel: TGridPanel;
    lMesAno: TLabel;
    lValor: TLabel;
    dbtMesAno: TDBText;
    dbtValorAluguel: TDBText;
    pAluguelCabecalho: TPanel;
    lAluguel: TLabel;
    pCobranca: TPanel;
    lCobrancas: TLabel;
    gCobranca: TDBGrid;
    gDesconto: TDBGrid;
    pGestaoCobranca: TPanel;
    pGestaoDesconto: TPanel;
    iPago: TImage;
    iAguardando: TImage;
    iLetraC: TImage;
    iLetraO: TImage;
    iLetraM: TImage;
    iLetraP: TImage;
    sbIncluirCadastro: TSpeedButton;
    sbEditarCadastro: TSpeedButton;
    sbExcluirCadastro: TSpeedButton;
    sbExcluirDesconto: TSpeedButton;
    sbEditarDesconto: TSpeedButton;
    sbIncluirDesconto: TSpeedButton;

  private

  public
    procedure VisualizarImagens(_APago, _AAguardando, _AComp: boolean);

  end;

implementation

{$R *.dfm}

{ TframeAluguelLancamento }

procedure TframeAluguelLancamento.VisualizarImagens(_APago, _AAguardando, _AComp: boolean);
begin
  iPago.Visible       := _APago;
  iAguardando.Visible := _AAguardando;
  iLetraC.Visible     := _AComp;
  iLetraO.Visible     := _AComp;
  iLetraM.Visible     := _AComp;
  iLetraP.Visible     := _AComp;
end;

end.
