unit lib.observer;

interface

uses
  consts.nomeCadastros;

type
  TNotificaObserver = procedure of object;

  TNotificacao = record
    TypeCadastros: TTypeCadastros;
  end;

  iMenuObserver = interface
    ['{9657EBB6-9B61-4DA3-9970-D22701A01BFE}']
    procedure AtualizarObserver(_ANotificacao: TNotificacao);
  end;

  iMenuSubjectObserver = interface
    ['{859393B5-05A5-4513-BB17-1B73044E7862}']
    function AdicionarObserver(_AObserver: iMenuObserver): iMenuSubjectObserver;
    function RemoverObserver(_AObserver: iMenuObserver): iMenuSubjectObserver;
    procedure Notificar;
  end;

implementation

end.
