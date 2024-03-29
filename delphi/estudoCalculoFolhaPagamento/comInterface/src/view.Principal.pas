unit view.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids
  ,dp.composite
  ,dp.component
  ,dp.leaf.complementar
  ,dp.leaf.mensal
  ,dp.leaf.ferias
  ,dp.leaf.rescisao
  ,dp.leaf.decSalario;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Memo2: TMemo;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }

    FPacoteCalculo: TPacoteCalculo;

    function PegarCalculo: ICalculo;

    procedure AdicionarCalculoNaListaComposite;
    procedure LimparListaDeCalculos;
    procedure ExecutarCalculosComposite;
    procedure ExecutarCalculoLeaf;

    procedure ExibirCalculoMemo(_ADescricao: string);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ExecutarCalculosComposite;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  LimparListaDeCalculos;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  AdicionarCalculoNaListaComposite;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ExecutarCalculoLeaf;
end;

procedure TForm1.LimparListaDeCalculos;
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  FPacoteCalculo.LimparLista;
end;

function TForm1.PegarCalculo: ICalculo;
begin
  case ComboBox1.ItemIndex of
    0: Result := TCalculoMensal.Create;
    1: Result := TCalculoFerias.Create;
    2: Result := TCalculoRescisao.Create;
    3: Result := TCalculo13Salario.Create;
    4: Result := TCalculoComplementar.Create;
    else
      raise Exception.Create('Tipo de cálculo não reconhecido!');
  end;

  Result.AdicionarExibicaoDeQualCalculo(ExibirCalculoMemo);
end;

procedure TForm1.AdicionarCalculoNaListaComposite;
begin
  Memo1.Lines.Add(Format('Calcular -> %s', [ComboBox1.Text]));
  FPacoteCalculo.AdicionarCalculo(PegarCalculo);
end;

procedure TForm1.ExecutarCalculoLeaf;
begin
  Memo2.Lines.Add('Resultado final individual'+ sLineBreak + FormatFloat(',0.00', PegarCalculo.ExecutarCalculo));
end;

procedure TForm1.ExecutarCalculosComposite;
begin
  Memo2.Lines.Add('Resultado final: '+ FormatFloat(',0.00', FPacoteCalculo.ExecutarCalculo));
end;

procedure TForm1.ExibirCalculoMemo(_ADescricao: string);
begin
  Memo2.Lines.Add(_ADescricao);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPacoteCalculo := TPacoteCalculo.Create;
  FPacoteCalculo.AdicionarExibicaoDeQualCalculo(ExibirCalculoMemo);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FPacoteCalculo);
end;

end.
