program FinancasZeroUmTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  view.geral in '..\library\lib.view.geral\view.geral.pas' {formTemplate},
  lib.proc.objects in '..\library\lib.proc.objects\lib.proc.objects.pas',
  pkg.json.interfaces in '..\library\lib.pkg.JSON\pkg.json.interfaces.pas',
  pkg.json.template in '..\library\lib.pkg.JSON\pkg.json.template.pas',
  model.lib.aguarde in '..\library\lib.models\model.lib.aguarde.pas',
  model.lib.interfaces in '..\library\lib.models\model.lib.interfaces.pas',
  model.lib in '..\library\lib.models\model.lib.pas',
  lib.login.view in '..\library\lib.login\lib.login.view.pas',
  data.images in '..\library\lib.images\data.images.pas',
  Firebase.Auth in '..\library\lib.Firebase\Firebase.Auth.pas',
  Firebase.Database in '..\library\lib.Firebase\Firebase.Database.pas',
  Firebase.Interfaces in '..\library\lib.Firebase\Firebase.Interfaces.pas',
  Firebase.Request in '..\library\lib.Firebase\Firebase.Request.pas',
  Firebase.Response in '..\library\lib.Firebase\Firebase.Response.pas',
  lib.DAO.dataModel in '..\library\lib.DAO\lib.DAO.dataModel.pas',
  controller.lib.interfaces in '..\library\lib.controllers\controller.lib.interfaces.pas',
  controller.lib in '..\library\lib.controllers\controller.lib.pas',
  consts.enums in '..\library\lib.consts\consts.enums.pas',
  consts.styles in '..\library\lib.consts\consts.styles.pas',
  consts.views.forms in '..\library\lib.consts\consts.views.forms.pas',
  lib.conexao.db.interfaces in '..\library\lib.conexao.db\lib.conexao.db.interfaces.pas',
  lib.conexao.factory in '..\library\lib.conexao.db\lib.conexao.factory.pas',
  lib.DAO.conexao.config in '..\library\lib.conexao.db\lib.DAO.conexao.config.pas',
  lib.DAO.conexao in '..\library\lib.conexao.db\lib.DAO.conexao.pas',
  lib.login.realtimedb.config in '..\library\lib.conexao.db\lib.login.realtimedb.config.pas',
  lib.login.realtimedb in '..\library\lib.conexao.db\lib.login.realtimedb.pas',
  lib.RT.conexao in '..\library\lib.conexao.db\lib.RT.conexao.pas',
  classes.template.despesa in '..\library\lib.classes\classes.template.despesa.pas',
  classes.template.interfaces in '..\library\lib.classes\classes.template.interfaces.pas',
  classes.template.portador in '..\library\lib.classes\classes.template.portador.pas',
  classes.template.unified in '..\library\lib.classes\classes.template.unified.pas',
  attributes.custom.interfaces in '..\library\lib.attributes\attributes.custom.interfaces.pas',
  attributes.custom in '..\library\lib.attributes\attributes.custom.pas',
  view.aguarde in '..\library\lib.view.geral\view.aguarde.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

