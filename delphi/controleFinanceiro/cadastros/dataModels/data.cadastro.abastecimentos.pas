unit data.cadastro.abastecimentos;

interface

uses
  System.SysUtils, System.Classes, data.cadastro.template,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  TdataCadastroAbastecimentos = class(TdataCadastroTemplate)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
