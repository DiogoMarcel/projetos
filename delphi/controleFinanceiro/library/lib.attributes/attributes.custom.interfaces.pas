unit attributes.custom.interfaces;

interface

uses
  System.Generics.Collections,
  Data.DB;

type
  IPropsAttributes = interface
    ['{67E60243-4434-425C-808A-F83BFF123341}']
    function isMyAttribute: boolean;
  end;

  IAttributesCustom = interface
    ['{03BF1D6A-2097-45C1-9773-C7DF3580008E}']
  end;

  IAttributeInvisible = interface
    ['{B81558E8-2EFB-43FA-B3E3-AAB886DE9834}']
    function IsInvisible: boolean;
  end;

  IAttributeWidth = interface
    ['{4EC21774-852F-4E23-8ABF-2D54365E5AAA}']
    function Width: integer;
  end;

  IAttributeMonetario = interface
    ['{016AC142-305E-488E-8448-819889D8DF67}']
    function Monetario: boolean;
  end;

  IAttributeTitulo = interface
    ['{292EE2C0-F87D-44BE-9E4A-76720763ABA9}']
    function Titulo: string;
  end;

  IAttributeIsValid = interface
    ['{39E48186-A428-4CDA-973E-2B0C6F67B780}']
    function IsValid: TDictionary<string, string>;
  end;

  IAttributeFieldType = interface
    ['{9AD9F062-D912-4D15-A2B2-1BE2914C1C3F}']
    function AFieldType: TFieldType;
  end;

  IAttributeFK = interface
    ['{547CEE77-74DD-498C-8AED-721760CD3192}']
    function ClassFK: TClass;
  end;

  IAttributeDescricaoPesquisa = interface
    ['{AAB90A86-2630-49C8-97FF-0ADE3BD9D6C3}']
    function EhDescricaoPesquisa: boolean;
  end;



implementation

end.
