unit model.cadastro.despesacartao;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroDespesaCartao = class abstract (TModelCadAbstractTofolo)
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
  classes.template.despesacartao;

var
  FCadastroDespesaCartao: iCadastros;

{ TCadastroCredor }

class function TCadastroDespesaCartao.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroDespesaCartao) then
    FCadastroDespesaCartao := Self.Create;

  Result := FCadastroDespesaCartao;
end;

function TCadastroDespesaCartao.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_DESPESACARTAO));
end;

function TCadastroDespesaCartao.PegarNodeCadastro: string;
begin
  Result := '/despesacartao';
end;

function TCadastroDespesaCartao.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.DespesaCartao;
end;

function TCadastroDespesaCartao.PegarTClassCadastro: TClass;
begin
  Result := TDespesaCartao;
end;

procedure TCadastroDespesaCartao.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Despesa Cartão');
end;

end.

