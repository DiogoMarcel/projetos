unit view.cad.padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.Geral,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.Actions,
  Vcl.ActnList;

type
  TfCadPadrao = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ActionList1: TActionList;
    aSair: TAction;
    procedure aSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfCadPadrao.aSairExecute(Sender: TObject);
begin
  Self.Close;
end;

end.
