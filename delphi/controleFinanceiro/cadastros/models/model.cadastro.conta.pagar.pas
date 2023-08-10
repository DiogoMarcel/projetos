unit model.cadastro.conta.pagar;

interface

uses
  Data.DB,
  Vcl.Forms,
  System.Classes,
  System.Variants,
  lib.proc.objects,
  model.cadastro.conta,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroContaPagar = class abstract (TCadastroConta)
  protected
    procedure SetTituloTela(_AProcTitulo: TTituloCadastro); override;
    function PegarFormCadastro: TFormClass; override;
    procedure AtualizarParamsQueryLista; override;
    procedure AtualizarParamsQueryGrade; override;
    function ModelBeforePost: boolean; override;

  public
    class function ObterInstancia: iCadastros; override;

  end;

implementation

uses
  lib.helper.querys,
  consts.views.forms;

var
  FCadastroContaPagar: iCadastros;

{ TCadastroContaPagar }

function TCadastroContaPagar.ModelBeforePost: boolean;
begin
  Result := inherited ModelBeforePost;

  if (PegarCDSCadastro.State = dsInsert) then
  begin
    PegarCDSCadastro.FieldByName('tipoconta').AsString := 'P';
  end;
end;

class function TCadastroContaPagar.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroContaPagar) then
    FCadastroContaPagar := Self.Create;

  Result := FCadastroContaPagar;
end;

procedure TCadastroContaPagar.AtualizarParamsQueryGrade;
begin
  inherited;
  PegarQConsultaGrade.SetParamString('pTipoConta', 'P');
end;

procedure TCadastroContaPagar.AtualizarParamsQueryLista;
begin
  inherited;
  PegarQCadastro.SetParamString('pTipoConta', 'P');
end;

function TCadastroContaPagar.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_CONTA_PAGAR));
end;

procedure TCadastroContaPagar.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Contas Pagar');
end;

end.
