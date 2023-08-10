unit model.cadastro.saldoportador;

interface

uses
  Vcl.Forms,
  consts.SQLs,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroSaldoPortador = class abstract (TModelCadAbstractTofolo)
  protected
    procedure SetTituloTela(_AProcTitulo: TTituloCadastro); override;
    function PegarFormCadastro: TFormClass; override;
    function PegarTClassCadastro: TClass; override;
    function PegarObjectToJson: TObject; override;
    function PegarNodeCadastro: string; override;
    function ModelBeforePost: boolean; override;
    function PegarEnumSQLGrade: TSQLEnum; override;

  public
    class function ObterInstancia: iCadastros; override;

  end;

implementation

uses
  System.SysUtils,
  System.DateUtils,
  consts.views.forms,
  classes.template.unified,
  classes.template.saldoportador;

var
  FCadastroSaldoPortador: iCadastros;

{ TCadastroCredor }

function TCadastroSaldoPortador.PegarEnumSQLGrade: TSQLEnum;
begin
  Result := sqlConsultaGradeSaldoPortador;
end;

function TCadastroSaldoPortador.ModelBeforePost: boolean;
begin
  Result := inherited ModelBeforePost;

  PegarCDSCadastro.FieldByName('DATAINCLUSAO').AsDateTime := Now();
end;

class function TCadastroSaldoPortador.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroSaldoPortador) then
    FCadastroSaldoPortador := Self.Create;

  Result := FCadastroSaldoPortador;
end;

function TCadastroSaldoPortador.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_SALDOPORTADOR));
end;

function TCadastroSaldoPortador.PegarNodeCadastro: string;
begin
  Result := '/saldoportador';
end;

function TCadastroSaldoPortador.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.SaldoPortador;
end;

function TCadastroSaldoPortador.PegarTClassCadastro: TClass;
begin
  Result := TSaldoPortador;
end;

procedure TCadastroSaldoPortador.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Saldo Portador');
end;

end.

