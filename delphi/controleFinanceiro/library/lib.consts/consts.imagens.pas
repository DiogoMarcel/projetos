unit consts.imagens;

interface

uses
  lib.types.enum;

type
  EQualImgList = (qil16, qil24, qil32, qil40);
  EQualImgListVirtual = (qiv54);

type
  TConstImagens54Logo = (ci54Logonil
                        ,ci54LogoBradesco
                        ,ci54LogoCaixa
                        ,ci54LogoInter
                        ,ci54LogoNuInvest
                        ,ci54LogoPicPay
                        ,ci54LogoSicredi
                        ,ci54LogoFlash
                        );

type
  TConstImagens24 = (ci24nil
                    ,ci24ListaNormal
                    ,ci24GradeNormal
                    ,ci24ListaBranco
                    ,ci24GradeBranco
                    ,ci24Pendente
                    ,ci24Confirmado
                    ,ci24LetraC
                    ,ci24LetraO
                    ,ci24LetraM
                    ,ci24LetraP
                    );

type
  TConstImagens32 = (ci32nil
                    ,ci32Relatorios
                    ,ci32OpcaoSair
                    ,ci32Cadastros
                    ,ci32Cartao
                    ,ci32Credor
                    ,ci32DespesaCartao
                    ,ci32MembroFamilia
                    ,ci32Pagar
                    ,ci32Portador
                    ,ci32Receber
                    ,ci32SaldoFGTS
                    ,ci32SaldoPortador
                    ,ci32Tag
                    ,ci32RelSaldoDetalhado
                    ,ci32Rent
                    ,ci32Abastecimentos
                    );

type
  TConstImagens40 = (ci40nil
                    ,ci40Salvar
                    ,ci40Cancelar
                    ,ci40Sair
                    ,ci40Cartao
                    ,ci40Pagar
                    ,ci40Receber
                    ,ci40Portador
                    ,ci40SaldoPortador
                    ,ci40Tag
                    ,ci40DespesaCartao
                    ,ci40SaldoFGTS
                    ,ci40Credor
                    ,ci40MembroFamilia
                    ,ci40EditarCadastro
                    ,ci40ExcluirCadastro
                    ,ci40IncluirCadastro
                    ,ci40EditarCadastroDesabilitaado
                    ,ci40ExcluirCadastroDesabilitaado
                    ,ci40IncluirCadastroDesabilitaado
                    ,ci40CancelarDesabilitaado
                    ,ci40SalvarDesabilitado
                    );

type
  TEnumImagens54Logo = class(TLibEnum<TConstImagens54Logo>)
  const
    FIntImagens54Logo: array[TConstImagens54Logo] of integer = (-1, 0, 1, 2, 3, 4, 5, 6);
    FStrImagens54Logo: array[TConstImagens54Logo] of string  = ('nil'
                                                               ,'Bradesco'
                                                               ,'Caixa'
                                                               ,'Inter'
                                                               ,'nuInvest'
                                                               ,'PicPay'
                                                               ,'Sicredi'
                                                               ,'Flash'
                                                               );
  protected
    class function GetArrayValues: TArrayInteger; override;
    class function GetArrayNames: TArrayString; override;
  end;

