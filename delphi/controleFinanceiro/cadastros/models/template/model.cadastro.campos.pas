unit model.cadastro.campos;

interface

uses
  Data.DB,
  model.cadastro.interfaces;

type
  TModelCadastroCampos = class(TInterfacedObject, iCamposCadastro)
  private
    FCadastro: iCadastros;

    function PegarFieldDefs(_AFieldDefs: TFieldDefs): iCamposCadastro;
    function SetCadastro(_ACadastro: iCadastros): iCamposCadastro;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: iCamposCadastro;
  end;

implementation

uses
  System.SysUtils,
  attributes.custom,
  System.Rtti;

{ TModelCadastroCampos }
constructor TModelCadastroCampos.Create;
begin
end;

destructor TModelCadastroCampos.Destroy;
begin
  inherited;
end;

class function TModelCadastroCampos.New: iCamposCadastro;
begin
  Result := Self.Create;
end;

function TModelCadastroCampos.SetCadastro(_ACadastro: iCadastros): iCamposCadastro;
begin
  Result := Self;
  FCadastro := _ACadastro;
end;

function TModelCadastroCampos.PegarFieldDefs(_AFieldDefs: TFieldDefs): iCamposCadastro;
var
  Tipo: TRttiType;
  Contexto: TRttiContext;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  AttributeWidth: TAttributeWidth;
  AAttributeFieldType: TAttributeFieldType;
  APropsAttributes: TPropsAttributes;
  APropriedadeName: string;
  AWidth: integer;
begin
  Result := Self;

  Contexto := TRttiContext.Create;

  Tipo := Contexto.GetType(FCadastro.PegarTClassCadastro.ClassInfo);

  for Propriedade in Tipo.GetProperties do
  begin

    APropsAttributes := TPropsAttributes.Create;
    try

      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TAttributeFieldType then
          APropsAttributes.AFieldType(Atributo as TAttributeFieldType);

        if Atributo is TAttributeWidth then
          APropsAttributes.Width(Atributo as TAttributeWidth);
      end;

      if APropsAttributes.isMyAttribute then
      begin
        APropriedadeName    := LowerCase(Propriedade.Name);
        AttributeWidth      := APropsAttributes.Width;
        AAttributeFieldType := APropsAttributes.AFieldType;

        AWidth := 0;
        if (Assigned(AttributeWidth)) and (AttributeWidth.Width > 0) then
          AWidth := AttributeWidth.Width
        else if Propriedade.PropertyType.TypeKind in [tkString, tkUString, tkWString, tkLString] then
          AWidth := 200
        else if Propriedade.PropertyType.TypeKind in [tkChar, tkWChar] then
          AWidth := 50;

        _AFieldDefs.Add(APropriedadeName, AAttributeFieldType.AFieldType, AWidth);
      end;
    finally
      FreeAndNil(APropsAttributes);
    end;
  end;
end;

end.
