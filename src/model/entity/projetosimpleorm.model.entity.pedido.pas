unit projetosimpleorm.model.entity.pedido;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDO')]
  TPedido = class
    private
      FId: Integer;
      FIdCliente: Integer;
      FDataEmissao: TDate;
      FValorTotal: Currency;
    public
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;

      [Campo('ID_CLIENTE'), Fk]
      property IdCliente: Integer read FIdCliente write FIdCliente;

      [Campo('DATAEMISSAO')]
      property DataEmissao: TDate read FDataEmissao write FDataEmissao;

      [Campo('VALORTOTAL')]
      property ValorTotal: Currency read FValorTotal write FValorTotal;
  end;

implementation

end.