type
  TEnumImagens24 = class(TLibEnum<TConstImagens24>)
  const
    FIntImagens24: array[TConstImagens24] of integer = (-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    FStrImagens24: array[TConstImagens24] of string  = ('nil'
                                                       ,'ListaNormal'
                                                       ,'GradeNormal'
                                                       ,'ListaBranco'
                                                       ,'GradeBranco'
                                                       ,'Pendente'
                                                       ,'Confirmado'
                                                       ,'Letra C'
                                                       ,'Letra O'
                                                       ,'Letra M'
                                                       ,'Letra P'
                                                       );
  protected
    class function GetArrayValues: TArrayInteger; override;
    class function GetArrayNames: TArrayString; override;
  end;

type
  TEnumImagens32 = class(TLibEnum<TConstImagens32>)
  const
    FIntImagens32: array[TConstImagens32] of integer = (-1
                                                       , 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
                                                       , 11, 12, 13, 14, 15);
    FStrImagens32: array[TConstImagens32] of string  = ('nil'
                                                       ,'Relatórios'
                                                       ,'Sair'
                                                       ,'Cadastros'
                                                       ,'Cartão'
                                                       ,'Credor'
                                                       ,'Despesa Cartão'
                                                       ,'Membro Família'
                                                       ,'Pagar'
                                                       ,'Portador'
                                                       ,'Receber'
                                                       ,'Saldo FGTS'
                                                       ,'Saldo Portador'
                                                       ,'Tags'
                                                       ,'Relatório Saldo Detalhado'
                                                       ,'Alugar Casa'
                                                       ,'Abastecimentos'
                                                       );
  protected
    class function GetArrayValues: TArrayInteger; override;
    class function GetArrayNames: TArrayString; override;
  end;

type
  TEnumImagens40 = class(TLibEnum<TConstImagens40>)
  const
    FIntImagens40: array[TConstImagens40] of integer = (-1
                                                       , 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
                                                       , 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
    FStrImagens40: array[TConstImagens40] of string  = ('nil'
                                                       ,'Salvar'
                                                       ,'Cancelar'
                                                       ,'Sair'
                                                       ,'Cartão'
                                                       ,'Pagar'
                                                       ,'Receber'
                                                       ,'Portador'
                                                       ,'Saldo Portador'
                                                       ,'Tags'
                                                       ,'Despesa Cartão'
                                                       ,'Saldo FGTS'
                                                       ,'Credor'
                                                       ,'Membro Família'
                                                       ,'Editar Cadastro'
                                                       ,'Excluir Cadastro'
                                                       ,'Incluir Cadastro'
                                                       ,'Editar Cadastro Desabilitado'
                                                       ,'Excluir Cadastro Desabilitado'
                                                       ,'Incluir Cadastro Desabilitado'
                                                       ,'Cancelar Desabilitado'
                                                       ,'Salvar Desabilitado'
                                                       );
  protected
    class function GetArrayValues: TArrayInteger; override;
    class function GetArrayNames: TArrayString; override;
  end;

implementation

{ TEnumImagens54Logo }

class function TEnumImagens54Logo.GetArrayNames: TArrayString;
begin
  Result := TArrayUtils.ArrayOfStringToArrayString(FStrImagens54Logo);
end;

class function TEnumImagens54Logo.GetArrayValues: TArrayInteger;
begin
  Result := TArrayUtils.ArrayOfIntegerToArrayInteger(FIntImagens54Logo);
end;

{ TEnumImagens24 }

class function TEnumImagens24.GetArrayNames: TArrayString;
begin
  Result := TArrayUtils.ArrayOfStringToArrayString(FStrImagens24);
end;

class function TEnumImagens24.GetArrayValues: TArrayInteger;
begin
  Result := TArrayUtils.ArrayOfIntegerToArrayInteger(FIntImagens24);
end;

{ TEnumImagens32 }

class function TEnumImagens32.GetArrayNames: TArrayString;
begin
  Result := TArrayUtils.ArrayOfStringToArrayString(FStrImagens32);
end;

class function TEnumImagens32.GetArrayValues: TArrayInteger;
begin
  Result := TArrayUtils.ArrayOfIntegerToArrayInteger(FIntImagens32);
end;

{ TEnumImagens40 }

class function TEnumImagens40.GetArrayNames: TArrayString;
begin
  Result := TArrayUtils.ArrayOfStringToArrayString(FStrImagens40);
end;

class function TEnumImagens40.GetArrayValues: TArrayInteger;
begin
  Result := TArrayUtils.ArrayOfIntegerToArrayInteger(FIntImagens40);
end;

end.

