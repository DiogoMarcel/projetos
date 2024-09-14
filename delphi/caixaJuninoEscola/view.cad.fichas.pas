unit view.cad.fichas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cad.padrao, Vcl.ExtCtrls, data.geral,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfCadFichas = class(TfCadPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadFichas: TfCadFichas;

implementation

{$R *.dfm}

end.
