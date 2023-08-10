unit model.cadastro.credor;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroCredor = class abstract (TModelCadAbstractTofolo)
  protected
    procedure SetTituloTela(_AProcTitulo: TTituloCadastro); override;
    function PegarFormCadastro: TFormClass; override;
    function PegarTClassCadastro: TClass; override;
    function PegarObjectToJson: TObject; override;
    function PegarNodeCadastro: string; override;

  public
    class function ObterInstancia: iCadastros; override;

  end;

implementation

uses
  consts.views.forms,
  classes.template.unified,
  classes.template.credor;

var
  FCadastroCredor: iCadastros;

{ TCadastroCredor }

class function TCadastroCredor.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroCredor) then
    FCadastroCredor := Self.Create;

  Result := FCadastroCredor;
end;

function TCadastroCredor.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_CREDOR));
end;

function TCadastroCredor.PegarNodeCadastro: string;
begin
  Result := '/credor';
end;

function TCadastroCredor.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.Credor;
end;

function TCadastroCredor.PegarTClassCadastro: TClass;
begin
  Result := TCredor;
end;

procedure TCadastroCredor.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Credor');
end;

end.
