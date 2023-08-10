unit lib.proc.objects;

interface

type
  TTituloCadastro = procedure(_ATitulo: string) of object;
  TAtualizarConsultaGrade = procedure of object;
  TExecutarBeforePostNaView = function: Boolean of object;
  TAtualizarMensagemSplash = procedure(_AMensagem: string) of object;

implementation

end.
