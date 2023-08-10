unit EditMaskMDS;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Mask;

type
  TEditKeyPressEvent = procedure(Sender: TObject; var Key: Char) of object;

  TEditMaskMDS = class(TMaskEdit)
  private
    FOnEnter: TNotifyEvent;
    FOnExit: TNotifyEvent;
    FonKeyPress: TEditKeyPressEvent;

  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: Char); override;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property OnEnter: TNotifyEvent read FOnEnter write FOnEnter;
    property OnExit: TNotifyEvent read FOnExit write FOnExit;
    property OnKeyPress: TEditKeyPressEvent read FonKeyPress write FonKeyPress;

  end;

procedure Register;

implementation

{ TEditMaskMDS }

procedure Register;
begin
  RegisterComponents('DMDS', [TEditMaskMDS]);
end;

procedure TEditMaskMDS.DoEnter;
begin
  Self.EditMask := EmptyStr;

  if Assigned(OnEnter) then OnEnter(Self);
end;

procedure TEditMaskMDS.DoExit;
begin
  if not ((String( Self.Text ).Contains(',')) or (String( Self.Text ).Contains('.'))) then
  begin
    if String(Self.Text).IsEmpty then
      Self.Text := '0,00'
    else
      Self.Text := String( Self.Text ) + ',00';
  end;

  if Assigned(OnExit) then OnExit(Self);
end;

constructor TEditMaskMDS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetParentComponent(AOwner);
end;

procedure TEditMaskMDS.KeyPress(var Key: Char);
begin
  inherited;

  if Assigned(FonKeyPress) then
    FonKeyPress(Self, Key);

  if (Key = '.') or (Key = ',') then
  begin
    if (not String( Self.Text ).Contains(',')) then
    begin
      if (String( Self.Text ).IsEmpty) then
      begin
        Key := #0;
        Self.Text := '0,';
        Self.SelStart := 2;
      end
      else
        Key := ',';
    end
    else
      Key := #0;
  end
  else
  begin
    if (not String( Self.Text ).IsEmpty) and (Key <> #8) then
    begin
      if String( Self.Text ).Contains(',') then
      begin
        if String( Self.Text ).Split([','])[1].Length.ToString.Equals('2') then
          Key := #0;
      end;
    end;
  end;

end;

end.

