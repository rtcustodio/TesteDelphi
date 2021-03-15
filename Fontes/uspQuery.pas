unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;

    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);

    function PreparaColunas : string;
    function PreparaTabela : string;
    function PreparaCondicoes : string;
    function LimpaLinhasEmBrancoStringList(StringList : TStringList) : TStringList;
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    procedure GeraSQL;
  published
    property spCondicoes : TStringList read FspCondicoes write SetspCondicoes;
    property spColunas : TStringList read FspColunas write SetspColunas;
    property spTabelas : TStringList read FspTabelas write SetspTabelas;
  end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited;
  FspCondicoes := TStringList.Create;
  FspColunas := TStringList.Create;
  FspTabelas := TStringList.Create;
  FspColunas.Delimiter := ',';
end;

destructor TspQuery.Destroy;
begin
  FreeAndNil(FspCondicoes);
end;

procedure TspQuery.GeraSQL;
begin
  SQL.Clear;
  SQL.Add(PreparaColunas);
  SQL.Add(PreparaTabela);
  SQL.Add(PreparaCondicoes);
end;

function TspQuery.LimpaLinhasEmBrancoStringList(
  StringList: TStringList): TStringList;
var
  I : integer;
begin
  for I := StringList.Count -1 downto 0 do
    if (StringList.Strings[i] = '') then
      StringList.Delete(i);
  Result := StringList;
end;

function TspQuery.PreparaColunas: string;
begin
  FspColunas := LimpaLinhasEmBrancoStringList(FspColunas);
  if FspColunas.Count = 0 then
    raise Exception.Create('Ao menos uma coluna deve ser informada');
  Result := 'SELECT ' + spColunas.DelimitedText;
end;

function TspQuery.PreparaCondicoes: string;
var
  I: Integer;
begin
  FspCondicoes := LimpaLinhasEmBrancoStringList(FspCondicoes);
  if spCondicoes.Count = 0 then Exit;
  Result := 'where ';
  for I := 0 to spCondicoes.Count -1 do
  begin
    Result := Result + spCondicoes[I];
    if I < spCondicoes.Count -1 then Result := Result + sLineBreak + 'and ';
  end;
end;


function TspQuery.PreparaTabela: string;
var
  I : integer;
begin
  FspTabelas := LimpaLinhasEmBrancoStringList(FspTabelas);

  if spTabelas.Count > 1 then
    raise Exception.Create('Apenas uma tabela deve ser informada');
  if spTabelas.Count = 0 then
    raise Exception.Create('Ao menos uma tabela deve ser informada');
  Result := 'FROM ' + Trim(spTabelas.Text);
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  FspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  FspCondicoes := Value;
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  FspTabelas := Value;
end;

end.
