unit lib.login.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.geral, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TfLoginView = class(TformTemplate)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    eSenha: TEdit;
    eUsuario: TEdit;
    Button2: TButton;
    eBanco: TComboBox;
    procedure pGeralMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FValidou: boolean;
    FCancelou: boolean;

  public

    property Validou: boolean read FValidou;
    property Cancelou: boolean read FCancelou;

    class function ConectarAoSistema: boolean;

  end;

implementation

uses
  lib.view.splash,
  controller.lib;

{$R *.dfm}

{ TfLoginView }

procedure TfLoginView.Button1Click(Sender: TObject);
begin
  inherited;
  FValidou := String(eUsuario.Text).ToLower.Equals('diogo') and
              String(eSenha.Text).ToLower.Equals('');
  Close;
end;

procedure TfLoginView.Button2Click(Sender: TObject);
begin
  inherited;
  FCancelou := True;
  Close;
end;

class function TfLoginView.ConectarAoSistema: boolean;
var
  AContador: integer;
  AFormLogin: TfLoginView;
begin
  Result := False;

  AFormLogin := TfLoginView.Create(Application);
  try
    AContador := 0;
    while AContador < 3 do
    begin
      {$IFDEF DEBUG}
        Result := True;
      {$ELSE}
        AFormLogin.ShowModal;
        Result := AFormLogin.Validou;
      {$ENDIF}

      if Result then
      begin
        TControllerLibrary.New.Conexao.StartConexao;
        Break;
      end
      else if AFormLogin.Cancelou then
        Break;

      AContador := AContador +1;
    end;
  finally
    FreeAndNil(AFormLogin);
  end;

  TformSplash.ExibirSplash;

end;

procedure TfLoginView.FormCreate(Sender: TObject);
begin
  inherited;
  FValidou := False;
  FCancelou := False;
end;

procedure TfLoginView.pGeralMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MoveWindowFromButton(Button);
end;

end.
