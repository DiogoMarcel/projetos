unit lib.DAO.interfaces;

interface

type
  iCMDTransacao = interface
    ['{A54F39B9-4492-419D-B195-AB5371C26188}']
    function AddCommand(_ACommand: string): iCMDTransacao;

    function SetParamString(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamBoolean(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamInteger(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamCurrency(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamFloat(_AParamName: string; _AValue: Variant): iCMDTransacao;
    function SetParamDateTime(_AParamName: string; _AValue: Variant): iCMDTransacao;

    function Executar: iCMDTransacao;
  end;

implementation

end.
