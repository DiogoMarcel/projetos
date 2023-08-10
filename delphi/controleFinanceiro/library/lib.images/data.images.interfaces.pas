unit data.images.interfaces;

interface

uses
  Vcl.Buttons,
  Vcl.Controls,
  consts.imagens,
  Vcl.VirtualImageList;

type
  IDataImagens = interface
    ['{2F46AC08-6699-432B-A10A-B218AE78A5B2}']

    function PegarImagem24(_AButton: TSpeedButton;
                           _AImgEnabled: TConstImagens24;
                           _AImgDisabled: TConstImagens24 = ci24nil): IDataImagens;
    function PegarImagem32(_AButton: TSpeedButton;
                           _AImgEnabled: TConstImagens32;
                           _AImgDisabled: TConstImagens32 = ci32nil): IDataImagens;
    function PegarImagem40(_AButton: TSpeedButton;
                           _AImgEnabled: TConstImagens40;
                           _AImgDisabled: TConstImagens40 = ci40nil): IDataImagens;

    function PegarImageList(_AQualImgList: EQualImgList): TImageList; overload;
    function PegarImageList(_AQualImgList: EQualImgListVirtual): TVirtualImageList; overload;

    function PegarNomesListas(_AQualImgList: EQualImgList): string; overload;
    function PegarNomesListas(_AQualImgList: EQualImgListVirtual): string; overload;
  end;

implementation

end.

