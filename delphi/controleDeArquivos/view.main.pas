unit view.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TviewMain = class(TForm)
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewMain: TviewMain;

implementation

uses
  view.cadastro.versoes;

{$R *.dfm}

procedure TviewMain.Button1Click(Sender: TObject);
var
  viewCadastroVersoes: TviewCadastroVersoes;
begin
  viewCadastroVersoes := TviewCadastroVersoes.Create(Application);
  try
    viewCadastroVersoes.ShowModal;
  finally
    FreeAndNil(viewCadastroVersoes);
  end;
end;

procedure TviewMain.SpeedButton1Click(Sender: TObject);
const
  SELDIRHELP = 1000;
//var
//  Diretorio: string;
begin
//  if not string(eDiretorio.Text).IsEmpty then
//    Diretorio := eDiretorio.Text
//  else
//    Diretorio := TDiretorioEArquivos.New.DiretorioExecutavel;
//
//  if FileCtrl.SelectDirectory(Diretorio, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
//  begin
//    TStringField(eDiretorio.DataField).AsString := Diretorio;
//  end;
end;

end.
