unit controller.cadastro.interfaces;

interface

uses
  consts.nomeCadastros,
  model.cadastro.interfaces;

type
  iControllerCadastros = interface
    ['{BD06AE94-3A35-4C08-A7B0-3ED712404BA3}']
    function TypeCadastro(_TypeCadastro: TTypeCadastros): iControllerCadastros; overload;
    function TypeCadastro: TTypeCadastros; overload;
    function Cadastro: iCadastros;
  end;

implementation

end.

