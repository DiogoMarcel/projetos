unit model.cadastro.factory;

interface

uses
  model.cadastro.interfaces,
  consts.nomeCadastros;

type
  TModelCadastroFactory = class(TInterfacedObject, iCadastrosFactory)
  private
    function GerarCadastro(_TypeCadastro: TTypeCadastros): iCadastros;

  public
    class function New: iCadastrosFactory;

  end;

implementation

uses
  System.SysUtils,
  model.cadastro.portador,
  model.cadastro.membrofamilia,
  model.cadastro.conta,
  model.cadastro.conta.pagar,
  model.cadastro.conta.receber,
  model.cadastro.credor,
  model.cadastro.tags,
  model.cadastro.saldofgts,
  model.cadastro.cartao,
  model.cadastro.despesacartao,
  model.cadastro.saldoportador,
  model.cadastro.abastecimentos;

{ TModelCadastroFactory }

class function TModelCadastroFactory.New: iCadastrosFactory;
begin
  Result := Self.Create;
end;

function TModelCadastroFactory.GerarCadastro(_TypeCadastro: TTypeCadastros): iCadastros;
begin
  {TODO: [HINT - Cadastros] Adicionar na fábrica o cadastro - E criar a classe}

  case _TypeCadastro of
    cadPortador       : Result := TCadastroPortador.ObterInstancia;
    cadMembroFamilia  : Result := TCadastroMembroFamilia.ObterInstancia;
    cadConta          : Result := TCadastroConta.ObterInstancia;
    cadContaPagar     : Result := TCadastroContaPagar.ObterInstancia;
    cadContaReceber   : Result := TCadastroContaReceber.ObterInstancia;
    cadCredor         : Result := TCadastroCredor.ObterInstancia;
    cadTags           : Result := TCadastroTags.ObterInstancia;
    cadSaldoFGTS      : Result := TCadastroSaldoFGTS.ObterInstancia;
    cadCartao         : Result := TCadastroCartao.ObterInstancia;
    cadDespesaCartao  : Result := TCadastroDespesaCartao.ObterInstancia;
    cadSaldoPortador  : Result := TCadastroSaldoPortador.ObterInstancia;
    cadAbastecimentos : Result := TCadastroAbastecimentos.ObterInstancia;
    else
      raise Exception.Create('Gerar cadastro factory: TypeCadastro não informado corretamente!');
  end;
end;

end.

