unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

type
  TfPrincipal = class(TForm)
    actmgrMenuPrincipal: TActionManager;
    actTarefa1: TAction;
    actTarefa2: TAction;
    actTarefa3: TAction;
    mmMenu: TMainMenu;
    arefas1: TMenuItem;
    actTarefa11: TMenuItem;
    actTarefa21: TMenuItem;
    acttarefa31: TMenuItem;
    procedure actTarefa1Execute(Sender: TObject);
    procedure actTarefa2Execute(Sender: TObject);
    procedure actTarefa3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

Uses ufTarefa1, uftarefa2, ufTarefa3;

procedure TfPrincipal.actTarefa1Execute(Sender: TObject);
var
  fTarefa1: TfTarefa1;
begin
  Application.CreateForm(TfTarefa1, fTarefa1);
end;

procedure TfPrincipal.actTarefa2Execute(Sender: TObject);
var
  fTarefa2: TfTarefa2;
begin
  Application.CreateForm(TfTarefa2, fTarefa2);
end;

procedure TfPrincipal.actTarefa3Execute(Sender: TObject);
var
  fTarefa3: TfTarefa3;
begin
  Application.CreateForm(TfTarefa3, fTarefa3);

end;

end.
