unit data.cadastro.template.interfaces;

interface

uses
  consts.nomeCadastros,
  FireDAC.Comp.Client,
  Datasnap.Provider,
  Datasnap.DBClient,
  lib.observer,
  Data.DB;

type
  idataCadastroTemplate = interface
    ['{0C469523-5D8C-4232-8215-9C2DC1F03CFF}']
    function PegarMTCadastro: TFDMemTable;

    function PegarDSCadastro: TDataSource;
    function PegarQCadastro: TFDQuery;
    function PegarDSPCadastro: TDataSetProvider;
    function PegarCDSCadastro: TClientDataSet;

    function PegarDSConsultaGrade: TDataSource;
    function PegarQConsultaGrade: TFDQuery;
    function PegarDSPConsultaGrade: TDataSetProvider;
    function PegarCDSConsultaGrade: TClientDataSet;

    procedure SetNotificaObserver(const _ANotificaObserver: TNotificaObserver);
  end;

  idataCadastroFactory = interface
    ['{8C1A691C-90DF-4BB8-8C00-C86D53519D56}']
    function GerarDataCadastro(_TypeCadastro: TTypeCadastros): idataCadastroTemplate;
  end;

implementation

end.
