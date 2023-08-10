unit lib.sql.interfaces;

interface

uses
  consts.SQLs;

type
  iSQLResultado = interface
    ['{5B742339-7BF1-425B-9D50-45BAD0179AED}']
    function PegarSQL: string;
  end;

  iSQLDefinicao = interface
    ['{4B75CEF6-0046-45E4-87D5-B99F66795D95}']
    function SetEnumSQL(_ASQLEnum: TSQLEnum): iSQLResultado;
  end;

implementation

end.
