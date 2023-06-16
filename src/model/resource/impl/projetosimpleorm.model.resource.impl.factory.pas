unit projetosimpleorm.model.resource.impl.factory;

interface

uses
  projetosimpleorm.model.resource.interfaces;

type
  TResource = class(TInterfacedObject, IResource)
    private
      FConexao: IConexao;
      FConfiguracao: IConfiguracao;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IResource;
      function Conexao: IConexao;
      function Configuracao: IConfiguracao;
  end;

implementation

uses
  projetosimpleorm.model.resource.impl.configuracao,
  projetosimpleorm.model.resource.impl.conexaofiredac;

{ TResource }

function TResource.Conexao: IConexao;
begin
  Result := FConexao;
end;

function TResource.Configuracao: IConfiguracao;
begin
  Result := FConfiguracao;
end;

constructor TResource.Create;
begin
  FConfiguracao := TConfiguracao.New;
  FConexao := TConexao.New(FConfiguracao);
end;

destructor TResource.Destroy;
begin

  inherited;
end;

class function TResource.New: IResource;
begin
  Result := Self.Create;
end;

end.
