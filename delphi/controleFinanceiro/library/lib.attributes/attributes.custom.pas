unit attributes.custom;

interface

uses
  Data.DB,
  System.Generics.Collections,
  attributes.custom.interfaces;

type
  TCustomAttributeTemplate = class abstract (TCustomAttribute, IAttributesCustom)
  private
    [Volatile] FRefCount: Integer;

    //Métodos necessários para a interface
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

  TAttributeInvisible = class(TCustomAttributeTemplate, IAttributeInvisible)
  public
    function IsInvisible: boolean;
  end;

  TAttributeWidth = class(TCustomAttributeTemplate, IAttributeWidth)
  private
    FWidth: integer;
  public
    constructor Create(const _Width: integer); overload;
    function Width: integer;
  end;

  TAttributeMonetario = class(TCustomAttributeTemplate, IAttributeMonetario)
  public
    function Monetario: boolean;
  end;

  TAttributeTitulo = class(TCustomAttributeTemplate, IAttributeTitulo)
  private
    FTitulo: string;
  public
    constructor Create(const _Titulo: string); overload;
    function Titulo: string;
  end;

  TAttributeIsValid = class(TCustomAttributeTemplate, IAttributeIsValid)
  private
    FIsValid: TDictionary<string, string>;
  public
    constructor Create(const _IsValid: TDictionary<string, string>); overload;
    function IsValid: TDictionary<string, string>;
  end;

  TAttributeFieldType = class(TCustomAttributeTemplate, IAttributeFieldType)
  private
    FFieldType: TFieldType;
  public
    constructor Create(const _FieldType: TFieldType); overload;
    function AFieldType: TFieldType;
  end;

  TAttributeFK = class(TCustomAttributeTemplate, IAttributeFK)
  private
    FClassFK: TClass;
  public
    constructor Create(const _ClassFK: TClass); overload;
    function ClassFK: TClass;
  end;

  TAttributeDescricaoPesquisa = class(TCustomAttributeTemplate, IAttributeDescricaoPesquisa)
  private
    FEhDescricaoPesquisa: boolean;
  public
    constructor Create(const _EhDescricaoPesquisa: boolean = true); overload;
    function EhDescricaoPesquisa: boolean;
  end;

  TPropsAttributes = class(TInterfacedObject, IPropsAttributes)
  private
    FPropTitulo           : TAttributeTitulo;
    FPropVisible          : TAttributeInvisible;
    FPropWidth            : TAttributeWidth;
    FPropMonetario        : TAttributeMonetario;
    FPropFieldType        : TAttributeFieldType;
    FPropFK               : TAttributeFK;
    FPropDescricaoPesquisa: TAttributeDescricaoPesquisa;

  public
    function isMyAttribute: boolean;

    function Titulo           : TAttributeTitulo;             overload;
    function Visible          : TAttributeInvisible;          overload;
    function Width            : TAttributeWidth;              overload;
    function Monetario        : TAttributeMonetario;          overload;
    function AFieldType       : TAttributeFieldType;          overload;
    function PropFK           : TAttributeFK;                 overload;
    function DescricaoPesquisa: TAttributeDescricaoPesquisa;  overload;

    procedure Titulo(Value            : TAttributeTitulo);            overload;
    procedure Visible(Value           : TAttributeInvisible);         overload;
    procedure Width(Value             : TAttributeWidth);             overload;
    procedure Monetario(Value         : TAttributeMonetario);         overload;
    procedure AFieldType(Value        : TAttributeFieldType);         overload;
    procedure PropFK(Value            : TAttributeFK);                overload;
    procedure DescricaoPesquisa(Value : TAttributeDescricaoPesquisa); overload;

  end;

implementation

{ TCustomAttributeTemplate }
function TCustomAttributeTemplate.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TCustomAttributeTemplate._AddRef: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;

function TCustomAttributeTemplate._Release: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicDecrement(FRefCount);
  if Result = 0 then
    Destroy;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;

{ TAttributeTitulo }
constructor TAttributeTitulo.Create(const _Titulo: string);
begin
  inherited Create;
  FTitulo := _Titulo;
