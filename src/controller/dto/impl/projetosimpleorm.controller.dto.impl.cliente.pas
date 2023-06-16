unit projetosimpleorm.controller.dto.impl.cliente;

interface

uses
  System.Classes,
  projetosimpleorm.controller.dto.interfaces,
  projetosimpleorm.model.service.interfaces,
  projetosimpleorm.model.entity.cliente,
  projetosimpleorm.model.entity.pessoa;

type
  TClienteDTO = class(TInterfacedObject, ICliente)
    private
      FEntity: TCliente;
      FService: IService<TCliente>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: ICliente;

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

implementation

uses
  projetosimpleorm.model.service.impl.servicesimpleorm;

{ TClienteDTO }

function TClienteDTO.Build: IService<TCliente>;
begin
  Result := FService;
end;

function TClienteDTO.CpfCnpj: String;
begin
  Result := FEntity.CpfCnpj;
end;

function TClienteDTO.CpfCnpj(Value: String): ICliente;
begin
  Result := Self;
  FEntity.CpfCnpj := Value;
end;

constructor TClienteDTO.Create;
begin
  FEntity := TCliente.Create;
  FService := TServiceSimpleORM<TCliente>.New(FEntity);
end;

destructor TClienteDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TClienteDTO.Email(Value: String): ICliente;
begin
  Result := Self;
  FEntity.Email := Value;
end;

function TClienteDTO.Email: String;
begin
  Result := FEntity.Email;
end;

function TClienteDTO.Foto(Value: TStream): ICliente;
begin
  Result := Self;
  FEntity.Foto := Value;
end;

function TClienteDTO.Foto: TStream;
begin
  Result := FEntity.Foto;
end;

function TClienteDTO.Id(Value: Integer): ICliente;
begin
  Result := Self;
  FEntity.Id := Value;
end;

function TClienteDTO.Id: Integer;
begin
  Result := FEntity.Id;
end;

function TClienteDTO.IdPessoa: Integer;
begin
  Result := FEntity.IdPessoa;
end;

function TClienteDTO.IdPessoa(Value: Integer): ICliente;
begin
  Result := Self;
  FEntity.IdPessoa := Value;
end;

class function TClienteDTO.New: ICliente;
begin
  Result := Self.Create;
end;

function TClienteDTO.Telefone(Value: String): ICliente;
begin
  Result := Self;
  FEntity.Telefone := Value;
end;

function TClienteDTO.Telefone: String;
begin
  Result := FEntity.Telefone;
end;

function TClienteDTO.Tipo: String;
begin
  Result := FEntity.Tipo;
end;

function TClienteDTO.Tipo(Value: String): ICliente;
begin
  Result := Self;
  FEntity.Tipo := Value;
end;

end.
