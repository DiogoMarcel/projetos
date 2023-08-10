unit model.cadastro.saldofgts;

interface

uses
  Vcl.Forms,
  System.Classes,
  lib.proc.objects,
  model.cadastro.abstract,
  model.cadastro.interfaces;

type
  TCadastroSaldoFGTS = class abstract (TModelCadAbstractTofolo)
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
  classes.template.saldofgts;

var
  FCadastroSaldoFGTS: iCadastros;

{ TCadastroCredor }

class function TCadastroSaldoFGTS.ObterInstancia: iCadastros;
begin
  if not Assigned(FCadastroSaldoFGTS) then
    FCadastroSaldoFGTS := Self.Create;

  Result := FCadastroSaldoFGTS;
end;

function TCadastroSaldoFGTS.PegarFormCadastro: TFormClass;
begin
  Result := TFormClass(FindClass(NOME_CADASTRO_SALDOFGTS));
end;

function TCadastroSaldoFGTS.PegarNodeCadastro: string;
begin
  Result := '/saldofgts';
end;

function TCadastroSaldoFGTS.PegarObjectToJson: TObject;
begin
  Result := TUnifiedClasses.ObterInstancia.SaldoFGTS;
end;

function TCadastroSaldoFGTS.PegarTClassCadastro: TClass;
begin
  Result := TSaldoFGTS;
end;

procedure TCadastroSaldoFGTS.SetTituloTela(_AProcTitulo: TTituloCadastro);
begin
  _AProcTitulo('Saldo FGTS');
end;

end.
