unit projetosimpleorm.controller.dto.impl.pedidoitens;

interface

uses
  projetosimpleorm.controller.dto.interfaces,
  projetosimpleorm.model.entity.pedidoitens,
  projetosimpleorm.model.service.interfaces;

type
  TPedidoItensDTO = class(TInterfacedObject, IPedidoItens)
    private
      FEntity: TPedidoItens;
      FService: IService<TPedidoItens>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IPedidoItens;

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

uses
  projetosimpleorm.model.service.impl.servicesimpleorm;

{ TPedidoItensDTO }

function TPedidoItensDTO.Build: IService<TPedidoItens>;
begin
  Result := FService;
end;

constructor TPedidoItensDTO.Create;
begin
  FEntity := TPedidoItens.Create;
  FService := TServiceSimpleORM<TPedidoItens>.New(FEntity);
end;

destructor TPedidoItensDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TPedidoItensDTO.Id: Integer;
begin
  Result := FEntity.Id;
end;

function TPedidoItensDTO.Id(Value: Integer): IPedidoItens;
begin
  Result := Self;
  FEntity.Id := Value;
end;

function TPedidoItensDTO.IdPedido(Value: Integer): IPedidoItens;
begin
  Result := Self;
  FEntity.IdPedido := Value;
end;

function TPedidoItensDTO.IdPedido: Integer;
begin
  Result := FEntity.IdPedido;
end;

function TPedidoItensDTO.IdProduto: Integer;
begin
  Result := FEntity.IdProduto;
end;

function TPedidoItensDTO.IdProduto(Value: Integer): IPedidoItens;
begin
  Result := Self;
  FEntity.IdProduto := Value;
end;

class function TPedidoItensDTO.New: IPedidoItens;
begin
  Result := Self.Create;
end;

function TPedidoItensDTO.Quantidade(Value: Integer): IPedidoItens;
begin
  Result := Self;
  FEntity.Quantidade := Value;
end;

function TPedidoItensDTO.Quantidade: Integer;
begin
  Result := FEntity.Quantidade;
end;

function TPedidoItensDTO.ValorTotal: Double;
begin
  Result := FEntity.ValorTotal;
end;

function TPedidoItensDTO.ValorTotal(Value: Double): IPedidoItens;
begin
  Result := Self;
  FEntity.ValorTotal := Value;
end;

function TPedidoItensDTO.ValorUnitario: Double;
begin
  Result := FEntity.ValorUnitario;
end;

function TPedidoItensDTO.ValorUnitario(Value: Double): IPedidoItens;
begin
  Result := Self;
  FEntity.ValorUnitario := Value;
end;

end.
