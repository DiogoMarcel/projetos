unit model.lib.aguarde;

interface

uses
  System.Classes,
  view.aguarde,
  model.lib.interfaces;

type
  TModelAguarde = class(TInterfacedObject, iModelAguarde)
  private
    FFrmLibAguarde: TformLibAguarde;

    function ExibirAguarde(_AMensagem: string = ''): iModelAguarde;
    procedure FinalizaAguarde;

  public
    constructor Create(_AOwner: TComponent);
    destructor Destroy; override;

    class function New(_AOwner: TComponent): iModelAguarde;

  end;

implementation

uses
  System.SysUtils;

{ TModelAguarde }

constructor TModelAguarde.Create(_AOwner: TComponent);
begin
  FFrmLibAguarde := TformLibAguarde.New(_AOwner);
end;

destructor TModelAguarde.Destroy;
begin
  if Assigned(FFrmLibAguarde) then
    FreeAndNil(FFrmLibAguarde);

  inherited;
end;

function TModelAguarde.ExibirAguarde(_AMensagem: string = ''): iModelAguarde;
begin
  Result := Self;

  FFrmLibAguarde.ExibirAguarde(_AMensagem);
end;

procedure TModelAguarde.FinalizaAguarde;
begin
  FFrmLibAguarde.EncerraAguarde;
end;

class function TModelAguarde.New(_AOwner: TComponent): iModelAguarde;
begin
  Result := Self.Create(_AOwner);
end;

end.
