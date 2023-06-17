unit projetosimpleorm.controller.dto.impl.produto;

interface

uses
  projetosimpleorm.controller.dto.interfaces,
  projetosimpleorm.model.service.interfaces,
  projetosimpleorm.model.entity.produto, System.Classes;

type
  TProdutoDTO = class(TInterfacedObject, IProduto)
    private
      FEntity: TProduto;
      FService: IService<TProduto>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IProduto;

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

implementation

uses
  projetosimpleorm.model.service.impl.servicesimpleorm;

{ TProdutoDTO }

function TProdutoDTO.Build: IService<TProduto>;
begin
  Result := FService;
end;

constructor TProdutoDTO.Create;
begin
  FEntity := TProduto.Create;
  FService := TServiceSimpleORM<TProduto>.New(FEntity);
end;

function TProdutoDTO.Descricao(Value: String): IProduto;
begin
  Result := Self;
  FEntity.Descricao := Value;
end;

function TProdutoDTO.Descricao: String;
begin
  Result := FEntity.Descricao;
end;

destructor TProdutoDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TProdutoDTO.Foto: TStream;
begin
  Result := FEntity.Foto;
end;

function TProdutoDTO.Foto(Value: TStream): IProduto;
begin
  Result := Self;
  FEntity.Foto := Value;
end;

function TProdutoDTO.Id(Value: Integer): IProduto;
begin
  Result := Self;
  FEntity.Id := Value;
end;

function TProdutoDTO.Id: Integer;
begin
  Result := FEntity.Id;
end;

class function TProdutoDTO.New: IProduto;
begin
  Result := Self.Create;
end;

function TProdutoDTO.PrecoVenda: Double;
begin
  Result := FEntity.PrecoVenda;
end;

function TProdutoDTO.PrecoVenda(Value: Double): IProduto;
begin
  Result := Self;
  FEntity.PrecoVenda := Value;
end;

end.
