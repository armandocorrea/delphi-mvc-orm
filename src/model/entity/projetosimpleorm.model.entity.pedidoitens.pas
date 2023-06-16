unit projetosimpleorm.model.entity.pedidoitens;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDOITENS')]
  TPedidoItens = class
    private
      FId: Integer;
      FIdPedido: Integer;
      FIdProduto: Integer;
      FQuantidade: Integer;
      FValorUnitario: Currency;
      FValorTotal: Currency;
    public
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;

      [Campo('ID_PEDIDO'), Fk]
      property IdPedido: Integer read FIdPedido write FIdPedido;

      [Campo('ID_PRODUTO'), Fk]
      property IdProduto: Integer read FIdProduto write FIdProduto;

      [Campo('QUANTIDADE')]
      property Quantidade: Integer read FQuantidade write FQuantidade;

      [Campo('VALORUNITARIO')]
      property ValorUnitario: Currency read FValorUnitario write FValorUnitario;

      [Campo('VALORTOTAL')]
      property ValorTotal: Currency read FValorTotal write FValorTotal;
    end;

implementation

end.
