unit projetosimpleorm.controller.interfaces;

interface

uses
  projetosimpleorm.controller.dto.interfaces,
  projetosimpleorm.model.resource.interfaces;

type
  IController = interface
    function Pedido: IPedido;
    function PedidoItens: IPedidoItens;
    function Produto: IProduto;
    function Cliente: ICliente;
    function Pessoa: IPessoa;
    function Endereco: IEndereco;
    function Configuracao: IConfiguracao;
  end;

implementation

end.
