program caixaJunino;

uses
  Vcl.Forms,
  view.principal in 'view.principal.pas' {fPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  view.cad.padrao in 'view.cad.padrao.pas' {fCadPadrao},
  data.geral in 'data.geral.pas' {datas: TDataModule},
  view.cad.fichas in 'view.cad.fichas.pas' {fCadFichas},
  view.cad.caixas in 'view.cad.caixas.pas' {fCadCaixas},
  view.cad.retiradas in 'view.cad.retiradas.pas' {fCadRetiradas},
  view.report in 'view.report.pas' {fReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Emerald Light Slate');
  Application.CreateForm(Tdatas, datas);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfReport, fReport);
  Application.Run;
end.
