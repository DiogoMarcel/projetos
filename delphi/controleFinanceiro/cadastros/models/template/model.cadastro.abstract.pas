unit model.cadastro.abstract;

interface

{$REGION 'uses_interface'}
uses
  Data.DB,
  Vcl.Forms,
  Vcl.DBGrids,
  Vcl.DBCtrls,
  System.Rtti,
  lib.records,
  consts.SQLs,
  lib.sql.geral,
  System.Classes,
  lib.proc.objects,
  Datasnap.DBClient,
  Datasnap.Provider,
  attributes.custom,
  lib.helper.querys,
  FireDAC.Comp.Client,
  model.cadastro.interfaces;
{$ENDREGION}

type
  TModelCadAbstractTofolo = class abstract (TInterfacedObject, iCadastros)
  private
    FRecOnFormShow: TRecOnFormShow;

    procedure ConferirAssinatura(_AComponent: TComponent);
    procedure AdicionarColunaGridFK(_APropFK: TAttributeFK);
    procedure AjustarSQLDataSourceLista;
    procedure AdicionarColunaGrid(_APropsAttributes: TPropsAttributes;
                                  _APropriedade: TRttiProperty;
                                  _APropClassFK: string = '');
    procedure onGetTextBoolean(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure AjustarQueryGrid;

    function EhMeuAtributo(_APropsAttributes: TPropsAttributes;
                           _APropriedade: TRttiProperty): boolean;
    function PegarPropriedades(_ATypeInfo: Pointer): TArray<TRttiProperty>;
    function MontarSQLLista: string;
    function SetRecOnFormShow(_ARecOnFormShow: TRecOnFormShow): iCadastros;
    function AjustarGrid: iCadastros;
    procedure ExcluirRegistroAtual;

    {function UpdateDataSet: iCadastros;}
    {function AjustarMemTable: iCadastros;}

  protected
    {Componentes}
    function PegarMTCadastro: TFDMemTable;
    function PegarGridConsulta: TDBGrid;
    function PegarQCadastro: TFDQuery;
    function PegarDSCadastro: TDataSource;
    function PegarCDSCadastro: TClientDataSet;
    function PegarDSPCadastro: TDataSetProvider;
    function PegarQConsultaGrade: TFDQuery;

    {Virtuais}
    procedure AtualizarParamsQueryLista; virtual;
    function ModelBeforePost: boolean; virtual;
    function PegarSQLWhereCadastro: string; virtual;
    function PegarEnumSQLGrade: TSQLEnum; virtual;
    procedure ExcluirRegistrosAuxiliares; virtual;

    {Abstract}
    procedure SetTituloTela(_AProcTitulo: TTituloCadastro); virtual; abstract;
    procedure AtualizarParamsQueryGrade; virtual;
    function PegarFormCadastro: TFormClass; virtual; abstract;
    function PegarTClassCadastro: TClass; virtual; abstract;
    function PegarObjectToJson: TObject; virtual; abstract;
    function PegarNodeCadastro: string; virtual; abstract;

    {iCadastros}
    function onFormShow(_ARecOnFormShow: TRecOnFormShow): iCadastros;
    function AjustarSQLDataSourceGrade: iCadastros;
    function CancelarInserirEditarCadastro: iCadastros;
    function GravarCadastro: iCadastros;
    function AtualizarRegistros: iCadastros;
    function ExcluirCadastro: iCadastros;

    {Execuções na View}
    function ExecutarBeforePostNaView: boolean;

    procedure DoAfterApplyUpdateAbstract(Sender: TObject; var OwnerData: OleVariant);

  public
    class function ObterInstancia: iCadastros; virtual; abstract;

  end;

implementation

{$REGION 'uses_implementation'}
uses
  dialogs,
  model.cadastro.jsonstring,
  REST.Response.Adapter,
  System.SysUtils,
  model.cadastro.campos,
  lib.messages;
{$ENDREGION}

{ TControllerCadAbstractTofolo }

{$REGION 'Comentado por enquanto - Real Time'}
{function TModelCadAbstractTofolo.UpdateDataSet: iCadastros;
var
  vConv: TCustomJSONDataSetAdapter;
begin
  Result := Self;

  vConv := TCustomJSONDataSetAdapter.Create(Application);
  try

    vConv.Dataset := PegarFDMemTable;

    TModelCadastroCampos
      .New
        .SetCadastro(Self)
        .PegarFieldDefs(vConv.FieldDefs);

    vConv.UpdateDataSet( TModelJSONCadString
                           .New
                             .ParseJSON(PegarObjectToJson)
                             .GetValue );

  finally
    FreeAndNil(vConv);
  end;
end;

function TModelCadAbstractTofolo.AjustarMemTable: iCadastros;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
begin
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(PegarTClassCadastro.ClassInfo);

    PegarFDMemTable.First;

    while not PegarFDMemTable.Eof do
    begin
      for Propriedade in Tipo.GetProperties do
      begin
        if (PegarFDMemTable.FindField(LowerCase(Propriedade.Name)) <> Nil) and
           (PegarFDMemTable.FieldByName(LowerCase(Propriedade.Name)).DataType in [ftDate, ftTime, ftDateTime]) and
           (PegarFDMemTable.FieldByName(LowerCase(Propriedade.Name)).Value = 0) then
        begin
          PegarFDMemTable.Edit;
          PegarFDMemTable.FieldByName(LowerCase(Propriedade.Name)).Clear;
          PegarFDMemTable.Post;
        end;
      end;

      PegarFDMemTable.Next;
    end;

  finally
    Contexto.Free;
  end;

  PegarFDMemTable.First;
end;}
{$ENDREGION}

{$REGION 'Procedure/Function - Virtual'}
function TModelCadAbstractTofolo.ModelBeforePost: boolean; begin Result := True; end;
function TModelCadAbstractTofolo.PegarSQLWhereCadastro: string; begin Result := ''; end;
function TModelCadAbstractTofolo.PegarEnumSQLGrade: TSQLEnum; begin Result := sqlNull end;
procedure TModelCadAbstractTofolo.ExcluirRegistrosAuxiliares; begin {} end;
procedure TModelCadAbstractTofolo.AtualizarParamsQueryGrade; begin {} end;
procedure TModelCadAbstractTofolo.AtualizarParamsQueryLista; begin {} end;
{$ENDREGION}

{$REGION 'Propertys'}
procedure TModelCadAbstractTofolo.ConferirAssinatura(_AComponent: TComponent);
begin
  if not Assigned(_AComponent) then
    raise Exception.Create('Falha componente não informado no ModelCadAbstract');
end;

function TModelCadAbstractTofolo.PegarCDSCadastro: TClientDataSet;
begin
  ConferirAssinatura(FRecOnFormShow.cdsCadastro);
  Result := FRecOnFormShow.cdsCadastro;
end;

function TModelCadAbstractTofolo.PegarDSCadastro: TDataSource;
begin
  ConferirAssinatura(FRecOnFormShow.dsCadastro);
  Result := FRecOnFormShow.dsCadastro;
end;

function TModelCadAbstractTofolo.PegarDSPCadastro: TDataSetProvider;
begin
  ConferirAssinatura(FRecOnFormShow.dspCadastro);
  Result := FRecOnFormShow.dspCadastro;
end;

function TModelCadAbstractTofolo.PegarMTCadastro: TFDMemTable;
begin
  ConferirAssinatura(FRecOnFormShow.mtCadastro);
  Result := FRecOnFormShow.mtCadastro;
end;

function TModelCadAbstractTofolo.PegarGridConsulta: TDBGrid;
begin
  ConferirAssinatura(FRecOnFormShow.gConsultaCadastro);
  Result := FRecOnFormShow.gConsultaCadastro;
end;

function TModelCadAbstractTofolo.PegarQCadastro: TFDQuery;
begin
  ConferirAssinatura(FRecOnFormShow.qCadastro);
  Result := FRecOnFormShow.qCadastro;
end;

function TModelCadAbstractTofolo.PegarQConsultaGrade: TFDQuery;
begin
  ConferirAssinatura(FRecOnFormShow.qConsultaGrade);
  Result := FRecOnFormShow.qConsultaGrade;
end;

function TModelCadAbstractTofolo.SetRecOnFormShow(_ARecOnFormShow: TRecOnFormShow): iCadastros;
begin
  Result := Self;

  FRecOnFormShow := _ARecOnFormShow;
end;
{$ENDREGION}

{$REGION 'SQLs'}
function TModelCadAbstractTofolo.AjustarSQLDataSourceGrade: iCadastros;
begin
  Result := Self;

  if (PegarEnumSQLGrade = sqlNull) then
    Exit;

  PegarQConsultaGrade
    .PrepareSQL(
      TSQLGeral.New
        .SetEnumSQL(PegarEnumSQLGrade)
          .PegarSQL
    );

  AtualizarParamsQueryGrade;
end;

procedure TModelCadAbstractTofolo.AjustarSQLDataSourceLista;
begin
  if not Assigned(PegarGridConsulta.DataSource) then
    PegarGridConsulta.DataSource := PegarDSCadastro;

  PegarQCadastro.PrepareSQL(MontarSQLLista);

  AtualizarParamsQueryLista;
end;

function TModelCadAbstractTofolo.MontarSQLLista: string;
var
  ACampos: string;
  ATabela: string;
  ALeftJoin: string;
  APropFK: TAttributeFK;
  Propriedade: TRttiProperty;
  APropsAttributes: TPropsAttributes;
  PropriedadeFK: TRttiProperty;
  APropsAttributesFK: TPropsAttributes;
  AttributeDescricaoPesquisa: TAttributeDescricaoPesquisa;

  procedure AddCampoSQL(_ACampo: string; _AFK: boolean = false);
  begin
    if (not ACampos.IsEmpty) then
      ACampos := ACampos + ',';

    ACampos := ACampos + ATabela.ToUpper +'.'+ _ACampo.ToUpper;

    if _AFK then
      ACampos := ACampos +' '+ _ACampo.ToUpper +'_'+ ATabela.ToUpper;
  end;

  function TabelaPrincipal: string;
  begin
    Result := PegarTClassCadastro.ClassName.Substring(1, PegarTClassCadastro.ClassName.Length).ToUpper;
  end;
begin
  ACampos := EmptyStr;
  ALeftJoin := EmptyStr;

  for Propriedade in PegarPropriedades(PegarTClassCadastro.ClassInfo) do
  begin
    APropsAttributes := TPropsAttributes.Create;
    try
      if (EhMeuAtributo(APropsAttributes, Propriedade)) then
      begin
        ATabela := TabelaPrincipal;
        APropFK := APropsAttributes.PropFK;

        if Assigned(APropFK) then
        begin
          AddCampoSQL(Propriedade.Name);

          for PropriedadeFK in TRttiContext.Create.GetType(APropFK.ClassFK).GetProperties do
          begin
            APropsAttributesFK := TPropsAttributes.Create;
            try
              if EhMeuAtributo(APropsAttributesFK, PropriedadeFK) then
              begin
                AttributeDescricaoPesquisa := APropsAttributesFK.DescricaoPesquisa;

                ATabela := APropFK.ClassFK.ClassName.Substring(1, APropFK.ClassFK.ClassName.Length);

                if Assigned(AttributeDescricaoPesquisa) then
                begin
                  AddCampoSQL(PropriedadeFK.Name, True);

                  ALeftJoin := ALeftJoin +' LEFT JOIN '+ ATabela.ToUpper + ' ON '+ TabelaPrincipal +'.'+ Propriedade.Name.ToUpper +' = '+ ATabela.ToUpper +'.'+ Propriedade.Name.Replace('_', '', [rfReplaceAll]).ToUpper;
                end;
              end;
            finally
              FreeAndNil(APropsAttributesFK);
            end;
          end;
        end
        else
          AddCampoSQL(Propriedade.Name);
      end;
    finally
      FreeAndNil(APropsAttributes);
    end;
  end;

  Result :=          'SELECT '+ ACampos;
  Result := Result + ' FROM '+ TabelaPrincipal;
  Result := Result + ALeftJoin;
  Result := Result + PegarSQLWhereCadastro;
  Result := Result + ' ORDER BY 1';
end;
{$ENDREGION}

function TModelCadAbstractTofolo.onFormShow(_ARecOnFormShow: TRecOnFormShow): iCadastros;
begin
  Result := Self;

  SetRecOnFormShow(_ARecOnFormShow);
  SetTituloTela(_ARecOnFormShow.ProcTitulo);
  AjustarSQLDataSourceLista;
  AjustarSQLDataSourceGrade;
  {UpdateDataSet;}
  AjustarGrid;
  {AjustarMemTable;}
  AtualizarRegistros;
  AjustarQueryGrid;
end;

{$REGION 'Ajustando_GRID'}
function TModelCadAbstractTofolo.PegarPropriedades(_ATypeInfo: Pointer): TArray<TRttiProperty>;
begin
  Result := TRttiContext.Create.GetType(_ATypeInfo).GetProperties;
end;

function TModelCadAbstractTofolo.EhMeuAtributo(_APropsAttributes: TPropsAttributes;
                                               _APropriedade: TRttiProperty): boolean;
var
  Atributo: TCustomAttribute;
begin
  for Atributo in _APropriedade.GetAttributes do
  begin
    if Atributo is TAttributeinVisible then
      _APropsAttributes.Visible(Atributo as TAttributeinVisible);

    if Atributo is TAttributeFieldType then
      _APropsAttributes.AFieldType(Atributo as TAttributeFieldType);

    if Atributo is TAttributeTitulo then
      _APropsAttributes.Titulo(Atributo as TAttributeTitulo);

    if Atributo is TAttributeWidth then
      _APropsAttributes.Width(Atributo as TAttributeWidth);

    if Atributo is TAttributeMonetario then
      _APropsAttributes.Monetario(Atributo as TAttributeMonetario);

    if Atributo is TAttributeFK then
      _APropsAttributes.PropFK(Atributo as TAttributeFK);

    if Atributo is TAttributeDescricaoPesquisa then
      _APropsAttributes.DescricaoPesquisa(Atributo as TAttributeDescricaoPesquisa);
  end;

  Result := _APropsAttributes.isMyAttribute;
end;

procedure TModelCadAbstractTofolo.AdicionarColunaGrid(_APropsAttributes: TPropsAttributes;
                                                      _APropriedade: TRttiProperty;
                                                      _APropClassFK: string = '');
var
  AFieldName: string;
  AttributeMonetario: TAttributeMonetario;
  AtributoTitulo: TAttributeTitulo;
  AttributeInvisible: TAttributeInvisible;
  AttributeWidth: TAttributeWidth;
begin
  with PegarGridConsulta.Columns.Add do
  begin
    AFieldName := EmptyStr;
    if (not _APropClassFK.IsEmpty) then
      AFieldName := '_'+ _APropClassFK.Substring(1, _APropClassFK.Length).ToLower;

    FieldName := _APropriedade.Name.ToLower + AFieldName;

    AtributoTitulo     := _APropsAttributes.Titulo;
    AttributeInvisible := _APropsAttributes.Visible;
    AttributeWidth     := _APropsAttributes.Width;
    AttributeMonetario := _APropsAttributes.Monetario;

    if Assigned(AtributoTitulo) then
      Title.Caption := AtributoTitulo.Titulo;

    if Assigned(AttributeMonetario) then
      Width := 130
    else if (Assigned(AttributeWidth)) and (AttributeWidth.Width > 0) then
      Width := AttributeWidth.Width
    else if _APropriedade.PropertyType.TypeKind in [tkString, tkUString, tkWString, tkLString] then
      Width := 225
    else if _APropriedade.PropertyType.TypeKind in [tkChar, tkWChar] then
      Width := 50;

    if Assigned(AttributeInvisible) then
      Visible := (AttributeInvisible.IsInvisible);
  end;
end;

procedure TModelCadAbstractTofolo.AdicionarColunaGridFK(_APropFK: TAttributeFK);
var
  AttributeDescricaoPesquisa: TAttributeDescricaoPesquisa;
  APropsAttributes: TPropsAttributes;
  Propriedade: TRttiProperty;
begin
  for Propriedade in TRttiContext.Create.GetType(_APropFK.ClassFK).GetProperties do
  begin
    APropsAttributes := TPropsAttributes.Create;
    try
      if EhMeuAtributo(APropsAttributes, Propriedade) then
      begin
        AttributeDescricaoPesquisa := APropsAttributes.DescricaoPesquisa;

        if Assigned(AttributeDescricaoPesquisa) then
          AdicionarColunaGrid(APropsAttributes, Propriedade, _APropFK.ClassFK.ClassName);
      end;
    finally
      FreeAndNil(APropsAttributes);
    end;
  end;
end;

function TModelCadAbstractTofolo.AjustarGrid: iCadastros;
var
  APropFK: TAttributeFK;
  Propriedade: TRttiProperty;
  APropsAttributes: TPropsAttributes;
begin
  Result := Self;

  PegarGridConsulta.Columns.Clear;

  for Propriedade in PegarPropriedades(PegarTClassCadastro.ClassInfo) do
  begin
    APropsAttributes := TPropsAttributes.Create;
    try
      if (EhMeuAtributo(APropsAttributes, Propriedade)) then
      begin
        APropFK := APropsAttributes.PropFK;

        if Assigned(APropFK) then
          AdicionarColunaGridFK(APropFK)
        else
          AdicionarColunaGrid(APropsAttributes, Propriedade);
      end;
    finally
      FreeAndNil(APropsAttributes);
    end;
  end;
end;

procedure TModelCadAbstractTofolo.onGetTextBoolean(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;

  Text := EmptyStr;
end;

procedure TModelCadAbstractTofolo.AjustarQueryGrid;
var
  Propriedade: TRttiProperty;
  APropsAttributes: TPropsAttributes;
  AttributeMonetario: TAttributeMonetario;
  AAttributeFieldType: TAttributeFieldType;
begin
  for Propriedade in PegarPropriedades(PegarTClassCadastro.ClassInfo) do
  begin
    APropsAttributes := TPropsAttributes.Create;
    try
      if (EhMeuAtributo(APropsAttributes, Propriedade)) then
      begin
        AttributeMonetario  := APropsAttributes.Monetario;
        AAttributeFieldType := APropsAttributes.AFieldType;

        if (Assigned(AttributeMonetario)) and (Assigned(PegarCDSCadastro.FindField(Propriedade.Name.ToLower))) then
          TCurrencyField(PegarCDSCadastro.FindField(Propriedade.Name.ToLower)).DisplayFormat := ',0.00'
        else if Assigned(AAttributeFieldType) and (AAttributeFieldType.AFieldType = ftBoolean) then
          PegarCDSCadastro.FindField(Propriedade.Name.ToLower).OnGetText := onGetTextBoolean;
      end;
    finally
      FreeAndNil(APropsAttributes);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Aba_Cadastro'}
function TModelCadAbstractTofolo.CancelarInserirEditarCadastro: iCadastros;
begin
  case PegarCDSCadastro.State of
    dsEdit
    , dsInsert:
      PegarCDSCadastro.Cancel;
  end;
end;

function TModelCadAbstractTofolo.ExecutarBeforePostNaView: boolean;
begin
  Result := True;
  if Assigned(FRecOnFormShow.FuncExecutarBeforePostNaView) then
    Result := FRecOnFormShow.FuncExecutarBeforePostNaView;
end;

procedure TModelCadAbstractTofolo.DoAfterApplyUpdateAbstract(Sender: TObject; var OwnerData: OleVariant);
begin

  if Assigned(FRecOnFormShow.FuncExecutarAfterPostNaView) then
    FRecOnFormShow.FuncExecutarAfterPostNaView;

  inherited;
end;

function TModelCadAbstractTofolo.GravarCadastro: iCadastros;
begin
  case PegarCDSCadastro.State of
    dsEdit
    , dsInsert: begin
      if (not ExecutarBeforePostNaView) then
        Abort;

      if (not ModelBeforePost) then
        Abort;

      PegarCDSCadastro.AfterApplyUpdates := DoAfterApplyUpdateAbstract;

      PegarCDSCadastro.Post;
      PegarCDSCadastro.ApplyUpdates(0);
    end;
  end;
end;

function TModelCadAbstractTofolo.AtualizarRegistros: iCadastros;
begin
  Result := Self;

  if PegarCDSCadastro.Active then
    PegarCDSCadastro.Refresh
  else
    PegarCDSCadastro.Active := True;

  FRecOnFormShow.ProcAtualizarConsultaGrade;
end;

procedure TModelCadAbstractTofolo.ExcluirRegistroAtual;
const
  MAX_ERRORS = 0;
begin
  ExcluirRegistrosAuxiliares;

  PegarCDSCadastro.Delete;

  if PegarCDSCadastro.ApplyUpdates(MAX_ERRORS) = MAX_ERRORS then
    TLibMessages.New.Informar('Registro excluído com sucesso!');

  FRecOnFormShow.ProcAtualizarConsultaGrade;
end;

function TModelCadAbstractTofolo.ExcluirCadastro: iCadastros;
begin
  if (not PegarCDSCadastro.Active) or (PegarCDSCadastro.IsEmpty) then
    raise Exception.Create('Nenhum registro encontrado para excluir!');

  if (TLibMessages.New.Confirmar('Tem certeza que deseja excluir o registro?')) then
    ExcluirRegistroAtual;
end;
{$ENDREGION}

end.

