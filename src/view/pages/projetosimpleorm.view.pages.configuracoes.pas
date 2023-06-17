unit projetosimpleorm.view.pages.configuracoes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage, projetosimpleorm.controller.interfaces;

type
  TPageConfiguracoes = class(TForm)
    pnlContainer: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    Image3: TImage;
    SpeedButton3: TSpeedButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel9: TPanel;
    Shape2: TShape;
    edtTipo: TEdit;
    Panel7: TPanel;
    Shape1: TShape;
    edtPath: TEdit;
    Panel11: TPanel;
    Shape4: TShape;
    edtUserName: TEdit;
    Panel14: TPanel;
    Shape6: TShape;
    edtPassword: TEdit;
    Panel15: TPanel;
    Shape7: TShape;
    edtPorta: TEdit;
    Panel17: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Panel18: TPanel;
    Shape9: TShape;
    edtSchema: TEdit;
    Panel19: TPanel;
    Shape10: TShape;
    edtLocking: TEdit;
    Panel21: TPanel;
    Shape12: TShape;
    edtServidor: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FController: IController;

    procedure CarregarDados;
  public
    { Public declarations }
  end;

var
  PageConfiguracoes: TPageConfiguracoes;

implementation

uses
  projetosimpleorm.controller.impl.controller;

{$R *.dfm}

procedure TPageConfiguracoes.CarregarDados;
begin
  try
    edtTipo.Text := FController.Configuracao.DriverID;
    edtPath.Text := FController.Configuracao.Database;
    edtUserName.Text := FController.Configuracao.UserName;
    edtPassword.Text := FController.Configuracao.Password;
    edtPorta.Text := FController.Configuracao.Port;
    edtSchema.Text := FController.Configuracao.Schema;
    edtLocking.Text := FController.Configuracao.Locking;
    edtServidor.Text := FController.Configuracao.Server;
  except
  end;
end;

procedure TPageConfiguracoes.FormCreate(Sender: TObject);
begin
  FController := TController.New;
end;

procedure TPageConfiguracoes.FormShow(Sender: TObject);
begin
  Self.CarregarDados;
end;

procedure TPageConfiguracoes.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TPageConfiguracoes.SpeedButton2Click(Sender: TObject);
begin
  try
    FController.Configuracao
      .DriverID(edtTipo.Text)
      .Database(edtPath.Text)
      .Username(edtUsername.Text)
      .Password(edtPassword.Text)
      .Port(edtPorta.Text)
      .Server(edtServidor.Text)
      .Schema(edtSchema.Text)
      .Locking(edtLocking.Text);

    ShowMessage('Dados gravados com sucesso!');
  except
    raise Exception.Create('Erro ao tentar gravar os dados');
  end;
end;

end.
