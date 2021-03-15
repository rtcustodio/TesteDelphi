program ProvaDelphiApp;

uses
  Vcl.Forms,
  ufPrincipal in 'Fontes\ufPrincipal.pas' {fPrincipal},
  ufTarefa1 in 'Fontes\ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'Fontes\ufTarefa2.pas' {fTarefa2},
  uspClasses.Contador in 'Fontes\uspClasses.Contador.pas',
  uspUtils in 'Fontes\uspUtils.pas',
  ufTarefa3 in 'Fontes\ufTarefa3.pas' {fTarefa3},
  uspClasses.ClientDataSetUtils in 'Fontes\uspClasses.ClientDataSetUtils.pas',
  uspQuery in 'Fontes\uspQuery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
