unit lib.records;

interface

uses
  Data.DB,
  Vcl.DBCtrls,
  Vcl.DBGrids,
  Datasnap.DBClient,
  Datasnap.Provider,
  FireDAC.Comp.Client,
  lib.proc.objects;

type
  TRecOnFormShow = record
    ProcTitulo: TTituloCadastro;
    gConsultaCadastro: TDBGrid;
    mtCadastro: TFDMemTable;

    dsCadastro: TDataSource;
    dspCadastro: TDataSetProvider;
    cdsCadastro: TClientDataSet;
    qCadastro: TFDQuery;

    qConsultaGrade: TFDQuery;
    ProcAtualizarConsultaGrade: TAtualizarConsultaGrade;
    FuncExecutarBeforePostNaView: TExecutarBeforePostNaView;
    FuncExecutarAfterPostNaView: TExecutarAfterPostNaView;

  end;

implementation

end.

