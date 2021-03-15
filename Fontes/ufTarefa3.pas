unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfTarefa3 = class(TForm)
    Label1: TLabel;
    dbgRegistros: TDBGrid;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CriaDataSource(var DataSource : TDataSource);
    procedure CriaClientDataSet(var ClientDataSet: TClientDataSet);
    procedure CriaRegistros;
    function CalculaTotalColuna(ClientDataSet : TClientDataSet; IndiceColuna : integer) : Double;
    function CalculaTotalDivisoesColuna(ClientDataSet : TClientDataSet; IndiceColuna : integer) : Double;
    procedure ConfiguraGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    cdsRegistros : TClientDataSet;
    dsRegistros  : TDataSource;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uspUtils, uspClasses.ClientDataSetUtils;

procedure TfTarefa3.BitBtn1Click(Sender: TObject);
begin
  edtTotal.Text := FormatFloat('#0,.00', CalculaTotalColuna(cdsRegistros, cdsRegistros.FieldByName('Valor').Index));
end;

procedure TfTarefa3.BitBtn2Click(Sender: TObject);
begin
  edtTotalDivisoes.Text := FormatFloat('#0,.00', CalculaTotalDivisoesColuna(cdsRegistros, cdsRegistros.FieldByName('Valor').Index) );
end;

function TfTarefa3.CalculaTotalColuna(ClientDataSet : TClientDataSet; IndiceColuna : integer) : Double;
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

function TfTarefa3.CalculaTotalDivisoesColuna(ClientDataSet : TClientDataSet; IndiceColuna : integer) : Double;
var
  Valor1, Valor2 : Double;
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

procedure TfTarefa3.ConfiguraGrid;
begin
  dbgRegistros.DataSource := dsRegistros;
end;

procedure TfTarefa3.CriaClientDataSet(var ClientDataSet: TClientDataSet);
begin
  ClientDataSet := TClientDataSet.Create(Self);
  ClientDataSet.Close;
  ClientDataSet.FieldDefs.Clear;
  ClientDataSet.FieldDefs.add('IdProjeto',ftInteger);
  ClientDataSet.FieldDefs.add('NomeProjeto',ftString,250);
  ClientDataSet.FieldDefs.add('Valor',ftFloat);
  ClientDataSet.CreateDataSet;
  TFloatField( ClientDataSet.FieldByName('Valor') ).Currency := true;
end;

procedure TfTarefa3.CriaDataSource(var DataSource : TDataSource);
begin
  DataSource := TDataSource.Create(Self);
  DataSource.DataSet := cdsRegistros;
end;

procedure TfTarefa3.CriaRegistros;
var
  I: Integer;
begin
  for I := 1 to 10 do
  begin
    cdsRegistros.Append;
    cdsRegistros.FieldByName('IdProjeto').AsInteger   := I ;
    cdsRegistros.FieldByName('NomeProjeto').AsString  := 'Projeto ' + IntToStr(I) ;
    cdsRegistros.FieldByName('Valor').AsFloat         := Random(1000);
    cdsRegistros.Post;
  end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dsRegistros);
  FreeAndNil(cdsRegistros);
  FechaForm(Sender, Action);
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
var
  cds : TClientDataSetAux;
begin
  cds := TClientDataSetAux.Create(dbgRegistros);
  cds.CriaRegistros;
  ShowMessage(FormatFloat('#0.,00', cds.CalculaTotalColuna(2)) );
//  CriaClientDataSet(cdsRegistros);
//  CriaDataSource(dsRegistros);
//  ConfiguraGrid;
//  CriaRegistros;
end;

end.
