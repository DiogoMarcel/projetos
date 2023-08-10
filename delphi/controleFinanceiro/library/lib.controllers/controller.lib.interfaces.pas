unit controller.lib.interfaces;

interface

uses
  System.Classes,
  lib.conexao.db.interfaces,
  model.lib.interfaces;

type
  iControllerLibrary = interface
    ['{FCF59281-71ED-46F0-A315-30F1CBAA97BB}']
    function Lib: iModelLibrary;
    function Conexao: IConexaoAbstract;
    function Aguarde(_AOwner: TComponent): iModelAguarde;
  end;

implementation

end.
