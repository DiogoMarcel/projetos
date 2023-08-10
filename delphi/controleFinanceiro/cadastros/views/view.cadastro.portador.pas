unit view.cadastro.portador;

interface

{$REGION 'usesInterface'}
uses
  Vcl.Forms,
  data.cadastro.portador,
  view.cadastro.template,
  Data.DB,
  System.Classes,
  System.Actions,
  FireDAC.Comp.Client,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.DBCGrids,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Controls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.WinXPanels,
  Datasnap.DBClient,
  Datasnap.Provider,
  DBRadioGroupSimNao;
{$ENDREGION}

type
  TformCadPortador = class(TformCadastroTemplate)
    tIdPortador: TDBText;
    lIdPortador: TLabel;
    lNomePortador: TLabel;
    eNomePortador: TDBEdit;
    rgTipoConta: TDBRadioGroupSimNao;
    eAgencia: TDBEdit;
    lAgencia: TLabel;
    eNumeroConta: TDBEdit;
    lNumeroConta: TLabel;
    eDigitoConta: TDBEdit;
    lDigitoConta: TLabel;
    lId_MembroFamilia: TLabel;
    lcbId_MembroFamilia: TDBLookupComboBox;
    iLogos: TImage;
    lImgPortador: TLabel;
    cbImgPortador: TComboBox;
    procedure cbImgPortadorChange(Sender: TObject);
  private
    procedure CarregarImagemPortador;

  protected
    procedure SetIControllerCadastros;      override;
    procedure AbrirConsultasLookup;         override;
    procedure ConfigurarTela;               override;
    procedure AjustarCombosSemConexao;      override;
    function ExecutarBeforePostNaView: boolean; override;

  public
    { Public declarations }
  end;

implementation

uses
  data.images,
  data.images.interfaces,
  data.cadastro.template.interfaces,
  data.cadastro.template.factory,
  Vcl.VirtualImageList,
  lib.sql.lookup,
  consts.SQLs,
  System.SysUtils,
  controller.cadastro,
  consts.imagens,
  consts.nomeCadastros;

{$R *.dfm}

{ TformCadPortador }

procedure TformCadPortador.AbrirConsultasLookup;
var
  AdmMembroFamilia: idataCadastroTemplate;
begin
  inherited AbrirConsultasLookup;

  AdmMembroFamilia := TdataCadastroFactory.New.GerarDataCadastro(cadMembroFamilia);

  lcbId_MembroFamilia.ListSource  := AdmMembroFamilia.PegarDSCadastro;

  AdmMembroFamilia.PegarQCadastro.SQL.Clear;
  AdmMembroFamilia.PegarQCadastro.SQL.Add(
    TSQLLookup.New
      .SetEnumSQL(sqlLookupMembroFamilia)
        .PegarSQL
  );

  AdmMembroFamilia.PegarCDSCadastro.Active  := True;
end;

procedure TformCadPortador.cbImgPortadorChange(Sender: TObject);
begin
  inherited;
  CarregarImagemPortador;
end;

procedure TformCadPortador.ConfigurarTela;
var
  I: integer;
  ADataImagens: IDataImagens;
  AVirtualImageList: TVirtualImageList;
begin
  inherited;
  ADataImagens := TdataImages.ObterInstanciaDataImagens;
  AVirtualImageList := ADataImagens.PegarImageList(qiv54);

  cbImgPortador.Items.Clear;
  for I := 0 to AVirtualImageList.Images.Count -1 do
  begin
    cbImgPortador.Items.Add(
      I.ToString +' - '+
      AVirtualImageList.Images[i].Name.Substring(
        AVirtualImageList.Images[i].Name.IndexOf(ADataImagens.PegarNomesListas(qiv54)) +8, {8 = ci54Logo}
        AVirtualImageList.Images[i].Name.Length
      )
    );
  end;
end;

function TformCadPortador.ExecutarBeforePostNaView: boolean;
begin
  Result := True;
  FdmCadastro.PegarCDSCadastro.FieldByName('ImgPortador').AsInteger := cbImgPortador.ItemIndex;
end;

procedure TformCadPortador.AjustarCombosSemConexao;
begin
  inherited;
  cbImgPortador.Text := EmptyStr;
  cbImgPortador.ItemIndex := -1;
  if (FdmCadastro.PegarCDSCadastro.RecordCount > 0) then
  begin
    cbImgPortador.ItemIndex := FdmCadastro.PegarCDSCadastro.FieldByName('ImgPortador').AsInteger;
    CarregarImagemPortador;
  end;
end;

procedure TformCadPortador.CarregarImagemPortador;
begin
  iLogos.Picture.Assign(nil);

  TdataImages.ObterInstanciaDataImagens
    .PegarImageList(qiv54)
      .GetBitmap(
        cbImgPortador.ItemIndex,
        iLogos.Picture.Bitmap
      );
end;

procedure TformCadPortador.SetIControllerCadastros;
begin
  inherited;
  ControllerCadastros := TControllerCadastro.New.TypeCadastro(cadPortador);
end;

initialization
  RegisterClass(TformCadPortador);

finalization
  UnRegisterClass(TformCadPortador);

end.
