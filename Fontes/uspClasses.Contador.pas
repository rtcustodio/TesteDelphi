unit uspClasses.Contador;

interface

uses VCL.ComCtrls, System.threading, System.SysUtils,
  Classes, Controls, StdCtrls, Forms;

type
 TContador = class(TThread)
 private
   FbarraProgresso: TProgressBar;
   FPrioridade: Integer;
   FQuantidadeLoops: Integer;
   FIntervalo: Integer;
   procedure SetIntervalo(const Value: Integer);
   procedure SetQuantidadeLoops(const Value: Integer);
   procedure DefinePrioridade;
 public
   constructor Create;
   property barraProgresso: TProgressBar read FbarraProgresso write FbarraProgresso;
   property Prioridade: Integer read FPrioridade write FPrioridade;
   property Intervalo : Integer read FIntervalo write SetIntervalo;
   property QuantidadeLoops :Integer read FQuantidadeLoops write SetQuantidadeLoops;
 protected
   procedure Execute; override;
 end;

implementation

{ TThreadProgresso }

constructor TContador.Create;
begin
  inherited;
  Intervalo       := 1000;
  QuantidadeLoops := 100;
  FreeOnTerminate := true;
  Prioridade      := 1;
end;

procedure TContador.DefinePrioridade;
begin
  case FPrioridade of
    0: Priority := tpLower;
    1: Priority := tpNormal;
    2: Priority := tpHigher;
    3: Priority := tpTimeCritical;
  end;
end;

procedure TContador.Execute;
var
 I: Integer;
begin
  DefinePrioridade;
  if Assigned(Fbarraprogresso) then
  begin
    FbarraProgresso.Max := QuantidadeLoops;
    FbarraProgresso.Position := 0;
  end;
  for I := 0 to QuantidadeLoops -1 do
  begin
    if Assigned(Fbarraprogresso) then
      FbarraProgresso.StepBy(1);
    Sleep(Intervalo);
  end;
  Application.ProcessMessages();
  Self.Terminate;
  inherited;
end;

procedure TContador.SetIntervalo(const Value: Integer);
begin
  FIntervalo := Value;
end;

procedure TContador.SetQuantidadeLoops(const Value: Integer);
begin
  FQuantidadeLoops := Value;
end;

end.
