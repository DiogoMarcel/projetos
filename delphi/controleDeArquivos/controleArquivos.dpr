program controleArquivos;

uses
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Forms,
  System.SysUtils,
  view.main in 'view.main.pas' {viewMain},
  view.default.others in 'view.default.others.pas' {viewDefaultOthers},
  view.cadastro.versoes in 'view.cadastro.versoes.pas' {viewCadastroVersoes};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.Title := 'Controle de arquivos';
  Application.CreateForm(TviewMain, viewMain);
  Application.Run;
end.
