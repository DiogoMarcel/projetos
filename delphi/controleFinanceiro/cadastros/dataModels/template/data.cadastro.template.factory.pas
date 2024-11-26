unit data.cadastro.template.factory;

interface

uses
  Vcl.Forms,
  consts.nomeCadastros,
  data.cadastro.template.interfaces;

type
  TdataCadastroFactory = class(TInterfacedObject, idataCadastroFactory)
  private
  public
    class function New: idataCadastroFactory;

    function GerarDataCadastro(_TypeCadastro: TTypeCadastros): idataCadastroTemplate;

  end;

implementation

uses
  System.SysUtils,
  data.cadastro.cartao,
  data.cadastro.conta.pagar,
  data.cadastro.conta,
  data.cadastro.conta.receber,
  data.cadastro.credor,
  data.cadastro.despesacartao,
  data.cadastro.membrofamilia,
  data.cadastro.portador,
  data.cadastro.saldoFGTS,
  data.cadastro.saldoportador,
  data.cadastro.tags,
  data.cadastro.abastecimentos,
  data.cadastro.veiculos;

{ TdataCadastroFactory }

function TdataCadastroFactory.GerarDataCadastro(_TypeCadastro: TTypeCadastros): idataCadastroTemplate;
begin
  case _TypeCadastro of
    cadPortador:      Result := TdataCadastroPortador.Create(Application);
    cadConta:         Result := TdataCadastroConta.Create(Application);
    cadContaPagar:    Result := TdataCadastroContaPagar.Create(Application);
    cadContaReceber:  Result := TdataCadastroContaReceber.Create(Application);
    cadMembroFamilia: Result := TdataCadastroMembroFamilia.Create(Application);
    cadCredor:        Result := TdataCadastroCredor.Create(Application);
    cadTags:          Result := TdataCadastroTags.Create(Application);
    cadSaldoFGTS:     Result := TdataCadastroSaldoFGTS.Create(Application);
    cadCartao:        Result := TdataCadastroCartao.Create(Application);
    cadDespesaCartao: Result := TdataCadastroDespesaCartao.Create(Application);
    cadSaldoPortador: Result := TdataCadastroSaldoPortador.Create(Application);
    cadAbastecimentos:Result := TdataCadastroAbastecimentos.Create(Application);
    cadVeiculos:      Result := TdataCadastroVeiculos.Create(Application);
  else
    raise Exception.Create('TdataCadastroFactory.GerarDataCadastro - Não identificado o tipo do cadastro informado!');
  end;
end;

class function TdataCadastroFactory.New: idataCadastroFactory;
begin
  Result := Self.Create;
end;

end.
