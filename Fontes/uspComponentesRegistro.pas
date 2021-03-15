unit uspComponentesRegistro;

interface

procedure Register;

implementation

  uses System.Classes, uspQuery;

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

end.