end;

function TAttributeTitulo.Titulo: string;
begin
  Result := FTitulo;
end;

{ TAttributeInvisible }
function TAttributeInvisible.IsInvisible: boolean;
begin
  Result := False;
end;

{ TAttributeWidth }
constructor TAttributeWidth.Create(const _Width: integer);
begin
  inherited Create;
  FWidth := _Width;
end;

function TAttributeWidth.Width: integer;
begin
  Result := FWidth;
end;

{ TAttributeMonetario }
function TAttributeMonetario.Monetario: boolean;
begin
  Result := True;
end;

{ TAttributeIsValid }

constructor TAttributeIsValid.Create(const _IsValid: TDictionary<string, string>);
begin
  inherited Create;
  FIsValid := _IsValid;
end;

function TAttributeIsValid.IsValid: TDictionary<string, string>;
begin
  Result := FIsValid;
end;

{ TAttributeFieldType }
constructor TAttributeFieldType.Create(const _FieldType: TFieldType);
begin
  inherited Create;
  FFieldType := _FieldType;
end;

function TAttributeFieldType.AFieldType: TFieldType;
begin
  Result := FFieldType;
end;

{ TAttributeFK }
function TAttributeFK.ClassFK: TClass;
begin
  Result := FClassFK;
end;

constructor TAttributeFK.Create(const _ClassFK: TClass);
begin
  inherited Create;
  FClassFK := _ClassFK;
end;

{ TAttributeDescricaoPesquisa }

constructor TAttributeDescricaoPesquisa.Create(const _EhDescricaoPesquisa: boolean = true);
begin
  inherited Create;
  FEhDescricaoPesquisa := _EhDescricaoPesquisa;
end;

function TAttributeDescricaoPesquisa.EhDescricaoPesquisa: boolean;
begin
  Result := FEhDescricaoPesquisa;
end;

{ TPropsAttributes }
function TPropsAttributes.isMyAttribute: boolean;
begin
  Result := Assigned(FPropTitulo)    or
            Assigned(FPropVisible)   or
            Assigned(FPropWidth)     or
            Assigned(FPropMonetario) or
            Assigned(FPropFieldType) or
            Assigned(FPropFK)        or
            Assigned(FPropDescricaoPesquisa);
end;

procedure TPropsAttributes.Monetario(Value: tAttributeMonetario);
begin
  FPropMonetario := Value;
end;

procedure TPropsAttributes.PropFK(Value: TAttributeFK);
begin
  FPropFK := Value;
end;

procedure TPropsAttributes.Titulo(Value: tAttributeTitulo);
begin
  FPropTitulo := Value;
end;

procedure TPropsAttributes.Visible(Value: tAttributeInvisible);
begin
  FPropVisible := Value;
end;

procedure TPropsAttributes.Width(Value: tAttributeWidth);
begin
  FPropWidth := Value;
end;

procedure TPropsAttributes.AFieldType(Value: TAttributeFieldType);
begin
  FPropFieldType := Value;
end;

procedure TPropsAttributes.DescricaoPesquisa(Value: TAttributeDescricaoPesquisa);
begin
  FPropDescricaoPesquisa := Value;
end;

function TPropsAttributes.DescricaoPesquisa: TAttributeDescricaoPesquisa;
begin
  Result := FPropDescricaoPesquisa;
end;

function TPropsAttributes.AFieldType: TAttributeFieldType;
begin
  Result := FPropFieldType;
end;

function TPropsAttributes.Monetario: tAttributeMonetario;
begin
  Result := FPropMonetario;
end;

function TPropsAttributes.Titulo: tAttributeTitulo;
begin
  Result := FPropTitulo;
end;

function TPropsAttributes.Visible: tAttributeInvisible;
begin
  Result := FPropVisible;
end;

function TPropsAttributes.Width: tAttributeWidth;
begin
  Result := FPropWidth;
end;

function TPropsAttributes.PropFK: TAttributeFK;
begin
  Result := FPropFK;
end;

end.

