unit uspUtils;

interface

uses VCL.Forms, DataSnap.DBClient, Data.DB, System.SysUtils;

procedure FechaForm(Sender: TObject; var Action: TCloseAction);
function CalculaTotalColuna(ClientDataSet : TClientDataSet; IndiceColuna : integer) : Double;

implementation

procedure FechaForm(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  (Sender as TForm).Release;
end;

function CalculaTotalColuna(ClientDataSet : TClientDataSet; IndiceColuna : integer) : Double;
begin
  if not (ClientDataSet.Fields[IndiceColuna].DataType in [ftFloat]) then
    raise Exception.Create('Somente pode calcular coluna do tipo Float');
  ClientDataSet.First;
  Result := 0;
  while not ClientDataSet.Eof do
  begin
    Result := Result + TFloatField(ClientDataSet.Fields[IndiceColuna]).Value;
    ClientDataSet.Next;
  end;
end;

end.
