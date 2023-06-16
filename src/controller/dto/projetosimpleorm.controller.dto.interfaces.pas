unit projetosimpleorm.controller.dto.interfaces;

interface

uses
  System.Classes,
  projetosimpleorm.model.service.interfaces,
  projetosimpleorm.model.entity.cliente, projetosimpleorm.model.entity.pessoa,
  projetosimpleorm.model.entity.produto,
  projetosimpleorm.model.entity.endereco, projetosimpleorm.model.entity.pedido,
  projetosimpleorm.model.entity.pedidoitens;

type
  ICliente = interface
    function Id(Value: Integer): ICliente; overload;
    function Id: Integer; overload;
    function IdPessoa(Value: Integer): ICliente; overload;
    function IdPessoa: Integer; overload;
    function Tipo(Value: String): ICliente; overload;
    function Tipo: String; overload;
    function CpfCnpj(Value: String): ICliente; overload;
    function CpfCnpj: String; overload;
    function Email(Value: String): ICliente; overload;
    function Email: String; overload;
    function Telefone(Value: String): ICliente; overload;
    function Telefone: String; overload;
    function Foto(Value: TStream): ICliente; overload;
    function Foto: TStream; overload;
    function Build: IService<TCliente>;
  end;

  IPessoa = interface
    function Id(Value: Integer): IPessoa; overload;
    function Id: Integer; overload;
    function Nome(Value: String): IPessoa; overload;
    function Nome: String; overload;
    function DataNascReg(Value: TDate): IPessoa; overload;
    function DataNascReg: TDate; overload;
    function Build: IService<TPessoa>;
  end;

  IProduto = interface
    function Id(Value: Integer): IProduto; overload;
    function Id: Integer; overload;
    function Descricao(Value: String): IProduto; overload;
    function Descricao: String; overload;
    function PrecoVenda(Value: Double): IProduto; overload;
    function PrecoVenda: Double; overload;
    function Foto(Value: TStream): IProduto; overload;
    function Foto: TStream; overload;
    function Build: IService<TProduto>;
  end;

  IEndereco = interface
    function Id(Value: Integer): IEndereco; overload;
    function Id: Integer; overload;
    function IdPessoa(Value: Integer): IEndereco; overload;
    function IdPessoa: Integer; overload;
    function Logradouro(Value: String): IEndereco; overload;
    function Logradouro: String; overload;
    function Numero(Value: String): IEndereco; overload;
    function Numero: String; overload;
    function Complemento(Value: String): IEndereco; overload;
    function Complemento: String; overload;
    function Cidade(Value: String): IEndereco; overload;
    function Cidade: String; overload;
    function Bairro(Value: String): IEndereco; overload;
    function Bairro: String; overload;
    function Estado(Value: String): IEndereco; overload;
    function Estado: String; overload;
    function Tipo(Value: String): IEndereco; overload;
    function Tipo: String; overload;
    function Build: IService<TEndereco>;
  end;

  IPedido = interface
    function Id(Value: Integer): IPedido; overload;
    function Id: Integer; overload;
    function IdCliente(Value: Integer): IPedido; overload;
    function IdCliente: Integer; overload;
    function DataEmissao(Value: TDateTime): IPedido; overload;
    function DataEmissao: TDateTime; overload;
    function ValorTotal(Value: Double): IPedido; overload;
    function ValorTotal: Double; overload;
    function Build: IService<TPedido>;
  end;

  IPedidoItens = interface
    function Id(Value: Integer): IPedidoItens; overload;
    function Id: Integer; overload;
    function IdPedido(Value: Integer): IPedidoItens; overload;
    function IdPedido: Integer; overload;
    function IdProduto(Value: Integer): IPedidoItens; overload;
    function IdProduto: Integer; overload;
    function Quantidade(Value: Integer): IPedidoItens; overload;
    function Quantidade: Integer; overload;
    function ValorUnitario(Value: Double): IPedidoItens; overload;
    function ValorUnitario: Double; overload;
    function ValorTotal(Value: Double): IPedidoItens; overload;
    function ValorTotal: Double; overload;
    function Build: IService<TPedidoItens>;
  end;

implementation

end.
