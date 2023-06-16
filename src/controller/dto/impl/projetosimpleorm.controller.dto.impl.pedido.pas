unit projetosimpleorm.controller.dto.impl.pedido;

interface

uses
  projetosimpleorm.controller.dto.interfaces,
  projetosimpleorm.model.entity.pedido,
  projetosimpleorm.model.service.interfaces;

type
  TPedidoDTO = class(TInterfacedObject, IPedido)
    private
      FEntity: TPedido;
      FService: IService<TPedido>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IPedido;

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

implementation

uses
  projetosimpleorm.model.service.impl.servicesimpleorm;

{ TPedidoDTO }

function TPedidoDTO.Build: IService<TPedido>;
begin
  Result := FService;
end;

constructor TPedidoDTO.Create;
begin
  FEntity  := TPedido.Create;
  FService := TServiceSimpleORM<TPedido>.New(FEntity);
end;

function TPedidoDTO.DataEmissao: TDateTime;
begin
  Result := FEntity.DataEmissao;
end;

function TPedidoDTO.DataEmissao(Value: TDateTime): IPedido;
begin
  Result := Self;
  FEntity.DataEmissao := Value;
end;

destructor TPedidoDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TPedidoDTO.Id: Integer;
begin
  Result := FEntity.Id;
end;

function TPedidoDTO.Id(Value: Integer): IPedido;
begin
  Result := Self;
  FEntity.Id := Value;
end;

function TPedidoDTO.IdCliente(Value: Integer): IPedido;
begin
  Result := Self;
  FEntity.IdCliente := Value;
end;

function TPedidoDTO.IdCliente: Integer;
begin
  Result := FEntity.IdCliente;
end;

class function TPedidoDTO.New: IPedido;
begin
  Result := Self.Create;
end;

function TPedidoDTO.ValorTotal(Value: Double): IPedido;
begin
  Result := Self;
  FEntity.ValorTotal := Value;
end;

function TPedidoDTO.ValorTotal: Double;
begin
  Result := FEntity.ValorTotal;
end;

end.
