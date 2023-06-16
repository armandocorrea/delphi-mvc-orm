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
      FDataEmissao: TDateTime;
      FValorTotal: Double;
    public
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;

      [Campo('ID_CLIENTE'), Fk]
      property IdCliente: Integer read FIdCliente write FIdCliente;

      [Campo('DATAEMISSAO')]
      property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;

      [Campo('VALORTOTAL'), Format('#.##0,00')]
      property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

implementation

end.
