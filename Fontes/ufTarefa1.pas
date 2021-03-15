unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.DApt,
  FireDAC.Phys.TDataDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.TData;

type
  TfTarefa1 = class(TForm)
    mmColunas: TMemo;
    mmTabela: TMemo;
    mmCondicoes: TMemo;
    mmSQL: TMemo;
    btnGeraSQL: TBitBtn;
    FDPhysTDataDriverLink1: TFDPhysTDataDriverLink;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
  private
    { Private declarations }
    procedure GerarSQL;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uspQuery, uspUtils;

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  GerarSQL;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FechaForm(Sender, Action);
end;

procedure TfTarefa1.GerarSQL;
var
  spQuery : TspQuery;
begin
  spQuery := TspQuery.Create(nil);
  try
    spQuery.spColunas.Assign(mmColunas.Lines);
    spQuery.spTabelas.Assign(mmTabela.Lines);
    spQuery.spCondicoes.Assign(mmCondicoes.Lines);
    spQuery.GeraSQL;
    mmSQL.Lines.Assign(spQuery.SQL);
  finally
    FreeAndNil(spQuery);
  end;
end;

end.
