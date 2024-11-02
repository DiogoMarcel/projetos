unit model.relatorio.abastecimentos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, MidasLib,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmAbastecimentos = class(TDataModule)
    qAbastecimentos: TFDQuery;
    dspAbastecimentos: TDataSetProvider;
    dsAbastecimentos: TDataSource;
    cdsAbastecimentos: TClientDataSet;
    cdsAbastecimentosidabastecimento: TLargeintField;
    cdsAbastecimentosobservacao: TWideStringField;
    cdsAbastecimentosdataabastecimento: TWideStringField;
    cdsAbastecimentostotalabastecimento: TFloatField;
    cdsAbastecimentosdiftotalabastecimento: TBCDField;
    cdsAbastecimentoskmcarro: TIntegerField;
    cdsAbastecimentosdifkmcarro: TBCDField;
    cdsAbastecimentosquantidadelitros: TFloatField;
    cdsAbastecimentosdifquantidadelitros: TBCDField;
    cdsAbastecimentosmedia: TBCDField;
    cdsAbastecimentosvalorlitro: TBCDField;
    cdsAbastecimentosano: TIntegerField;
    cdsAbastecimentosmes: TIntegerField;
    cdsAbastecimentosorigemdado: TSmallintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
