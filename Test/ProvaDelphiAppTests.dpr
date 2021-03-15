program ProvaDelphiAppTests;
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
  uspQuery in '..\Fontes\uspQuery.pas',
  DUnitTestRunner,
  TestuspClasses.ClientDataSetUtils in 'TestuspClasses.ClientDataSetUtils.pas',
  uspClasses.ClientDataSetUtils in '..\Fontes\uspClasses.ClientDataSetUtils.pas',
  TestuspQuery in 'TestuspQuery.pas',
  TestuspClasses.Contador in 'TestuspClasses.Contador.pas',
  uspClasses.Contador in '..\Fontes\uspClasses.Contador.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

