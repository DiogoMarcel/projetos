unit lib.messages;

interface

uses
  Windows,
  Vcl.Consts,
  Vcl.Dialogs,
  System.UITypes,
  lib.messages.interfaces;

type
  TLibMessages = class(TInterfacedObject, iLibMessages)
  private
    {https://www.devmedia.com.br/resourcestring-em-delphi-parte-ii/17011}
    procedure SetResourceString(xOldResourceString: PResStringRec; xValueChanged: PChar);
    procedure TraduzirMensagens;

  public
    constructor Create;

    procedure Informar(_AMessage: string);
    procedure Warning(_AMessage: string);
    procedure Erro(_AMessage: string);
    function Confirmar(_AMessage: string): boolean;

    class function New: iLibMessages;
  end;

implementation

{ TLibMessages }

class function TLibMessages.New: iLibMessages;
begin
  Result := Self.Create;
end;

constructor TLibMessages.Create;
begin
  inherited;
  TraduzirMensagens;
end;

procedure TLibMessages.SetResourceString(xOldResourceString: PResStringRec; xValueChanged: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(xOldResourceString, SizeOf(xOldResourceString^), PAGE_EXECUTE_READWRITE, @POldProtect);
  xOldResourceString^.Identifier := Integer(xValueChanged);
  VirtualProtect(xOldResourceString, SizeOf(xOldResourceString^), POldProtect, @POldProtect);
end;

procedure TLibMessages.TraduzirMensagens;
begin
  SetResourceString(@SMsgDlgYes,        'Sim');
  SetResourceString(@SMsgDlgWarning,    'Atenção');
  SetResourceString(@SMsgDlgError,      'Erro');
  SetResourceString(@SMsgDlgInformation,'Information');
  SetResourceString(@SMsgDlgConfirm ,   'Confirmar');
  SetResourceString(@SMsgDlgYes ,       '&Sim');
  SetResourceString(@SMsgDlgNo ,        '&Não');
  SetResourceString(@SMsgDlgOK ,        'OK');
  SetResourceString(@SMsgDlgCancel ,    'Cancelar');
  SetResourceString(@SMsgDlgHelp ,      '&Ajuda');
  SetResourceString(@SMsgDlgHelpHelp ,  'Ajuda');
  SetResourceString(@SMsgDlgAbort ,     '&Abortar');
  SetResourceString(@SMsgDlgRetry ,     '&Repetir');
  SetResourceString(@SMsgDlgIgnore ,    '&Ignorar');
  SetResourceString(@SMsgDlgAll ,       '&Tudo');
  SetResourceString(@SMsgDlgNoToAll ,   'N&ao para Tudo');
  SetResourceString(@SMsgDlgYesToAll ,  'Sim para &Tudo');
  SetResourceString(@SMsgDlgClose ,     '&Fechar');
end;

procedure TLibMessages.Warning(_AMessage: string);
begin
  MessageDlg(_AMessage, TMsgDlgType.mtWarning, [mbOK], 0);
end;

function TLibMessages.Confirmar(_AMessage: string): boolean;
begin
  Result := MessageDlg(_AMessage, mtConfirmation, [mbyes, mbno], 0) = mrYes;
end;

procedure TLibMessages.Informar(_AMessage: string);
begin
  MessageDlg(_AMessage, mtInformation, [mbOK], 0);
end;

procedure TLibMessages.Erro(_AMessage: string);
begin
  MessageDlg(_AMessage, TMsgDlgType.mtError, [mbOK], 0);
end;

end.

