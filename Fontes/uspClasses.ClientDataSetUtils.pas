unit uspClasses.ClientDataSetUtils;

interface

uses Data.DB, DataSnap.DBClient, System.SysUtils, VCL.DBGrids;

type
  TClientDataSetAux = class
  private
    FDataSource: TDataSource;
    FClientDataSet: TClientDataSet;
    FDBGrid: TDBGrid;
    procedure CriaClientDataSet;
    procedure CriaDataSource;
    procedure SetClientDataSet(const Value: TClientDataSet);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetDBGrid(var Value: TDBGrid);
    property DataSource : TDataSource read FDataSource write SetDataSource;
    property DBGrid : TDBGrid read FDBGrid write FDBGrid;
  public
    constructor Create(var Grid: TDBGrid);
    destructor Destroy;
    property ClientDataSet : TClientDataSet read FClientDataSet write SetClientDataSet;
    procedure CriaRegistros;
    function CalculaTotalColuna(IndiceColuna: integer): Double;
    function CalculaTotalDivisoesColuna(
  IndiceColuna: integer): Double;
  end;

implementation

{ TClientDataSetAux }

function TClientDataSetAux.CalculaTotalColuna(IndiceColuna: integer): Double;
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

function TClientDataSetAux.CalculaTotalDivisoesColuna(
  IndiceColuna: integer): Double;
var
  Valor1, Valor2, Divisao : Double;
  I: Integer;
begin
  if not (ClientDataSet.Fields[IndiceColuna].DataType in [ftFloat]) then
    raise Exception.Create('Somente pode calcular coluna do tipo Float');
  ClientDataSet.First;
  Result := 0;
  for I := 1 to ClientDataSet.RecordCount -1 do
  begin
    Valor1 := TFloatField(ClientDataSet.Fields[IndiceColuna]).Value;
    ClientDataSet.Next;
    Valor2 := TFloatField(ClientDataSet.Fields[IndiceColuna]).Value;
    Result := Result + (Valor2 / Valor1);
  end;

end;

constructor TClientDataSetAux.Create(var Grid: TDBGrid);
begin
  CriaClientDataSet;
  CriaDataSource;
  if Assigned(Grid) then
  begin
    DBGrid:=Grid;
    DBGrid.DataSource := DataSource;
  end;
end;

procedure TClientDataSetAux.CriaClientDataSet;
begin
  ClientDataSet := TClientDataSet.Create(nil);
  ClientDataSet.Close;
  ClientDataSet.FieldDefs.Clear;
  ClientDataSet.FieldDefs.add('IdProjeto',ftInteger);
  ClientDataSet.FieldDefs.add('NomeProjeto',ftString,250);
  ClientDataSet.FieldDefs.add('Valor',ftFloat);
  ClientDataSet.CreateDataSet;
  TFloatField( ClientDataSet.FieldByName('Valor') ).Currency := true;
end;

procedure TClientDataSetAux.CriaDataSource;
begin
  DataSource := TDataSource.Create(nil);
  DataSource.DataSet := ClientDataSet;
end;

procedure TClientDataSetAux.CriaRegistros;
var
  I: Integer;
begin
  for I := 1 to 10 do
  begin
    ClientDataSet.Append;
    ClientDataSet.FieldByName('IdProjeto').AsInteger   := I ;
    ClientDataSet.FieldByName('NomeProjeto').AsString  := 'Projeto ' + IntToStr(I) ;
    ClientDataSet.FieldByName('Valor').AsFloat         := Random(1000);
    ClientDataSet.Post;
  end;
end;

destructor TClientDataSetAux.Destroy;
begin
  ClientDataSet.Free;
  DataSource.Free;
end;

procedure TClientDataSetAux.SetClientDataSet(const Value: TClientDataSet);
begin
  FClientDataSet := Value;
end;

procedure TClientDataSetAux.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TClientDataSetAux.SetDBGrid(var Value: TDBGrid);
begin
  FDBGrid := Value;
end;

end.
