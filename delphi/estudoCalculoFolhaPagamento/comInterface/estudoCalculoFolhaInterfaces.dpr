program estudoCalculoFolhaInterfaces;

uses
  Vcl.Forms,
  view.Principal in 'src\view.Principal.pas' {Form1},
  dp.component in 'src\composite\dp.component.pas',
  dp.composite in 'src\composite\dp.composite.pas',
  dp.leaf.complementar in 'src\composite\dp.leaf.complementar.pas',
  dp.leaf.mensal in 'src\composite\dp.leaf.mensal.pas',
  dp.leaf.ferias in 'src\composite\dp.leaf.ferias.pas',
  dp.leaf.rescisao in 'src\composite\dp.leaf.rescisao.pas',
  dp.leaf.decSalario in 'src\composite\dp.leaf.decSalario.pas',
  dp.leaf.abstract in 'src\composite\dp.leaf.abstract.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
