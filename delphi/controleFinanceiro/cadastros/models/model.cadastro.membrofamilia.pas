unit model.cadastro.membrofamilia;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroMembroFamilia = class abstract (TModelCadAbstractTofolo)
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
  classes.template.membrofamilia;

var
  FCadastroMembroFamilia: iCadastros;

{ TCadastroMembroFamilia }

class function TCadastroMembroFamilia.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroMembroFamilia) then
    FCadastroMembroFamilia := Self.Create;

  Result := FCadastroMembroFamilia;
end;

function TCadastroMembroFamilia.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_MEMBROFAMILIA));
end;

function TCadastroMembroFamilia.PegarNodeCadastro: string;
begin
  Result := '/membrofamilia';
end;

function TCadastroMembroFamilia.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.MembrosFamilia;
end;

function TCadastroMembroFamilia.PegarTClassCadastro: TClass;
begin
  Result := TMembroFamilia;
end;

procedure TCadastroMembroFamilia.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Membro Família');
end;

end.

