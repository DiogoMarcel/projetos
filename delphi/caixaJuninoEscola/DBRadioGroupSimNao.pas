unit DBRadioGroupSimNao;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TDBRadioGroupSimNao = class(TDBRadioGroup)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;

  published

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('DMDS', [TDBRadioGroupSimNao]);
end;

{ TDBRadioGroupSimNao }

constructor TDBRadioGroupSimNao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetParentComponent(AOwner);

  Caption := '';
  Columns := 2;

  Items.Add('Sim');
  Items.Add('Não');

  Values.Add('true');
  Values.Add('false');
end;

end.
