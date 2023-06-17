unit projetosimpleorm.view.pages.produto;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  projetosimpleorm.view.utils.impl.resourceimage,
  projetosimpleorm.view.utils.interfaces,
  projetosimpleorm.controller.interfaces;

type
  TPageProduto = class(TForm)
    pnlContainer: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    btnSair: TSpeedButton;
    Panel3: TPanel;
    Image2: TImage;
    btnSalvar: TSpeedButton;
    Panel4: TPanel;
    Image3: TImage;
    BtnExcluir: TSpeedButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    imgFoto: TImage;
    Shape1: TShape;
    Panel8: TPanel;
    Label13: TLabel;
    Panel24: TPanel;
    Shape7: TShape;
    edtDescricao: TEdit;
    Label1: TLabel;
    Panel9: TPanel;
    Shape2: TShape;
    edtCodigo: TEdit;
    Label2: TLabel;
    Panel10: TPanel;
    Shape3: TShape;
    edtPrecoVenda: TEdit;
    SpeedButton4: TSpeedButton;
    OD: TOpenDialog;
    Panel11: TPanel;
    Image4: TImage;
    btnListar: TSpeedButton;
    ListView1: TListView;
    procedure btnSairClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FController: IController;
  public

  end;

var
  PageProduto: TPageProduto;

implementation

uses
  projetosimpleorm.controller.impl.controller;

{$R *.dfm}

{ TPageProduto }

procedure TPageProduto.FormCreate(Sender: TObject);
var
  lImages: iImage;
begin
  FController := TController.New;

  lImages := TResourceImage.New;
  lImages.ResourceImage(imgFoto,'noimage');
  lImages.ResourceImage(Image1,'sair');
  lImages.ResourceImage(Image2,'salvar');
  lImages.ResourceImage(Image3,'excluir');
  lImages.ResourceImage(Image4,'lista');
end;

procedure TPageProduto.btnListarClick(Sender: TObject);
var
  lList: TListItem;
  lDataSource: TDataSource;
begin
  lDataSource := TDataSource.Create(nil);
  try
    FController.Produto.Build.DataSource(lDataSource).ListarTodos;

    if lDataSource.DataSet.IsEmpty then
    begin
      ShowMessage('Não existem dados a serem visualizados');
      Exit;
    end;

    lDataSource.DataSet.First;
    while not lDataSource.DataSet.Eof do
    begin
      lList := ListView1.Items.Add;
      lList.Caption := lDataSource.DataSet.FieldByName('ID').AsString;
      lList.SubItems.Add(lDataSource.DataSet.FieldByName('DESCRICAO').AsString);
      lList.SubItems.Add(lDataSource.DataSet.FieldByName('PRECOVENDA').AsString);
      lDataSource.DataSet.Next;
    end;
  finally
    lDataSource.DisposeOf;
  end;
end;

procedure TPageProduto.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TPageProduto.btnSalvarClick(Sender: TObject);
var
  lStream: TMemoryStream;
begin
  lStream := TMemoryStream.Create;

  try
    try
      if not (imgFoto.Picture = nil) then
        imgFoto.Picture.LoadFromStream(lStream);

      FController
        .Produto
        .Descricao(edtDescricao.Text)
        .PrecoVenda(StrToCurr(edtPrecoVenda.Text))
        .Foto(lStream)
        .Build.Inserir;

      ShowMessage('Produto cadastrado com sucesso!');
    except
      raise Exception.Create('Não foi possível cadastrar o produto.');
    end;
  finally
    lStream.DisposeOf;
  end;
end;

procedure TPageProduto.SpeedButton4Click(Sender: TObject);
begin
  if OD.Execute then
    imgFoto.Picture.LoadFromFile(OD.FileName);
end;

end.
