unit view.geral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList;

type
  TformTemplate = class(TForm)
    pGeral: TPanel;
    aListaAcoes: TActionList;
    aSair: TAction;
    procedure FormCreate(Sender: TObject);
    procedure aSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  consts.styles;

{$R *.dfm}

procedure TformTemplate.aSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TformTemplate.FormCreate(Sender: TObject);
begin
  pGeral.Color := COLOR_PAGES_GERAL;
end;

end.
