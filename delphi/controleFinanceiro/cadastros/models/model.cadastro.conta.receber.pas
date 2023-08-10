unit model.cadastro.conta.receber;

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
  TCadastroContaReceber = class abstract (TCadastroConta)
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
  FCadastroContaReceber: iCadastros;

{ TCadastroContaReceber }

function TCadastroContaReceber.ModelBeforePost: boolean;
begin
  Result := inherited ModelBeforePost;

  if (PegarCDSCadastro.State = dsInsert) then
  begin
    PegarCDSCadastro.FieldByName('tipoconta').AsString := 'R';
  end;
end;

class function TCadastroContaReceber.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroContaReceber) then
    FCadastroContaReceber := Self.Create;

  Result := FCadastroContaReceber;
end;

procedure TCadastroContaReceber.AtualizarParamsQueryGrade;
begin
  inherited;
  PegarQConsultaGrade.SetParamString('pTipoConta', 'R');
end;

procedure TCadastroContaReceber.AtualizarParamsQueryLista;
begin
  inherited;
  PegarQCadastro.SetParamString('pTipoConta', 'R');
end;

function TCadastroContaReceber.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_CONTA_RECEBER));
end;

procedure TCadastroContaReceber.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Contas Receber');
end;

end.
