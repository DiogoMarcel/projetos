unit frame.cadastro.conta.imgs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TframeCadContaImagens = class(TFrame)
    iPagamentoManual: TImage;
    iFolhaPagamento: TImage;
    iDebitoAuto: TImage;
    iDebidaCartao: TImage;
    iCalender: TImage;
    lDebitoAuto: TLabel;
    lCalender: TLabel;
    lPagamentoManual: TLabel;
    lFolhaPagamento: TLabel;
    liDebidaCartao: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
