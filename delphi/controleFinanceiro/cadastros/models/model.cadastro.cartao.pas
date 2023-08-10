unit model.cadastro.cartao;

interface

uses
  Data.DB,
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroCartao = class abstract (TModelCadAbstractTofolo)
  private
    function ValidarDiaVencimento: boolean;
  protected
    procedure SetTituloTela(_AProcTitulo: TTituloCadastro); override;
    function PegarFormCadastro: TFormClass; override;
    function PegarTClassCadastro: TClass; override;
    function PegarObjectToJson: TObject; override;
    function PegarNodeCadastro: string; override;
    function ModelBeforePost: boolean; override;

  public
    class function ObterInstancia: iCadastros; override;

  end;

implementation

uses
  lib.messages,
  consts.views.forms,
  classes.template.unified,
  classes.template.cartao;

var
  FCadastroCartao: iCadastros;

{ TCadastroCredor }

function TCadastroCartao.ModelBeforePost: boolean;
begin
  Result := inherited ModelBeforePost;

  if not ValidarDiaVencimento then
    Exit(False);

end;

function TCadastroCartao.ValidarDiaVencimento: boolean;
begin
  Result := True;
  if (PegarCDSCadastro.FieldByName('DIAVENCIMENTO').AsInteger > 31) then
  begin
    TLibMessages.New.Warning('O dia de vencimento deve estar entre 01 e 31!');
    Result := False;
  end;
end;

class function TCadastroCartao.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroCartao) then
    FCadastroCartao := Self.Create;

  Result := FCadastroCartao;
end;

function TCadastroCartao.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_CARTAO));
end;

function TCadastroCartao.PegarNodeCadastro: string;
begin
  Result := '/cartao';
end;

function TCadastroCartao.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.Cartao;
end;

function TCadastroCartao.PegarTClassCadastro: TClass;
begin
  Result := TCartao;
end;

procedure TCadastroCartao.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Cartão');
end;

end.

