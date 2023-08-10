unit view.geral;

interface

uses
  Winapi.Messages,
  Winapi.Windows,
  System.Classes,
  System.Actions,
  Vcl.Forms,
  Vcl.ActnList,
  Vcl.Controls,
  Vcl.ExtCtrls;

type
  TformTemplate = class(TForm)
    pGeral: TPanel;
    alAcoes: TActionList;
    aSair: TAction;
    procedure FormCreate(Sender: TObject);
    procedure aSairExecute(Sender: TObject);
  private

  protected
    procedure MoveWindowFromButton(_Button: TMouseButton);

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

procedure TformTemplate.MoveWindowFromButton(_Button: TMouseButton);
const
  SC_DRAGMOVE = $F012;
begin
  inherited;
  if _Button = mbleft then
  begin
    ReleaseCapture;

    Self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

end.

