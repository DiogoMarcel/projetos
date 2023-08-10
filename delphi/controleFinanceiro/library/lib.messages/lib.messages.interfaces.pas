unit lib.messages.interfaces;

interface

type
  iLibMessages = interface
    ['{08318299-3C23-4DDF-BCCE-C1FEECB1C163}']
    procedure Informar(_AMessage: string);
    procedure Warning(_AMessage: string);
    procedure Erro(_AMessage: string);
    function Confirmar(_AMessage: string): boolean;
  end;

implementation

end.
