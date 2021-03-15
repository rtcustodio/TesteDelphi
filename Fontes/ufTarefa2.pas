unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.threading, uspClasses.Contador;

type
  TfTarefa2 = class(TForm)
    edtTempoThread1: TEdit;
    edtTempoThread2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnExecutaThread: TBitBtn;
    pgBar1: TProgressBar;
    pgBar2: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnExecutaThreadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function ExecutaContagem(Contador : TContador; barraProgresso: TProgressBar;
  Intervalo: Integer) : TContador;
    var
      Contador1 : TContador;
      Contador2 : TContador;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfTarefa2 }

uses uspUtils;

procedure TfTarefa2.btnExecutaThreadClick(Sender: TObject);
begin
  if Assigned(Contador1) and (not Contador1.Finished) then
    ShowMessage('Contador1 está executando')
  else
    Contador1:=  ExecutaContagem( Contador1, pgBar1, StrToIntDef(edtTempoThread1.Text, 1000));

  if Assigned(Contador2) and (not Contador2.Finished) then
    ShowMessage('Contador2 está executando')
  else
    Contador2:=  ExecutaContagem( Contador2, pgBar2, StrToIntDef(edtTempoThread2.Text, 1000));
end;

function TfTarefa2.ExecutaContagem(Contador : TContador; barraProgresso: TProgressBar;
  Intervalo: Integer) : TContador;
begin
  Contador := TContador.Create;
  Contador.Intervalo        := Intervalo;
  Contador.QuantidadeLoops  := 100;
  Contador.barraProgresso   := barraProgresso;
  Contador.Resume;
  Result := Contador;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FechaForm(Sender, Action);
end;

end.
