unit projetosimpleorm.model.service.impl.servicesimpleorm;

interface

uses
  SimpleInterface,
  SimpleDAO,
  SimpleQueryFiredac,
  System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  Data.DB,
  projetosimpleorm.model.service.interfaces,
  projetosimpleorm.model.resource.interfaces;

type
  TServiceSimpleORM<T: Class, constructor> = class(TInterfacedObject, IService<T>)
    private
      FParent: T;
      FConexao: IConexao;
      FConn: ISimpleQuery;
      FDAO: ISimpleDAO<T>;
      FDataSource: TDataSource;
    public
      constructor Create(Parent: T);
      destructor Destroy; override;
      class function New(Parent: T): IService<T>;

      function ListarTodos: IService<T>;
      function ListarPorId(aId: Integer): IService<T>;
      function ListarPor(Field: String; Value: Variant): IService<T>;
      function Inserir: IService<T>;
      function Atualizar: IService<T>;
      function Excluir: IService<T>; overload;
      function Excluir(Field, Value: String): IService<T>; overload;
      function DataSource(var aDataSource: TDataSource): IService<T>;
      function This: T;
  end;

implementation

uses
  projetosimpleorm.model.resource.impl.factory;

{ TServiceSimpleORM<T> }

function TServiceSimpleORM<T>.Atualizar: IService<T>;
begin
  Result := Self;
  FDAO.Update(FParent);
end;

constructor TServiceSimpleORM<T>.Create(Parent: T);
begin
  FParent := Parent;
  FDataSource := TDataSource.Create(nil);
  FConexao := TResource.New.Conexao;
  FConn := TSimpleQueryFiredac.New(TFDConnection(FConexao.Connect));
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TServiceSimpleORM<T>.DataSource(var aDataSource: TDataSource): IService<T>;
begin
  Result := Self;
  aDataSource := FDataSource;
end;

destructor TServiceSimpleORM<T>.Destroy;
begin
  FDataSource.DisposeOf;
  inherited;
end;

function TServiceSimpleORM<T>.Excluir(Field, Value: String): IService<T>;
begin
  Result := Self;
  FDAO.Delete(Field, Value);
end;

function TServiceSimpleORM<T>.Excluir: IService<T>;
begin
  Result := Self;
  FDAO.Delete(FParent);
end;

function TServiceSimpleORM<T>.Inserir: IService<T>;
begin
  Result := Self;
  FDAO.Insert(FParent);
end;

function TServiceSimpleORM<T>.ListarPor(Field: String; Value: Variant): IService<T>;
begin
  Result := Self;
  FDAO.Find(Field, Value);
end;

function TServiceSimpleORM<T>.ListarPorId(aId: Integer): IService<T>;
begin
  Result := Self;
  FDAO.Find(aId);
end;

function TServiceSimpleORM<T>.ListarTodos: IService<T>;
begin
  Result := Self;
  FDAO.Find(False);
end;

class function TServiceSimpleORM<T>.New(Parent: T): IService<T>;
begin
  Result := Self.Create(Parent);
end;

function TServiceSimpleORM<T>.This: T;
begin
  Result := FParent;
end;

end.
