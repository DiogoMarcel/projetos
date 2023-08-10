unit pkg.json.interfaces;

interface

type
  IPkgJsonTemplate = interface
    ['{09144766-D543-4A1C-B167-04206EF5C19C}']
    function GetAsJson: string;
    procedure SetAsJson(aValue: string);

  end;

implementation

end.
