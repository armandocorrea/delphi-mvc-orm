unit projetosimpleorm.controller.dto.impl.endereco;

interface

uses
  projetosimpleorm.controller.dto.interfaces,
  projetosimpleorm.model.entity.endereco,
  projetosimpleorm.model.service.interfaces;

type
  TEnderecoDTO = class(TInterfacedObject, IEndereco)
    private
      FEntity: TEndereco;
      FService: IService<TEndereco>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IEndereco;

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

implementation

uses
  projetosimpleorm.model.service.impl.servicesimpleorm;

{ TEnderecoDTO }

function TEnderecoDTO.Bairro(Value: String): IEndereco;
begin
  Result := Self;
  FEntity.Bairro := Value;
end;

function TEnderecoDTO.Bairro: String;
begin
  Result := FEntity.Bairro;
end;

function TEnderecoDTO.Build: IService<TEndereco>;
begin
  Result := FService;
end;

function TEnderecoDTO.Cidade(Value: String): IEndereco;
begin
  Result := Self;
  FEntity.Cidade := Value;
end;

function TEnderecoDTO.Cidade: String;
begin
  Result := FEntity.Cidade;
end;

function TEnderecoDTO.Complemento(Value: String): IEndereco;
begin
  Result := Self;
  FEntity.Complemento := Value;
end;

function TEnderecoDTO.Complemento: String;
begin
  Result := FEntity.Complemento;
end;

constructor TEnderecoDTO.Create;
begin
  FEntity := TEndereco.Create;
  FService := TServiceSimpleORM<TEndereco>.New(FEntity);
end;

destructor TEnderecoDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TEnderecoDTO.Estado(Value: String): IEndereco;
begin
  Result := Self;
  FEntity.Estado := Value;
end;

function TEnderecoDTO.Estado: String;
begin
  Result := FEntity.Estado;
end;

function TEnderecoDTO.Id(Value: Integer): IEndereco;
begin
  Result := Self;
  FEntity.Id := Value;
end;

function TEnderecoDTO.Id: Integer;
begin
  Result := FEntity.Id;
end;

function TEnderecoDTO.IdPessoa: Integer;
begin
  Result := FEntity.IdPessoa;
end;

function TEnderecoDTO.IdPessoa(Value: Integer): IEndereco;
begin
  Result := Self;
  FEntity.IdPessoa := Value;
end;

function TEnderecoDTO.Logradouro(Value: String): IEndereco;
begin
  Result := Self;
  FEntity.Logradouro := Value;
end;

function TEnderecoDTO.Logradouro: String;
begin
  Result := FEntity.Logradouro;
end;

class function TEnderecoDTO.New: IEndereco;
begin
  Result := Self.Create;
end;

function TEnderecoDTO.Numero: String;
begin
  Result := FEntity.Numero;
end;

function TEnderecoDTO.Numero(Value: String): IEndereco;
begin
  Result := Self;
  FEntity.Numero := Value;
end;

function TEnderecoDTO.Tipo: String;
begin
  Result := FEntity.Tipo;
end;

function TEnderecoDTO.Tipo(Value: String): IEndereco;
begin
  Result := Self;
  FEntity.Tipo := Value;
end;

end.
