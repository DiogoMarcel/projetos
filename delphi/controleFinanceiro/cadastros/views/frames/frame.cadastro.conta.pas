unit frame.cadastro.conta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.ControlList, Vcl.ExtCtrls, data.frame.cadastro.conta,
  System.Actions, Vcl.ActnList, Vcl.Imaging.pngimage;

type
  TframeCadConta = class(TFrame)
    pGeral: TPanel;
    clConta: TControlList;
    gpCabecalho: TGridPanel;
    lTituloFamilia: TLabel;
    lTituloTotal: TLabel;
    tValorTotal: TDBText;
    tDescricaoConta: TDBText;
    tValorConta: TDBText;
    tMembroFamilia: TDBText;
    iDebidaCartao: TImage;
    iFolhaPagamento: TImage;
    iPagamentoManual: TImage;
    iCalender: TImage;
    iDebitoAuto: TImage;
    procedure clContaBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure aExcluirExecute(Sender: TObject);
  private
    FdmConta        : TdmFrameConta;
    FValorTotal     : currency;
    FNome           : string;
    FTipoConta      : string;
    FIdMembroFamilia: integer;

    function GetIdMembroFamilia: integer;
    function GetNome: string;
    function GetTipoConta: string;
    function GetValorTotal: currency;

    procedure SetIdMembroFamilia(const Value: integer);
    procedure SetNome(const Value: string);
    procedure SetTipoConta(const Value: string);
    procedure SetValorTotal(const Value: currency);

    procedure AtualizarCDSFrame;

  public
    property ValorTotal     : currency read GetValorTotal      write SetValorTotal     ;
    property Nome           : string   read GetNome            write SetNome           ;
    property TipoConta      : string   read GetTipoConta       write SetTipoConta      ;
    property IdMembroFamilia: integer  read GetIdMembroFamilia write SetIdMembroFamilia;

    procedure OnCreate;
    procedure GerarSQLFrame;
    procedure MontarLista;
    procedure AtualizarLista;


  end;

implementation

uses
  consts.SQLs,
  lib.helper.querys,
  lib.sql.geral;

{$R *.dfm}

{ TframeCadConta }

procedure TframeCadConta.OnCreate;
begin
  FdmConta := TdmFrameConta.Create(Application);
end;

procedure TframeCadConta.AtualizarCDSFrame;
begin
  if FdmConta.cdsFrameGrade.Active then
    FdmConta.cdsFrameGrade.Refresh
  else
    FdmConta.cdsFrameGrade.Active := True;
end;

procedure TframeCadConta.AtualizarLista;
begin
  FdmConta
    .qFrameGrade
      .SetParamCurrency('pValorTotal', FValorTotal)
      .SetParamString('pTipoConta', FTipoConta)
      .SetParamString('pNome', FNome)
      .SetParamInteger('pMembroFamilia', FIdMembroFamilia);

  AtualizarCDSFrame;
end;

procedure TframeCadConta.GerarSQLFrame;
begin
  FdmConta
    .qFrameGrade
      .PrepareSQL(
        TSQLGeral.New
          .SetEnumSQL(sqlFrameConta)
            .PegarSQL)
      .SetParamCurrency('pValorTotal', FValorTotal)
      .SetParamString('pTipoConta', FTipoConta)
      .SetParamString('pNome', FNome)
      .SetParamInteger('pMembroFamilia', FIdMembroFamilia);

  AtualizarCDSFrame;

  TCurrencyField(FdmConta.cdsFrameGrade.FieldByName('VALOR')).currency := True;
end;

procedure TframeCadConta.MontarLista;
begin
  if not FdmConta.cdsFrameGrade.Active then
    Exit;

  tMembroFamilia.DataField   := 'NOME';
  tValorTotal.DataField      := 'VALORTOTAL';
  tDescricaoConta.DataField  := 'DESCRICAO';
  tValorConta.DataField      := 'VALOR';

  tMembroFamilia.DataSource   := FdmConta.dsFrameGrade;
  tValorTotal.DataSource      := FdmConta.dsFrameGrade;
  tDescricaoConta.DataSource  := FdmConta.dsFrameGrade;
  tValorConta.DataSource      := FdmConta.dsFrameGrade;

  clConta.ItemCount := FdmConta.cdsFrameGrade.RecordCount;
end;

procedure TframeCadConta.aExcluirExecute(Sender: TObject);
begin
  FdmConta.cdsFrameGrade.RecNo := clConta.ItemIndex+1;

  showmessage('Excluir / '+ FdmConta.cdsFrameGrade.FieldByName('IDCONTA').AsInteger.ToString);
end;

procedure TframeCadConta.clContaBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  if FdmConta.cdsFrameGrade.Active then
  begin
    FdmConta.cdsFrameGrade.RecNo := AIndex +1;

    iFolhaPagamento.Visible  := FdmConta.cdsFrameGrade.FieldByName('PERTENCEAFOLHA').AsBoolean;
    iDebidaCartao.Visible    := FdmConta.cdsFrameGrade.FieldByName('DEBITACARTAO').AsBoolean;
    iCalender.Visible        := FdmConta.cdsFrameGrade.FieldByName('CONTAANUAL').AsBoolean;
    iPagamentoManual.Visible := FdmConta.cdsFrameGrade.FieldByName('PAGAMENTOMANUAL').AsBoolean;
    iDebitoAuto.Visible      := FdmConta.cdsFrameGrade.FieldByName('DEBITOAUTO').AsBoolean;

    tDescricaoConta.Refresh;
  end;
end;

function TframeCadConta.GetIdMembroFamilia: integer;
begin
  Result := FIdMembroFamilia;
end;

function TframeCadConta.GetNome: string;
begin
  Result := FNome;
end;

function TframeCadConta.GetTipoConta: string;
begin
  Result := FTipoConta;
end;

function TframeCadConta.GetValorTotal: currency;
begin
  Result := FValorTotal;
end;

procedure TframeCadConta.SetIdMembroFamilia(const Value: integer);
begin
  FIdMembroFamilia := Value;
end;

procedure TframeCadConta.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TframeCadConta.SetTipoConta(const Value: string);
begin
  FTipoConta := Value;
end;

procedure TframeCadConta.SetValorTotal(const Value: currency);
begin
  FValorTotal := Value;
end;

end.

