program DelphiDay;

uses
  Vcl.Forms,
  DelphiDay.View.Principale in 'View\DelphiDay.View.Principale.pas' {DelphiDayViewPrincipale},
  DelphiDay.Controller.Dipendente.Factory in 'Controller\Dipendente\DelphiDay.Controller.Dipendente.Factory.pas',
  DelphiDay.Controller.Dipendente.Interfaces in 'Controller\Dipendente\DelphiDay.Controller.Dipendente.Interfaces.pas',
  DelphiDay.Controller.Dipendente.Entity in 'Controller\Dipendente\DelphiDay.Controller.Dipendente.Entity.pas',
  DelphiDay.Model.Database.Factory in 'Model\Database\DelphiDay.Model.Database.Factory.pas',
  DelphiDay.Model.Database.Interfaces in 'Model\Database\DelphiDay.Model.Database.Interfaces.pas',
  DelphiDay.Model.Database.Connessione.FireDAC in 'Model\Database\FireDAC\DelphiDay.Model.Database.Connessione.FireDAC.pas',
  DelphiDay.Model.Database.Query.FireDAC in 'Model\Database\FireDAC\DelphiDay.Model.Database.Query.FireDAC.pas',
  DelphiDay.Controller.Dipendente in 'Controller\Dipendente\DelphiDay.Controller.Dipendente.pas',
  DelphiDay.Model.Dipendente in 'Model\Dipendente\DelphiDay.Model.Dipendente.pas',
  DelphiDay.Model.Dipendente.Factory in 'Model\Dipendente\DelphiDay.Model.Dipendente.Factory.pas',
  DelphiDay.Model.Dipendente.Interfaces in 'Model\Dipendente\DelphiDay.Model.Dipendente.Interfaces.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDelphiDayViewPrincipale, DelphiDayViewPrincipale);
  Application.Run;
end.
