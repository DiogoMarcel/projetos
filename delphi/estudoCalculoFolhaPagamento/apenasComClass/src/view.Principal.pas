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

    function PegarCalculo: TCalculo;

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

function TForm1.PegarCalculo: TCalculo;
begin
  case ComboBox1.ItemIndex of
    0: begin
      Result := TCalculoMensal.Create;

      (Result as TCalculoMensal).AdicionarExibicaoDeQualCalculo(ExibirCalculoMemo);
      {Problema de não ser uma interface - precisa replicar para todos o CAST}

    end;

    1: begin
      Result := TCalculoFerias.Create;
      (Result as TCalculoFerias).AdicionarExibicaoDeQualCalculo(ExibirCalculoMemo);
    end;

    2: begin
      Result := TCalculoRescisao.Create;
      (Result as TCalculoRescisao).AdicionarExibicaoDeQualCalculo(ExibirCalculoMemo);
    end;

    3: begin
      Result := TCalculo13Salario.Create;
      (Result as TCalculo13Salario).AdicionarExibicaoDeQualCalculo(ExibirCalculoMemo);
    end;

    4: begin
      Result := TCalculoComplementar.Create;
      (Result as TCalculoComplementar).AdicionarExibicaoDeQualCalculo(ExibirCalculoMemo);
    end;

    else
      raise Exception.Create('Tipo de cálculo não reconhecido!');
  end;
end;

procedure TForm1.AdicionarCalculoNaListaComposite;
begin
  Memo1.Lines.Add(Format('Calcular -> %s', [ComboBox1.Text]));

  FPacoteCalculo.AdicionarCalculo(PegarCalculo);
end;

procedure TForm1.ExecutarCalculoLeaf;
var
  ACalculo: TCalculo;
begin
  ACalculo := PegarCalculo;
  try
    Memo2.Lines.Add('Resultado final individual'+ sLineBreak + FormatFloat(',0.00', ACalculo.ExecutarCalculo));
  finally
    FreeAndNil(ACalculo);
  end;
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
