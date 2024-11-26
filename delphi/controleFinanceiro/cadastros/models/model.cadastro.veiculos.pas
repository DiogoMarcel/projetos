unit model.cadastro.veiculos;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroVeiculos = class abstract (TModelCadAbstractTofolo)
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
  classes.template.veiculos;

var
  FCadastroVeiculos: iCadastros;

{ TCadastroVeiculos }

class function TCadastroVeiculos.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroVeiculos) then
    FCadastroVeiculos := Self.Create;

  Result := FCadastroVeiculos;
end;

function TCadastroVeiculos.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_VEICULOS));
end;

function TCadastroVeiculos.PegarNodeCadastro: string;
begin
  Result := '/veiculos';
end;

function TCadastroVeiculos.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.Veiculos;
end;

function TCadastroVeiculos.PegarTClassCadastro: TClass;
begin
  Result := TVeiculos;
end;

procedure TCadastroVeiculos.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Veículos');
end;

end.

