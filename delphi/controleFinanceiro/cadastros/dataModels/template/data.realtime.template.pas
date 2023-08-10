unit data.realtime.template;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdataRealTimeTemplate = class(TDataModule)
    mtDados: TFDMemTable;
    dsDadosRealtime: TDataSource;
  private
    { Private declarations }
  public
    function PegarMemTable: TFDMemTable;
    function PegarDataSource: TDataSource;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TdataRealTimeTemplate.PegarDataSource: TDataSource;
begin
  Result := dsDadosRealtime;
end;

function TdataRealTimeTemplate.PegarMemTable: TFDMemTable;
begin
  Result := mtDados;
end;

end.
