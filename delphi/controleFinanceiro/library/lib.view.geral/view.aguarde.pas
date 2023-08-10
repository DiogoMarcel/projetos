unit view.aguarde;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Imaging.GIFImg,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.Controls,
  Vcl.StdCtrls,
  System.SysUtils,
  System.Classes,
  Vcl.WinXCtrls;

type
  TformLibAguarde = class(TForm)
    pAguarde: TPanel;
    lMensagem: TLabel;
    lTitulo: TLabel;
    imGif: TImage;
    aiGiroteia: TActivityIndicator;
    procedure lTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }

  public
    procedure ExibirAguarde(_AMensagem: string);
    procedure EncerraAguarde;

    class function New(_AOwner: TComponent): TformLibAguarde;

  end;

implementation

{$R *.dfm}

{ TformLibAguarde }

procedure TformLibAguarde.EncerraAguarde;
begin
  Self.Hide;
end;

procedure TformLibAguarde.ExibirAguarde(_AMensagem: string);
begin

  aiGiroteia.Animate := True;

  (imGif.Picture.Graphic as TGIFImage).Animate := True;

  if _AMensagem.IsEmpty then
    _AMensagem := 'Carregando dados...';

  lMensagem.Caption := _AMensagem;

  Self.Show;
  Self.Update;
end;

procedure TformLibAguarde.lTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  inherited;
  if Button = mbleft then
  begin
    ReleaseCapture;

    Self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

class function TformLibAguarde.New(_AOwner: TComponent): TformLibAguarde;
begin
  Result := Self.Create(_AOwner);
end;

initialization
  RegisterClass(TformLibAguarde);

finalization
  UnRegisterClass(TformLibAguarde);

end.

