unit projetosimpleorm.controller.impl.controller;

interface

uses
  projetosimpleorm.controller.dto.interfaces,
  projetosimpleorm.controller.interfaces,
  projetosimpleorm.model.resource.interfaces,
  projetosimpleorm.controller.dto.impl.produto;

type
  TController = class(TInterfacedObject, IController)
    private
      FPedido: IPedido;
      FPedidoItens: IPedidoItens;
      FProduto: IProduto;
      FCliente: ICliente;
      FPessoa: IPessoa;
      FEndereco: IEndereco;
      FConfiguracao: IConfiguracao;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IController;

      function Pedido: IPedido;
      function PedidoItens: IPedidoItens;
      function Produto: IProduto;
      function Cliente: ICliente;
      function Pessoa: IPessoa;
      function Endereco: IEndereco;
      function Configuracao: IConfiguracao;
  end;

implementation

uses
  projetosimpleorm.controller.dto.impl.cliente,
  projetosimpleorm.controller.dto.impl.endereco,
  projetosimpleorm.controller.dto.impl.pedido,
  projetosimpleorm.controller.dto.impl.pedidoitens,
  projetosimpleorm.controller.dto.impl.pessoa,
  projetosimpleorm.model.resource.impl.configuracao;

{ TController }

function TController.Cliente: ICliente;
begin
  if not Assigned(FCliente) then
    FCliente := TClienteDTO.New;

  Result := FCliente;
end;

function TController.Configuracao: IConfiguracao;
begin
  if not Assigned(FConfiguracao) then
    FConfiguracao := TConfiguracao.New;

  Result := FConfiguracao;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Endereco: IEndereco;
begin
  if not Assigned(FEndereco) then
    FEndereco := TEnderecoDTO.New;

  Result := FEndereco;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

function TController.Pedido: IPedido;
begin
  if not Assigned(FPedido) then
    FPedido := TPedidoDTO.New;

  Result := FPedido;
end;

function TController.PedidoItens: IPedidoItens;
begin
  if not Assigned(FPedidoItens) then
    FPedidoItens := TPedidoItensDTO.New;

  Result := FPedidoItens;
end;

function TController.Pessoa: IPessoa;
begin
  if not Assigned(FPessoa) then
    FPessoa := TPessoaDTO.New;

  Result := FPessoa;
end;

function TController.Produto: IProduto;
begin
  if not Assigned(FProduto) then
    FProduto := TProdutoDTO.New;

  Result := FProduto;
end;

end.
