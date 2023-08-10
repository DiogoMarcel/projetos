unit data.images;

interface

uses
  Graphics,
  Vcl.Buttons,
  System.SysUtils,
  System.Classes,
  System.ImageList,
  Vcl.Forms,
  Vcl.ImgList,
  Vcl.Controls;

type
  eDataImage32 = (diRelatorios
                 ,diOpcaoSair
                 ,diCadastros);

type
  TdataImages = class(TDataModule)
    list32: TImageList;
  private
    { Private declarations }
  public
    class procedure PegarImageBtnParaSpeedButton(_Imagem: eDataImage32; _Button: TSpeedButton);

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

class procedure TdataImages.PegarImageBtnParaSpeedButton(_Imagem: eDataImage32; _Button: TSpeedButton);
var
  ABitmap: TBitmap;
  ADataImages: TdataImages;
begin
  ADataImages := TdataImages.Create(Application);
  ABitmap := TBitmap.Create;
  try
    ADataImages.list32.GetBitmap(Ord(_Imagem), ABitmap);

    _Button.Glyph := ABitmap;
  finally
    FreeAndNil(ADataImages);
    FreeAndNil(ABitmap);
  end;
end;

end.
