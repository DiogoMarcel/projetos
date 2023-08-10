unit consts.styles;

interface

uses
  Vcl.Graphics;

type
  RColorRGBConst = record
    ColorR, ColorG, ColorB: integer;
  end;

const
  COLOR_PAGES_GERAL           = clWindow;
  COLOR_MENU_CADASTROS        : RColorRGBConst = (ColorR: 128; ColorG: 191; ColorB: 255);
  COLOR_PANEL_CABECALHO_MENU  : RColorRGBConst = (ColorR: 128; ColorG: 191; ColorB: 255);

implementation

end.
