unit model.cadastro.tags;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroTags = class abstract (TModelCadAbstractTofolo)
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
  classes.template.tags;

var
  FCadastroTags: iCadastros;

{ TCadastroTags }

class function TCadastroTags.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroTags) then
    FCadastroTags := Self.Create;

  Result := FCadastroTags;
end;

function TCadastroTags.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_TAGS));
end;

function TCadastroTags.PegarNodeCadastro: string;
begin
  Result := '/tags';
end;

function TCadastroTags.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.Tags;
end;

function TCadastroTags.PegarTClassCadastro: TClass;
begin
  Result := TTags;
end;

procedure TCadastroTags.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Tags');
end;

end.

