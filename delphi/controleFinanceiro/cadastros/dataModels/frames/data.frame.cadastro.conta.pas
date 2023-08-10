unit data.frame.cadastro.conta;

interface

uses
  System.SysUtils, System.Classes, data.frame.cadastro.template,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmFrameConta = class(TdmFrameGrade)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
