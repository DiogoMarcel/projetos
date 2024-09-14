unit view.cad.retiradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cad.padrao, Data.DB, data.geral,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfCadRetiradas = class(TfCadPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadRetiradas: TfCadRetiradas;

implementation

{$R *.dfm}

end.
