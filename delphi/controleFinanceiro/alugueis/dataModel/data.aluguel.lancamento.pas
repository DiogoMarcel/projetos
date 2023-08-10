unit data.aluguel.lancamento;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  lib.DAO.dataModel;

type
  TdataAluguel = class(TDataModule)
    dsAluguel: TDataSource;
    qAluguel: TFDQuery;
    dspAluguel: TDataSetProvider;
    cdsAluguel: TClientDataSet;
    dsAluguelTotal: TDataSource;
    qAluguelTotal: TFDQuery;
    dsAluguelTotalComp: TDataSource;
    qAluguelTotalComp: TFDQuery;
    cdsAlugueldataaluguel: TWideStringField;
    cdsAlugueldatapagamento: TDateField;
    cdsAluguelpagamentocomp: TDateField;
    cdsAluguelidaluguel: TIntegerField;
    qAluguelTotaltotal: TFloatField;
    qAluguelTotalidaluguel: TIntegerField;
    qAluguelTotalComptotal: TFloatField;
    qAluguelTotalCompidaluguel: TIntegerField;
    dsAluguelCob: TDataSource;
    qAluguelCob: TFDQuery;
    qAluguelCobid_aluguel: TIntegerField;
    qAluguelCobdataaluguel: TWideStringField;
    qAluguelCobdatapagamento: TDateField;
    qAluguelCobvaloraluguel: TFloatField;
    qAluguelCobdescricao: TWideStringField;
    qAluguelCobvalorconta: TFloatField;
    dsAluguelDes: TDataSource;
    qAluguelDes: TFDQuery;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    WideStringField2: TWideStringField;
    FloatField2: TFloatField;
    dsAluguelCompCob: TDataSource;
    qAluguelCompCob: TFDQuery;
    IntegerField2: TIntegerField;
    WideStringField3: TWideStringField;
    DateField2: TDateField;
    FloatField3: TFloatField;
    WideStringField4: TWideStringField;
    FloatField4: TFloatField;
    dsAluguelCompDes: TDataSource;
    qAluguelCompDes: TFDQuery;
    IntegerField3: TIntegerField;
    WideStringField5: TWideStringField;
    DateField3: TDateField;
    FloatField5: TFloatField;
    WideStringField6: TWideStringField;
    FloatField6: TFloatField;
    cdsAluguelvaloraluguel: TCurrencyField;
    qAluguelCobidaluguelconta: TIntegerField;
    qAluguelCobidaluguel: TIntegerField;
    qAluguelCobvalor: TFloatField;
    qAluguelCobcompartilhado: TWideStringField;
    qAluguelCobtipoconta: TWideStringField;
    qAluguelDesidaluguel: TIntegerField;
    qAluguelDesidaluguelconta: TIntegerField;
    qAluguelDesvalor: TFloatField;
    qAluguelDescompartilhado: TWideStringField;
    qAluguelDestipoconta: TWideStringField;
    qAluguelCompCobidaluguel: TIntegerField;
    qAluguelCompCobidaluguelconta: TIntegerField;
    qAluguelCompCobvalor: TFloatField;
    qAluguelCompCobcompartilhado: TWideStringField;
    qAluguelCompCobtipoconta: TWideStringField;
    qAluguelCompDesidaluguel: TIntegerField;
    qAluguelCompDesidaluguelconta: TIntegerField;
    qAluguelCompDesvalor: TFloatField;
    qAluguelCompDescompartilhado: TWideStringField;
    qAluguelCompDestipoconta: TWideStringField;
  private
    { Private declarations }

  public
    { Public declarations }

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
