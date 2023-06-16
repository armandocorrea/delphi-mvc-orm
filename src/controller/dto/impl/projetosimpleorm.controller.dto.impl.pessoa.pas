unit projetosimpleorm.controller.dto.impl.pessoa;

interface

uses
  projetosimpleorm.model.entity.pessoa,
  projetosimpleorm.model.service.interfaces,
  projetosimpleorm.controller.dto.interfaces;

type
  TPessoaDTO = class(TInterfacedObject, IPessoa)
    private
      FEntity: TPessoa;
      FService: IService<TPessoa>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IPessoa;

      function Id(Value: Integer): IPessoa; overload;
      function Id: Integer; overload;
      function Nome(Value: String): IPessoa; overload;
      function Nome: String; overload;
      function DataNascReg(Value: TDate): IPessoa; overload;
      function DataNascReg: TDate; overload;
      function Build: IService<TPessoa>;
  end;

implementation

uses
  projetosimpleorm.model.service.impl.servicesimpleorm;

{ TPessoaDTO }

function TPessoaDTO.Build: IService<TPessoa>;
begin
  Result := FService;
end;

constructor TPessoaDTO.Create;
begin
  FEntity := TPessoa.Create;
  FService := TServiceSimpleORM<TPessoa>.New(FEntity);
end;

function TPessoaDTO.DataNascReg(Value: TDate): IPessoa;
begin
  Result := Self;
  FEntity.DataNascReg := Value;
end;

function TPessoaDTO.DataNascReg: TDate;
begin
  Result := FEntity.DataNascReg;
end;

destructor TPessoaDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TPessoaDTO.Id(Value: Integer): IPessoa;
begin
  Result := Self;
  FEntity.Id := Value;
end;

function TPessoaDTO.Id: Integer;
begin
  Result := FEntity.Id;
end;

class function TPessoaDTO.New: IPessoa;
begin
  Result := Self.Create;
end;

function TPessoaDTO.Nome(Value: String): IPessoa;
begin
  Result := Self;
  FEntity.Nome := Value;
end;

function TPessoaDTO.Nome: String;
begin
  Result := FEntity.Nome;
end;

end.
