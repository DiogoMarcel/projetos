unit data.cadastro.conta.pagar;

interface

uses
  System.SysUtils, System.Classes, data.cadastro.conta, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  Datasnap.DBClient, Datasnap.Provider;

type
  TdataCadastroContaPagar = class(TdataCadastroConta)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
