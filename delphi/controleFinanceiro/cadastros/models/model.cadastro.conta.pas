unit model.cadastro.conta;

interface

uses
  Vcl.Forms,
  consts.SQLs,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroConta = class abstract (TModelCadAbstractTofolo)
  protected
    procedure SetTituloTela(_AProcTitulo: TTituloCadastro); override;
    function PegarFormCadastro: TFormClass; override;
    function PegarTClassCadastro: TClass; override;
    function PegarObjectToJson: TObject; override;
    function PegarNodeCadastro: string; override;
    function PegarSQLWhereCadastro: string; override;
    function PegarEnumSQLGrade: TSQLEnum; override;

  public
    class function ObterInstancia: iCadastros; override;

  end;

implementation

uses
  consts.views.forms,
  classes.template.unified,
  classes.template.conta;

var
  FCadastroConta: iCadastros;

{ TCadastroConta }

function TCadastroConta.PegarEnumSQLGrade: TSQLEnum;
begin
  Result := sqlConsultaGradeConta;
end;

class function TCadastroConta.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroConta) then
    FCadastroConta := Self.Create;

  Result := FCadastroConta;
end;

function TCadastroConta.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_CONTA));
end;

function TCadastroConta.PegarNodeCadastro: string;
begin
  Result := '/conta';
end;

function TCadastroConta.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.Conta;
end;

function TCadastroConta.PegarSQLWhereCadastro: string;
begin
  Result := ' WHERE TIPOCONTA = :pTipoConta ';
end;

function TCadastroConta.PegarTClassCadastro: TClass;
begin
  Result := TConta;
end;

procedure TCadastroConta.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Conta');
end;

end.

