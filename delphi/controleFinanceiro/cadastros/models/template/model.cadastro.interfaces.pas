unit model.cadastro.interfaces;

interface

uses
  Data.DB,
  Vcl.Forms,
  Vcl.DBCtrls,
  System.JSON,
  Vcl.DBGrids,
  lib.records,
  consts.nomeCadastros,
  lib.proc.objects,
  FireDAC.Comp.Client;

type
  iCadastros = interface
    ['{1CC59B18-685F-4088-819B-AC9EDB8805F3}']
    function onFormShow(_ARecOnFormShow: TRecOnFormShow): iCadastros;
    function CancelarInserirEditarCadastro: iCadastros;
    function GravarCadastro: iCadastros;
    function AtualizarRegistros: iCadastros;
    function AjustarSQLDataSourceGrade: iCadastros;
    function ExcluirCadastro: iCadastros;
    function PegarFormCadastro: TFormClass;
    function PegarTClassCadastro: TClass;
    function PegarNodeCadastro: string;
  end;

  iCadastrosFactory = interface
    ['{D209D4E9-6CC5-4226-A4CF-210DC6CB794A}']
    function GerarCadastro(_TypeCadastro: TTypeCadastros): iCadastros;
  end;

  iJSONCadastroToString = interface
    ['{8CFA3F71-B459-45A3-8635-D7EC06C71A8C}']
    function ParseJSON(_Object: TObject): iJSONCadastroToString;
    function GetValue: TJSONValue;
  end;

  iCamposCadastro = interface
    ['{2536781B-8AA5-4C47-8BFC-B92D88BCE3CC}']
    function SetCadastro(_ACadastro: iCadastros): iCamposCadastro;
    function PegarFieldDefs(_AFieldDefs: TFieldDefs): iCamposCadastro;
  end;

implementation

end.

