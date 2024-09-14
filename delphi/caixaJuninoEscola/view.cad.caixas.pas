unit view.cad.caixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cad.padrao, Data.DB, data.geral,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList;

type
  TfCadCaixas = class(TfCadPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadCaixas: TfCadCaixas;

implementation

{$R *.dfm}

end.
