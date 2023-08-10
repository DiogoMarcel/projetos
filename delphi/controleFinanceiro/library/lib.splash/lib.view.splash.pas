unit lib.view.splash;

interface

uses
  lib.data.splash,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Imaging.GIFImg, Vcl.WinXCtrls,
  Vcl.StdCtrls;

type
  TformSplash = class(TformTemplate)
    iSplash: TImage;
    aiGiroteia: TActivityIndicator;
    lSplash: TLabel;
    lMensagens: TLabel;
    tSplash: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tSplashTimer(Sender: TObject);
  private
    FDataSplash: TdataSplash;

    procedure AtualizarMensagem(_AMensagem: string);
    procedure AtivarTimerAposExecutar;

  public
    class procedure ExibirSplash;
  end;

implementation

{$R *.dfm}

{ TformSplash }

procedure TformSplash.AtualizarMensagem(_AMensagem: string);
begin
  lMensagens.Caption := _AMensagem;
end;

class procedure TformSplash.ExibirSplash;
var
  formSplash: TformSplash;
begin
  formSplash := TformSplash.Create(Application);
  try
    formSplash.ShowModal;
  finally
    formSplash.Free;
  end;
end;

procedure TformSplash.tSplashTimer(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TformSplash.FormCreate(Sender: TObject);
begin
  inherited;
  FDataSplash := TdataSplash.Create(Application);
end;

procedure TformSplash.FormDestroy(Sender: TObject);
begin
  inherited;
  if (Assigned(FDataSplash)) then
    FreeAndNil(FDataSplash);
end;

procedure TformSplash.AtivarTimerAposExecutar;
begin
  tSplash.Enabled := True;
end;

procedure TformSplash.FormShow(Sender: TObject);
begin
  inherited;
  FDataSplash.ExecutarFuncoesIniciais(AtualizarMensagem);
  AtivarTimerAposExecutar;
end;

end.
