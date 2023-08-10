unit model.lib.interfaces;

interface

uses
  consts.styles,
  Vcl.ExtCtrls;

type
  iModelLibrary = interface
    ['{FCF59281-71ED-46F0-A315-30F1CBAA97BB}']
    function ConverteColorHexToColorDelphi(_Panel: TPanel; _ColorTextHex: RColorRGBConst): iModelLibrary;
  end;

  iModelAguarde = interface
    ['{A5F36FFA-2032-4B94-B108-615CFCA866E8}']
    function ExibirAguarde(_AMensagem: string = ''): iModelAguarde;
    procedure FinalizaAguarde;
  end;

implementation

end.

