unit model.cadastro.portador;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroPortador = class abstract (TModelCadAbstractTofolo)
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
  consts.views.forms,
  classes.template.unified,
  classes.template.portador;

var
  FCadastroPortador: iCadastros;

{ TCadastroPortador }

function TCadastroPortador.ModelBeforePost: boolean;
begin
  Result := inherited ModelBeforePost;

  if (PegarCDSCadastro.FieldByName('TIPOCONTA').IsNull) then
    PegarCDSCadastro.FieldByName('TIPOCONTA').AsString := 'D';
end;

class function TCadastroPortador.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroPortador) then
    FCadastroPortador := Self.Create;

  Result := FCadastroPortador;
end;

function TCadastroPortador.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_PORTADOR));
end;

function TCadastroPortador.PegarNodeCadastro: string;
begin
  Result := '/portadores';
end;

function TCadastroPortador.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.Portadores;
end;

function TCadastroPortador.PegarTClassCadastro: TClass;
begin
  Result := TPortador;
end;

procedure TCadastroPortador.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Portador');
end;

end.

