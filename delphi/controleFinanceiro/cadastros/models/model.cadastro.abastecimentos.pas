unit model.cadastro.abastecimentos;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroAbastecimentos = class abstract (TModelCadAbstractTofolo)
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
  classes.template.abastecimentos;

var
  FCadastroAbastecimentos: iCadastros;

{ TCadastroTags }

class function TCadastroAbastecimentos.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroAbastecimentos) then
    FCadastroAbastecimentos := Self.Create;

  Result := FCadastroAbastecimentos;
end;

function TCadastroAbastecimentos.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_ABASTECIMENTOS));
end;

function TCadastroAbastecimentos.PegarNodeCadastro: string;
begin
  Result := '/abastecimentos';
end;

function TCadastroAbastecimentos.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.Abastecimentos;
end;

function TCadastroAbastecimentos.PegarTClassCadastro: TClass;
begin
  Result := TAbastecimentos;
end;

procedure TCadastroAbastecimentos.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Abastecimentos');
end;

end.

